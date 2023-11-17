#tag Window
Begin Window MainWindow
   BackColor       =   &c23282D00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   720
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   1179466650
   MenuBarVisible  =   True
   MinHeight       =   600
   MinimizeButton  =   True
   MinWidth        =   900
   Placement       =   0
   Resizeable      =   True
   Title           =   "TESSA"
   Visible         =   True
   Width           =   1184
   Begin Label ChosenStep
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   15.0
      FontUnit        =   0
      Height          =   29
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   413
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
      Text            =   "-"
      TextAlignment   =   0
      TextColor       =   &c4C4C4C00
      Tooltip         =   ""
      Top             =   42
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   198
   End
   Begin ServerSocket MainServerSocket
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      MaximumSocketsConnected=   25
      MinimumSocketsAvailable=   2
      Port            =   7777
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin GroupBox SecurityGroup
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   67
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   73
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -99
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   320
      Begin Label Label2
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
         InitialParent   =   "SecurityGroup"
         Italic          =   False
         Left            =   83
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
         Text            =   "Remaining time"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   -93
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   102
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
         InitialParent   =   "SecurityGroup"
         Italic          =   False
         Left            =   83
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Current security level:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   -64
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   141
      End
      Begin Label RemainingTimeLabel
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
         InitialParent   =   "SecurityGroup"
         Italic          =   False
         Left            =   229
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "00:00"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   -92
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   44
      End
      Begin PushButton PB_Refresh
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Refresh"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "SecurityGroup"
         Italic          =   False
         Left            =   302
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   -91
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton PB_Close
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Close"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "SecurityGroup"
         Italic          =   False
         Left            =   302
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   -61
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin TextField TF_SecurityLevel
         AllowAutoDeactivate=   True
         AllowFocusRing  =   True
         AllowSpellChecking=   False
         AllowTabs       =   False
         BackgroundColor =   &cFFFFFF00
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   False
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Format          =   ""
         HasBorder       =   True
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "SecurityGroup"
         Italic          =   False
         Left            =   221
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "5"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   -62
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   64
      End
   End
   Begin RESTSocket RSocket
      Index           =   -2147483648
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      ValidateCertificates=   False
   End
   Begin PopupMenu TreeMenu
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   112
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   12
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   184
   End
   Begin HTLListBox HTL
      ActiveColumn    =   -1
      ActiveRow       =   -1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   True
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   True
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   5
      ColumnWidths    =   "*,40,40,40,0"
      darkModeEnabled =   False
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   30
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      genericTblHorizontal=   False
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   1
      HasBorder       =   False
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   674
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Hierarchical Test List	E	L	S	D"
      Italic          =   False
      Left            =   0
      ListboxType     =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      mActiveElementMode=   "ActiveElementEnum.DoNone"
      RequiresSelection=   False
      rowMouseOver    =   -1
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   42
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   305
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin MarsSplitter MarsSplitter1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   720
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   308
      LineColor       =   &cBBBBBB00
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MinBottomRight  =   0
      MinTopLeft      =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   20
   End
   Begin CustomTabPanel MainTab
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackgroundColor=   False
      Height          =   639
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   328
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   84
      Transparent     =   False
      Visible         =   True
      Width           =   854
   End
   Begin Canvas Picture64
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   340
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
      Top             =   8
      Transparent     =   True
      Visible         =   True
      Width           =   64
   End
   Begin GraphicalButton SaveProject
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Save"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   1880756223
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   1014
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   8
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
   End
   Begin GraphicalButton Stop_Button
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Stop"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   739188735
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   662
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   8
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
   End
   Begin GraphicalButton Reset_Button
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Reset"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   491417599
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   729
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   8
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
   End
   Begin MenuBevelButton Start_Button
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackgroundColor=   False
      Height          =   64
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   796
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   8
      Transparent     =   True
      Visible         =   True
      Width           =   64
   End
   Begin GraphicalButton ScreenshotButton
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Prt Scr"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   1396692991
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   1100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   8
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
   End
   Begin GraphicalButton Open_HMI_Window
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "HMI"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   1090056191
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   945
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   8
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
   End
   Begin GraphicalButton Halt_Button
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Halt"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   679565311
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   863
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   8
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
   End
   Begin Label ElementLabel
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   15.0
      FontUnit        =   0
      Height          =   27
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   413
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Untitled"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   9
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   198
   End
   Begin Label SelectedTreeLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   14.0
      FontUnit        =   0
      Height          =   27
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
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Selected Tree:"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   9
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  If App.GlobalTestSequence <> Nil Then
		    If not CloseSequence Then
		      Return true // -> cancel the close
		    End
		  End
		  
		  If not QuitButtonPress Then
		    Return True
		  End
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  App.GlobalTestSequence = Nil
		  RefillTreeMenu("Resource")
		  
		  if mPasswordTimer <> nil then
		    mPasswordTimer.Mode = Timer.ModeOff
		    mPasswordTimer.Enabled = false
		  end
		  
		  WorkspaceSettings.MainWindowGeometry.SetCoordinateValues(Me.Left, 0, Me.Top, Me.Width, me.Height)
		  Quit
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim keyDown As String = Uppercase(Key)
		  If keyDown = "S" Then
		    #If TargetMacOS Then
		      If Keyboard.AsyncCommandKey Then
		        Dim newName As String = ""
		        If Keyboard.AsyncShiftKey Then
		          newName = SaveAsSequence(App.GlobalTestSequence)
		        Else
		          newName = SaveSequence(App.GlobalTestSequence)
		        End
		        SetFileName( newName )
		        Return True
		      End
		    #Else
		      If Keyboard.AsyncControlKey Then
		        Dim newName As String = ""
		        If Keyboard.AsyncShiftKey Then
		          newName = SaveAsSequence(App.GlobalTestSequence)
		        Else
		          newName = SaveSequence(App.GlobalTestSequence)
		        End
		        SetFileName( newName )
		        Return True
		      End
		    #Endif
		  End
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  MainWindow.Left = WorkspaceSettings.MainWindowGeometry.X
		  MainWindow.Top = WorkspaceSettings.MainWindowGeometry.Y
		  
		  // Fix for situations where the workspace settings for the window 
		  // are too small on startup
		  If WorkspaceSettings.MainWindowGeometry.Width < 900 Then
		    MainWindow.Width = 900
		  Else 
		    MainWindow.Width = WorkspaceSettings.MainWindowGeometry.Width
		  End If
		  
		  If WorkspaceSettings.MainWindowGeometry.Height < 600 Then
		    MainWindow.Height = 600
		  Else
		    MainWindow.Height = WorkspaceSettings.MainWindowGeometry.Height
		  End If
		  
		  init_MainWindow
		  ResizeMainWindow
		  
		  ' Dim dbfile As FolderItem = 
		  ' If CheckFile(dbfile) Then
		  ' LoadDatabase(dbfile)
		  ' else
		  ' 'msgbox("Could not connect to Database")
		  ' End
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'g.DrawingColor = &c23282D
		  'g.FillRectangle 0,0,g.width,g.height
		  If darkModeEnabled Then
		    g.DrawingColor = &c23282D
		    g.FillRectangle MarsSplitter1.Left + MarsSplitter1.Width,0, _
		    g.Width,g.Height
		    
		    g.DrawingColor = &c242B31
		    g.FillRectangle 0, 0, MarsSplitter1.Left + MarsSplitter1.Width , g.Height
		  Else
		    g.DrawingColor = &ce3e4e6
		    g.FillRectangle 0,0, g.Width,g.Height
		  End If
		  
		  
		  g.DrawingColor = &cD8D8D8
		  g.PenSize = 2
		  dim x as Double = MarsSplitter1.Left + (MarsSplitter1.Width / 2)
		  dim h as Double = (ScreenshotButton.Top + ScreenshotButton.Height) + 5
		  g.DrawLine(x,h,g.Width,h)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  ResizeMainWindow
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  ResizeMainWindow
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function DarkMode() As Boolean Handles DarkMode.Action
		  TESSA_DarkMode = Not TESSA_DarkMode
		  WorkspaceSettings.DarkModeEnabled.SIAB(TESSA_DarkMode)
		  MainWindow.darkModeEnabled = TESSA_DarkMode
		  
		  If TESSA_DarkMode Then
		    DarkMode.Value = "Dark Mode: On"
		  Else
		    DarkMode.Value = "Dark Mode: Off"
		  End If
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function DebugOn() As Boolean Handles DebugOn.Action
		  if App.Security_Check(2) then
		    App.SwitchGlobalDebug
		  end
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileClose() As Boolean Handles FileClose.Action
		  self.Close // -> all the rest happens in the CancelClose and Close events!
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpenandsyncronize() As Boolean Handles FileOpenandsyncronize.Action
		  if App.Security_Check(2) then
		    Dim dialog As New OpenDialog
		    Dim dialogFolder As FolderItem = GetFolderItem(GetWorkingFolder)
		    if CheckFolder(dialogFolder)  then
		      dialogFolder=dialogFolder.Child("Testsequences")
		      If CheckFolder(dialogFolder) Then
		      else
		        #If TargetLinux Then
		          dialogFolder = SpecialFolder.Home
		        #Else
		          dialogFolder = SpecialFolder.Documents
		        #EndIf
		      End
		      dialog.InitialDirectory = dialogFolder
		      
		      dialog.Title = "Open Testsequence"
		      dialog.Filter = FileTypes1.TextXML
		      Dim fileItem As FolderItem = dialog.ShowModal()
		      If fileItem <> Nil Then
		        OpenTestSequence(fileItem.NativePath,true,2)
		        TESSAGlobalFunctions.ActualTestcasePath=fileItem.NativePath
		      End
		    end
		  end
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpenmerge() As Boolean Handles FileOpenmerge.Action
		  if App.Security_Check(2) then
		    Dim dialog As New OpenDialog
		    Dim dialogFolder As FolderItem = GetWorkingFolderItem
		    if CheckFolder(dialogFolder)  then
		      dialogFolder=dialogFolder.Child("Testsequences")
		      If CheckFolder(dialogFolder) Then
		      else
		        #If TargetLinux Then
		          dialogFolder = SpecialFolder.Home
		        #Else
		          dialogFolder = SpecialFolder.Documents
		        #EndIf
		      End
		      dialog.InitialDirectory = dialogFolder
		      
		      dialog.Title = "Open Testsequence"
		      dialog.Filter = FileTypes1.TextXML
		      Dim fileItem As FolderItem = dialog.ShowModal()
		      If fileItem <> Nil Then
		        OpenTestSequence(fileItem.NativePath,true,1)
		        TESSAGlobalFunctions.ActualTestcasePath=fileItem.NativePath
		      End
		    end
		  end
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSave() As Boolean Handles FileSave.Action
		  if App.Security_Check(2) then
		    Dim newName As String = SaveSequence(App.GlobalTestSequence)
		    SetFileName( newName )
		  end
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveAs() As Boolean Handles FileSaveAs.Action
		  if App.Security_Check(2) then
		    Dim newName As String = SaveAsSequence(App.GlobalTestSequence)
		    SetFileName( newName )
		  end
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveSequencebyIndexing() As Boolean Handles FileSaveSequencebyIndexing.Action
		  if App.Security_Check(2) then
		    Dim newName As String = SaveSequenceWithIndexing(App.GlobalTestSequence)
		    SetFileName( newName )
		  end
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ManualItem() As Boolean Handles ManualItem.Action
		  Dim f As FolderItem = GetAppFolderItem
		  If CheckFolder(f) Then
		    f = f.Child(App.ManualFolderName)
		    If CheckFolder(f) Then
		      f = f.Child("TESSA User Manual.pdf")
		      if CheckFile(f) then
		        f.Launch
		      End
		    End
		  End
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewSequenceItem1() As Boolean Handles NewSequenceItem1.Action
		  if App.Security_Check(2) then
		    Dim S as string = "<TESSA Name=" + chr(34) + "TESSA_Testsequence" + chr(34) +" HMI="+ chr(34) + "off" + chr(34) + " Hierarchical_Links="+ chr(34) + "on" + chr(34) +" >"+CR+  "<Teststep Name=" + chr(34) + "Teststep" + chr(34) +  " />" +CR+ "</TESSA>"
		    Return App.ParseTestsequenceFile(S )
		  else
		    return true
		  end
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function NewSequenceItem2() As Boolean Handles NewSequenceItem2.Action
		  if App.Security_Check(2) then
		    Dim S as string = "<TESSA Name=" + chr(34) + "TESSA_Testsequence" + chr(34) +" HMI="+ chr(34) + "on" + chr(34) + " Hierarchical_Links="+ chr(34) + "on" + chr(34) +" >"+CR+  "<Teststep Name=" + chr(34) + "Teststep" + chr(34) +  " />" +CR+ "</TESSA>" 
		    Return App.ParseTestsequenceFile(S)
		  else
		    return true
		  end
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function OpenItem() As Boolean Handles OpenItem.Action
		  if App.Security_Check(4) then
		    Dim dialog As New OpenDialog
		    Dim dialogFolder As FolderItem = GetWorkingFolderItem
		    if CheckFolder(dialogFolder)  then
		      dialogFolder=dialogFolder.Child("Testsequences")
		      If CheckFolder(dialogFolder) Then
		      else
		        #If TargetLinux Then
		          dialogFolder = SpecialFolder.Home
		        #Else
		          dialogFolder = SpecialFolder.Documents
		        #EndIf
		      End
		      dialog.InitialDirectory = dialogFolder
		      
		      dialog.Title = "Open Testsequence"
		      dialog.Filter = FileTypes1.TextXML
		      Dim fileItem As FolderItem = dialog.ShowModal()
		      If fileItem <> Nil Then
		        OpenTestSequence(fileItem.NativePath,0)
		        TESSAGlobalFunctions.ActualTestcasePath=fileItem.NativePath
		      End
		    end
		  end
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveSystemReport() As Boolean Handles SaveSystemReport.Action
		  if App.GlobalTopmostElement<>nil then
		    Dim SystemState as AttributeClass = App.GlobalTopmostElement.GetAttribute("SystemState")
		    if (SystemState<>nil) and (SystemState IsA String_AttributeClass) then
		      CollectSystemInformation(String_AttributeClass(SystemState),false)
		    end
		  end
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowMinimize() As Boolean Handles WindowMinimize.Action
		  Me.Minimize
		  Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WindowReset21screen() As Boolean Handles WindowReset21screen.Action
		  Reset_to_Screen0
		  HMI_Window.Reset_to_Screen0
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub AddTestreporttoList(TestreportName as string)
		  Dim i as integer = TestReportTable.Ubound
		  if i<0 then
		    i=0
		  end
		  Redim TestReportTable(i+1)
		  TestReportTable(TestReportTable.Ubound-1)=TestReportName
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Adjust_Buttons(NewPage as Test_StepClass)
		  // Do adjust the buttons settings according the
		  if NewPage<>nil then
		    
		    Dim ButtonEnable As Boolean = True
		    if App.GetTESSAState <> 0 then
		      if NewPage.ExecuteSkip.GIAB then
		        ButtonEnable = false
		      ElseIf (NewPage.UserHalt.GIAI > 0) Then
		        ButtonEnable = NewPage.CheckRunState(7)
		      end
		    end
		    
		    Dim ButtonCaption As String
		    Dim ButtonVisible As Boolean
		    
		    ButtonCaption = "Ignore"
		    ButtonVisible = (NewPage.GetStepButtonState(Test_StepClass.StepButtonEnum.ButtonNext) > 0)
		    if NewPage.Button_Next.GIAS <> "" Then
		      ButtonCaption = NewPage.Button_Next.GIAS
		      ButtonVisible  =True
		    End
		    
		    // adjust Repeat Button, third in row
		    ButtonCaption = "Repeat"
		    ButtonVisible = (NewPage.GetStepButtonState(Test_StepClass.StepButtonEnum.ButtonRepeat) > 0)
		    If NewPage.Button_Repeat.GIAS <> "" Then
		      ButtonCaption = NewPage.Button_Repeat.GIAS
		      ButtonVisible = True
		    End
		    
		    // adjust Reset Button at left
		    ButtonCaption = "Reset"
		    ButtonVisible = (NewPage.GetStepButtonState(Test_StepClass.StepButtonEnum.ButtonEndTest) > 0)
		    if NewPage.Button_EndTest.GIAS <> "" Then
		      ButtonCaption = NewPage.Button_EndTest.GIAS
		      ButtonVisible = True
		    End
		    
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttrTab() As AttributesTabClass
		  return TabManager.GetAttributesTabClass
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub checkDarkMode()
		  If TESSA_DarkMode Then
		    DarkMode.Value = "Dark Mode: On"
		  Else
		    DarkMode.Value = "Dark Mode: Off"
		  End If
		  Self.darkModeEnabled = TESSA_DarkMode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloseSequence() As Boolean
		  If App.GlobalTestSequence <> Nil Then
		    If Not App.GlobalTestSequence.IsChanged Then
		      Element_Delete(App.GlobalTestSequence)
		      Return True
		    else
		      Dim infoDialog As New MessageDialog
		      infoDialog.Icon = MessageDialog.GraphicCaution
		      infoDialog.ActionButton.Caption  = "Save"
		      infoDialog.CancelButton.Visible = True
		      infoDialog.AlternateActionButton.Visible = True
		      infoDialog.AlternateActionButton.Caption = "Don't Save"
		      infoDialog.Message = "Do you want to save old Testsequence first and then load a new one"
		      infoDialog.Explanation = "If you don't save, your changes int the old Testsequence will be lost."
		      Dim pressButton As MessageDialogButton
		      pressButton = infoDialog.ShowModal
		      Select Case pressButton
		      Case infoDialog.ActionButton
		        Call SaveSequence(App.GlobalTestSequence)
		        Element_Delete(App.GlobalTestSequence)
		        Return true
		      Case infoDialog.AlternateActionButton
		        Element_Delete(App.GlobalTestSequence)
		        Return true
		      Case infoDialog.CancelButton
		        Return False
		      End Select
		    end
		  else
		    Return True
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Element_Delete(LS as BasicClass, DeleteChild As Boolean = True)
		  if LS<>nil then
		    // delete included objects first
		    while (LS.FirstSubStep<>nil and DeleteChild)
		      Element_Delete(LS.FirstSubStep)
		    wend
		    
		    RemoveSpecialGUIElement(LS)
		    DeleteBasicStepClass(LS)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillTestReportTable(SubFolder as string, TestType as string)
		  #Pragma Unused TestType
		  
		  // TODO: what does it do???
		  Dim f as FolderItem
		  Dim i,n as integer
		  Dim SN as string
		  // load names of last used intrument in file Last_used.txt
		  'ReportList.DeleteAllRows
		  
		  if SubFolder="" then
		    SubFolder="Reports"
		  end
		  // load all files with .xml ending into the drop down menu
		  f=GetWorkingFolderItem.Child(SubFolder)
		  if CheckFolder(f) then
		    n=1
		    Redim TestReportTable(f.Count)
		    For i=1 to f.Count
		      SN=f.Item(i).DisplayName
		      // add item to display list
		      if (left(SN,1)=".") or (f.Item(i).Directory) then
		        // do not add invisible files (mac) or directories
		      else
		        TestReportTable(n-1)=SN
		      end
		    next
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReportType(TestType As String) As String
		  UserSelectedReportType=nil
		  if TestType <> "All" then
		    if TestType="Current Test Run" then
		      if App.GlobalTestSequence<>nil then
		        UserSelectedReportType=App.GlobalTestSequence.GetTestReportMatrix
		      end
		    else
		      if TestType  = "ICT File Formatx" then
		      else
		        for i As Integer = 0 to UBound(RepList())
		          if RepList(i).FileName = TestType then
		            UserSelectedReportType = RepList(i)
		            UserSelectedReportNr = 0
		            TestType = RepList(i).File_Identifier
		          end
		        next
		      end
		    end
		  end
		  
		  Return TestType
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleStepClass(NewMeasStep As BasicClass)
		  If NewMeasStep <> Nil Then
		    // load external elements
		    NewMeasStep.LoadExternals
		    If NewMeasStep.UpperStep <> Nil Then
		      NewMeasStep.UpperStep.ConnectAllLinks
		    Else
		      NewMeasStep.ConnectAllLinks
		    End
		    //ceck name id name is exists name will be updated
		    NewMeasStep.CheckAllSubNames
		    
		    // handle special gui element function such as tables, graphs
		    Handle_All_Special_GUI_Elements(NewMeasStep)
		    
		    If NewMeasStep IsA StepClass Then
		      StepClass(NewMeasStep).Step_Init_AfterLoad
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Handle_All_Special_GUI_Elements(GUI_Element as BasicClass)
		  if GUI_Element<>nil then
		    Handle_Special_GUI_Element(GUI_Element)
		    GUI_Element=GUI_Element.FirstSubStep
		    while GUI_Element<>nil
		      Handle_All_Special_GUI_Elements(GUI_Element)
		      GUI_Element=GUI_Element.NextStep
		    wend
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_HMI(NewMeasStep as BasicClass, HandleInclude As Boolean = false)
		  If NewMeasStep <> Nil And App.HMI_Active then
		    If NewMeasStep IsA Test_StepClass Then
		      Dim isVisible As Boolean = true
		      Dim iter As BasicClass = NewMeasStep
		      While iter <> nil And Not iter IsA TESSA_Prog_StepClass
		        If iter IsA Test_StepClass And Test_StepClass(iter).HMI_Page.GIAI = 0 Then
		          isVisible = false
		          Exit
		        End
		        iter = iter.UpperStep
		      Wend
		      
		      If isVisible Then
		        Dim parent As BasicClass = NewMeasStep.UpperStep
		        While parent <> nil And Not parent IsA TESSA_Prog_StepClass And Not Parent IsA Test_StepClass
		          parent = parent.UpperStep
		        Wend
		        If parent IsA TESSA_Prog_StepClass And NewMeasStep IsA Test_StepClass And Test_StepClass(NewMeasStep).HMI_Page.GIAI = 2 Then
		          MsgBox "Teststep " + NewMeasStep.Name.GIAS + " has been turned solid as no upper test step was found"
		          Test_StepClass(NewMeasStep).HMI_Page.SIAI(3)
		        End 
		        HMI_Window.Add_HMI_Page(Test_StepClass(NewMeasStep), Test_StepClass(NewMeasStep).HMI_Page.GIAI=3)
		      Else
		        HandleInclude = false
		      End
		    End
		    
		    If NewMeasStep IsA HMI_StepClass Then
		      HMI_StepClass(NewMeasStep).HMI_Constructor
		    End
		    
		    If HandleInclude Then
		      Dim BS As BasicClass = NewMeasStep.FirstSubStep
		      while BS <> Nil
		        Handle_HMI(BS, HandleInclude)
		        BS = BS.NextStep
		      wend
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Handle_Special_GUI_Element(NewMeasStep as BasicClass)
		  // this routine handles connections of the elements to other graphical elements
		  
		  if NewMeasStep <> Nil then
		    //handle special GUI Elements
		    Select case NewMeasStep
		    case isA TESSA_Prog_StepClass
		      App.GlobalTestSequence=TESSA_Prog_StepClass(NewMeasStep)
		    case isA EEPROM_Module.HMI_EEPROM_StepClass
		      Dim EEPROMTab As EEPROMTabClass = TabManager.GetEEPROMTabClass
		      If EEPROMTab <> Nil Then
		        EEPROMTab.Add_EEPROMSelection(NewMeasStep.Name.GIAS, NewMeasStep.GetUniqueID)
		      End
		    end
		    Handle_HMI(NewMeasStep)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub initMenuBar(SubFolder As String)
		  //add tamplates
		  // load all files with .xml ending into the drop down menu
		  
		  Dim folder as FolderItem = GetWorkingFolderItem
		  if CheckFolder(folder) then
		    folder = folder.Child("Tamplates")
		    if CheckFolder(folder) then
		      TemplatesItems.EnableClearMenu = false
		      TemplatesItems.ClearList
		      For i As Integer = 1 to folder.Count
		        Dim displayName as string = folder.Item(i).DisplayName
		        if (left(displayName, 1) <> ".") then
		          TemplatesItems.AddItem(folder.Item(i))
		        end
		      Next
		    end
		  end
		  
		  //added recent files in combobox
		  MainWindow.UpdateRecentFiles
		  
		  //added defined program
		  DefinedItems.ClearList
		  Dim DefinedProgram(-1) As String = App.GetDefinedProgramFiles()
		  For Each Item As String In DefinedProgram
		    DefinedItems.AddItem(GetFolderItemFromPath(Item))
		  Next
		  
		  folder = GetWorkingFolderItem
		  If CheckFolder(folder) Then
		    folder=folder.Child(SubFolder)
		    If CheckFolder(folder) Then
		      For i As Integer = 1 To folder.Count
		        Dim f As FolderItem = folder.Item(i)
		        If CheckFile(f) Then
		          Dim displayName As String = f.DisplayName
		          SavedItems.additem(f)
		        End
		      Next
		    End
		  End
		  
		  AddHandler TemplatesItems.ItemTriggered, AddressOf onMenuTriggered
		  AddHandler RecentItems.ItemTriggered, AddressOf onMenuTriggered
		  AddHandler SavedItems.ItemTriggered, AddressOf onMenuTriggered
		  AddHandler DefinedItems.ItemTriggered, AddressOf onMenuTriggered
		  
		  AddHandler FileMenu.EnableMenu, AddressOf MenuWillEnable
		  AddHandler EditMenu.EnableMenu, AddressOf MenuWillEnable
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init_MainWindow()
		  Dim LogTab As LogTabClass = TabManager.GetLogTabClass
		  If LogTab <> Nil Then
		    LogTab.RefreshShownValues
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadDatabase(dbfile as FolderItem)
		  //Dim dbfile as FolderItem = GetOpenFolderItem("*.sqlite")
		  
		  if dbfile <> nil then
		    mdb = new SQLiteDatabase
		    mdb.DatabaseFile = dbfile
		    
		    if mdb.Connect then
		      'self.Title = "connected to database "+ dbfile.NameWithoutExtensionMBS
		    end
		    if mdb.Error then
		      MsgBox mdb.ErrorMessage
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadTestreport(TRT as TestReportMatrix, TR as integer, fileItem As FolderItem)
		  
		  if (TRT<>nil) and (fileItem <> Nil) and (fileItem.Exists) and (not fileItem.Directory) then
		    
		    TRT.FileContent=OpenMeasFileForLoad(fileItem.NativePath, true)
		    
		    if TRT.FileContent<>"" then
		      TRT.Parse(TR)  // TR is the number of the place where the information has to be put to
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadTestReportMatrix(vFileName as string)
		  Dim  S as string
		  Dim TF as TestReportMatrix
		  
		  TF= new TestReportMatrix(vFileName)
		  RepList.append(TF)
		  
		  if vFileName<>"" then
		    S=OpenMeasFileForLoad("Reports"+PathSeparator+"Definitions",vFileName)
		    TF.FileContent=S
		    TF.Loaded=true
		    if vFileName.InStr(1,".txt")>0 then
		      vFileName=vFileName.Mid(1,vFileName.len-4)
		    end
		    TF.FileName=vFileName
		    if S<>"" then
		      // define type of file
		      if S.InStr(1,"{@BATCH")>0 then
		        TF.FileType="ICT"
		        TF.File_Identifier="1YF"
		      else
		        if S.InStr(1,"/>"+chr(13))>0 then
		          TF.FileType="XML"
		          TF.File_Identifier=vFileName
		        else
		          TF.FileType="TAB"
		          TF.File_Identifier=vFileName
		        end
		      end
		      
		      'TF.Parse(0)  // 0 is the definition file of the test report
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MenuWillEnable(item As MenuItem)
		  If item <> Nil Then
		    Select Case item.Name
		    Case FileMenu.Name
		      FileClose.Enabled = App.GlobalTestSequence <> Nil
		      FileSave.Enabled = FileClose.Enabled
		      FileSaveAs.Enabled = FileClose.Enabled
		      FileSaveSequencebyIndexing.Enabled = FileClose.Enabled
		    Case EditMenu.Name
		      If Focus<> Nil Then
		        EditUndo.Visible = (Focus <> HTL)
		        EditClear.Visible = EditUndo.Visible
		        EditSelectAll.Visible = EditUndo.Visible
		        UntitledMenu0.Visible = EditUndo.Visible
		        UntitledMenu1.Visible = EditUndo.Visible
		        If Focus = HTL Then
		          Dim c As new Clipboard
		          EditPaste.Enabled = c.RawDataAvailable(ObjectRawData)
		          EditCut.Visible = Not HTL.GetActiveStep IsA TESSA_Prog_StepClass
		          EditCopy.Visible = EditCut.Visible
		        End
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub onMenuTriggered(pMenuLis As MenuFolderItemList, item As MenuItem)
		  #Pragma Unused pMenuLis
		  if App.Security_Check(4) then
		    if item <> Nil And item.Tag <> Nil then
		      OpenTestSequence(item.Tag.StringValue,0)
		      TESSAGlobalFunctions.ActualTestcasePath = item.Tag.StringValue
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenTestSequence(path As String, CheckChanges as boolean, MergingMode as integer)
		  if CheckChanges then
		  else
		    App.ResetChanges
		  end
		  OpenTestSequence(path,MergingMode)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenTestSequence(path As String, MergingMode as integer)
		  if path <> "" then
		    
		    Dim progressWnd As New ProgressWindow("Load Testsequence","Loading testsequence: " + CR+ path, 100 , load_icon )
		    progressWnd.Show
		    
		    Dim fileItem As FolderItem = GetFolderItemFromPath(path)
		    Select Case CheckFolderItem(fileItem)
		    case 0, 3 // fileItem is nil or non existing
		      fileItem = GetWorkingFolderItem
		      if CheckFolder(FileItem) then
		        fileItem = fileItem.Child("Testsequences")
		        If CheckFolder(fileItem) Then
		          if path.InStr(fileItem.NativePath) = 0 Then
		            fileItem = fileItem.Child(path)
		            If fileItem <> Nil Then
		              path = fileItem.NativePath
		            End
		          End
		        End
		      end
		    case 1 // fileItem is a directory
		      // => error
		    case 2 // fielItem is ok
		      
		    end
		    
		    progressWnd.AddToProgress(10)
		    Dim ParseText As String = OpenMeasFileForLoad(path)
		    
		    progressWnd.AddToProgress(10)
		    
		    If App.ParseTestsequenceFile(ParseText,true,progressWnd,MergingMode) Then
		      progressWnd.AddToProgress(70)
		      
		      MainWindow.SetFileName( fileItem.NativePath )
		      
		      If WorkspaceSettings <> Nil Then
		        WorkspaceSettings.AddRecentFile(path)
		        UpdateRecentFiles
		      End
		      
		      If App.GlobalTestSequence <> Nil Then
		        App.GlobalTestSequence.ProgFolderItem = fileItem
		        if App.GlobalTestSequence.FirstSubStep IsA StepClass then
		          App.GlobalTestSequence.ActiveStep=StepClass(App.GlobalTestSequence.FirstSubStep)
		        end
		        if App.HMI_Active Then
		          if WorkspaceSettings <> Nil Then
		            WorkspaceSettings.OnlyHMI.SIAB(True)
		          End
		          //Disabled this for now test layout changes when opening a Tsequence
		          'HMI_Window.SetButtonFrame(App.GlobalTestSequence.HMI_Toolbar.GIAI)
		          'Select case App.GlobalTestSequence.HMI_Size.GIAI
		          'case 0
		          'HMI_Window.Left = App.GlobalTestSequence.HMIWindowSize.X
		          'HMI_Window.Top = App.GlobalTestSequence.HMIWindowSize.Y
		          'HMI_Window.Width = App.GlobalTestSequence.HMIWindowSize.Width
		          'HMI_Window.Height = App.GlobalTestSequence.HMIWindowSize.Height
		          'case 1
		          'HMI_Window.Minimize
		          'case 2
		          ''HMI_Window.FullScreen = true
		          'HMI_Window.Maximize
		          'HMI_Window.Left = 0
		          'HMI_Window.Top = 0
		          'end
		          'HMI_Window.UpdateHMIListWidth(App.GlobalTestSequence.HMIPageOffset.GIAI)
		          HMI_Window.Show
		        end
		        App.GlobalTestSequence.ClearChangeProperty
		      End
		    End
		    progressWnd.Close
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function QuitButtonPress() As Boolean
		  Dim DoQuit As Boolean = False
		  if App.GetTESSAState = 0 then // TESSA is running
		    Dim infoDialog As new MessageDialog
		    infoDialog.Icon = MessageDialog.GraphicCaution
		    infoDialog.ActionButton.Caption = "Quit"
		    infoDialog.CancelButton.Visible = True
		    infoDialog.Message = "The testsequence is runnning! Do You really want to abort?"
		    infoDialog.Explanation = "If You quit, your  testsequence will be aborted."
		    Dim button As MessageDialogButton = infoDialog.ShowModal
		    If button = infoDialog.ActionButton Then
		      DoQuit = True
		    End
		  else
		    DoQuit = True
		  end
		  if DoQuit Then
		    if  App.GetTESSAState <> 4 Then // if running, suspend, waiting or sleeping
		      App.MainLoop("stop")
		    End
		  End
		  
		  if App.GlobalSYNC <> Nil Then
		    If App.GlobalSYNC.isRunning then
		      Dim infoDialog As new MessageDialog
		      infoDialog.Icon = MessageDialog.GraphicCaution
		      infoDialog.ActionButton.Caption = "Quit"
		      infoDialog.CancelButton.Visible = True
		      infoDialog.Message = "The transfering is runnning! Do You really want to abort?"
		      infoDialog.Explanation = "If You quit, current transfering will be aborted."
		      Dim button As MessageDialogButton = infoDialog.ShowModal
		      If button = infoDialog.ActionButton Then
		        App.GlobalSYNC.StopChecking(true)
		        App.GlobalSYNC.CancelAll
		        DoQuit = True
		      Else
		        Return False
		      End
		    else
		      App.GlobalSYNC.StopChecking(true)
		      App.GlobalSYNC.CancelAll
		      DoQuit = True
		    End
		    
		    'if not App.GlobalSYNC.CanQuit Then
		    'DoQuit = False
		    'else
		    'DoQuit = true
		    'End
		  End
		  
		  Return DoQuit
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawAttributeList()
		  AttrTab.RefreshShownValues true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawMainTree()
		  Dim Data As String = TreeMenu.RowTag(TreeMenu.ListIndex)
		  Dim SelectedTreeClass As BasicClass = Nil
		  If Data = "" Then
		    Select Case TreeMenu.Text
		    Case "Settings"
		      SelectedTreeClass = MainSettings.Instance
		    Case "Resource"
		      SelectedTreeClass = App.GlobalResources
		    Case "SYNC"
		      SelectedTreeClass = App.GlobalSYNC
		    Case "All Tree"
		      SelectedTreeClass = App.GlobalTopmostElement
		    End
		  Else
		    Dim SelectedSequence As BasicClass = App.GlobalTopmostElement.FindElementByUniqueID(Data)
		    If SelectedSequence <> Nil And SelectedSequence IsA TESSA_Prog_StepClass Then
		      SelectedTreeClass = SelectedSequence
		    End
		  End
		  
		  If SelectedTreeClass = Nil Then
		    SelectedTreeClass = App.GlobalTopmostElement
		  End
		  If HTL.GetActiveStep = Nil Or HTL.GetBasicClass.GetUniqueID <> SelectedTreeClass.GetUniqueID Then
		    HTL.SetBasicClass(SelectedTreeClass)
		    HTL.ExpandedTop
		    HTL.SetScrollClass(SelectedTreeClass)
		    SetFocus
		    HTL.SetFocus
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefillTreeMenu(ItemID As String)
		  Dim SelectRow As Integer = TreeMenu.ListIndex
		  
		  'AddDebugText_("RefillTreeMenu: "+ItemID)
		  
		  TreeMenu.DeleteAllRows
		  
		  TreeMenu.AddRow("Settings")
		  TreeMenu.AddRow("Resource")
		  If App.GlobalTestSequence <> Nil Then
		    TreeMenu.AddRow("-")
		    TreeMenu.AddRow("Sequence - " + App.GlobalTestSequence.Name.GIAS)
		    SelectRow = TreeMenu.ListCount - 1
		    TreeMenu.RowTag(SelectRow) = App.GlobalTestSequence.GetUniqueID
		  End
		  TreeMenu.AddRow("-")
		  TreeMenu.AddRow("SYNC")
		  TreeMenu.AddRow("-")
		  TreeMenu.AddRow("All Tree")
		  
		  'AddDebugText("Basic Tree filled: ")
		  
		  If ItemID <> "" Then
		    Select Case ItemID
		    Case "All Tree"
		      'AddDebugText_("case is all tree ")
		      'AddDebugText_(str(TreeMenu.ListCount))
		      SelectRow = TreeMenu.ListCount - 1
		      'AddDebugText_("selected row "+str(SelectRow))
		    Case "Settings"
		      SelectRow = 0
		    Case "SYNC"
		      SelectRow = TreeMenu.ListCount - 3
		    Case "Resource"
		      SelectRow = 1
		    Case "Active_TestSequence"
		      SelectRow = 3
		    else
		      if  WorkspaceSettings.GetUniqueID = ItemID then
		        SelectRow = 0
		      else
		        if (App.GlobalTopmostElement<>nil) and (App.GlobalTopmostElement.GetUniqueID=ItemID) then
		          SelectRow = TreeMenu.ListCount - 1
		        else
		          if (App.GlobalResources<>nil) and (App.GlobalResources.GetUniqueID=ItemID) then
		            SelectRow = 1
		          else
		            if (App.GlobalSYNC<>nil) and (App.GlobalSYNC.GetUniqueID=ItemID) then
		              SelectRow = TreeMenu.ListCount - 3
		            End
		          end
		        end
		      End
		    end
		  end
		  
		  'AddDebugText("SelectRow is "+str(SelectRow))
		  
		  TreeMenu.ListIndex = SelectRow
		  
		  'AddDebugText_("Row is set")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveHMIForBasicStep(RemoveStep As BasicClass, RemoveInclude As Boolean = false)
		  if RemoveStep <> nil then
		    If RemoveInclude Then
		      Dim BS As BasicClass = RemoveStep.FirstSubStep
		      while BS <> Nil
		        RemoveHMIForBasicStep(BS, RemoveInclude)
		        BS = BS.NextStep
		      wend
		    End
		    
		    If RemoveStep IsA Test_StepClass And App.HMI_Active Then
		      HMI_Window.Remove_HMI_Page(Test_StepClass(RemoveStep), False)
		    End
		    If RemoveStep IsA HMI_StepClass Then
		      HMI_StepClass(RemoveStep).RemoveHMI
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveSpecialGUIElement(RemoveStep As BasicClass, RemoveInclude As Boolean = false)
		  if RemoveStep <> nil then
		    RemoveHMIForBasicStep(RemoveStep)
		    
		    Select Case RemoveStep
		    Case IsA EEPROM_Module.HMI_EEPROM_StepClass
		      Dim EEPROMTab As EEPROMTabClass = TabManager.GetEEPROMTabClass
		      If EEPROMTab <> Nil Then
		        EEPROMTab.Remove_EEPROMSelection(EEPROM_Module.HMI_EEPROM_StepClass(RemoveStep))
		      End
		    End
		    
		    If RemoveInclude Then
		      Dim BS As BasicClass = RemoveStep.FirstSubStep
		      while BS <> Nil
		        RemoveSpecialGUIElement(BS, RemoveInclude)
		        BS = BS.NextStep
		      wend
		    End
		    
		    If RemoveStep IsA TESSA_Prog_StepClass And App.HMI_Active Then
		      HMI_Window.Close
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub resetLinks()
		  Redim Links(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset_to_Screen0()
		  
		  Top=screen(0).AvailableTop+100
		  Left=screen(0).AvailableLeft+100
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ResizeMainWindow()
		  // Nothing to do here. We could add a splitter between the HTL and MainTab, though
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveAsSequence(Sequence As TESSA_Prog_StepClass) As String
		  If Sequence <> Nil Then
		    //open dialog
		    Dim saveDialog As New SaveAsDialog
		    Dim basicFolder As FolderItem = GetWorkingFolderItem
		    if CheckFolder(basicFolder) then
		      basicFolder = basicFolder.Child("Testsequences")
		    end
		    If Sequence.ProgFolderItem <> Nil Then
		      saveDialog.SuggestedFileName = Sequence.ProgFolderItem.DisplayName
		    Else
		      saveDialog.SuggestedFileName = Sequence.Name.GIAS
		    End
		    saveDialog.Filter = FileTypes1.TextXML
		    
		    If not(checkFolder(basicFolder))Then
		      #If TargetLinux Then
		        basicFolder = SpecialFolder.Home
		      #Else
		        basicFolder = SpecialFolder.Documents
		      #EndIf
		    End
		    
		    saveDialog.InitialDirectory = basicFolder
		    Dim file As FolderItem = saveDialog.ShowModal
		    If file <> Nil Then
		      // check version info adn take the highes version
		      if  Sequence.AutomaticVersionCheck.GIAB then
		        Dim i1,i2,Vers as integer
		        i1=InstrReverse(file.Name,0,"_v")
		        if i1>0 then
		          i2=file.Name.Instr(i1,".")
		          if i2>0 then
		            Vers=val(file.Name.Mid(i1+2,i2-i1-1))
		            if Vers<Sequence.Version.GIAI then
		              Vers = Sequence.Version.GIAI
		              file.Name = file.Name.Mid(1,i1+1)+str(Vers)+file.Name.Mid(i2,file.Name.Len)
		            else
		              Sequence.Version.SIAI(Vers)
		            end
		            
		          end
		        end
		      end
		      //need save file
		      Dim SaveText As String
		      Sequence.Save(SaveText,0)
		      if SaveText <> "" then
		        Call OpenMeasFileForSave(SaveText, file)
		        Sequence.ProgFolderItem = file
		        Sequence.SaveAdditionalDataForAll(file)
		        Sequence.ClearChangeProperty
		        WorkspaceSettings.AddRecentFile(file.NativePath)
		        UpdateRecentFiles
		        Return file.NativePath
		      End
		    End
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveSequence(Sequence As BasicClass) As String
		  if Sequence isA TESSA_Prog_StepClass then
		    Dim item As FolderItem = TESSA_Prog_StepClass(Sequence).ProgFolderItem
		    If CheckFile(item) Then
		      // check version info adn take the highes version
		      if  TESSA_Prog_StepClass(Sequence).AutomaticVersionCheck.GIAB then
		        Dim i1,i2,Vers as integer
		        i1=InstrReverse(item.Name,0,"_v")
		        if i1>0 then
		          i2=item.Name.Instr(i1,".")
		          if i2>0 then
		            Vers=val(item.Name.Mid(i1+2,i2-i1-1))
		            if Vers<TESSA_Prog_StepClass(Sequence).Version.GIAI then
		              Vers = TESSA_Prog_StepClass(Sequence).Version.GIAI
		              item.Name = item.Name.Mid(1,i1+1)+str(Vers)+item.Name.Mid(i2,item.Name.Len)
		            else
		              TESSA_Prog_StepClass(Sequence).Version.SIAI(Vers)
		            end
		            
		          end
		        end
		      end
		      Global_SYNC_Time=GetSYNCTime
		      //only save file
		      Dim SaveText As String = ""
		      Sequence.Save(SaveText,0)
		      if SaveText <> "" then
		        Call OpenMeasFileForSave(SaveText, item)
		        
		        Sequence.SaveAdditionalDataForAll(TESSA_Prog_StepClass(Sequence).ProgFolderItem)
		        Sequence.ClearChangeProperty
		        Return item.NativePath
		      End
		    Else
		      Return SaveAsSequence(TESSA_Prog_StepClass(Sequence))
		    End
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveSequenceWithIndexing(Sequence As TESSA_Prog_StepClass) As String
		  If Sequence <> Nil Then
		    Dim fileItem As FolderItem = Sequence.ProgFolderItem
		    If CheckFile(fileItem) Then
		      Dim fileName As String = fileItem.DisplayName
		      fileName = fileName.Left(fileName.Len - 4)
		      fileItem = fileItem.Parent
		      If fileItem <> Nil Then
		        Dim count As Integer = fileItem.Count
		        Dim item As FolderItem
		        Dim versionRegExp As new RegEx
		        versionRegExp.SearchPattern = "v\d+"
		        
		        Dim FileNameRegExp As new RegEx
		        Dim filePattern As String = fileName
		        Dim match As RegExMatch = versionRegExp.Search(fileName)
		        if match <> Nil Then
		          Dim pos As Integer = fileName.LeftB(match.SubExpressionStartB(match.SubExpressionCount - 1)).Len + 1
		          filePattern = fileName.Left(pos - 1)
		        End
		        FileNameregExp.SearchPattern = filePattern
		        
		        Dim version As String = ""
		        Dim maxVersion As Integer = 0
		        For i As Integer = 1 to count
		          item = fileItem.Item(i)
		          If item <> Nil Then
		            match = FileNameregExp.Search(item.DisplayName)
		            If match <> Nil Then
		              match = versionRegExp.Search(item.DisplayName)
		              If match <>Nil Then
		                version = match.SubExpressionString(match.SubExpressionCount - 1)
		                version = version.Right(version.Len - 1)
		                If maxVersion < Val(version) Then
		                  maxVersion = Val(version)
		                End
		              End
		            End
		          End
		        Next
		        If filePattern.Right(1) <> " " Then
		          filePattern = filePattern + " "
		        End
		        if Sequence.AutomaticVersionCheck.GIAB then
		          Sequence.Version.SIAI(maxVersion + 1)
		        end
		        Dim newFileName As String = filePattern + "v" + Str(maxVersion + 1) + ".xml"
		        if CheckFolder(fileItem) then
		          item = fileItem.Child(newFileName)
		          If item <> Nil and (not item.Directory) Then
		            //only save file
		            Dim SaveText As String
		            Sequence.Save(SaveText,0)
		            if SaveText <> "" then
		              Call OpenMeasFileForSave(SaveText, item)
		              
		              Sequence.ProgFolderItem = item
		              Sequence.SaveAdditionalDataForAll(item)
		              Sequence.ClearChangeProperty
		              
		              WorkspaceSettings.AddRecentFile(item.NativePath)
		              UpdateRecentFiles
		              Return item.NativePath
		            End
		          End
		        End
		      end
		    Else
		      Return SaveAsSequence(Sequence)
		    End
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveTestReport(FS as TestReportMatrix)
		  if FS<>nil then
		    if FS.Loaded then
		      Dim FileName, c as string
		      //make file name
		      FileName=FS.TRH(0).Name+"-"+FS.TRH(0).SerialNumber+"-"+FS.TRH(0).Testprogram+"-"+"R1-"+Mid(FS.TRH(0).TestResult,1,1)+".txt"
		      
		      c=""
		      
		      //save header
		      c=FS.TRH(0).SerialNumber+FS.TRH(0).Name+chr(13)+chr(13)
		      c=c+"Teststation"+chr(9)+FS.TRH(0).Teststation+chr(13)
		      c=c+"Testprogram"+chr(9)+FS.TRH(0).Testprogram+chr(13)
		      c=c+"TestDate"+chr(9)+FS.TRH(0).TestDate+chr(13)
		      c=c+"Tester"+chr(9)+FS.TRH(0).Tester+chr(13)
		      c=c+"Testresult"+chr(9)+FS.TRH(0).TestResult+chr(13)
		      //save testesteps
		      
		      
		      'Dim LS as BasicClass
		      'DIM TS as Teststep
		      'Dim n as integer
		      
		      'LS=FS.FirstSubStep
		      'n=0
		      'while LS<>nil
		      'if LS IsA Teststep then
		      'TS=Teststep(LS)
		      '//LS.Set_ICT_Criteria(0,
		      '//c=c+"Teststep"+chr(9)+TS.Name+chr(9)+TS.Description+chr(9)+TS.Criteria+chr(9)+str(TS.Measurement)+chr(9)+TS.Result+chr(13)
		      'n=n+1
		      'end
		      'LS=LS.NextStep
		      'wend
		      
		      c=c
		      //save to file
		      
		      Dim f As FolderItem= GetWorkingFolderItem //file type defined in File Type Sets Editor
		      if CheckFolder(f) then
		        Dim SubFolder as string="Reports"
		        if SubFolder<>"" then
		          f=f.Child(SubFolder)
		        end
		        if CheckFolder(f) then
		          f=f.Child(FileName)
		          If CheckFile(f) then
		            Call OpenMeasFileForSave(c, f)
		          end
		        end
		      end
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendPOST(BS as Restfull_Resource, SendMethod as text, URL as text, data as Xojo.Core.MemoryBlock, MimeType as Text)
		  RestFull_RS = BS
		  
		  RSocket.ClearRequestHeaders
		  
		  RSocket.SetRequestContent(data, MimeType)
		  
		  try
		    RSocket.Send(SendMethod, URL)
		  catch e As RuntimeException
		    if RestFull_RS<>nil then
		      RestFull_RS.Reply.SIAS("error occured "+e.Reason)
		    else
		      
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFileName(newName as string)
		  if newName <> "" Then
		    'MainWindow.Title = "TESSA : "+newName.Mid(i1+1,i2-i1-1)
		    Dim i1,i2 as integer
		    i1 = InstrReverse(newName, 0, PathSeparator)
		    i2 = newName.InStr(i1,".xml")
		    MainWindow.Title = "TESSA : "+newName.Mid(i1+1,i2-i1-1)
		    Title = "TESSA Editor : "+newName.Mid(i1+1,i2-i1-1)
		    If App.HMI_Active Then
		      HMI_Window.Title = "TESSA HMI : "+newName.Mid(i1+1,i2-i1-1)
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMouseCursor(form as string)
		  Select case form
		  case is="wait"
		    MouseCursor=System.Cursors.Wait
		  case is="finger"
		    MouseCursor=System.Cursors.FingerPointer
		  else
		    MouseCursor=System.Cursors.StandardPointer
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowLinkEditor()
		  AttrTab.ShowLinkEditor
		  ResizeMainWindow
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sound(SoundName as string)
		  #Pragma Unused SoundName
		  Dim NotePlayer1 as new NotePlayer
		  
		  NotePlayer1.Instrument=20
		  NotePlayer1.PlayNote(60,60)
		  NotePlayer1.PlayNote(72,60)
		  NotePlayer1.PlayNote(60,60)
		  NotePlayer1.PlayNote(60,0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartStop(Mode as string)
		  Dim sequenceRunMode As Integer
		  Dim menu As MenuItem = Start_Button.GetMenu
		  if menu <> Nil Then
		    For i As Integer = 0 to menu.Count - 1
		      If menu.Item(i).Checked Then
		        sequenceRunMode = i
		        Exit
		      End
		    Next
		  End
		  Select case Mode
		  case is = "reset"
		    If sequenceRunMode < 2 Then
		      Start_Button.SetIcon(start_icon)
		    Else
		      Start_Button.SetIcon(start2_icon)
		    End
		    Start_Button.GraphicalButton1.Selected = False
		    Start_Button.SetEnabled(true)
		    'Reset_Button.Icon = Icon_Stop_off
		    Reset_Button.Enabled = false
		    'Halt_Button.Icon = Icon_Halt_off
		    Halt_Button.Enabled = false
		    TreeMenu.Enabled = True
		  case is ="halt"
		    If sequenceRunMode < 2 Then
		      Start_Button.SetIcon(start_icon)
		    Else
		      Start_Button.SetIcon(start2_icon)
		    End
		    Start_Button.GraphicalButton1.Selected = False
		    Start_Button.SetEnabled(true)
		    'Reset_Button.Icon = Icon_Stop_on
		    Reset_Button.Enabled = true
		    'Halt_Button.Icon = Icon_Halt_off
		    Halt_Button.Enabled = false
		    TreeMenu.Enabled = True
		  case is ="start"
		    if App.GlobalTestSequence <> Nil Then
		      RefillTreeMenu(App.GlobalTestSequence.GetUniqueID)
		    End
		    if App.GlobalDebug then App.Debug_Start
		    If sequenceRunMode < 2 Then
		      'Start_Button.SetIcon(startRunning)
		    Else
		      'Start_Button.SetIcon(start2Running)
		    End
		    Start_Button.GraphicalButton1.Selected = True
		    Start_Button.SetEnabled(false)
		    'Reset_Button.Icon = Icon_Stop_on
		    Reset_Button.Enabled = True
		    'Halt_Button.Icon = Icon_Halt_on
		    Halt_Button.Enabled = true
		    TreeMenu.Enabled = False
		  end
		  if App.HMI_Active then
		    HMI_Window.HMI_StartStop(Mode)
		    HMI_Window.Show
		    if App.Security_GetLevel>3 then
		      MainWindow.Hide
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwitchDebugMode(vDebugOn as boolean)
		  Dim MI as MenuItem = MenuBar.Child("DebugOn")
		  if vDebugOn then
		    if MI<>nil then
		      MI.Text="Debug on"
		    end
		    HTL.ColumnWidths="*,40,40,40,20"
		  else
		    if MI<>nil then
		      MI.Text="Debug off"
		    end
		    HTL.ColumnWidths="*,40,40,40,0"
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateActiveObjectInMainTree(BS as BasicClass)
		  
		  If BS <> Nil Then
		    For i As Integer = 0 to HTL.ListCount - 1
		      If HTL.RowTag(i) = BS.GetUniqueID Then
		        HTL.Cell(i, 0) = BS.Name.GIAS
		        If BS.Name_Error Then
		          BS.Name_Error = False
		        End
		        'HTL.FillTreeRow(i, BS)
		        Exit
		      End
		    Next
		  End
		  
		  'HTL.UpdateBasicStep(HTL.GetActiveStep)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMainWindow()
		  If Not WorkspaceSettings.OnlyHMI.GIAB Then
		    HTL.Highlight(App.EventLoop.GetActiveMeasStep)
		  End
		  
		  dim tab As TabClass = MainTab.CurrentTab
		  if tab <> nil then
		    tab.RefreshShownValues()
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateRecentFiles()
		  RecentItems.ClearList
		  Dim recentFile(-1) As String = WorkspaceSettings.GetRecentFiles()
		  For Each Item As String in recentFile
		    RecentItems.AddItem(GetFolderItemFromPath(Item))
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserButton_EndTest()
		  //reset the program to the very first step or step to the linked teststep
		  // turn off the active step
		  // activate the first test step or the active step
		  if not(App.EventLoop.State=Thread.Running) then
		    App.EventLoop.Resume
		    //AddDebugTextCR("E1 Resume in user button")
		  end
		  Dim AMS as BasicClass = App.EventLoop.GetActiveMeasStep
		  if (AMS<>nil) and (AMS.GetUpperTest_Step<>nil) then
		    Dim TS as Test_StepClass = Test_StepClass(AMS.GetUpperTest_Step)
		    if TS.Button_EndTest.GIAS="" then
		      // find the first teststep
		      if App.GlobalTestSequence.FirstSubStep<>nil then
		        TS.ExecuteFlag.SIAB(true)
		        TS.SetGotoStep(Test_StepClass(App.GlobalTestSequence.FirstSubStep),false)
		      end
		    else
		      Dim BS as BasicClass
		      if TS.Button_EndTest.Link<>nil then
		        BS=TS.Button_EndTest.Link.MyStep
		      else
		        BS=TS.FindElement(TS.Button_EndTest.GIAS,true)
		      end
		      if (BS<>nil) and (BS IsA Test_StepClass)then
		        TS.SetGotoStep(Test_StepClass(BS),false)
		      end
		    end
		    
		    if (TS.TestResult.GIAI=ErrorCode_Fail) and TS.ExecuteTest.GIAB then
		      If App.HMI_Active Then
		        HMI_Window.HMI_ResetError(TS)
		      End
		      TS.Step_HMI_UpdateAll(1)
		      if AMS IsA StepClass then StepClass(AMS).ResetConnect
		    end
		  end
		  if not(App.EventLoop.State=Thread.Running) then
		    App.EventLoop.Resume
		    //AddDebugTextCR("E2 Resume in user button")
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserButton_Next(InitiatedbyENTER as boolean)
		  //step to the next element ignore possible error
		  
		  if App.EventLoop.State <> Thread.Running then
		    App.EventLoop.Resume
		    //AddDebugTextCR("E1 Resume in user button")
		  end
		  
		  if App.EventLoop.ActiveMeasStep<>nil then
		    Dim FS as Test_StepClass = App.EventLoop.ActiveMeasStep.GetUpperTest_Step
		    if FS<>nil then
		      Select case FS.GetStepButtonState(Test_StepClass.StepButtonEnum.ButtonNext)
		      case 0
		        FS.ExecuteFlag.SIAB(true)
		      case 1
		        FS.ExecuteFlag.SIAB(true)
		        #if DebugBuild
		          // we want to know when ExecuteFlag gets modified again -> see code in Boolean_AttributeClass.SOAB
		          DebugGlobals.FocusOn = FS.ExecuteFlag
		        #endif
		        //FS.TestResult.SIAI(5)
		      case 2
		        // stop actual step and make FS to step to the next step
		        App.EventLoop.ActiveMeasStep.Reset
		        App.EventLoop.ActiveMeasStep=FS
		        FS.SetRunState(6)
		        FS.ExecuteFlag.SIAB(true)
		      else
		        FS=FS
		      end
		      
		      if FS.UserWait.GIAI>0 then
		        // test step waits on user input
		        if InitiatedbyENTER then
		        else
		          if FS.ExecuteTest.GIAB then
		            If App.HMI_Active Then
		              HMI_Window.HMI_ResetError(FS)
		            End
		            FS.ExecuteSkip.SIAB(true)
		          else
		            FS.ExecuteFlag.SIAB(true)
		          end
		        end
		        App.EventLoop.ActiveMeasStep.SetRunState(6)
		        FS.GotoNext=true
		      else
		        if FS.ExecuteTest.GIAB then
		          Dim ti as integer = FS.GetActionOnError
		          // display trigger means: 0=none 1(default)=Show_Errors 2=Halt+Show_Errors 3=Abort 
		          Select case ti
		          case 1// show error only
		            if FS.TestResult.GIAI=1 then
		              If App.HMI_Active Then
		                HMI_Window.HMI_ResetError(FS)
		              End
		              App.EventLoop.ActiveMeasStep.SetRunState(6)
		              FS.GotoNext=true
		              FS.ExecuteSkip.SIAB(true)
		            else
		              if FS.ExecuteSkip.GIAB then
		                If App.HMI_Active Then
		                  HMI_Window.HMI_ResetError(FS)
		                End
		                App.EventLoop.ActiveMeasStep.SetRunState(6)
		                FS.GotoNext=true
		              else
		                App.EventLoop.ActiveMeasStep.SetRunState(9)
		                FS.GotoNext=true
		              end
		            end
		          case 2 // show_all
		            If App.HMI_Active Then
		              HMI_Window.HMI_ResetError(FS)
		            End
		            App.EventLoop.ActiveMeasStep.SetRunState(6)
		            FS.GotoNext=true
		          case 3 // halt & show errors
		            if FS.TestResult.GIAI=1 then
		              If App.HMI_Active Then
		                HMI_Window.HMI_ResetError(FS)
		              End
		              FS.SetRunState(8)
		              FS.GotoNext=true
		            end
		          case 4 // show and halt on all
		            If App.HMI_Active Then
		              HMI_Window.HMI_ResetError(FS)
		            End
		            FS.SetRunState(8)
		            FS.GotoNext=true
		          else
		            // go on
		            App.EventLoop.ActiveMeasStep.SetRunState(9)
		            FS.GotoNext=true
		            //needed? Test_StepClass(App.EventLoop.ActiveMeasStep).TestResult.SIAI(ErrorCode_Pass)
		          end
		        end
		      end
		    end
		  end
		  
		  if App.EventLoop.State <> Thread.Running then
		    App.EventLoop.Resume
		    //AddDebugTextCR("E2 Resume in user button")
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserButton_Repeat()
		  //repeat the same element again
		  if not(App.EventLoop.State=Thread.Running) then
		    App.EventLoop.Resume
		    //AddDebugTextCR("E1 Resume in user button")
		  end
		  
		  if App.EventLoop.ActiveMeasStep <> nil And App.EventLoop.ActiveMeasStep  IsA Test_StepClass then
		    Dim TS as Test_StepClass = Test_StepClass(App.EventLoop.ActiveMeasStep)
		    if TS.Button_Repeat.GIAS="" then
		      TS.SetRunState(1)
		    else
		      Dim BS as BasicClass
		      if TS.Button_Repeat.Link<>nil then
		        BS=TS.Button_Repeat.Link.MyStep
		      else
		        BS=TS.FindElement(TS.Button_Repeat.GIAS,true)
		      end
		      if (BS<>nil) and (BS IsA Test_StepClass)then
		        TS.SetGotoStep(Test_StepClass(BS),false)
		      end
		    end
		    
		    if (Test_StepClass(App.EventLoop.ActiveMeasStep).TestResult.GIAI=ErrorCode_Fail) and Test_StepClass(App.EventLoop.ActiveMeasStep).ExecuteTest.GIAB then
		      If App.HMI_Active Then
		        HMI_Window.HMI_ResetError(Test_StepClass(App.EventLoop.ActiveMeasStep))
		      End
		      Test_StepClass(App.EventLoop.ActiveMeasStep).Step_HMI_UpdateAll(1)
		      App.EventLoop.ActiveMeasStep.ResetConnect
		    end
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		#tag Note
			used to write the SAM600 report into the correct recordset
		#tag EndNote
		ActualTestcasePath As string
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  break '!!!
			End Get
		#tag EndGetter
		AttrEditor As AttributeEditor
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		commandsFile As FolderItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdarkModeEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdarkModeEnabled = value
			  If value Then
			    ChosenStep.TextColor = Color.White
			    ElementLabel.TextColor = Color.White
			    SelectedTreeLabel.TextColor = Color.White
			  Else
			    ChosenStep.TextColor = Color.Black
			    ElementLabel.TextColor = Color.Black
			    SelectedTreeLabel.TextColor = Color.Black
			  End If
			  Invalidate(False)
			  
			  // Replace this with control loop soon
			  MainTab.darkModeEnabled = value
			  Halt_Button.darkModeEnabled = value
			  Open_HMI_Window.darkModeEnabled = value
			  Reset_Button.darkModeEnabled = value
			  SaveProject.darkModeEnabled = value
			  ScreenshotButton.darkModeEnabled = value
			  Start_Button.darkModeEnabled = value
			  Stop_Button.darkModeEnabled = value
			  HTL.darkModeEnabled = value
			  
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DebugStep As BasicClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Links() As LinkInfo
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentSocket As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdb As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		mPasswordTimer As PasswordTimer = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		pic64 As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		RepList(-1) As TestReportMatrix
	#tag EndProperty

	#tag Property, Flags = &h0
		RestFull_RS As Restfull_Resource
	#tag EndProperty

	#tag Property, Flags = &h0
		TestReportTable(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h0
		UserName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		UserPassword As string
	#tag EndProperty

	#tag Property, Flags = &h0
		UserSelectedReportNr As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		UserSelectedReportType As TestReportMatrix
	#tag EndProperty


	#tag Constant, Name = SwitchToHMI, Type = String, Dynamic = False, Default = \"Show in HMI", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events MainServerSocket
	#tag Event
		Function AddSocket() As TCPSocket
		  
		  AddDebugText("Added Socket " + Str(mCurrentSocket))
		  
		  Dim ret As TCPSocket = New ClientSocket( mCurrentSocket )
		  
		  mCurrentSocket = mCurrentSocket + 1
		  
		  Return ret
		End Function
	#tag EndEvent
	#tag Event
		Sub Error(ErrorCode As Integer, err As RuntimeException)
		  AddDebugText("ServerSocket error: " + Str(ErrorCode))
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SecurityGroup
	#tag Event
		Sub Open()
		  if MainWindow.mPasswordTimer=nil then
		    MainWindow.mPasswordTimer=new PasswordTimer()
		  end
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PB_Refresh
	#tag Event
		Sub Action()
		  App.Security_ResetTimer
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PB_Close
	#tag Event
		Sub Action()
		  App.Security_Lock
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RSocket
	#tag Event
		Sub PageReceived(URL as Text, HTTPStatus as Integer, Content as xojo.Core.MemoryBlock)
		  'URLResponseField.Text = URL
		  'StatusCodeField.Text = HTTPStatus.ToText
		  '
		  
		  // Convert the content returned from the API from a MemoryBlock to Text.
		  Dim textData As Text
		  Try
		    textData = Xojo.Core.TextEncoding.UTF8.ConvertDataToText(content)
		  Catch e As RuntimeException
		    textData = "RESTy: Unable to display the binary data. " + e.Reason + " Try downloading it to a file instead."
		  End Try
		  if RestFull_RS<>nil then
		    Restfull_RS.Reply.SIAS(textData)
		    Restfull_RS.SetNewData(true)
		  end if
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub FileReceived(URL as Text, HTTPStatus as Integer, File as xojo.IO.FolderItem)
		  Dim textData As Text
		  'URLResponseField.Text = URL
		  'StatusCodeField.Text = HTTPStatus.ToText
		  '
		  'ResponseArea.Text = "File downloaded to: " + EndOfLine.UNIX.ToText + _
		  'SavePath
		  '
		  'ShowResponsePage
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error(err as RuntimeException)
		  if RestFull_RS<>nil then
		    Restfull_RS.Reply.SIAS(err.Reason)
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function AuthenticationRequired(Realm as Text, ByRef Name as Text, ByRef Password as Text) As Boolean
		  If UserName <> "" And UserPassword <> "" Then
		    Name = UserName.ToText
		    Password = UserPassword.ToText
		    Return True
		  else
		    Return false
		  End If
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events TreeMenu
	#tag Event
		Sub Change()
		  RedrawMainTree
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HTL
	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #Pragma Unused action
		  
		  Dim RootStep As BasicClass = Me.GetBasicClass
		  If RootStep <> Nil Then
		    // set focus
		    MainWindow.SetFocus
		    //clear drop rect
		    For i As Integer = 0 to Me.ListCount - 1
		      Me.CellTag(i, 0) = 0
		    Next
		    
		    Dim NewMeasStep As BasicClass
		    Dim needtoDelete As Boolean = False
		    // get dragged data
		    If obj.PrivateRawData("tessa.abspath") <> "" Then
		      //drop element from Libaray
		      Dim XMLPointer As Integer = 1
		      Dim S as string = OpenMeasFileForLoad(obj.PrivateRawData("tessa.abspath").FixEncoding)
		      NewMeasStep = Parse_XML(S, XMLPointer)
		    ElseIf obj.PrivateRawData("tessa.id") <> "" Then
		      needtoDelete = True
		      dim ID As String = obj.PrivateRawData("tessa.id").FixEncoding
		      NewMeasStep = RootStep.FindElementByUniqueID(ID)
		    End
		    
		    If NewMeasStep <> Nil Then
		      If NewMeasStep IsA TESSA_Prog_StepClass Then
		        'If not CloseSequence Then
		        'Return
		        'End
		      End
		      
		      'if NewMeasStep IsA TESSA_Prog_StepClass Then
		      'App.GlobalTopmostElement.AddSubElement(NewMeasStep)
		      'Else
		      Dim MouseX As Integer = System.MouseX - Me.Left - Self.Left
		      Dim MouseY As Integer = System.MouseY - Me.Top - Self.Top
		      Dim CurrentRow As Integer = Me.RowFromXY(MouseX, MouseY)
		      
		      Dim Operation As Integer = 0
		      //0 - add as SubElement
		      //1 - add as nextElement
		      //2 - add as end element when user drops item on rows which are not exists(CurrentRow < 0 or CurrentRow >= Me.ListCount)
		      Dim RowsHeight As Integer = (CurrentRow - Me.ScrollPosition + 1)* Me.RowHeight
		      if Abs(RowsHeight - MouseY) < 4 Then
		        CurrentRow = CurrentRow - 1
		        Operation = 1
		      Else
		        RowsHeight = RowsHeight + Me.RowHeight
		        If Abs(RowsHeight - MouseY) < 4 Then
		          Operation = 1
		        End
		      End
		      
		      If CurrentRow < 0 or CurrentRow >= Me.ListCount Then
		        If Operation = 1 Then
		          Return
		        End
		        CurrentRow = Me.ListCount - 1
		        Operation = 2
		      End
		      
		      // try to find the basic parent class
		      Dim CurrentStep As BasicClass = RootStep.FindElementByUniqueID(me.RowTag(CurrentRow).StringValue)
		      if CurrentStep = Nil Then
		        CurrentStep = RootStep
		      End
		      
		      If NewMeasStep.GetUniqueID = CurrentStep.GetUniqueID Then
		        Return
		      End
		      
		      if needtoDelete Then
		        RemoveSpecialGUIElement(NewMeasStep, true)
		        DeleteBasicStepClass(NewMeasStep)
		      End 
		      
		      Select Case Operation
		      Case 0
		        CurrentStep.AddSubElement(NewMeasStep)
		      Case 1
		        Dim AddAsNext As Boolean = True
		        If CurrentRow < (Me.ListCount - 1) Then
		          Dim NextElement As BasicClass = RootStep.FindElementByUniqueID(me.RowTag(CurrentRow + 1))
		          If CurrentStep.FirstSubStep <> Nil And NextElement <> Nil And CurrentStep.FirstSubStep.GetUniqueID = NextElement.GetUniqueID Then
		            AddAsNext = False
		          End
		        End
		        if AddAsNext Then
		          CurrentStep.AddNextElement(NewMeasStep)
		        Else
		          CurrentStep.AddFirstSubElement(NewMeasStep)
		        End
		        
		      Case 2
		        If CurrentStep.GetUniqueID = RootStep.GetUniqueID Then
		          CurrentStep.AddSubElement(NewMeasStep)
		        ElseIf CurrentStep.UpperStep <> Nil then
		          CurrentStep.UpperStep.AddSubElement(NewMeasStep)
		        Else
		          RootStep.AddSubElement(NewMeasStep)
		        End
		      End
		      
		      'End
		      
		      HandleStepClass(NewMeasStep)
		      If NewMeasStep.UpperStep <> Nil Then
		        NewMeasStep.UpperStep.Changed = True
		      End
		      
		      Dim BS As BasicClass = NewMeasStep
		      //expanded NewMeasStep
		      'While NewMeasStep <> Nil
		      'NewMeasStep.Expanded = True
		      'NewMeasStep = NewMeasStep.UpperStep
		      'Wend
		      
		      'If BS IsA TESSA_Prog_StepClass Then
		      'RefillTreeMenu(BS.GetUniqueID)
		      'Else
		      Me.UpdateTree
		      Me.SetScrollClass(BS)
		      'End
		    End
		  End
		End Sub
	#tag EndEvent
	#tag Event
		Sub StepSelected(BS As BasicClass)
		  If BS <> Nil Then
		    Dim elementTypeName As String = BS.BasicTypeName
		    If BS.DerivedType.GIAS <> "" Then
		      elementTypeName = elementTypeName + ":" + BS.DerivedType.GIAS
		    End
		    ChosenStep.Text = elementTypeName 
		    
		    pic64 = ElementTypeFactory.instance.GetBasicStepBigIcon(BS)
		    Picture64.Invalidate(False)
		    Picture64.HelpTag = BS.Name.GOAS
		    ElementLabel.Value = BS.Name.GOAS
		    
		    if BS IsA Test_StepClass then
		      Adjust_Buttons(Test_StepClass(BS))
		    end
		    
		    MainTab.StepSelected (BS)
		    Invalidate(False)
		  End
		End Sub
	#tag EndEvent
	#tag Event
		Sub DidUpdate(BS As BasicClass)
		  If BS <> Nil Then
		    MainTab.DidUpdate (BS)
		  End
		End Sub
	#tag EndEvent
	#tag Event
		Sub DeleteElement(BS As BasicClass)
		  If BS <> Nil Then
		    If BS.UpperStep <> Nil Then
		      BS.UpperStep.Changed = True
		    End
		    Element_Delete(BS)
		    If BS <> Nil And BS IsA TESSA_Prog_StepClass Then
		      App.GlobalTestSequence = Nil
		      RefillTreeMenu("Resource")
		    Else
		      Me.UpdateTree
		    End
		  End
		End Sub
	#tag EndEvent
	#tag Event
		Sub PasteElement(source As String)
		  If source <> "" Then
		    Dim activeStep As BasicClass =  Me.GetActiveStep
		    If activeStep <> Nil Then
		      Dim XMLPointer As Integer = 1
		      Dim NewMeasStep As BasicClass = Parse_XML(source, XMLPointer)
		      If NewMeasStep <> Nil Then
		        activeStep.AddSubElement(NewMeasStep)
		        
		        HandleStepClass(NewMeasStep)
		        If NewMeasStep.UpperStep <> Nil Then
		          NewMeasStep.UpperStep.Changed = True
		        End
		        
		        Dim BS As BasicClass = NewMeasStep
		        //expanded NewMeasStep
		        'While NewMeasStep <> Nil
		        'NewMeasStep.Expanded = True
		        'NewMeasStep = NewMeasStep.UpperStep
		        'Wend
		        
		        Me.UpdateTree
		        Me.SetScrollClass(BS)
		      End
		    End
		  End
		End Sub
	#tag EndEvent
	#tag Event
		Function AddToContextMenu(base As MenuItem, x As Integer, y As Integer) As Boolean
		  If App.HMI_Active Then
		    base.Append(new MenuItem(SwitchToHMI, SwitchToHMI))
		  End
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function AddedContextMenuAction(hitItem As MenuItem) As Boolean
		  Select Case hitItem.Tag.StringValue
		  Case SwitchToHMI
		    Dim activeBasic As BasicClass = Me.GetActiveStep
		    If activeBasic <> Nil Then
		      Dim ts As Test_StepClass = activeBasic.GetUpperTest_Step
		      If ts <> Nil Then
		        HMI_Window.Change_HMI_Page(ts)
		        HMI_Window.Show
		        Return True
		      End
		    End
		  End
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function DisclosureWidgetPaint(g As Graphics, row As Integer, ByRef x As Integer, ByRef y As Integer, ByRef width As Integer, ByRef height As Integer) As Boolean
		  If me.RowExpandedAt(row) Then
		    g.DrawPicture(icon_disclosure_open, x, y)
		  Else
		    g.DrawPicture(icon_disclosure_closed, x, y)
		  End If
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  // disabled mousehover effects
		  'dim currentRow as Integer = me.rowMouseOver
		  'dim newRow as Integer = me.RowFromXY(X,Y)
		  'If currentRow <> newRow Then
		  'me.rowMouseOver = newRow
		  'Invalidate(False)
		  'End If
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseExit()
		  me.rowMouseOver = -1
		  Invalidate(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MarsSplitter1
	#tag Event
		Sub Open()
		  me.Attach TreeMenu, true
		  me.Attach HTL
		  me.Attach MainTab
		  me.Attach Picture64, true // true means: just move, not resize
		  'me.Attach SaveProject, true
		  'me.Attach Open_HMI_Window, true
		  Me.Attach ElementLabel, True
		  me.Attach ChosenStep, true
		End Sub
	#tag EndEvent
	#tag Event
		Sub Moved(distance as Integer)
		  MainWindow.Invalidate(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Picture64
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  Const padding = 15
		  If pic64 <> nil Then
		    dim ratio as Double = min( (me.Height - padding) / pic64.Height, (me.Width - padding) / pic64.Width)
		    
		    // Calculate new size
		    dim w,h as Integer
		    
		    //maintain aspect ratio to fit in the canvas
		    w = pic64.Width * ratio
		    h = pic64.Height * ratio
		    
		    //Center the image
		    Dim x, y As Integer
		    x = Me.Width / 2 - w / 2
		    y = Me.Height / 2 - h / 2
		    
		    g.DrawPicture(pic64, x, y, w, h, 0, 0, pic64.Width, pic64.Height)
		  End If
		  g.ForeColor = RGB(0, 120, 215)
		  g.PenSize = 2
		  g.DrawRoundRectangle(0,0,Me.Width,Me.Height, 10, 10)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveProject
	#tag Event
		Sub LeftClick()
		  Dim SelectedStep As BasicClass = HTL.GetBasicClass
		  If SelectedStep <> Nil Then
		    'if not(App.Security_WindowVisible) then
		    'PasswordWindow.Show
		    'end
		    If App.Security_Check(2) Then
		      If App.GlobalResources <> Nil And App.GlobalResources.FindElementByUniqueID(SelectedStep.GetUniqueID) <> Nil Then
		        If App.SaveConfigFile Then
		          MsgBox "Configuration data has been saved."
		        End
		      ElseIf App.GlobalTestSequence <> Nil And App.GlobalTestSequence.FindElementByUniqueID(SelectedStep.GetUniqueID) <> Nil Then
		        Dim newName As String = SaveSequence(App.GlobalTestSequence)
		        SetFileName( newName )
		      ElseIf App.GlobalSYNC <> Nil And App.GlobalSYNC.FindElementByUniqueID(SelectedStep.GetUniqueID) <> Nil Then
		        If App.SaveSYNCSettings Then
		          'MsgBox "TESSA settings has been saved"
		        End
		      ElseIf MainSettings.Instance.FindElementByUniqueID(SelectedStep.GetUniqueID) <> Nil Then
		        MainSettings.Instance.SaveSettings
		      End
		    End
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Stop_Button
	#tag Event
		Sub LeftClick()
		  If QuitButtonPress Then
		    Quit
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Reset_Button
	#tag Event
		Sub LeftClick()
		  App.MainLoop("stop")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Start_Button
	#tag Event
		Sub Open()
		  'Me.SetIcon(Icon_Start_on)
		  Me.SetIcon(start_icon)
		  Dim buttonMenu As New MenuItem
		  buttonMenu.Append(new MenuItem("Normal", RunSequenceModeEnum.Normal))
		  buttonMenu.Append(new MenuItem(MenuItem.TextSeparator))
		  buttonMenu.Append(new MenuItem("TestStep by TestStep", RunSequenceModeEnum.StepByStep))
		  buttonMenu.Append(new MenuItem("Element by Element", RunSequenceModeEnum.ElementByElement))
		  Select Case App.SequenceRunMode
		  Case RunSequenceModeEnum.Normal
		    buttonMenu.Item(0).Checked = True
		  Case RunSequenceModeEnum.StepByStep
		    buttonMenu.Item(2).Checked = True
		  Case RunSequenceModeEnum.ElementByElement
		    buttonMenu.Item(3).Checked = True
		  End
		  Me.SetMenu(buttonMenu)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ButtonToggled()
		  App.MainLoop("toggle")
		End Sub
	#tag EndEvent
	#tag Event
		Sub MenuTriggered(Item As MenuItem)
		  If Item <> Nil Then
		    Dim menu As MenuItem = Me.GetMenu
		    If menu <> Nil Then
		      For i As Integer = 0 to menu.Count - 1
		        menu.Item(i).Checked = False
		      Next
		    End
		    Item.Checked = True
		    If App.HMI_Active Then
		      MarkMenuItemAsChekcedByTag(HMI_Window.Start_Button.GetMenu, Item.Tag)
		    End
		    App.SequenceRunMode = RunSequenceModeEnum(Item.Tag.IntegerValue)
		    If App.SequenceRunMode = RunSequenceModeEnum.Normal Then
		      Me.SetIcon(start_icon)
		      If App.HMI_Active Then
		        HMI_Window.Start_Button.SetIcon(start_icon)
		      End
		    Else
		      Me.SetIcon(start2_icon)
		      If App.HMI_Active Then
		        HMI_Window.Start_Button.SetIcon(start2_icon)
		      End
		    End
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScreenshotButton
	#tag Event
		Sub LeftClick()
		  SaveScreenShot(TakeScreenShot(Self), "Main_Debug_index")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Open_HMI_Window
	#tag Event
		Sub LeftClick()
		  HMI_Window.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Halt_Button
	#tag Event
		Sub LeftClick()
		  App.MainLoop("toggle")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
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
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
		Name="ActualTestcasePath"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UserSelectedReportNr"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="UserName"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UserPassword"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="pic64"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Picture"
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
#tag EndViewBehavior
