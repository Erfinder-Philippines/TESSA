#tag Window
Begin ContainerControl SchematicCanvasContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   522
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   834
   Begin SchematicCanvas SchemCanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      canvasIsScrolling=   False
      canvasOffsetX   =   0
      canvasOffsetY   =   0
      canvasPage      =   ""
      darkModeEnabled =   False
      DoubleBuffer    =   True
      Enabled         =   True
      gridImage       =   0
      Height          =   522
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      mHorizontalScrollBarLast=   0
      mVerticalScrollBarLast=   0
      mXScroll        =   0
      mYScroll        =   0
      Right           =   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   834
   End
   Begin ScrollBar VerticalScrollBar
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   505
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   836
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   17
   End
   Begin ScrollBar HorizontalScrollBar
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowLiveScrolling=   True
      Enabled         =   True
      Height          =   17
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LineStep        =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaximumValue    =   100
      MinimumValue    =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   525
      Transparent     =   False
      Value           =   0
      Visible         =   False
      Width           =   816
   End
   Begin Timer refreshTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   100
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub action_linkFollowed(testStepName as String, outgoingIndex as Integer)
		  RaiseEvent LinkFollow(testStepName, outgoingIndex)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub hidePageElements()
		  If pageIndex = -1 Then
		    Return
		  End If
		  For each ec As ElementContainer in SchemCanvas.Container
		    If ec.Visible and ec.parentTeststep <> testStepIDs(pageIndex) then
		      ec.Hide
		    End If
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub myRefresh()
		  SchemCanvas.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub removeLink(lkInfo as LinkInfo, lkIndex as Integer)
		  dim id as string = lkInfo.toElement.uniqueID
		  dim bc as BasicClass = App.GlobalTestSequence.FindElementByUniqueID(id)
		  If bc <> Nil Then
		    MsgBox bc.GetAttribute(lkInfo.t_attribute_Y).LinkName
		    bc.GetAttribute(lkInfo.t_attribute_Y).DisconnectLink
		    SchemCanvas.Links.Remove(lkIndex)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showPageElements()
		  If pageIndex = -1 Then
		    Return
		  End If
		  For each ec As ElementContainer in SchemCanvas.Container
		    If not ec.Visible and ec.parentTeststep = testStepIDs(pageIndex) then
		      ec.Visible = true
		    End If
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event LinkFollow(testStepName as String, outgoingIndex as Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		pageIndex As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		testStepIDs() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		testStepNames() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events SchemCanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  // Draws the image, adjusted for scrolling
		  g.DrawPicture(me.drawLinks, me.mXScroll, me.mYScroll)
		  
		  // Size the scrollbar based on how much vertical scrolling the image can do
		  VerticalScrollBar.Maximum = me.gridImage.Height - g.Height
		  // Disable scrollbar if image is shorter than canvas area since there
		  // is nothing to scroll
		  If g.Height > me.gridImage.Height Then
		    VerticalScrollBar.Enabled = False
		    Me.mYScroll = 0
		  Else
		    VerticalScrollBar.Enabled = True
		  End If
		  
		  // Size the scrollbar based on how much horizontal scrolling the image can do
		  HorizontalScrollBar.Maximum = me.gridImage.Width - g.Width
		  
		  // Disable scrollbar if image is narrower than canvas area since there
		  // is nothing to scroll
		  If g.Width > me.gridImage.Width Then
		    HorizontalScrollBar.Enabled = False 
		    me.mXScroll = 0
		  Else
		    HorizontalScrollBar.Enabled = True
		  End If
		  
		  #If TargetWindows Then
		    If me.DraggingRect <> Nil Then
		      If Not me.DraggingRect.Visible Then
		        If me.DraggingRect.isBeingResized Then
		          g.DrawingColor = &c2589FF
		        Elseif Not me.DraggingRect.isBeingResized Then
		          g.DrawingColor = &cFC4A34
		        End If
		        g.PenSize = 3
		        g.DrawRoundRectangle(me.DraggingRect.Left - me.canvasOffsetX,me.DraggingRect.Top - me.canvasOffsetY, _
		        me.DraggingRect.Width,me.DraggingRect.Height,10,10)
		      End If
		      
		    Elseif Me.canvasIsScrolling Then
		      g.DrawingColor = &cFC4A34
		      g.PenSize = 3
		      For each ec as ElementContainer in Me.Container
		        If ec.parentTeststep = me.canvasPage Then
		          g.DrawRoundRectangle(ec.Left - me.canvasOffsetX,ec.Top - me.canvasOffsetY, _
		          ec.Width,ec.Height,10,10)
		        End If
		      Next
		    End If
		  #Endif
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Const kLeftArrow = 28
		  Const kRightArrow = 29
		  Const kUpArrow = 30
		  Const kDownArrow = 31
		  Const kDelete = 127
		  Const kScrollUnit = 20 // pixels to scroll per keypress
		  
		  // Move the scrollbar based on the key that was pressed
		  Select Case Asc(Key)
		  Case kLeftArrow
		    HorizontalScrollBar.Value = HorizontalScrollBar.Value - kScrollUnit
		    
		  Case kRightArrow
		    HorizontalScrollBar.Value = HorizontalScrollBar.Value + kScrollUnit
		    
		  Case kUpArrow
		    VerticalScrollBar.Value = VerticalScrollBar.Value - kScrollUnit
		    
		  Case kDownArrow
		    VerticalScrollBar.Value = VerticalScrollBar.Value + kScrollUnit
		    
		  Case kDelete
		    dim linkIndex as Integer = me.getSelectedLink
		    If linkIndex <> -1 Then
		      removeLink(me.Links(linkIndex), linkIndex)
		    End If
		  End Select
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  // If the mousewheel is moved over the Canvas, then
		  // use the delta to adjust the scrollbars, which
		  // scrolls the image.
		  
		  VerticalScrollBar.Value = VerticalScrollBar.Value + deltaY
		End Function
	#tag EndEvent
	#tag Event
		Function getHScrollBarVal() As ScrollBar
		  return HorizontalScrollBar
		End Function
	#tag EndEvent
	#tag Event
		Function getVScrollBarVal() As ScrollBar
		  Return VerticalScrollBar
		End Function
	#tag EndEvent
	#tag Event
		Sub setHScrollBarVal(value as Integer)
		  HorizontalScrollBar.Value = value
		End Sub
	#tag EndEvent
	#tag Event
		Sub setVScrollBarVal(value as Integer)
		  VerticalScrollBar.Value = value
		End Sub
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem <> Nil Then
		    dim mTag as String = hitItem.Tag
		    Select Case mTag
		    Case "Follow"
		      me.followLink
		    Case "Remove"
		      dim linkIndex as Integer = me.getSelectedLink
		      If linkIndex <> -1 Then
		        removeLink(me.Links(linkIndex), linkIndex)
		      End If
		    End Select
		  End If
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  dim lnks() as LinkInfo = me.Links 
		  For i as Integer = 0 To Ubound(lnks)
		    If me.WithinLink(i) And lnks(i).linkIsDrawn Then
		      Me.setSelectedLink(i)
		      Me.Invalidate(False)
		      Dim followMenuItem As MenuItem
		      followMenuItem = New MenuItem("Follow Link", "Follow")
		      If lnks(i).isLocal Then
		        followMenuItem.Enabled = False
		        base.Append(followMenuItem)
		      Else
		        base.Append(followMenuItem)
		      End If
		      base.Append(New MenuItem("Remove Link","Remove"))
		      me.LinkSelected(i)
		      Return True
		      Exit
		    Else
		      lnks(i).thickness = 3
		    End If
		  Next
		  Me.setSelectedLink(-1)
		  Me.Invalidate(False)
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub followLink()
		  // shorten this code soon
		  dim selLink as Integer = me.getSelectedLink
		  If selLink <> -1 Then
		    refreshTimer.Enabled = False
		    dim lkInfo as LinkInfo = me.Links(selLink)
		    dim newPageIndex as Integer
		    If lkInfo.fromElement.parentTeststep = testStepIDs(pageIndex) Then
		      newPageIndex = testStepIDs.IndexOf(lkInfo.toElement.parentTeststep)
		    ElseIf lkInfo.toElement.parentTeststep = testStepIDs(pageIndex) Then
		      newPageIndex = testStepIDs.IndexOf(lkInfo.fromElement.parentTeststep)
		    End If
		    'CurrentTestStep.Text = testStepNames(newPageIndex)
		    SchemCanvas.canvasPage = testStepIDs(newPageIndex)
		    'OutgoingStep.TestStepMenu.ListIndex = pageIndex
		    action_linkFollowed(testStepNames(newPageIndex),pageIndex)
		    pageIndex = newPageIndex
		    
		    hidePageElements
		    showPageElements
		    SchemCanvas.Invalidate(False)
		    refreshTimer.Enabled = True
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub DarkModeSchematics()
		  'OutgoingStep.darkModeEnabled = Me.darkModeEnabled
		  'If me.darkModeEnabled Then
		  'self.BackgroundColor = &c2D3137 '&c23282D
		  'CurrentTestStep.TextColor = Color.White
		  'Else
		  'Self.BackgroundColor = &cF5F6F7 'RGB(240,240,240)'&cF0F0F0
		  'CurrentTestStep.TextColor = Color.Black
		  'End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseEnter()
		  refreshTimer.RunMode = Timer.RunModes.Multiple
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  refreshTimer.RunMode = Timer.RunModes.Off
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VerticalScrollBar
	#tag Event
		Sub ValueChanged()
		  // Calculate the delta that the scrollbar was
		  // moved and scroll the image accordingly.
		  
		  Dim delta As Integer
		  delta = SchemCanvas.mVerticalScrollBarLast - Me.Value
		  SchemCanvas.mYScroll = SchemCanvas.mYScroll + delta
		  
		  SchemCanvas.Scroll(0, delta)
		  
		  SchemCanvas.mVerticalScrollBarLast = Me.Value
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  // If the mouse wheel is moved, adjust the scrollbar
		  // by the delta.
		  
		  Me.Value = Me.Value + deltaY
		  
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events HorizontalScrollBar
	#tag Event
		Sub ValueChanged()
		  // Calculate the delta that the scrollbar was
		  // moved and scroll the image accordingly.
		  
		  Dim delta As Integer
		  delta = SchemCanvas.mHorizontalScrollBarLast - Me.Value
		  SchemCanvas.mXScroll = SchemCanvas.mXScroll + delta
		  
		  SchemCanvas.Scroll(delta, 0)
		  
		  SchemCanvas.mHorizontalScrollBarLast = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events refreshTimer
	#tag Event
		Sub Action()
		  myRefresh
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
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
		Name="TabPanelIndex"
		Visible=false
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
		Name="AllowAutoDeactivate"
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
		InitialValue="False"
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
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
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
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
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
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="pageIndex"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
