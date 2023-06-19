#tag Window
Begin Window WorkspaceWindow
   BackColor       =   &c23282D00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   11
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   True
   Height          =   444
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   2
   Resizeable      =   False
   Title           =   "Choose Workspace"
   Visible         =   True
   Width           =   888
   Begin PopupMenu Workspaces
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
      InitialValue    =   "Choose Workspace\r\n-\r\nTESSA"
      Italic          =   False
      Left            =   529
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   315
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   339
   End
   Begin CheckBox CB_Use_Global_Resources
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
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
      Left            =   529
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   347
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   17
   End
   Begin PushButton OkButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "OK"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   788
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   398
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton cancelButton
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
      Left            =   696
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   398
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Timer AnimationTimer
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   10
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Label Tessa_label
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   35.0
      FontUnit        =   2
      Height          =   46
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   537
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "TESSA"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   11
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   100
   End
   Begin Label VersionLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   34
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   542
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Test System Application,  © Tri-B-Werk Switzerland"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   58
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   280
   End
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
      Left            =   551
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "use global ""Elements"" folder"
      TextAlignment   =   0
      TextColor       =   &cFFFFFF00
      Tooltip         =   ""
      Top             =   347
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   317
   End
   Begin GraphicalCanvas BackgroundImage
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      darkModeEnabled =   False
      DoubleBuffer    =   True
      Enabled         =   True
      Height          =   444
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   517
   End
   Begin GraphicalCanvas LogoImage
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      darkModeEnabled =   False
      DoubleBuffer    =   True
      Enabled         =   True
      Height          =   200
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   603
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   75
      Transparent     =   True
      Visible         =   True
      Width           =   200
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  dim verticalCenter as Integer = (self.Height/2) - (g_hexa_3_dark.Height/2)
		  dim asset1 as new GraphicsAnimation(g_hexa_3_light, g_hexa_3_dark, 48, verticalCenter, 0, 0, 0)
		  graphicAssets.Append(asset1)
		  dim asset2 as new GraphicsAnimation(g_hexa_5_light, g_hexa_5_dark, 190, 10, -1, 0, 16)
		  graphicAssets.Append(asset2)
		  dim asset3 as new GraphicsAnimation(g_hexa_4_light, g_hexa_4_dark, 242, 50, 2, 0, 320)
		  graphicAssets.Append(asset3)
		  dim asset4 as new GraphicsAnimation(g_hexa_2_light, g_hexa_2_dark, 226, 250, 0, -1, 200)
		  graphicAssets.Append(asset4)
		  dim asset5 as new GraphicsAnimation(g_hexa_1_light,g_hexa_1_dark, 2, 285, 2, 0, 120)
		  graphicAssets.Append(asset5)
		  
		  self.BackgroundColor = &cF5F6F7
		  'self.BackgroundColor = &c23282D
		  Label1.TextColor = &c23282D
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function isFolderAsWorkspace(f As FolderItem) As Boolean
		  If CheckFolder(f) Then
		    Dim ConfigFolder As FolderItem = f.Child("TESSA_Config")
		    If not(CheckFolder(ConfigFolder)) Then
		      ConfigFolder= GetWorkingFolderItem
		      ConfigFolder = f.Child("TESSA_Config") // no more AXTDL
		      If CheckFolder(ConfigFolder) Then
		        Return True
		      End
		    Else
		      Return True
		    End
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PopulateWorkspacesList()
		  Workspaces.DeleteAllRows
		  Workspaces.AddRow("Choose Workspace")
		  Workspaces.RowTag(Workspaces.ListCount - 1) = Nil
		  Workspaces.AddSeparator
		  Workspaces.AddRow("TESSA")
		  Workspaces.RowTag(Workspaces.ListCount - 1) = mWorkspacesFolder.Parent // should be the folder defined in APPFOLDER settings
		  
		  if mWorkspacesFolder <> Nil And mWorkspacesFolder.Directory Then
		    Dim f As FolderItem = Nil
		    For i as Integer = 1 to mWorkspacesFolder.Count
		      f = mWorkspacesFolder.Item(i)
		      If isFolderAsWorkspace(f) Then
		        Workspaces.AddRow(f.DisplayName)
		        Workspaces.RowTag(Workspaces.ListCount - 1) = f
		      End
		    Next
		  End
		  
		  Workspaces.ListIndex = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVersionText(VersionText As String)
		  VersionText = VersionText.Trim
		  If VersionText <> "" Then
		    VersionLabel.Text = "Version: " + VersionText
		    VersionString = "Version: " + VersionText
		    Refresh
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show()
		  PopulateWorkspacesList
		  Super.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowModal()
		  PopulateWorkspacesList
		  Super.ShowModal
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowModalWithin(parentWindow As Window)
		  PopulateWorkspacesList
		  Super.ShowModalWithin(parentWindow)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowWithin(parentWindow As Window, facing As Integer = - 1)
		  PopulateWorkspacesList
		  Super.ShowWithin(parentWindow, facing)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mChosenWorkspace
			End Get
		#tag EndGetter
		ChosenWorkspace As FolderItem
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGlobalResources
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGlobalResources = value
			End Set
		#tag EndSetter
		GlobalResources As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		graphicAssets() As GraphicsAnimation
	#tag EndProperty

	#tag Property, Flags = &h0
		Immediate_Exit As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChosenWorkspace As FolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGlobalResources As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWorkspacesFolder As FolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private VersionString As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mWorkspacesFolder
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mWorkspacesFolder = value
			End Set
		#tag EndSetter
		WorkspacesFolder As FolderItem
	#tag EndComputedProperty


	#tag Constant, Name = MaxNumLines, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events CB_Use_Global_Resources
	#tag Event
		Sub Action()
		  GlobalResources = CB_Use_Global_Resources.Value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OkButton
	#tag Event
		Sub Action()
		  Immediate_Exit=false
		  GlobalResources = CB_Use_Global_Resources.Value
		  Dim index As Integer = Workspaces.ListIndex
		  if (index >1) And (index<Workspaces.ListCount) Then
		    mChosenWorkspace = Workspaces.RowTag(index)
		  Else
		    mChosenWorkspace = Workspaces.RowTag(2)
		  End
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cancelButton
	#tag Event
		Sub Action()
		  Immediate_Exit=true
		  Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AnimationTimer
	#tag Event
		Sub Action()
		  // Immediately start animation
		  BackgroundImage.Invalidate(False)
		  For each ga as GraphicsAnimation in graphicAssets
		    ga.changePos
		  Next
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BackgroundImage
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  dim pic as Picture
		  //Draw the graphics hexagons
		  If me.darkModeEnabled Then
		    g.DrawingColor = me.darkModeBG
		    g.FillRectangle(0,0,g.Width,g.Height)
		    pic = splash_graphics_dark
		  Else
		    pic = splash_graphics_light
		  End If
		  If pic <> nil Then
		    dim ratio as Double = min( Me.Height / pic.Height, Me.Width / pic.Width)
		    
		    // Calculate new size
		    dim w,h as Integer
		    
		    //maintain aspect ration to fit in the canvas
		    w = pic.Width * ratio
		    h = pic.Height * ratio
		    
		    //Center the image
		    Dim x, y As Integer
		    x = Me.Width / 2 - w / 2
		    y = Me.Height / 2 - h / 2
		    g.DrawPicture(pic, x, y, w, h, 0, 0, pic.Width, pic.Height)
		  End If
		  
		  If graphicAssets.Ubound <> -1 Then
		    dim hexagon as Picture 
		    For i as Integer = 0 to graphicAssets.Ubound
		      If me.darkModeEnabled Then
		        hexagon = graphicAssets(i).img_darkMode
		      Else
		        hexagon = graphicAssets(i).img
		      End If
		      
		      dim x, y as Integer
		      x = graphicAssets(i).XPos
		      y = graphicAssets(i).YPos
		      g.DrawPicture(hexagon, x, y)
		    Next
		  End If
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LogoImage
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  
		  //Draw instead of using Backdrop
		  dim pic as Picture
		  Dim textColor, BGColor as Color
		  If me.darkModeEnabled Then
		    BGColor = me.darkModeBG
		    textColor = me.darkModeTxtColor
		    pic = Tessa_logo_dark
		  Else
		    BGColor = me.ColorDefaultGreyLight_M
		    textColor = &c23282D
		    pic = Tessa_logo_dark
		  End If
		  
		  If pic <> Nil Then
		    g.DrawingColor = BGColor
		    g.FillRectangle(0,0,g.Width,g.Height)
		    
		    dim ratio as Double = min( (Me.Height * .8) / pic.Height, (Me.Width * .8) / pic.Width)
		    
		    // Calculate new size
		    dim w,h as Integer
		    
		    //maintain aspect ration to fit in the canvas
		    w = pic.Width * ratio
		    h = pic.Height * ratio
		    
		    //Center the image
		    Dim x, y As Integer
		    'x = Me.Width / 2 - w / 2
		    'y = Me.Height / 2 - h / 2
		    x = Me.Width - w
		    y = 0
		    
		    
		    g.DrawingColor = textColor
		    g.FontName = "Arial"
		    g.Bold = True
		    g.FontUnit = FontUnits.Point
		    g.FontSize = 60
		    dim titleLimit as double = g.TextWidth("TESSA")
		    g.FontSize = 13
		    'dim s as double = g.TextWidth("Version Alpha 2.0 Build 360")
		    dim s as double = g.TextWidth(VersionString)
		    while s >= titleLimit
		      g.FontSize = g.FontSize - 1
		      's = g.TextWidth("Version Alpha 2.0 Build 360")
		      s = g.TextWidth(VersionString)
		      if g.FontSize <=0 then
		        Exit
		      end if
		    wend
		    dim tempMargin as Double = g.FontSize
		    'g.DrawText("Version Alpha 2.0 Build 360",0,g.Height - 2)
		    g.DrawText(VersionString,0,g.Height - 2)
		    g.FontSize = 37
		    dim y2 as Integer = g.Height - (tempMargin * 2) - 2
		    g.DrawText("TESSA",0,y2)
		    y2 = y2 - h
		    g.DrawPicture(pic, x, y2, w, h, 0, 0, pic.Width, pic.Height)
		    
		    'g.DrawRectangle(0,0,g.width,g.height)
		  End If
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
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="GlobalResources"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="boolean"
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
		Name="Immediate_Exit"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="boolean"
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
		Visible=true
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
