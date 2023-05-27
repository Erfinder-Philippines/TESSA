#tag Window
Begin ContainerControl MenuBevelButton
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
   Height          =   64
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
   Width           =   64
   Begin GraphicalButton GraphicalButton1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Start"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   1112788991
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
      Begin PopupArrow PopupArrow1
         AllowAutoDeactivate=   True
         Enabled         =   True
         FacingDirection =   3
         Height          =   10
         Index           =   -2147483648
         InitialParent   =   "GraphicalButton1"
         Left            =   7
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   7
         Transparent     =   True
         Visible         =   True
         Width           =   10
      End
   End
End
#tag EndWindow

#tag WindowCode
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
		Function GetEnabled() As Boolean
		  'Return BevelButton1.Enabled
		  Return GraphicalButton1.Enabled
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMenu() As MenuItem
		  Return mMenu
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResizeControls()
		  PopupArrow1.Left = Me.Width - PopupArrow1.Width - 1
		  PopupArrow1.Top = Me.Height - PopupArrow1.Height - 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetButtonTag(tag As String)
		  GraphicalButton1.Tooltip = tag
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetButtonTitle(title As String)
		  GraphicalButton1.Caption = title
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEnabled(value As Boolean)
		  'BevelButton1.Enabled = value
		  GraphicalButton1.Enabled = value
		  Me.Enabled = value
		  PopupArrow1.Enabled = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetIcon(icon As Picture)
		  'BevelButton1.Icon = icon
		  GraphicalButton1.icon = icon
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMenu(Menu As MenuItem)
		  mMenu = Menu
		  PopupArrow1.Visible = mMenu <> Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisibleMenu(value As Boolean)
		  PopupArrow1.Visible = value
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event AboutToShowMenu(menu As MenuItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ButtonToggled()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event MenuTriggered(Item As MenuItem)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdarkModeEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdarkModeEnabled = value
			  GraphicalButton1.darkModeEnabled = value
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMenu As MenuItem = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events GraphicalButton1
	#tag Event
		Sub LeftClick()
		  ButtonToggled
		  Invalidate(false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupArrow1
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  If mMenu <> Nil And not IsContextualClick And GraphicalButton1.Enabled Then
		    AboutToShowMenu(mMenu)
		    Dim chooseItem As MenuItem = mMenu.PopUp(System.MouseX, System.MouseY)
		    If chooseItem <> Nil Then
		      MenuTriggered(chooseItem)
		    End
		  End
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  PopupArrow1.Visible = mMenu <> Nil
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
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
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
		Name="TabIndex"
		Visible=true
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
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
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
		Visible=true
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
		Name="darkModeEnabled"
		Visible=true
		Group="Behavior"
		InitialValue=""
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
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
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
#tag EndViewBehavior
