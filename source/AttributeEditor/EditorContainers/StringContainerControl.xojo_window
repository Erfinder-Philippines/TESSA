#tag Window
Begin ContainerControl StringContainerControl Implements AttributeContainerInterface
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
   Height          =   148
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
   Width           =   230
   Begin TextArea AttributeValue
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
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
      Height          =   114
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
      Top             =   1
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   117
   End
   Begin NumbericValidator LineField
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
      Height          =   32
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   230
   End
   Begin BevelButton ButtonSpecialChars
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   5
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   ""
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   514478079
      IconAlignment   =   1
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   69
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MenuStyle       =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   119
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   False
      Width           =   35
   End
   Begin BevelButton ButtonAnalyse
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   5
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   ""
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   753991679
      IconAlignment   =   1
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   38
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MenuStyle       =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      Tooltip         =   "Press this button to see the additional ASCII codes of the text information"
      Top             =   119
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   33
   End
   Begin BevelButton ButtonClear
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   5
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   ""
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   1028591615
      IconAlignment   =   1
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   8
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MenuStyle       =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      Tooltip         =   "Clears the string attribute, \nPress set in order to verify."
      Top             =   119
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   33
   End
   Begin TextArea AttributeValueBin
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   False
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
      Height          =   114
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   116
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
      TabIndex        =   5
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
      Width           =   114
   End
   Begin RadioButton RB_Dec
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Dec"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   110
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   121
      Transparent     =   True
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   48
   End
   Begin RadioButton RB_Hex
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Hex"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   164
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   121
      Transparent     =   True
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   58
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  base.Append(new MenuItem("Save to Debug", "debug"))
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem <> Nil Then
		    Select Case hitItem.Tag.StringValue
		    Case "debug"
		      Dim txtName As String = "DebugPring_" + mCurrentAttribute.MyStep.Name.GIAS +"_"+ mCurrentAttribute.Name + "_date_index"
		      Dim f As FolderItem = GetFolderItem(GetScreenshotsFolder)
		      If CheckFolder(f) Then
		        f = f.Child("DebugTexts")
		        If f <> Nil Then
		          If Not f.Exists Then
		            f.CreateAsFolder
		          End
		          Dim CurrentDate As new Date
		          f = f.Child(txtName + "-" + Format(CurrentDate.Hour, "0#\.") + Format(CurrentDate.Minute, "0#\.") + Format(CurrentDate.Second, "0#") + ".txt")
		          If f <> Nil Then
		            Call OpenMeasFileForSave(currentValue().StringValue, f)
		          End
		        End
		      End
		    End
		  End
		End Function
	#tag EndEvent

	#tag Event
		Sub Resized()
		  ResizeControls
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  ResizeControls
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function currentValue() As Variant
		  // Part of the AttributeContainerInterface interface.
		  // returns the actual value(s) of the container as a variant
		  if LineField.Visible Then
		    Return LineField.Text
		  End
		  Return AttributeValue.Text
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSelText() As string
		  return AttributeValue.SelText
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitContainer(Attr as AttributeClass)
		  // initializes the container each time it is setup for editing an attribute
		  If Attr <> Nil Then
		    mCurrentAttribute = Attr
		    mInitValue = mCurrentAttribute.GIAS
		    ButtonAnalyse.Icon = Small_Analyse
		    ButtonSpecialChars.Icon = Small_q
		    AttributeValueBin.Visible = false
		    RB_Dec.Visible=false
		    RB_Hex.Visible=false
		    LineField.Visible = false
		    Select case mCurrentAttribute.Format
		    case 0 // normal
		      AttributeValue.Width = Me.Width
		      AttributeValue.Visible = true
		    case 1 // single line
		      LineField.Visible = true
		      AttributeValue.Visible = false
		    case 2 // normal with special characters
		      AttributeValue.Visible = true
		      ButtonSpecialChars.Icon = Small_q_Inverted
		    case 3 // analyse with binary information
		      'AttributeValue.Width = Me.Width/2
		      'AttributeValueBin.Width = Me.Width/2
		      'AttributeValueBin.Left = Me.Width/2
		      AttributeValue.Visible = true
		      AttributeValueBin.Visible = true
		      RB_Dec.Visible=true
		      RB_Hex.Visible=true
		      ButtonAnalyse.Icon = Small_Analyse_Inverted
		      ResizeControls
		    end
		    LineField.ReadOnly = mCurrentAttribute.ReadOnly
		    AttributeValue.ReadOnly = mCurrentAttribute.ReadOnly
		    UpdateValue
		    Me.Visible = True
		    
		    UpdateSaveButton(AttributeValue.Visible And Not mCurrentAttribute.ReadOnly)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEnable() As Boolean
		  // Part of the AttributeContainerInterface interface
		  // returns the state "eneabled" of the editor
		  Return Me.Enabled
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResizeControls()
		  If AttributeValueBin.Visible Then
		    AttributeValue.Width = Me.Width / 2
		    AttributeValueBin.Left = Me.Width / 2
		    AttributeValueBin.Width = Me.Width / 2
		  Else
		    AttributeValue.Width = Me.Width
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue()
		  // Part of the AttributeContainerInterface interface.
		  // saves the value at the end of the editing session, or when the "set" button is pressed
		  if (mCurrentAttribute <> Nil) And not(StrComp(mCurrentAttribute.GIAS,currentValue().StringValue,0)=0) then
		    If mCurrentAttribute.Name = mCurrentAttribute.MyStep.Name.Name Then
		      Dim CurrentName As String = Me.currentValue
		      CurrentName = CurrentName.ReplaceAll(" ","_")
		      mCurrentAttribute.SIAS(CurrentName)
		      
		      If CurrentName <> mCurrentAttribute.GIAS And isElementNameAsDouble(mCurrentAttribute.MyStep, CurrentName) Then
		        Dim infoDialog As New MessageDialog
		        infoDialog.Icon = MessageDialog.GraphicCaution
		        infoDialog.ActionButton.Caption  = "Ok"
		        infoDialog.CancelButton.Visible = True
		        infoDialog.Message = "You can not have two elements with the same name in a single TestSequence."
		        infoDialog.Explanation = "If you click OK then to the element name will added automatic indexing."
		        Dim pressButton As MessageDialogButton = infoDialog.ShowModal
		        Select Case pressButton
		        Case infoDialog.ActionButton
		          Me.setCurrentValue(App.GlobalTopmostElement.FindHighestName(CurrentName,App.GlobalTopmostElement.GetHierarchicalLinksSetting))
		        Case infoDialog.CancelButton
		          Return
		        End
		      End
		    else
		      mCurrentAttribute.SIAS(currentValue().StringValue)
		    End
		    mCurrentAttribute.AttributeChanged
		    ValueSaved
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub scrollToBottom()
		  'If mCurrentAttribute.Name = "ComLog" Then
		  AttributeValue.SelectionStart = AttributeValue.Value.Length
		  Dim pos As Integer = AttributeValue.SelectionStart
		  AttributeValue.ScrollPosition = AttributeValue.LineNumber(pos)
		  'End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCurrentValue(data As Variant)
		  // Part of the AttributeContainerInterface interface.
		  // sets the given value as a variant to the editor 
		  if currentValue <> data Then
		    AttributeValue.Text = data
		    LineField.Text = data
		    if mCurrentAttribute.Format=3 then
		      BigDataBlock = AttributeValue.Text.Len>100 
		      if BigDataBlock then
		        AttributeValueBin.Text="Big Data Block!"+CR+"select characters on the left"+CR
		        if RB_Dec.Value then
		          for n as integer=1 to SelectedBinText.len
		            AttributeValueBin.Text=str(asc(SelectedBinText.mid(n,1)))+"."
		          next
		        else
		          for n as integer=1 to SelectedBinText.len
		            AttributeValueBin.Text=StrHex(asc(SelectedBinText.mid(n,1)),2)+"."
		          next
		        end
		      else
		        if RB_Dec.Value then
		          for n as integer=1 to AttributeValue.Text.len
		            AttributeValueBin.Text=str(asc(AttributeValue.Text.mid(n,1)))+"."
		          next
		        else
		          for n as integer=1 to AttributeValue.Text.len
		            AttributeValueBin.Text=StrHex(asc(AttributeValue.Text.mid(n,1)),2)+"."
		          next
		        end
		      end
		    end
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEnable(value As Boolean)
		  // Part of the AttributeContainerInterface interface.
		  // enables the editor, the user can then make changes
		  Me.Enabled = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UndoValue()
		  // Part of the AttributeContainerInterface interface.
		  // resets the value(s) to the value(s) at the start of the editing session
		  AttributeValue.Text = mInitValue
		  LineField.Text = mInitValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateValue()
		  // Part of the AttributeContainerInterface interface.
		  // updates the actual value(s) in the main attribute into the editor controls
		  
		  if mCurrentAttribute <> Nil then
		    AttributeValue.Text = mCurrentAttribute.GIAS
		    scrollToBottom
		    LineField.Text = mCurrentAttribute.GIAS
		    if mCurrentAttribute.Format=3 then
		      Dim S as string = mCurrentAttribute.GIAS
		      AttributeValueBin.Text=""
		      if RB_Dec.Value then
		        for n as integer=1 to S.len
		          AttributeValueBin.AppendText(str(asc(S.mid(n,1)))+".")
		        next
		      else
		        for n as integer=1 to AttributeValue.Text.len
		          AttributeValueBin.AppendText(StrHex(asc(S.mid(n,1)),2)+".")
		        next
		      end
		    end
		  End
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event EditNext()
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
		Private BigDataBlock As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentAttribute As AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitValue As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectedBinText As string
	#tag EndProperty


#tag EndWindowCode

#tag Events AttributeValue
	#tag Event
		Sub TextChange()
		  If mCurrentAttribute.Name = mCurrentAttribute.MyStep.Name.Name Then
		    Me.Text = Me.Text.ReplaceAll(".", "")
		  End
		  UpdateUndoButton(Me.Text <> mInitValue)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if Asc(Key)=13 Or Asc(Key)=9 or Asc(Key)=3 Then
		    SaveValue
		    if mCurrentAttribute IsA String_AttributeClass then
		      If String_AttributeClass(mCurrentAttribute).IsArray Then
		        EditNext
		      End
		    end
		  End
		End Function
	#tag EndEvent
	#tag Event
		Sub SelChange()
		  if mCurrentAttribute.Format=3 then
		    Dim n,i1,i2,n1,n2, L as integer = -1
		    Dim S1 as string = AttributeValue.Text
		    if BigDataBlock then
		      SelectedBinText = AttributeValue.SelText
		      AttributeValueBin.Refresh
		      Dim S2 as string = AttributeValueBin.Text
		    else
		      Dim S2 as string = AttributeValueBin.Text
		      L=S2.len
		      if AttributeValue.SelStart=0 then
		        i1=1
		        n=1
		        n1=0
		      else
		        while (n<L) and ((i1+1)<AttributeValue.SelStart)
		          n=n+1
		          if S2.Mid(n,1)="." then
		            i1=i1+1
		            n1=n
		          end
		        wend
		      end
		      
		      while (n<L) and ((i2+1)<AttributeValue.SelLength)
		        n=n+1
		        if S2.Mid(n,1)="." then
		          i2=i2+1
		          n2=n
		        end
		      wend
		      
		      if n1>=0 and n2>=0 then
		        AttributeValueBin.SelStart = n1
		        AttributeValueBin.SelLength = n2-n1-1
		        AttributeValueBin.Refresh
		      end
		    end
		  end
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LineField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.StringType)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValidTextChange()
		  If mCurrentAttribute.Name = mCurrentAttribute.MyStep.Name.Name Then
		    Dim pos As Integer = Me.SelStart
		    Me.Text = Me.Text.ReplaceAll(".", "")
		    Me.SelStart = pos
		  End
		  UpdateUndoButton(Me.Text <> mInitValue)
		End Sub
	#tag EndEvent
	#tag Event
		Sub EnterTabPressed()
		  SaveValue
		  UpdateUndoButton(False)
		  if mCurrentAttribute IsA String_AttributeClass then
		    If String_AttributeClass(mCurrentAttribute).IsArray Then
		      EditNext
		    end
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonSpecialChars
	#tag Event
		Sub Action()
		  if mCurrentAttribute.Format=2 then
		    mCurrentAttribute.Format=0
		  else
		    mCurrentAttribute.Format=2
		  end
		  
		  InitContainer(mCurrentAttribute)
		  
		  '¶
		  'PILCROW SIGN
		  'Unicode: U+00B6, UTF-8: C2 B6
		  '⇥
		  'RIGHTWARDS ARROW TO BAR
		  'Unicode: U+21E5, UTF-8: E2 87 A5
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonAnalyse
	#tag Event
		Sub Action()
		  if mCurrentAttribute.Format=3 then
		    mCurrentAttribute.Format=0
		  else
		    mCurrentAttribute.Format=3
		  end
		  
		  InitContainer(mCurrentAttribute)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ButtonClear
	#tag Event
		Sub Action()
		  setCurrentValue("")
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AttributeValueBin
	#tag Event
		Sub TextChange()
		  If mCurrentAttribute.Name = mCurrentAttribute.MyStep.Name.Name Then
		    Me.Text = Me.Text.ReplaceAll(".", "")
		  End
		  UpdateUndoButton(Me.Text <> mInitValue)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if Asc(Key)=13 Or Asc(Key)=9 or Asc(Key)=3 Then
		    if mCurrentAttribute IsA String_AttributeClass then
		      
		      If String_AttributeClass(mCurrentAttribute).IsArray Then
		        EditNext
		      End
		    End
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events RB_Dec
	#tag Event
		Sub Action()
		  UpdateValue
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RB_Hex
	#tag Event
		Sub Action()
		  UpdateValue
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
		Name="SelectedBinText"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
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
