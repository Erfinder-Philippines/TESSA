#tag Window
Begin ContainerControl TestStepContainer
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
   Height          =   164
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
   Width           =   142
   Begin GraphicalListbox ElementsListBox
      ActiveColumn    =   -1
      ActiveRow       =   -1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
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
      Height          =   108
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   7
      ListboxType     =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   33
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   128
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
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
      Left            =   37
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   145
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   68
   End
   Begin PopupMenu TestStepMenu
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "Consolas"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   128
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  If obj.TextAvailable Then
		    'MsgBox "Dropped attr index: " + obj.Text
		    dim bc as BasicClass = App.GlobalTestSequence.FindElementByUniqueID(TestStepMenu.RowTag(TestStepMenu.ListIndex))
		    ModalLinkEditor.selectedRoot = bc
		    ModalLinkEditor.selectedAttrRow = val(obj.Text)
		    ModalLinkEditor.loadStartLinkElement
		    ModalLinkEditor.schemTabClassInstance = RaiseEvent getSchemTabInstance
		    ModalLinkEditor.Show
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.AcceptTextDrop
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  g.DrawingColor = &cA0A0A0
		  g.DrawRectangle(0,0,g.Width,g.height)
		  
		  g.DrawingColor = &cFC4A34
		  'g.DrawLine(0, 0, g.Width, 0)
		  g.FillRectangle(0,0,g.Width,3)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub darkModeContainer()
		  ElementsListBox.darkModeEnabled = darkModeEnabled
		  If darkModeEnabled Then
		    Self.BackgroundColor = &c2D3137
		    'ElementName.TextColor = Color.White
		  Else
		    Self.BackgroundColor = &cF0f0f0
		    'ElementName.TextColor = Color.Black
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getMenuID() As String
		  If TestStepMenu.ListIndex <> -1 Then
		    dim stringID as String = TestStepMenu.RowTag(TestStepMenu.ListIndex)
		    return stringID
		  Else
		    return ""
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getRowIndex(elementID as String) As Integer
		  If ElementsListBox.ListCount <> 0 Then
		    For i as Integer = 0 to ElementsListBox.ListCount - 1
		      If elementID = str(ElementsListBox.RowTag(i)) Then
		        return i
		      End If
		    Next
		  End If
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub loadElements(listIndx as Integer)
		  ElementsListBox.DeleteAllRows
		  dim bc as BasicClass = App.GlobalTestSequence.FindElementByUniqueID(TestStepMenu.RowTag(listIndx))
		  If bc <> Nil And bc IsA Test_StepClass And bc.FirstSubStep <> Nil Then
		    bc = bc.FirstSubStep
		    dim i as integer = 0
		    Do
		      ElementsListBox.AddRow(bc.Name.FirstValue)
		      ElementsListBox.RowTag(i) = bc.GetUniqueID
		      bc = bc.NextStep
		      i = i + 1
		    Loop Until bc = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadSteps(stepIDs() as String)
		  TestStepMenu.DeleteAllRows
		  If stepIDs.Ubound <> -1 Then
		    For i as Integer = 0 to stepIDs.Ubound
		      dim bc as BasicClass = App.GlobalTestSequence.FindElementByUniqueID(stepIDs(i))
		      If bc <> Nil Then
		        TestStepMenu.AddRow(bc.Name.FirstValue)
		        TestStepMenu.RowTag(i) = bc.GetUniqueID
		      End if
		    Next
		  End If
		  TestStepMenu.ListIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SelectedTSChangeAction()
		  RaiseEvent SelectedTStepChanged
		  
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event getSchemTabInstance() As SchematicTabClass
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectedTStepChanged()
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return Top + Height
			End Get
		#tag EndGetter
		Bottom As Integer
	#tag EndComputedProperty

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
		isExpanded As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty


#tag EndWindowCode

#tag Events ElementsListBox
	#tag Event
		Sub Open()
		  'Me.AcceptTextDrop
		End Sub
	#tag EndEvent
	#tag Event
		Sub DropObjectOnRow(x As Integer, y As Integer, obj As DragItem, action As Integer, row As Integer, parentRow As Integer, location As Listbox.DropLocations)
		  'If location = listbox.DropLocations.OnRow then
		  'If obj.TextAvailable And Not sameLinkSource Then
		  'dim fromRow as Integer = val(obj.Text)
		  'dim toRow as Integer = row
		  'saveLink(self,fromRow,toRow)
		  'End If
		  'End If
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  'drag.Text = str(row)
		  '
		  'startLinkElement = self
		  'Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Expand
	#tag Event
		Sub Action()
		  'If isExpanded Then
		  'self.Height = defaultHeight
		  'ContainerBorder.Height = defaultHeight
		  'isExpanded = False
		  'Expand.Caption = "Show All"
		  'Else
		  'dim expandedHeight as Integer
		  'dim rowHeight as Integer = ElementAttributes.RowHeight
		  'dim visibleRows as Integer = ElementAttributes.Height / rowHeight
		  'expandedHeight = ((self.Height + rowHeight * ElementAttributes.ListCount) - (visibleRows * rowHeight))
		  'self.Height = expandedHeight
		  'ContainerBorder.Height = expandedHeight
		  'ElementAttributes.ScrollPosition = 0
		  'isExpanded = True
		  'Expand.Caption = "Show Less"
		  'End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TestStepMenu
	#tag Event
		Sub Change()
		  loadElements(Me.ListIndex)
		  SelectedTSChangeAction
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
		Name="Bottom"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
		Name="isExpanded"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
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
