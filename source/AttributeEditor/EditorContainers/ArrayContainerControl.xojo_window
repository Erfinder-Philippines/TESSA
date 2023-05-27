#tag Window
Begin ContainerControl ArrayContainerControl
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
   Height          =   234
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
   Transparent     =   True
   Visible         =   True
   Width           =   188
   Begin GraphicalListbox AttributeArray
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
      ColumnCount     =   2
      ColumnWidths    =   ""
      darkModeEnabled =   False
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      genericTblHorizontal=   False
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   1
      HasBorder       =   True
      HasHeader       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   206
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
      ListboxType     =   2
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   188
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton AddValue
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Add"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   211
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   67
   End
   Begin PushButton RemoveButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Remove"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   121
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   211
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   67
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub InitConatiner(Attr As AttributeClass)
		  if Attr IsA MultipleValuesAttributeClass then
		    mCurrentAttribute = MultipleValuesAttributeClass(Attr)
		    AttributeArray.Enabled = not Attr.ReadOnly
		    AttributeArray.columnWidths = "40"
		    UpdateAttrArray
		    Visible = True
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValues()
		  if mCurrentAttribute <> Nil then
		    For i As Integer = 0 to AttributeArray.ListCount - 1
		      mCurrentAttribute.SOAS(AttributeArray.Cell(i, 1), i)
		    Next
		    if AttributeArray.ListIndex >= 0 And AttributeArray.ListIndex <= mCurrentAttribute.GOAN Then
		      mCurrentAttribute.ActiveValue = AttributeArray.ListIndex
		    End
		    mCurrentAttribute.AttributeChanged
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateAttrArray()
		  if mCurrentAttribute <> nil then
		    if mCurrentAttribute.IsArray Then
		      AttributeArray.DeleteAllRows
		      For i As Integer = 0 to mCurrentAttribute.GOAN - 1
		        AttributeArray.AddRow(str(i))
		        AttributeArray.Cell(i, 1) = mCurrentAttribute.GOAS(i)
		      Next
		      AttributeArray.ListIndex = mCurrentAttribute.GOAA
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCurrentValue(data As Variant)
		  AttributeArray.Cell(AttributeArray.ListIndex,1) = data.StringValue
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event ItemAdded(item As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemChoosed(data As Variant)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ItemRemoved(index As Integer)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mCurrentAttribute As MultipleValuesAttributeClass = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events AttributeArray
	#tag Event
		Sub Change()
		  if Me.ListIndex >= 0 Then
		    ItemChoosed(Me.Cell(Me.ListIndex, 1))
		    
		    If Me.ListIndex <= mCurrentAttribute.GIAN Then
		      mCurrentAttribute.ActiveValue = Me.ListIndex
		    End
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddValue
	#tag Event
		Sub Action()
		  If mCurrentAttribute <> Nil Then
		    Dim lastActiveIndex As Integer = mCurrentAttribute.GIAA
		    mCurrentAttribute.ActiveValue = mCurrentAttribute.GIAN - 1
		    mCurrentAttribute.AddValue("")
		    mCurrentAttribute.ActiveValue = lastActiveIndex
		    UpdateAttrArray
		    ItemAdded("")
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RemoveButton
	#tag Event
		Sub Action()
		  If mCurrentAttribute <> Nil And mCurrentAttribute.GIAN > 0 Then
		    If mCurrentAttribute.RemoveValue(AttributeArray.ListIndex) Then
		      UpdateAttrArray
		      ItemRemoved(AttributeArray.ListIndex)
		    End
		  End
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
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
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
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
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
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
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
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
