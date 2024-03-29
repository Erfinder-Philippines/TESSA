#tag Class
Protected Class MarsSplitter
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  if me.Enabled and me.Visible then
		    mXAnchor = X
		    mYAnchor = Y
		    Return True
		  end
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If IsVertical Then
		    drag x - mXAnchor
		  else
		    drag y - mYAnchor
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  PickCursor
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.dockingSide = new Dictionary
		  PickCursor
		  RaiseEvent Open()
		  RaiseEvent Moved(0)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  ' Draw a little handle at the middle of the splitter region.
		  Dim x,y As Integer
		  If Me.Active And Me.Enabled and me.Visible Then
		    x = Me.Width / 2
		    y = Me.Height / 2
		    DrawHandlePoint(g,x,y)
		    const drawLines = true
		    const draw5Dots = true
		    const margin = 32
		    If IsVertical Then
		      #if drawLines
		        g.ForeColor = LineColor
		        g.DrawLine x, 0, x, y - margin
		        g.DrawLine x, y + margin, x, me.Height
		        //old code
		        'g.DrawLine x, margin, x, y - margin
		        'g.DrawLine x, y + margin, x, me.Height - margin
		      #endif
		      #if draw5Dots
		        DrawHandlePoint(g,x,y-4)
		        DrawHandlePoint(g,x,y+4)
		        DrawHandlePoint(g,x,y-8)
		        DrawHandlePoint(g,x,y+8)
		      #else
		        DrawHandlePoint(g,x,y-5)
		        DrawHandlePoint(g,x,y+5)
		      #endif
		    Else
		      #if drawLines
		        g.ForeColor = LineColor
		        g.DrawLine margin, y, x - margin, y
		        g.DrawLine x + margin, y, me.Width - margin, y
		      #endif
		      #if draw5Dots
		        DrawHandlePoint(g,x+4,y)
		        DrawHandlePoint(g,x-4,y)
		        DrawHandlePoint(g,x+8,y)
		        DrawHandlePoint(g,x-8,y)
		      #else
		        DrawHandlePoint(g,x+5,y)
		        DrawHandlePoint(g,x-5,y)
		      #endif
		    End If
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Attach(ctrl as ContainerControl, moveOnly as Boolean = false)
		  mAttached.Append ctrl._Control // this undocumented "_Control" access is necessary to make it work (as of RB 2008r1)
		  if moveOnly then
		    mCtrlsToMove.Append ctrl
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Attach(ctrl as RectControl, moveOnly as Boolean = false)
		  mAttached.Append ctrl
		  if moveOnly then
		    mCtrlsToMove.Append ctrl
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub drag(distance As Integer)
		  ' Find out how many pixels the splitter must move until the mouse
		  ' is once again centered over the origin point.
		  ' Resize all the split-controls by this amount.
		  ' Move the splitter itself so it sits underneath the mouse.
		  if me.Enabled and me.dockingSide <> nil then
		    If IsVertical Then
		      // move left <-> right
		      If Me.Left + distance < MinTopLeft Then
		        distance = MinTopLeft - Me.Left
		      End If
		      If Me.Left + Me.Width + distance > Me.Window.Width - MinBottomRight Then
		        distance = Me.Window.Width - MinBottomRight - Me.Left - Me.Width
		      End If
		      if distance <> 0 then
		        VerticalSplit distance
		        RaiseEvent Moved(distance)
		      end
		    Else
		      // move up <-> down
		      If Me.Top + distance < MinTopLeft Then
		        distance = MinTopLeft - Me.Top
		      End If
		      If Me.Top + Me.Height + distance > Me.Window.Height - MinBottomRight Then
		        distance = Me.Window.Height - MinBottomRight - Me.Top - Me.Height
		      End If
		      if distance <> 0 then
		        HorizontalSplit distance
		        RaiseEvent Moved(distance)
		      end
		    End If
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DrawHandlePoint(g As Graphics, x As Integer, y As Integer)
		  g.ForeColor = &c808080
		  g.FillOval(x-1,y-1,2,2)
		  g.ForeColor = &c333333
		  g.FillOval(x-1,y-1,1,1)
		  g.ForeColor = &cFFFFFF
		  g.FillOval(x,y,1,1)
		  Exception OutOfBoundsException
		    // ignore
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub HorizontalSplit(distance As Integer)
		  ' Find all the controls to either side of the splitter.
		  ' Adjust their dimensions to match the specified distance.
		  Dim ctr As Integer
		  Dim item As Object
		  Dim okToMove As Boolean
		  for ctr = 0 To Me.Window.ControlCount-1
		    item = Me.Window.Control( ctr )
		    If item IsA RectControl or item IsA ContainerControl Then
		      ' is this within the splitter's area of influence?
		      okToMove = Not(item Is Me)
		      if mAttached.Ubound >= 0 then
		        okToMove = okToMove and mAttached.IndexOf(item) >= 0
		      else
		        okToMove = okToMove And item.CtrlLeft >= Me.Left
		        okToMove = okToMove And (item.CtrlLeft + item.CtrlWidth) <= (Me.Left + Me.Width)
		        okToMove = okToMove And item.CtrlParent = me.Parent
		      end
		      
		      If okToMove Then
		        ' is this item above the splitter or below?
		        dim itemAfterSplitter as Boolean
		        if dockingSide.HasKey(item) then
		          itemAfterSplitter = dockingSide.Value(item)
		        else
		          dim pos, c as Integer
		          pos = me.Top + me.Height \ 2
		          c = item.CtrlTop + item.CtrlHeight \ 2
		          itemAfterSplitter = c >= pos
		          dockingSide.Value(item) = itemAfterSplitter
		        end
		        if mCtrlsToMove.IndexOf(item) < 0 then
		          // resize the control
		          dim h as Integer
		          if itemAfterSplitter then
		            h = item.CtrlHeight - distance
		            item.CtrlSetTop item.CtrlTop + distance
		          else
		            h = item.CtrlHeight + distance
		          end
		          If item IsA RectControl then
		            RectControl(item).Resize item.CtrlWidth, h
		          else
		            ContainerControl(item).Resize item.CtrlWidth, h
		          end
		        else
		          // move the control
		          dim ofs as Integer
		          if itemAfterSplitter then
		            ofs = distance
		          else
		            ofs = -distance
		          end
		          If item IsA RectControl then
		            RectControl(item).Top = RectControl(item).Top + ofs
		          else
		            ContainerControl(item).Top = ContainerControl(item).Top + ofs
		          end
		        end
		      End If
		    End If
		  Next
		  Me.Top = Me.Top + distance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsVertical() As Boolean
		  Return Height > Width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PickCursor()
		  if me.Enabled and me.Visible then
		    If IsVertical Then
		      Me.MouseCursor = System.Cursors.SplitterEastWest
		    Else
		      Me.MouseCursor = System.Cursors.SplitterNorthSouth
		    End If
		  else
		    Me.MouseCursor = nil
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Position() As Integer
		  if IsVertical then
		    return me.Left
		  else
		    return me.Top
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PositionRatio() As Double
		  dim splitterRatio as Double
		  if IsVertical then
		    splitterRatio = (me.Left+me.Width) / (Me.Window.Width-me.Width)
		  else
		    splitterRatio = (me.Top+me.Height) / (Me.Window.Height-me.Height)
		  end
		  return splitterRatio
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reposition(topOrLeft as Integer)
		  if me.Enabled then
		    if IsVertical then
		      drag topOrLeft - me.Left
		    else
		      drag topOrLeft - me.Top
		    end
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RepositionRatio(ratio as Double)
		  if me.Enabled then
		    if IsVertical then
		      me.Reposition ratio * (me.Window.Width-me.Width) - me.Width
		    else
		      me.Reposition ratio * (me.Window.Height-me.Height) - me.Height
		    end
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDocks()
		  me.dockingSide.Clear
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub VerticalSplit(distance As Integer)
		  ' Find all the controls to either side of the splitter.
		  ' Adjust their dimensions to match the specified distance.
		  Dim ctr As Integer
		  Dim item As Object
		  Dim okToMove As Boolean
		  For ctr = 0 To Me.Window.ControlCount-1
		    item = Me.Window.Control( ctr )
		    If item IsA RectControl or item IsA ContainerControl Then
		      ' is this within the splitter's area of influence?
		      okToMove = Not(item Is Me)
		      if mAttached.Ubound >= 0 then
		        okToMove = okToMove and mAttached.IndexOf(item) >= 0
		      else
		        okToMove = okToMove And item.CtrlTop >= Me.Top
		        okToMove = okToMove And  (item.CtrlTop + item.CtrlHeight) <= (Me.Top + Me.Height)
		        okToMove = okToMove And item.CtrlParent = Me.Parent
		      end
		      
		      If okToMove Then
		        ' is this to the left of the splitter or the right?
		        dim itemAfterSplitter as Boolean
		        if dockingSide.HasKey(item) then
		          itemAfterSplitter = dockingSide.Value(item)
		        else
		          dim pos, c as Integer
		          pos = me.Left + me.Width \ 2
		          c = item.CtrlLeft + item.CtrlWidth \ 2
		          itemAfterSplitter = c >= pos
		          dockingSide.Value(item) = itemAfterSplitter
		        end
		        if mCtrlsToMove.IndexOf(item) < 0 then
		          // resize the control
		          dim w as Integer
		          if itemAfterSplitter then
		            w = item.CtrlWidth - distance
		            item.CtrlSetLeft item.CtrlLeft + distance
		          else
		            w = item.CtrlWidth + distance
		          end
		          If item IsA RectControl then
		            RectControl(item).Resize w, item.CtrlHeight
		          else
		            ContainerControl(item).Resize w, item.CtrlHeight
		          end
		        else
		          // move the control
		          dim ofs as Integer = distance
		          If item IsA RectControl then
		            RectControl(item).Left = RectControl(item).Left + ofs
		          else
		            ContainerControl(item).Left = ContainerControl(item).Left + ofs
		          end
		        end
		      End If
		    End If
		  Next
		  Me.Left = Me.Left + distance
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Moved(distance as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Note, Name = About
		Original version by Mars Saxman: http://www.redplanetsw.com/realbasic/#splitter
		
		Changes by Thomas Tempelmann on 24 Nov 05:
		- added some checks to HorizontalSplit and VerticalSplit so that it does only affect directly neighboring controls
		
		Changes by Thomas Tempelmann on 20 Jan 08:
		- added Reposition() to move the splitter, e.g. within an Resizing event
		
		Changes by Thomas Tempelmann on 20 Feb 08:
		- added .Visible checks so that an enabled by invisible splitter still works but does not reveal itself in the GUI
		- deals better with negative heights caused by overflowing the splitter over a control.
		
		Changes by Thomas Tempelmann on 10 Mar 08:
		- added Attach() to explicitly attach controls that are moved by the splitter
		
		Changes by Thomas Tempelmann on 12 Mar 08:
		- can now move ContainerControls as well (they're not subclasses of RectControl, sadly)
		
		Changes by Thomas Tempelmann on 6 Mar 11:
		- fixed a long undiscovered bug about moving controls on the left/top of the splitter
		   (they got moved in the opposite direction).
		
	#tag EndNote

	#tag Note, Name = Features
		By default, this splitter moves & resizes all items it finds next to itself,
		including ContainerControls
		
		You can override this by calling the Attach method to tell the splitter
		not only which items are to be considered but also whether these items
		shall be resized or not.
		
		The splitter also pays attention to Locks, so make sure you check those
		if things don't seem to work as you expect.
		
	#tag EndNote


	#tag Property, Flags = &h21
		#tag Note
			key: control
			value: boolean (true: top/left, false: bottom/right)
		#tag EndNote
		Private dockingSide As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		LineColor As Color = &cD8D8D8
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAttached() As Object
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCtrlsToMove() As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		MinBottomRight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MinTopLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mXAnchor As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mYAnchor As Integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinTopLeft"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinBottomRight"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineColor"
			Visible=true
			Group="Behavior"
			InitialValue="&c666666"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
