#tag Window
Begin ContainerControl HMI_TextArea_Canvas Implements HMICanvasInterface
   AllowAutoDeactivate=   True
   AllowFocus      =   True
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   False
   HasBackgroundColor=   False
   Height          =   61
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   32
   Transparent     =   True
   Visible         =   True
   Width           =   208
   Begin TextArea HMI_TextArea
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
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   53
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   2
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
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   2
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   199
   End
   Begin ResizeContainer Resizer
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
      Height          =   61
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   208
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Me.HMI_TextArea.AcceptTextDrop
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  If mTextAreaStep <> Nil Then
		    mTextAreaStep.Paint(g, 1)
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CanvasRect() As REALbasic.Rect
		  // Part of the HMICanvasInterface interface.
		  Return Me.Bounds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetUI()
		  // Part of the HMICanvasInterface interface.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCoordinates(X as integer, Offset as integer, Y as integer, W as integer, H as integer)
		  // Part of the HMICanvasInterface interface.
		  // the new position is relative to the first (0,0) position
		  Left = X - HMI_StepClass.cCanvasMargin
		  Top = Y - HMI_StepClass.cCanvasMargin
		  Width=W + Offset + mTextAreaStep.Measure.GIAS.Len * mTextAreaStep.TextSize.GIAI + 2 * HMI_StepClass.cCanvasMargin
		  Height = H + 2 *HMI_StepClass.cCanvasMargin
		  
		  HMI_TextArea.Top = 4
		  HMI_TextArea.Left = Offset
		  HMI_TextArea.Height = H
		  HMI_TextArea.Width = W
		  if TargetWin32 Then
		    Me.Refresh
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditMode(type As Boolean)
		  Resizer.SetEditMode(type)
		  HMI_TextArea.Enabled = Not type
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHMIClass(HMIClass As HMI_StepClass)
		  // Part of the HMICanvasInterface interface.
		  mTextAreaStep = HMI_TextArea_StepClass(HMIClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, SetValue as string)
		  // virtual method, has been overridden for implermentation
		  
		  Select case PropertyName
		  case is = "TextField"
		    HMI_TextArea.Text=SetValue
		    ''case is = "TextFont"
		    ''HMI_TextArea.TextFont=SetValue
		    ''case is = "TextSize"
		    ''HMI_TextArea.TextSize=Val(SetValue)
		    ''case is = "TextColor"
		    ''HMI_TextArea.TextColor=GetColor(SetValue)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisible(value As Boolean)
		  // Part of the HMICanvasInterface interface.
		  Me.Visible = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvas(mode As Integer)
		  // Part of the HMICanvasInterface interface.
		  #Pragma Unused mode
		  if mTextAreaStep <> Nil then
		    HMI_TextArea.Text = mTextAreaStep.Value.GIAS
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mTextAreaStep As HMI_TextArea_StepClass = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events HMI_TextArea
	#tag Event
		Sub TextChange()
		  if mTextAreaStep <> nil then
		    mTextAreaStep.TextChange(Me.Text)
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  Dim cutMenuItem As new MenuItem("Cut")
		  cutMenuItem.KeyboardShortcut = App.kCutEditShortcut
		  Dim copyMenuItem As new MenuItem("Copy")
		  copyMenuItem.KeyboardShortcut = App.kCopyEditShortcut
		  Dim delMenuItem As new MenuItem("Delete")
		  delMenuItem.KeyboardShortcut = App.kDelEditShortcut
		  Dim pasteMenuItem As new MenuItem("Paste")
		  pasteMenuItem.KeyboardShortcut = App.kPasteEditShortcut
		  
		  Dim selAllMenuItem As new MenuItem("Select All")
		  selAllMenuItem.KeyboardShortcut = App.kSelAllEditShortcut
		  
		  Dim buffer As New Clipboard
		  If buffer.Text = "" Then
		    pasteMenuItem.Enabled = false
		  End
		  buffer.Close
		  
		  If Me.SelText = "" Then
		    cutMenuItem.Enabled = false
		    copyMenuItem.Enabled = false
		    delMenuItem.Enabled = false
		  End
		  
		  If Me.Text  = "" Then
		    selAllMenuItem.Enabled = false
		  End
		  
		  base.Append(cutMenuItem)
		  base.Append(copyMenuItem)
		  base.Append(pasteMenuItem)
		  base.Append(delMenuItem)
		  base.Append(new MenuItem(MenuItem.TextSeparator))
		  base.Append(selAllMenuItem)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem <> Nil Then
		    Select case hitItem.Text
		    case Is = "Cut"
		      Me.Copy
		      Me.SelText = ""
		    Case is = "Copy"
		      Me.Copy
		    Case is = "Paste"
		      Me.Paste
		    Case is = "Delete"
		      Me.SelText = ""
		    Case is = "Select All"
		      Me.SelectAll
		    End
		  End
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  #if TargetMacOS
		    Dim keyDown As String = Uppercase(Key)
		    If keyboard.AsyncCommandKey then
		      Select case keyDown
		      case Is = "X"
		        Me.Copy
		        Me.SelText = ""
		      Case is = "C"
		        Me.Copy
		      Case is = "V"
		        Me.Paste
		      Case is = "A"
		        Me.SelectAll
		      End
		    end
		  #endif
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Resizer
	#tag Event
		Sub Resize(X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  if mTextAreaStep <> Nil Then
		    mTextAreaStep.Resize_HMI_Element(X, Y, Width, Height)
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
