#tag Class
Protected Class Splitter
Inherits Canvas
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  If IsHorizontal Then
		    mLastY = System.MouseY
		  Else
		    mLastX = System.MouseX
		  End
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  If IsHorizontal Then
		    Dim dy As Integer = -mLastY + System.MouseY
		    If dy = 0 Then
		      Return
		    End
		    Top = Top + dy
		    Moved(0, dy)
		    mLastY = System.MouseY
		  Else
		    Dim dx As Integer = -mLastX + System.MouseX
		    If dx = 0 Then
		      Return
		    End
		    Left = Left + dx
		    Moved(dx, 0)
		    mLastX = System.MouseX
		  End
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  If IsHorizontal Then
		    MouseCursor = System.Cursors.SplitterNorthSouth
		  Else
		    MouseCursor = System.Cursors.SplitterEastWest
		  End
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
		        g.DrawLine x, margin, x, y - margin
		        g.DrawLine x, y + margin, x, me.Height - margin
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


	#tag Method, Flags = &h1
		Protected Sub DrawHandlePoint(g As Graphics, x As Integer, y As Integer)
		  g.ForeColor = &c808080
		  g.FillOval(x-1,y-1,2,2)
		  #if TargetCocoa
		    // Pixel() doesn't seem to work in Cocoa yet (IDE 2011r1)
		    g.ForeColor = &c333333
		    g.FillOval(x-1,y-1,1,1)
		    g.ForeColor = &cFFFFFF
		    g.FillOval(x,y,1,1)
		  #else
		    g.Pixel(x-1,y-1) = &c333333
		    g.Pixel(x,y) = &cFFFFFF
		  #endif
		  Exception OutOfBoundsException
		    // ignore
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsVertical() As Boolean
		  Return Height > Width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Move(x As Integer, y As Integer)
		  If IsHorizontal Then
		    Dim dy As Integer = y - Top
		    Top = y
		    Moved(0, dy)
		  Else
		    Dim dx As Integer = x - Left
		    Left = x
		    Moved(dx, 0)
		  End
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Moved(x As Integer, y As Integer)
	#tag EndHook


	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  return mIsHorizontal
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mIsHorizontal = value
			End Set
		#tag EndSetter
		Private IsHorizontal As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		LineColor As Color = &c666666
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsHorizontal As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastX As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastY As Integer = 0
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
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
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
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
			Name="LockLeft"
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
			Name="LockTop"
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
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
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
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
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
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
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
	#tag EndViewBehavior
End Class
#tag EndClass
