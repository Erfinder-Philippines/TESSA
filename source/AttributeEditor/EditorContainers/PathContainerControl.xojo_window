#tag Window
Begin ContainerControl PathContainerControl Implements AttributeContainerInterface
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
   Height          =   202
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
   Width           =   272
   Begin Label PathInfoLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   14
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Folder attribute path"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   35
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   129
   End
   Begin PushButton SetPathButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   ">>"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Press to set folder path"
      Top             =   167
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
   Begin TextArea PathTextField
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
      Height          =   103
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   0
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   59
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   272
   End
   BeginSegmented SegmentedControl PathTypeSegmentedControl
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "Folder\n\nFalse\rFile\n\nTrue"
      SelectionType   =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   7
      Transparent     =   True
      Visible         =   True
      Width           =   104
   End
   Begin PushButton NewButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "New"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   49
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   167
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   43
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function correctPathWithTemplates(path As String) As String
		  If path <> "" And mCurrentAttribute <> Nil And Not mCurrentAttribute.isNativePath Then
		    If mCurrentAttribute.MyStep IsA PathTemplate Then
		      If path.InStr(mCurrentAttribute.MyStep.Name.GIAS) > 0 Then
		        MsgBox "Template path cannot contain template on self"
		        path = ""
		      End
		    End
		    
		    path = GetTemplateValueFromPath(path)
		  End
		  Return path
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function currentValue() As Variant
		  // Part of the AttributeContainerInterface interface.
		  Return PathTextField.Text
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitContainer(Attr as AttributeClass)
		  // Part of the AttributeContainerInterface interface.
		  if Attr IsA Path_AttributeClass Then
		    mCurrentAttribute = Path_AttributeClass(Attr)
		    mInitValue = mCurrentAttribute.OriginalValue
		    PathTextField.ReadOnly = mCurrentAttribute.ReadOnly
		    PathTypeSegmentedControl.Enabled = not mCurrentAttribute.ReadOnly
		    if mCurrentAttribute.IsFolder Then
		      PathTypeSegmentedControl.Items(0).Selected = True
		    Else
		      PathTypeSegmentedControl.Items(1).Selected = True
		    End
		    UpdateControls
		    UpdateValue
		    Me.Visible = True
		    UpdateSaveButton(not mCurrentAttribute.ReadOnly)
		  end
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
		  if mCurrentAttribute <> Nil And mCurrentAttribute.GIAS <> PathTextField.Text then
		    mCurrentAttribute.SIAS(PathTextField.Text)
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
		      PathTextField.Text = data.StringValue
		    End
		    mInitValue = PathTextField.Text
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

	#tag Method, Flags = &h21
		Private Sub SetPath(createNew aS Boolean)
		  If mCurrentAttribute <> Nil Then
		    Dim f As FolderItem = Nil
		    if mCurrentAttribute.IsFolder Then
		      Dim dlg As New SelectFolderDialog
		      dlg.Title =  mCurrentAttribute.Name + "..."
		      dlg.ActionButtonCaption = "Select"
		      dlg.PromptText = "Please select folder"
		      if PathTextField.Text="" then
		        f = GetWorkingFolderItem
		      else
		        f = GetFolderItem(PathTextField.Text)
		      end
		      if f<>nil then
		        if f.Directory then
		          dlg.InitialDirectory = f
		        else
		          f=f.Parent
		          if f.Directory then
		            dlg.InitialDirectory = f
		          else
		            dlg.InitialDirectory = GetWorkingFolderItem
		          End
		        end
		      end
		      f= dlg.ShowModal
		    Else
		      Dim dlg As FolderItemDialog
		      If createNew Then
		        dlg = New SaveAsDialog
		      Else
		        dlg = new OpenDialog
		      End
		      dlg.Title =  mCurrentAttribute.Name + "..."
		      dlg.ActionButtonCaption = "Select"
		      dlg.PromptText = "Please select file"
		      if PathTextField.Text="" then
		        f = GetWorkingFolderItem
		      else
		        f = GetFolderItem(PathTextField.Text)
		      end
		      if f<>nil then
		        if f.Directory then
		          dlg.InitialDirectory = f
		        else
		          f=f.Parent
		          if f.Directory then
		            dlg.InitialDirectory = f
		          else
		            dlg.InitialDirectory = GetWorkingFolderItem
		          End
		        end
		        dlg.Filter = FileTypes1.SpecialFolder + FileTypes1.SpecialAny
		        f = dlg.ShowModal
		      end
		    End
		    If f <> Nil Then
		      PathTextField.Text = f.NativePath
		      SaveValue
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UndoValue()
		  // Part of the AttributeContainerInterface interface.
		  PathTextField.Text = mInitValue
		  PathTextField.HelpTag = mInitValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateControls()
		  if mCurrentAttribute <> Nil Then
		    NewButton.Visible = Not mCurrentAttribute.IsFolder
		    if mCurrentAttribute.IsFolder Then
		      PathInfoLabel.Text = "Folder Path:"
		    Else
		      PathInfoLabel.Text = "File Path:"
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateValue()
		  if mCurrentAttribute <> Nil then
		    PathTextField.Text = mCurrentAttribute.OriginalValue
		    PathTextField.HelpTag = mCurrentAttribute.GIAS
		  End
		End Sub
	#tag EndMethod


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
		Private mCurrentAttribute As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitValue As String
	#tag EndProperty


#tag EndWindowCode

#tag Events SetPathButton
	#tag Event
		Sub Action()
		  SetPath(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PathTextField
	#tag Event
		Sub TextChange()
		  Me.HelpTag = Me.Text
		  Dim pos As Integer = Me.SelStart
		  Me.Text = correctPathWithTemplates(Me.Text)
		  Me.SelStart = pos
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
#tag Events PathTypeSegmentedControl
	#tag Event
		Sub Action(itemIndex as integer)
		  if mCurrentAttribute <> Nil Then
		    mCurrentAttribute.SetType(itemIndex = 0)
		    UpdateControls
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NewButton
	#tag Event
		Sub Action()
		  SetPath(True)
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
