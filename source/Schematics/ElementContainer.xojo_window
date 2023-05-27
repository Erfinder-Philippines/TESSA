#tag Window
Begin ContainerControl ElementContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cEAEAEA00
   DoubleBuffer    =   True
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   True
   Height          =   170
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   False
   Visible         =   True
   Width           =   160
   Begin GraphicalListbox ElementAttributes
      ActiveColumn    =   -1
      ActiveRow       =   -1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   True
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      darkModeEnabled =   False
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   True
      Enabled         =   True
      FontName        =   "Consolas"
      FontSize        =   0.0
      FontUnit        =   0
      genericTblHorizontal=   False
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   1
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   False
      HeadingIndex    =   -1
      Height          =   90
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   5
      ListboxType     =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   57
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   150
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas ElementIcon
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      Height          =   30
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   16
      Transparent     =   False
      Visible         =   True
      Width           =   30
   End
   Begin PushButton Expand
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Show All"
      Default         =   False
      Enabled         =   True
      FontName        =   "Consolas"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   17
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   35
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   148
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   96
   End
   Begin Label ElementName
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Consolas"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   42
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   102
   End
   Begin Label SequenceNo
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Consolas"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   5
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "#"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   147
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   30
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  If Expand.Enabled Then
		    If withinResizingArea(x,y) Then
		      Me.MouseCursor = System.Cursors.ArrowNorthwestSoutheast
		      cursorAtResize = True
		    Else
		      Me.MouseCursor = System.Cursors.StandardPointer
		      cursorAtResize = False
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  MousePosition = New Point(-1, -1)
		  MouseOffset = New Point(0, 0)
		  setExpandedHeight
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawingColor = &c2589FF
		  g.PenSize = 3
		  g.DrawLine(0, 0, g.Width, 0)
		  if Expand.Enabled then
		    g.DrawingColor = &cA0A0A0
		    g.PenSize = 1
		    g.DrawLine(g.Width - 15, g.Height, g.Width, g.Height - 15)
		    g.DrawLine(g.Width - 10, g.Height, g.Width, g.Height - 10)
		    g.DrawLine(g.Width - 5, g.Height, g.Width, g.Height - 5)
		  end if
		  
		  g.DrawingColor = &cA0A0A0
		  g.DrawRectangle(0,0,g.Width,g.height)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  If height = maxHeight Then
		    isExpanded = true
		    Expand.Caption = "Show Less"
		  Elseif height = minHeight Then
		    isExpanded = False
		    Expand.Caption = "Show More"
		  End If
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(eName as String, e_Num as Integer, eAttr() as string, pTestStep as String, uID as String, icon as Picture)
		  ElementName.Text = eName
		  ElementNo = e_Num
		  defaultHeight = self.Height
		  parentTeststep = pTestStep
		  uniqueID = uID
		  element_icon = icon
		  
		  For i as integer = 0 to eAttr.Ubound
		    ElementAttr.Append(eAttr(i))
		  Next
		  
		  allowDrop = True
		  
		  SequenceNo.Value = str(ElementNo)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub darkModeContainer()
		  ElementAttributes.darkModeEnabled = darkModeEnabled
		  If darkModeEnabled Then
		    Self.BackgroundColor = &c2D3137
		    ElementName.TextColor = Color.White
		    SequenceNo.TextColor = Color.White
		  Else
		    Self.BackgroundColor = &cF0f0f0
		    ElementName.TextColor = Color.Black
		    SequenceNo.TextColor = Color.Black
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadAttrListBox()
		  ElementAttributes.DeleteAllRows
		  ElementAttributes.Visible = False
		  For i as integer = 0 to ElementAttr.Ubound
		    ElementAttributes.AddRow(ElementAttr(i))
		  Next
		  ElementAttributes.Visible = True
		  setExpandedHeight
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadAttrListBox(idx as Integer)
		  ElementAttributes.DeleteAllRows
		  ElementAttributes.Visible = False
		  If idx <> -1 Then
		    ElementAttributes.AddRow(ElementAttr(idx))
		  End If
		  ElementAttributes.Visible = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadSelfAsStartEC()
		  ElementName.Text = startLinkElement.ElementName.Text
		  ElementNo = startLinkElement.ElementNo
		  defaultHeight = self.Height
		  parentTeststep = startLinkElement.parentTeststep
		  uniqueID = startLinkElement.uniqueID
		  element_icon = startLinkElement.element_icon
		  
		  dim eAttr() as String = startLinkElement.ElementAttr
		  For i as Integer = 0 to eAttr.Ubound
		    ElementAttr.Append(eAttr(i))
		  Next
		  
		  loadAttrListBox(startLinkElement.ElementAttributes.ListIndex)
		  ElementAttributes.EnableDrag = False
		  ElementIcon.Invalidate(False)
		  Expand.Enabled = False
		  Expand.Visible = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sameLinkSource() As Boolean
		  If uniqueID = startLinkElement.uniqueID Then
		    Return True
		  Else
		    Return False
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveLink(toEC as ElementContainer, fromRow as Integer, toRow as Integer)
		  dim sourceBC as BasicClass = App.GlobalTestSequence.FindElementByUniqueID(startLinkElement.uniqueID)
		  dim bc as BasicClass = App.GlobalTestSequence.FindElementByUniqueID(toEC.uniqueID)
		  If bc <> Nil and sourceBC <> Nil Then
		    'bc.GetAttribute(toRow).Link = sourceBC.GetAttribute(fromRow)
		    bc.GetAttribute(toRow).ConnectLink(sourceBC.GetAttribute(fromRow))
		    dim newLink as new LinkInfo(toEC, startLinkElement, toRow, fromRow, 3, startLinkElement.parentTeststep)
		    MainWindow.Links.Append(newLink)
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setExpandedHeight()
		  dim expandedHeight as Integer
		  dim rowHeight as Integer = ElementAttributes.RowHeight
		  dim visibleRows as Integer = ElementAttributes.Height / rowHeight
		  expandedHeight = ((self.Height + rowHeight * ElementAttributes.ListCount) - (visibleRows * rowHeight))
		  maxHeight = expandedHeight
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function withinResizingArea(x as Integer, y as Integer) As Boolean
		  If x >= me.Width - 15 and y >= me.Height - 15 Then
		    return true
		  End If
		  return False
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		allowDrop As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Top + Height
			End Get
		#tag EndGetter
		Bottom As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		cursorAtResize As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdarkModeEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdarkModeEnabled = value
			  darkModeContainer
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		defaultHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ElementAttr() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ElementNo As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		element_icon As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		isBeingResized As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		isExpanded As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		maxHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		maxWidth As Integer = 300
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		minHeight As Integer = 170
	#tag EndProperty

	#tag Property, Flags = &h0
		minWidth As Integer = 160
	#tag EndProperty

	#tag Property, Flags = &h0
		mouseoffset As Point
	#tag EndProperty

	#tag Property, Flags = &h0
		mouseposition As Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUniqueID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		parentTeststep As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Left + Width
			End Get
		#tag EndGetter
		Right As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Shared startLinkElement As ElementContainer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mUniqueID
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mUniqueID = value
			End Set
		#tag EndSetter
		uniqueID As String
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events ElementAttributes
	#tag Event
		Sub Open()
		  loadAttrListBox
		  If allowDrop Then
		    ElementAttributes.AcceptTextDrop
		    ElementAttributes.ShowDropIndicator = True
		  End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObjectOnRow(x As Integer, y As Integer, obj As DragItem, action As Integer, row As Integer, parentRow As Integer, location As Listbox.DropLocations)
		  If location = listbox.DropLocations.OnRow then
		    If obj.TextAvailable And Not sameLinkSource Then
		      dim fromRow as Integer = val(obj.Text)
		      dim toRow as Integer = row
		      saveLink(self,fromRow,toRow)
		    End If
		  End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  drag.Text = str(row)
		  
		  startLinkElement = self
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ElementIcon
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'Const RedColor = &cFF0000
		  '
		  'g.ForeColor = RedColor
		  'g.DrawRect(0, 0, g.width, g.height)
		  'If element_icon <> Nil Then
		  'g.DrawPicture(element_icon, 0, 0, me.Width, me.Height, 0, 0, element_icon.Width, element_icon.Height)
		  'End If
		  Const padding = 5
		  If element_icon <> nil Then
		    dim ratio as Double = min( (me.Height - padding) / element_icon.Height, (me.Width - padding) / element_icon.Width)
		    
		    // Calculate new size
		    dim w,h as Integer
		    
		    //maintain aspect ratio to fit in the canvas
		    w = element_icon.Width * ratio
		    h = element_icon.Height * ratio
		    
		    //Center the image
		    Dim x, y As Integer
		    x = Me.Width / 2 - w / 2
		    y = Me.Height / 2 - h / 2
		    
		    g.DrawPicture(element_icon, x, y, w, h, 0, 0, element_icon.Width, element_icon.Height)
		    g.ForeColor = RGB(0, 120, 215)
		    g.PenSize = 2
		    g.DrawRoundRectangle(0,0,me.Width,me.Height, 5, 5)
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Expand
	#tag Event
		Sub Action()
		  If isExpanded Then
		    self.Height = defaultHeight
		    isExpanded = False
		    Expand.Caption = "Show All"
		  Else
		    dim expandedHeight as Integer
		    dim rowHeight as Integer = ElementAttributes.RowHeight
		    dim visibleRows as Integer = ElementAttributes.Height / rowHeight
		    expandedHeight = ((self.Height + rowHeight * ElementAttributes.ListCount) - (visibleRows * rowHeight))
		    self.Height = maxHeight
		    ElementAttributes.ScrollPosition = 0
		    isExpanded = True
		    Expand.Caption = "Show Less"
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
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
		InitialValue="False"
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
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
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
		Name="Right"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Bottom"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="isExpanded"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="defaultHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="parentTeststep"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="uniqueID"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="element_icon"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ElementNo"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="allowDrop"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="isBeingResized"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="maxHeight"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="cursorAtResize"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="maxWidth"
		Visible=false
		Group="Behavior"
		InitialValue="500"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="minHeight"
		Visible=false
		Group="Behavior"
		InitialValue="170"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="minWidth"
		Visible=false
		Group="Behavior"
		InitialValue="160"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="darkModeEnabled"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
