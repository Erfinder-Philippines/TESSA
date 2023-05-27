#tag Window
Begin ContainerControl ResourceContainerControl Implements AttributeContainerInterface
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
   Height          =   168
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
   Width           =   212
   Begin TextArea ValueArea
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   126
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   212
   End
   Begin PopupMenu AttrEditorResourceTestcases
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   19
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Test"
      Italic          =   False
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   2
      SelectedRowIndex=   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   141
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   106
   End
   Begin PushButton AttrEditorResource
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "test"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   115
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   140
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function currentValue() As Variant
		  // Part of the AttributeContainerInterface interface.
		  Return ValueArea.Text
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitContainer(Attr as AttributeClass)
		  // Part of the AttributeContainerInterface interface.
		  if Attr IsA Resource_AttributeClass Then
		    mCurrentAttribute = Resource_AttributeClass(Attr)
		    mInitValue = mCurrentAttribute.GIAS
		    
		    ValueArea.Visible = True
		    ValueArea.ReadOnly = mCurrentAttribute.ReadOnly
		    AttrEditorResource.Visible = True
		    AttrEditorResource.Enabled = not mCurrentAttribute.ReadOnly
		    UpdateValue
		    
		    if mCurrentAttribute.MyStep IsA CommonResources.DO_BitMask then
		      AttrEditorResourceTestcases.Visible = True
		      // fill the popup menu with the choices
		      AttrEditorResourceTestcases.DeleteAllRows
		      Dim S as string
		      Dim n as integer = 0
		      for i As integer = 0 to CommonResources.DO_BitMask(mCurrentAttribute.MyStep).ValueEnum.GIAN - 1
		        S = CommonResources.DO_BitMask(mCurrentAttribute.MyStep).ValueEnum.GIAS(i)
		        AttrEditorResourceTestcases.AddRow(S)
		        if S = CommonResources.DO_BitMask(mCurrentAttribute.MyStep).Value.GIAS then
		          n = i
		        end
		      next
		      AttrEditorResourceTestcases.ListIndex = n
		      AttrEditorResourceTestcases.Enabled = not mCurrentAttribute.ReadOnly
		    else
		      'if mCurrentAttribute.MyStep IsA ResourceClass then
		      'if ResourceClass(mCurrentAttribute.MyStep).FunctionEnum.GIAS <> "" then
		      'AttrEditorResourceTestcases.Visible = true
		      '// fill the popup menu with the choices
		      'AttrEditorResourceTestcases.DeleteAllRows
		      'Dim S as string
		      'Dim n as integer = 0
		      'for i As integer = 0 to ResourceClass(mCurrentAttribute.MyStep).FunctionEnum.GIAN - 1
		      'S = ResourceClass(mCurrentAttribute.MyStep).FunctionEnum.GIAS(i)
		      'AttrEditorResourceTestcases.AddRow(S)
		      'if S = ResourceClass(mCurrentAttribute.MyStep).ResourceFunction.GIAS then
		      'n = i
		      'end
		      'next
		      'AttrEditorResourceTestcases.ListIndex = n
		      'AttrEditorResourceTestcases.Enabled = not mCurrentAttribute.ReadOnly
		      'end
		      'end
		    end
		    Me.Visible = True
		    UpdateSaveButton(not mCurrentAttribute.ReadOnly)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEnable() As Boolean
		  // Part of the AttributeContainerInterface interface.
		  Return Me.Enabled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue()
		  // Part of the AttributeContainerInterface interface.
		  if mCurrentAttribute <> Nil And mCurrentAttribute.GIAS <> ValueArea.Text then
		    mCurrentAttribute.SIAS(ValueArea.Text)
		    mCurrentAttribute.AttributeChanged
		    ValueSaved
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCurrentValue(data As Variant)
		  // Part of the AttributeContainerInterface interface.
		  if currentValue <> data Then
		    if data.Type = Variant.TypeString Then
		      ValueArea.Text = data.StringValue
		    End
		    mInitValue = ValueArea.Text
		    UpdateUndoButton(False)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEnable(value As Boolean)
		  // Part of the AttributeContainerInterface interface.
		  Me.Enabled = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UndoValue()
		  // Part of the AttributeContainerInterface interface.
		  ValueArea.Text = mInitValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateValue()
		  if mCurrentAttribute <> Nil then
		    ValueArea.Text = mCurrentAttribute.GIAS
		  End
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event StartManualOperation(OPA as AttributeClass, UpdateAttrEditor as boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UpdateSaveButton(needToDisplay As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UpdateUndoButton(needToDisplay As Boolean)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ValueSaved()
	#tag EndHook


	#tag Property, Flags = &h21
		Private mCurrentAttribute As Resource_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitValue As String
	#tag EndProperty


#tag EndWindowCode

#tag Events ValueArea
	#tag Event
		Sub TextChange()
		  UpdateUndoButton(Me.Text <> mInitValue)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if Asc(Key) = 13 Or Asc(Key) = 9 Then
		    SaveValue
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events AttrEditorResource
	#tag Event
		Sub Action()
		  // test the connected resource function
		  if mCurrentAttribute <> Nil And mCurrentAttribute.MyStep IsA ResourceClass Then
		    Select case mCurrentAttribute.MyStep
		    case IsA CommonResources. DO_BitMask
		      ValueArea.Text = AttrEditorResourceTestcases.List(AttrEditorResourceTestcases.ListIndex)
		      SaveValue
		      if ResourceClass(mCurrentAttribute.MyStep).Run("", mCurrentAttribute) then
		        RaiseEvent StartManualOperation(mCurrentAttribute, true)
		      end
		    case IsA CommonResources.AO_Channel
		      SaveValue
		      if ResourceClass(mCurrentAttribute.MyStep).Run("", mCurrentAttribute) then
		        RaiseEvent StartManualOperation(mCurrentAttribute, False)
		      end
		    else
		      ValueArea.Text = AttrEditorResourceTestcases.List(AttrEditorResourceTestcases.ListIndex)
		      SaveValue
		      if ResourceClass(mCurrentAttribute.MyStep).Run(ValueArea.Text, mCurrentAttribute) then
		        RaiseEvent StartManualOperation(mCurrentAttribute, true)
		      end
		    end
		    'RaiseEvent StartManualOperation(mCurrentAttribute, true)
		  end
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
