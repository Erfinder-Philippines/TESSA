#tag Window
Begin Window SaveInElementLibrary
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   8
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   295
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Save element to Library"
   Visible         =   True
   Width           =   468
   Begin Label Label1
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Chosen Element:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   7
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin Label Label3
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "New name:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   89
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin TextField newNameField
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
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
      Height          =   27
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   139
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   88
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   309
   End
   Begin PushButton CancelButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   259
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   263
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   95
   End
   Begin Label Label4
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   139
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Element Name"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   22
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin Label Label5
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   139
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Template Name"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   54
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin Label elementNameLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   251
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   22
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   217
   End
   Begin Label templateNameLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   251
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   54
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   217
   End
   Begin GroupBox GroupBox1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Icon Option"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   114
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   318
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   127
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   130
      Begin RadioButton copyRadioButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Copy icon"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   328
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   153
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   110
      End
      Begin RadioButton noIconRadioButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "No icon"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   328
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   182
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   110
      End
      Begin RadioButton chooseIconRadioButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Choose icon"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   328
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   214
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   110
      End
   End
   Begin GroupBox GroupBox2
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Save Option"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   114
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   139
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   127
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
      Begin RadioButton asNewRadioButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "As New"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   False
         Left            =   149
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   156
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   100
      End
      Begin RadioButton overrideRadioButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Override"
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   False
         Left            =   149
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   188
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   100
      End
   End
   Begin PushButton SaveButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   366
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   263
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h1
		Protected Function CheckName() As Boolean
		  if mBasicClass = Nil Then
		    Close
		    Return False
		  ElseIf newNameField.Text = "" Then
		    MsgBox "Element name cannot be empty." + EndOfLine + "Please input name."
		    Return False
		  Else
		    Dim BS As new BasicClass("")
		    BS.BasicTypeName = mBasicClass.BasicTypeName
		    If mBasicClass.BasicTypeName <> newNameField.Text Then
		      BS.DerivedType.SIAS(newNameField.Text)
		    End
		    Dim type As ElementType = ElementTypeFactory.instance.GetElementType(BS)
		    if type <> Nil Then
		      MsgBox "Element name already exists." + chr(13) + "Please input another name."
		      Return False
		    End
		  End
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitControls()
		  if mBasicClass <> Nil Then
		    elementNameLabel.Text = mBasicClass.Name.GIAS
		    
		    templateNameLabel.Text = mBasicClass.BasicTypeName
		    If mBasicClass.DerivedType.GIAS <> "" Then
		      templateNameLabel.Text = mBasicClass.DerivedType.GIAS
		    End
		    
		    Dim type As ElementType = ElementTypeFactory.instance.GetElementType(mBasicClass)
		    if type <> Nil Then
		      newNameField.Text = type.GetName
		    Else
		      newNameField.Text = mBasicClass.BasicTypeName
		      If mBasicClass.DerivedType.GIAS <> "" Then
		        newNameField.Text = mBasicClass.DerivedType.GIAS
		      End
		    End
		    
		    overrideRadioButton.Enabled = (type <> Nil)
		    copyRadioButton.Enabled = overrideRadioButton.Enabled
		    if copyRadioButton.Enabled Then
		      copyRadioButton.Value = True
		    Else
		      noIconRadioButton.Value = True
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveElement(folder As FolderItem, Name As String, override As boolean, chooseIcon As Boolean, copyIcon As Boolean)
		  If (mBasicClass <> Nil) And CheckFolder(folder) Then
		    Dim f As FolderItem = folder.Child(Name)
		    if f <> Nil Then
		      If not f.Exists Then
		        f.CreateAsFolder
		      End
		      Dim type As ElementType = ElementTypeFactory.instance.GetElementType(mBasicClass)
		      Dim S As String
		      Dim oldDerivedType As String = mBasicClass.DerivedType.GIAS
		      if Not override Then
		        if mBasicClass.BasicTypeName <> Name Then
		          mBasicClass.DerivedType.SIAS(Name)
		        End
		      End
		      mBasicClass.Save(S, 0)
		      mBasicClass.DerivedType.SIAS(oldDerivedType)
		      If S <> "" And OpenMeasFileForSave(S, f.Child(Name + ".xml")) Then
		        If chooseIcon Then
		          Dim d As new OpenDialog
		          d.ActionButtonCaption = "Select Image"
		          d.Title = "Element Icon"
		          d.PromptText = "Please select element icon with size 64x64"
		          d.Filter = FileTypes1.Jpeg + FileTypes1.Png
		          Dim imageItem As FolderItem = d.ShowModal
		          If imageItem <> Nil Then
		            Dim pic As Picture = Picture.Open(imageItem)
		            if pic <> Nil Then
		              pic.Save(f.Child(Name + "64.png"), Picture.SaveAsPNG)
		              pic = pic.ScaleMBS(16, 16)
		              If pic <> Nil Then
		                pic.Save(f.Child(Name + ".png"), Picture.SaveAsPNG)
		              End
		            End
		          End
		        ElseIf copyIcon Then
		          if not override Then
		            If type <> Nil Then
		              Dim pic As Picture = type.getIcon
		              If pic <> Nil Then
		                pic.Save(f.Child(Name + ".png"), Picture.SaveAsPNG)
		              End
		              pic = type.getBigIcon
		              If pic <> Nil Then
		                pic.Save(f.Child(Name + "64.png"), Picture.SaveAsPNG)
		              End
		            End
		          End
		        End
		        If type <> Nil Then
		          if not override Then
		            S = OpenMeasFileForLoad(type.GetPath.Child(type.GetName + "_desc.xml"), False)
		            If S <> "" Then
		              Call OpenMeasFileForSave(S, f.Child(Name + "_desc.xml"))
		            End
		          End
		          ElementTypeFactory.instance.LoadAllElements
		        End
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBasicClass(BS As BasicClass)
		  mBasicClass = BS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show()
		  InitControls
		  Super.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowModal()
		  InitControls
		  Super.ShowModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowModalWithin(parentWindow As Window)
		  InitControls
		  Super.ShowModalWithin(parentWindow)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowWithin(parentWindow As Window, facing As Integer = - 1)
		  InitControls
		  Super.ShowWithin(parentWindow, facing)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mBasicClass As BasicClass = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events CancelButton
	#tag Event
		Sub Action()
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events asNewRadioButton
	#tag Event
		Sub Action()
		  newNameField.Enabled = Me.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events overrideRadioButton
	#tag Event
		Sub Action()
		  newNameField.Enabled = not me.Value
		  
		  newNameField.Text = mBasicClass.DerivedType.GIAS
		  If newNameField.Text = "" Then
		    Dim type As ElementType = ElementTypeFactory.instance.GetElementType(mBasicClass)
		    if type <> Nil Then
		      newNameField.Text = type.GetName
		    End
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveButton
	#tag Event
		Sub Action()
		  if asNewRadioButton.Value Then
		    if CheckName Then
		      Dim d As new SelectFolderDialog
		      d.Title = "New Element"
		      d.PromptText = "Please select folder where do You want to store your new element"
		      Dim f As FolderItem = GetWorkingFolderItem
		      if CheckFolder(f) Then
		        f = f.Child("Elements")
		      End
		      if f = Nil Or f.NativePath.InStr("Elements") = 0 Then
		        MsgBox "Please select fodler in the Element folder"
		      Else
		        d.InitialDirectory = f
		        f = d.ShowModal
		        if f = Nil Then
		          Return
		        End
		        SaveElement(f, newNameField.Text, false, chooseIconRadioButton.Value, copyRadioButton.Value)
		        Close
		      End
		    End
		  ElseIf overrideRadioButton.Value Then
		    Dim type as ElementType = ElementTypeFactory.instance.GetElementType(mBasicClass)
		    if type <> Nil Then
		      Dim f As FolderItem = type.GetPath
		      if f <> Nil Then
		        SaveElement(f.Parent, type.GetName, true, chooseIconRadioButton.Value, copyRadioButton.Value)
		      End
		      Close
		    End
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="0"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
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
		Group="Appearance"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Appearance"
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
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
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
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
