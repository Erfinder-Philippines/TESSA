#tag Window
Begin Window SplashWindow
   BackColor       =   &c23282D00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   4
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
   Title           =   "Untitled"
   Visible         =   True
   Width           =   888
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
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   75
      Transparent     =   True
      Visible         =   True
      Width           =   200
   End
   Begin Label ProgressLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   107
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   529
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &cFFFFFF00
      Tooltip         =   ""
      Top             =   312
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   339
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
      Left            =   529
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "TESSA"
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   7
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
      Left            =   536
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Test System Application,  © Tri-B-Werk Switzerland"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   43
      Transparent     =   True
      Underline       =   False
      Visible         =   False
      Width           =   280
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
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   517
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
		  ProgressLabel.TextColor = &c23282D
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddToProgressText(Text As String, NewLine as boolean, LogoShift as Boolean)
		  If Text <> "" Then
		    // Add Line to DebugText too
		    if NewLine then
		      AddDebugText(EndOfLine+Text)
		    else
		      AddDebugText(Text)
		    end
		    Dim i as integer
		    'Check for number of lines, delete if more than 6 lines
		    if NewLine then
		      if NumLines>=MaxNumLines then
		        'delete first line and shift
		        Lines.Remove(0)
		      else
		        NumLines=NumLines + 1
		      end
		      while lines.ubound < NumLines
		        lines.Append("")
		      wend
		      Lines(NumLines) = Text
		    else
		      Lines(NumLines) = Lines(NumLines) + Text
		    end
		    
		    Dim S as string = Lines(0)
		    for i=1 to Me.MaxNumLines
		      S=S+EndOfLine+Lines(i)
		    next
		    ProgressLabel.Text=S
		    ProgressLabel.Refresh
		    
		    'if LogoShift then
		    'LogoImage.Top=LogoImage.Top + 30
		    'LogoImage.Refresh
		    'end
		    self.Refresh
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearProgressText()
		  ProgressLabel.Text = ""
		  ProgressLabel.Refresh
		  self.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub darkModeSplash(value as Boolean)
		  If value Then
		    self.BackgroundColor = &c23282D
		    ProgressLabel.TextColor = &cF5F6F7
		  Else
		    self.BackgroundColor = &cF5F6F7
		    ProgressLabel.TextColor = &c23282D
		  End If
		  
		  BackgroundImage.darkModeEnabled = value
		  LogoImage.darkModeEnabled = value
		  
		  Self.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVersionText(VersionText As String)
		  If VersionText <> "" Then
		    VersionLabel.Text = VersionText
		    VersionString = VersionText
		    VersionLabel.Refresh
		    self.Refresh
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		graphicAssets() As GraphicsAnimation
	#tag EndProperty

	#tag Property, Flags = &h0
		Lines(6) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		NumLines As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private VersionString As String
	#tag EndProperty


	#tag Constant, Name = MaxNumLines, Type = Double, Dynamic = False, Default = \"4", Scope = Private
	#tag EndConstant


#tag EndWindowCode

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
		    pic = Tessa_logo_dark 'Tessa_logo_new
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
		Name="NumLines"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
