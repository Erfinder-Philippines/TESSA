#tag Window
Begin GraphicalTabContainer SourceTabContainer Implements TabInterface
   AllowAutoDeactivate=   True
   AllowFocus      =   True
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cF5F6F700
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   True
   Height          =   204
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
   Width           =   540
   Begin TextArea parse_inputText
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowStyledText =   True
      AllowTabs       =   True
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   14.0
      FontUnit        =   2
      Format          =   ""
      HasBorder       =   False
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      Height          =   147
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   6
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
      Top             =   55
      Transparent     =   True
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   529
   End
   Begin PushButton PB_GetSource
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Get Source"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   4
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   7
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   167
   End
   Begin PushButton PB_SetSource
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Set Source to Hierarchy"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   338
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   9
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   197
   End
   Begin RadioButton RadioButtonShow
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   19
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   226
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   9
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   False
      Width           =   16
   End
   Begin RadioButton RadioButtonHide
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   19
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   226
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   29
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   False
      Width           =   16
   End
   Begin CheckBox StyleCheckBox
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   21
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   4
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   29
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   86
      Begin Label StyleTextLabel
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
         InitialParent   =   "StyleCheckBox"
         Italic          =   False
         Left            =   24
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   2
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Style Text"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   29
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   62
      End
   End
   Begin Label HideSubstepsLabel
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
      Left            =   245
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Hide Substeps"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   27
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   80
   End
   Begin Label ShowSubstepsLabel
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
      Left            =   245
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Show Substeps"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   8
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   80
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DarkModeTabElements(value as Boolean)
		  If value Then
		    ShowSubstepsLabel.TextColor = Color.White
		    HideSubstepsLabel.TextColor = Color.White
		    StyleTextLabel.TextColor = Color.White
		    parse_inputText.TextColor = &cE3E4E6
		    parse_inputText.BackgroundColor = &c23282D
		    self.BackgroundColor = &c2D3137
		  Else
		    ShowSubstepsLabel.TextColor = Color.Black
		    HideSubstepsLabel.TextColor = Color.Black
		    StyleTextLabel.TextColor = Color.Black
		    parse_inputText.TextColor = Color.Black
		    parse_inputText.BackgroundColor = Color.White
		    self.BackgroundColor = &cF5F6F7
		  End If
		  
		  StyleCheckBox.Value = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim x,y,w,h as Double
		  w = 2
		  h = parse_inputText.Height
		  x = parse_inputText.Left - w
		  y = parse_inputText.Top
		  
		  g.ForeColor = &c2589FF
		  g.FillRectangle(x,y,w,h)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub checkFormatToggles()
		  Dim s As String = ""
		  If selectedBS <> nil Then
		    If RadioButtonHide.Value Then
		      selectedBS.Save(s,0,false)
		    Else
		      selectedBS.Save(s,0,True)
		    End If
		    parse_inputText.Value = s
		  Else
		    // Load the source
		    parse_inputText.Text = Self.GetSourceText()
		  End If
		  If StyleCheckBox.Value Then
		    formatTextArea(True)
		  End If
		  mModified = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  if Self.mSourceTabClass = nil then
		    break // why is it nil?
		    return nil
		  end if
		  Dim NewSourceContainer As New SourceTabContainer(SourceTabClass (Self.mSourceTabClass.Value))
		  NewSourceContainer.parse_inputText.Text = parse_inputText.Text
		  Return NewSourceContainer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mSourceTabClass = new WeakRef(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnterTab()
		  // Load the source
		  
		  'parse_inputText.Text = self.GetSourceText()
		  mModified = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExitTab()
		  // Might want to save any changes made to the source, or at least warn the user
		  
		  if hasSourceBeenChanged() then
		    break
		    MsgBox "Source has been changed but not saved!"
		  end
		  mModified = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub formatTextArea()
		  dim txt as String = parse_inputText.Value
		  dim p as Paragraph
		  Dim length As Integer
		  Dim data As String
		  dim startStyle, endStyle as Integer
		  dim paragraphLenCnt as integer = 0
		  dim startPosition as Integer
		  For i as Integer = 0 To parse_inputText.StyledText.ParagraphCount - 1
		    p = parse_inputText.StyledText.Paragraph(i)
		    'system.DebugLog str(p.EndPosition) + " - " + str(p.StartPosition)
		    length = p.EndPosition - p.StartPosition
		    data = txt.Middle(p.StartPosition, length)
		    startPosition = 0
		    //Attributes
		    For k as integer = 0 To p.Length
		      If data.IndexOf(startPosition," ") <> -1 Then
		        startStyle = data.IndexOf(startPosition," ")
		        If data.IndexOf(startStyle + 1,"=") <> -1 Then
		          endStyle = data.IndexOf(startStyle + 1,"=")
		          'System.DebugLog "endstyle: " + str(endstyle)
		          parse_inputText.StyledText.TextColor(startStyle + paragraphLenCnt,_
		          endStyle - startStyle) = &cfc4a34
		          startPosition = endStyle + 1
		        Else
		          Exit
		        End If
		      Else
		        Exit
		      End If
		    Next
		    startPosition = 0
		    //Values
		    For j as integer = 0 To p.Length
		      If data.IndexOf(startPosition,"""") <> -1 Then
		        startStyle = data.IndexOf(startPosition,"""")
		        endStyle = data.IndexOf(startStyle + 1,"""")
		        parse_inputText.StyledText.TextColor(startStyle + paragraphLenCnt,_
		        endStyle - startStyle + 1) = &c0077FF
		        startPosition = endStyle + 1
		        'System.DebugLog "startPosition: " + str(startPosition)
		      Else
		        Exit
		      End If
		    Next
		    
		    paragraphLenCnt = paragraphLenCnt + p.Length + 1
		  Next
		  styleFormatDone = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub formatTextArea(useRegEx as Boolean)
		  dim r as new RegExMBS
		  dim searchString as string = regexPattern
		  
		  if r.Compile(searchString) then
		    
		    dim s as string=parse_InputText.Value
		    dim start as Integer = 0
		    while r.Execute(s,start)>0
		      dim charPos as Integer = r.OffsetCharacters(0)
		      dim charLength as Integer = r.Substring(1).Length 
		      parse_InputText.StyledText.TextColor(charPos,charlength) = &cfc4a34
		      start = r.Offset(1)
		    wend
		    
		  else
		    MsgBox "Invalid RegEx Pattern"
		  end if
		  
		  searchString = regexPatternValues
		  if r.Compile(searchString) then
		    
		    dim s as string=parse_InputText.Value
		    dim start as Integer = 0
		    while r.Execute(s,start)>0
		      dim charPos as Integer = r.OffsetCharacters(0)
		      dim charLength as Integer = r.Substring(0).Length 
		      
		      parse_InputText.StyledText.TextColor(charPos,charlength) = &c0077FF
		      start = r.Offset(1)
		    wend
		    
		  else
		    MsgBox "Invalid RegEx Pattern"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetSourceText() As String
		  Dim SourceText As String = ""
		  If App.GlobalTestSequence <> Nil Then
		    App.GlobalTestSequence.Save(SourceText, 0)
		  End
		  Return SourceText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function hasSourceBeenChanged() As Boolean
		  return mModified and parse_inputText.Text <> "" and StrComp (parse_inputText.Text, self.GetSourceText(), 0) <> 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub radioButtonChanged()
		  checkFormatToggles
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSelText(txt as String)
		  self.parse_inputText.SelText = txt
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StepSelected(BS as BasicClass)
		  //Somehow this method is being called twice when selecting
		  // an element in the Tree, thus make checks to make sure the
		  // succeeding methods are only called once.
		  If BS <> Nil Then
		    // "selectedBS" is used to trace the current selected
		    // element in the Tree.
		    
		    If selectedBS <> Nil Then
		      //Check if the element has already been assigned
		      If (BS.GetUniqueID <> selectedBS.GetUniqueID) Then
		        //New element selected
		        selectedBS = BS
		        checkFormatToggles
		      ElseIf BS.GetUniqueID = selectedBS.GetUniqueID AND styleFormatDone Then
		        'System.DebugLog "Text Formatting Done already"
		      End If
		    Else
		      styleFormatDone = False
		      selectedBS = BS
		      checkFormatToggles
		    End If
		  End If
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mModified As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mselecText As string = """nil"""
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			SourceTabClass
		#tag EndNote
		Private mSourceTabClass As WeakRef = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedBS As BasicClass
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mselecText
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mselecText = value
			End Set
		#tag EndSetter
		selecText As string
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		styleFormatDone As Boolean = False
	#tag EndProperty


	#tag Constant, Name = regexPattern, Type = String, Dynamic = False, Default = \"(\\S+)\x3D[\"\']\?((\?:.(\?![\"\']\?\\s+(\?:\\S+)\x3D|[>\"\']))+.)[\"\']\?", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"(\\S+)\x3D[\"\']\?((\?:.(\?![\"\']\?\\s+(\?:\\S+)\x3D|[>\"\']))+.)[\"\']\?"
	#tag EndConstant

	#tag Constant, Name = regexPatternValues, Type = String, Dynamic = False, Default = \"((\?<![\\\\])[\'\"])((\?:.(\?!(\?<![\\\\])\\1))*.\?)\\1", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"((\?<![\\\\])[\'\"])((\?:.(\?!(\?<![\\\\])\\1))*.\?)\\1"
	#tag EndConstant


#tag EndWindowCode

#tag Events parse_inputText
	#tag Event
		Sub TextChange()
		  mModified = true
		  PB_SetSource.Enabled = parse_inputText.Text <> ""
		End Sub
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if hitItem <> nil then
		    
		    Dim d as new SaR_Window(SelecText,self)
		    
		  end
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  base.Append( new MenuItem("Search and Replace"))
		  
		  SelecText = parse_inputText.SelText
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events PB_GetSource
	#tag Event
		Sub Action()
		  If App.GlobalTestSequence <> Nil Then
		    parse_inputText.Text = GetSourceText
		  Else
		    MsgBox "No testsequences present yet!"
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PB_SetSource
	#tag Event
		Sub Action()
		  If selectedBS <> Nil And Not (selectedBS IsA TESSA_Prog_StepClass) Then
		    // New modified source
		    Dim s As String = parse_inputText.Text
		    Dim isSubstepsIncluded As Boolean = RadioButtonShow.Value
		    
		    Dim XMLPointer As Integer = 1
		    // Parse into a BasicClass
		    Dim NewMeasStep As BasicClass = Parse_XML(s, XMLPointer)
		    
		    If NewMeasStep Is Nil Then
		      // we were not able to parse?
		      Break
		      Return
		    End If
		    
		    // Save its location in the tree, so we can replace the old element later
		    Dim upperStep As BasicClass = selectedBS.UpperStep
		    Dim prevStep As BasicClass = selectedBS.PreviousStep
		    Dim nextStep As BasicClass = selectedBS.NextStep
		    
		    If selectedBS.FirstSubStep <> Nil Then
		      // make the substeps point to the NewMeasStep
		      Dim LS As BasicClass = selectedBS.FirstSubStep
		      While LS <> Nil
		        LS.UpperStep = NewMeasStep
		        LS = LS.NextStep
		      Wend
		    End If
		    
		    // Replace the old source with the modified source
		    
		    If upperStep <> Nil Then
		      If upperStep.FirstSubStep Is selectedBS Then
		        // this is the first element in the subordinate list
		        upperStep.AddSubElement(NewMeasStep, True)
		      Else
		        // add it to the last
		        upperStep.AddSubElement(NewMeasStep, False)
		      End If
		    Else
		      // this is a topmost element
		      Break
		    End If
		    
		    // we can now delete the old element, and its substeps (If included)
		    DeleteBasicStepClass(selectedBS, False)
		    
		    If parse_inputText.Text <> "" And parse_inputText.Text <> GetSourceText Then
		      Dim source As String = GetSourceText
		      source = source.ReplaceAll(NL,CR)
		      Call App.ParseTestsequenceFile(source, False)
		    End If
		    
		  Elseif parse_inputText.Text <> "" And parse_inputText.Text <> GetSourceText Then
		    Dim S As String = parse_inputText.Text
		    S = S.ReplaceAll(NL,CR)
		    Call App.ParseTestsequenceFile(S, False)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RadioButtonShow
	#tag Event
		Sub Action()
		  radioButtonChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RadioButtonHide
	#tag Event
		Sub Action()
		  radioButtonChanged
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StyleCheckBox
	#tag Event
		Sub Action()
		  checkFormatToggles
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="darkModeEnabled"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		Name="selecText"
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
	#tag ViewProperty
		Name="styleFormatDone"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
