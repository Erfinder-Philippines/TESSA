#tag Window
Begin Window HMI_Window
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   712
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   600
   MinimizeButton  =   True
   MinWidth        =   900
   Placement       =   1
   Resizeable      =   True
   Title           =   "HMI Window"
   Visible         =   False
   Width           =   1306
   Begin GraphicalListbox TSList
      ActiveColumn    =   -1
      ActiveRow       =   -1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   "*,80,30"
      darkModeEnabled =   False
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   30
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   2
      genericTblHorizontal=   False
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   1
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   600
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Teststep	 State	do\r"
      Italic          =   False
      Left            =   20
      ListboxType     =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   91
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   256
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Rectangle StateFrame
      AllowAutoDeactivate=   True
      BorderThickness =   1.0
      BottomRightColor=   &cFFFFFF00
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   73
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   6
      TopLeftColor    =   &cFFFFFF00
      Transparent     =   False
      Visible         =   True
      Width           =   256
      Begin Label ActiveElementType
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   12.0
         FontUnit        =   2
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "StateFrame"
         Italic          =   False
         Left            =   145
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "ElementType"
         TextAlignment   =   3
         TextColor       =   &c00DE8000
         Tooltip         =   ""
         Top             =   9
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   125
      End
      Begin Label ActiveElementName
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   12.0
         FontUnit        =   2
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "StateFrame"
         Italic          =   False
         Left            =   27
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
         Text            =   "ElementName"
         TextAlignment   =   0
         TextColor       =   &c00DE8000
         Tooltip         =   ""
         Top             =   9
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   125
      End
      Begin Label TCPLabel2
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   12.0
         FontUnit        =   2
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "StateFrame"
         Italic          =   False
         Left            =   100
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
         Text            =   "1"
         TextAlignment   =   0
         TextColor       =   &c00DE8000
         Tooltip         =   ""
         Top             =   53
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   86
      End
      Begin Label ActiveElementTimeOut
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   12.0
         FontUnit        =   2
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "StateFrame"
         Italic          =   False
         Left            =   157
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "TimeOut"
         TextAlignment   =   3
         TextColor       =   &c00DE8000
         Tooltip         =   ""
         Top             =   31
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   113
      End
      Begin Label Label1
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   12.0
         FontUnit        =   0
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "StateFrame"
         Italic          =   False
         Left            =   27
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "RunState"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   30
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   64
      End
      Begin Label Label2
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   12.0
         FontUnit        =   0
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "StateFrame"
         Italic          =   False
         Left            =   27
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "SendState"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   52
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   65
      End
      Begin Label Label3
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   12.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "StateFrame"
         Italic          =   False
         Left            =   177
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Retries"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   51
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   72
      End
      Begin Label TCPLabel3
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   12.0
         FontUnit        =   2
         Height          =   24
         Index           =   -2147483648
         InitialParent   =   "StateFrame"
         Italic          =   False
         Left            =   243
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   51
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   28
      End
      Begin Label TCPLabel1
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   12.0
         FontUnit        =   2
         Height          =   29
         Index           =   -2147483648
         InitialParent   =   "StateFrame"
         Italic          =   False
         Left            =   76
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "1"
         TextAlignment   =   2
         TextColor       =   &c00DE8000
         Tooltip         =   ""
         Top             =   27
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   55
      End
   End
   Begin PagePanel ResultPanel
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   518
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   307
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   0
      Panels          =   ""
      Scope           =   0
      TabIndex        =   25
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   90
      Transparent     =   True
      Value           =   0
      Visible         =   True
      Width           =   989
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
      InitialParent   =   ""
      Left            =   448
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   627
      Transparent     =   True
      Visible         =   True
      Width           =   64
   End
   Begin Splitter HMISplitter
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   603
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   284
      LineColor       =   &cBBBBBB00
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   42
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   91
      Transparent     =   True
      Visible         =   True
      Width           =   16
   End
   Begin GraphicalButton Exit_Button
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
      Left            =   314
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   False
      Tooltip         =   ""
      Top             =   627
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
      Left            =   381
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   627
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
      Left            =   515
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   627
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
   End
   Begin Canvas TextFrame
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   72
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   307
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   6
      Transparent     =   True
      Visible         =   True
      Width           =   603
      Begin Rectangle TimerBackground
         AllowAutoDeactivate=   True
         BorderThickness =   1.0
         BottomRightColor=   &c99999900
         Enabled         =   True
         FillColor       =   &cD1D1D100
         Height          =   64
         Index           =   -2147483648
         InitialParent   =   "TextFrame"
         Left            =   766
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         Tooltip         =   ""
         Top             =   12
         TopLeftColor    =   &c7F7F7F00
         Transparent     =   False
         Visible         =   False
         Width           =   64
         Begin Rectangle TimerForeground
            AllowAutoDeactivate=   True
            BorderThickness =   1.0
            BottomRightColor=   &c00FF0000
            Enabled         =   True
            FillColor       =   &c00FF0000
            Height          =   60
            Index           =   -2147483648
            InitialParent   =   "TimerBackground"
            Left            =   768
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   False
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   1
            TabPanelIndex   =   0
            Tooltip         =   ""
            Top             =   13
            TopLeftColor    =   &c00FF0000
            Transparent     =   False
            Visible         =   False
            Width           =   33
         End
      End
      Begin BevelButton Button_Change_HMI_View
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         BackgroundColor =   &cFF000000
         BevelStyle      =   1
         Bold            =   False
         ButtonStyle     =   0
         Caption         =   "Untitled"
         CaptionAlignment=   3
         CaptionDelta    =   0
         CaptionPosition =   1
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         HasBackgroundColor=   True
         Height          =   64
         Icon            =   573235385
         IconAlignment   =   6
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "TextFrame"
         Italic          =   False
         Left            =   842
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   12
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   64
      End
      Begin Label TimerDisplay
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "Verdana"
         FontSize        =   16.0
         FontUnit        =   0
         Height          =   29
         Index           =   -2147483648
         InitialParent   =   "TextFrame"
         Italic          =   False
         Left            =   770
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "00:00"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   26
         Transparent     =   True
         Underline       =   False
         Visible         =   False
         Width           =   59
      End
      Begin Label Description
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   18.0
         FontUnit        =   0
         Height          =   48
         Index           =   -2147483648
         InitialParent   =   "TextFrame"
         Italic          =   False
         Left            =   311
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Multiline       =   True
         Scope           =   0
         Selectable      =   False
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Untitled"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   17
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   443
      End
   End
   Begin Rectangle ResultMessageFrame
      AllowAutoDeactivate=   True
      BorderThickness =   1.0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFFFFFF00
      Height          =   518
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   307
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   39
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   90
      TopLeftColor    =   &c00000000
      Transparent     =   False
      Visible         =   True
      Width           =   986
      Begin TextArea TestDescription
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
         Height          =   79
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "ResultMessageFrame"
         Italic          =   False
         Left            =   311
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   455
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   266
      End
      Begin TextField TestName
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
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultMessageFrame"
         Italic          =   False
         Left            =   311
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   432
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   266
      End
      Begin TextField TestMeasurement
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
         Height          =   22
         Hint            =   ""
         Index           =   -2147483648
         InitialParent   =   "ResultMessageFrame"
         Italic          =   False
         Left            =   311
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   577
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   266
      End
      Begin TextArea TestCriteria
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
         Height          =   39
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "ResultMessageFrame"
         Italic          =   False
         Left            =   311
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   False
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   536
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   266
      End
      Begin TextArea TestResultMessage
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
         Height          =   167
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "ResultMessageFrame"
         Italic          =   False
         Left            =   583
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         MaximumCharactersAllowed=   0
         Multiline       =   True
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   433
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   704
      End
      Begin Listbox TestStepReportList
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   True
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   7
         ColumnWidths    =   "35,*,*,*,90,0,0"
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   -1
         DropIndicatorVisible=   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   16.0
         FontUnit        =   2
         GridLinesHorizontalStyle=   2
         GridLinesVerticalStyle=   3
         HasBorder       =   True
         HasHeader       =   True
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   338
         Index           =   -2147483648
         InitialParent   =   "ResultMessageFrame"
         InitialValue    =   "Idx	Name	Criteria	Meas	Result	Descr	Error	\n						Description 1	"
         Italic          =   False
         Left            =   307
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         RowSelectionType=   0
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   90
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   989
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
   End
   Begin Rectangle MainWindow_Button
      AllowAutoDeactivate=   True
      BorderThickness =   0.0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cE7E7E700
      Height          =   64
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   607
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   47
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   628
      TopLeftColor    =   &c00000000
      Transparent     =   False
      Visible         =   True
      Width           =   64
   End
   Begin GraphicalButton Button_Repeat
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Repeat"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   1571891199
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   838
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   45
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   627
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   140
   End
   Begin GraphicalButton Button_EndTest
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "End Test"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   992509951
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   990
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   46
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   627
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   140
   End
   Begin GraphicalButton Button_Next
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Continue"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   992419839
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   1142
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   627
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   140
   End
   Begin GraphicalButton ChooseBarcodeButton
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      BackColor       =   &c00FF0000
      Backdrop        =   0
      Bottom          =   0
      Caption         =   "Barcode"
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      icon            =   1571518463
      IconAlignment   =   -1
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   1085
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   41
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   10
      Transparent     =   True
      useBackColor    =   False
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
      Left            =   1207
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Right           =   0
      Scope           =   0
      Selected        =   False
      TabIndex        =   40
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   10
      Transparent     =   True
      useBackColor    =   False
      Visible         =   True
      Width           =   64
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  If not appQuitting And not MainWindow.QuitButtonPress Then
		    Return True
		  End
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  if self.LastPage <> nil then
		    self.LastPage.StopAll
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  For i As Integer = 0 to TSList.ColumnCount - 1
		    TSList.HeaderType(i) = ListBox.HeaderTypes.NotSortable
		  Next
		  
		  ProgramTimer = New ProgTimer
		  HMI_Set_View(0)
		  
		  Dim menu As MenuItem = MainWindow.Start_Button.GetMenu
		  Dim index As Integer
		  For index = 0 To menu.Count - 1
		    if menu.Item(index).Checked then
		      Exit
		    end
		  next
		  MarkMenuItemAsChekcedByIndex(Me.Start_Button.GetMenu, menu.Item(index).Tag.IntegerValue)
		  If App.SequenceRunMode = RunSequenceModeEnum.Normal Then
		    Me.Start_Button.SetIcon(start_icon)
		  Else
		    Me.Start_Button.SetIcon(start2_icon)
		  End
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  //Draw background for the ResultPanel
		  g.DrawingColor = &cF9F9F9
		  g.FillRectangle(ResultPanel.Left,ResultPanel.Top,ResultPanel.Width,ResultPanel.Height)
		  //Draw Button separators
		  g.DrawingColor = &cd8d8d8
		  g.PenSize = 2
		  g.DrawLine(Halt_Button.Right + 5, Halt_Button.Top, Halt_Button.Right + 5, Halt_Button.Bottom)
		  If Button_Repeat.Visible Then
		    g.DrawLine(Button_Repeat.Left - 5, Button_Repeat.Top, Button_Repeat.Left - 5, Button_Repeat.Bottom)
		  End If
		  g.DrawLine(Button_Next.Right + 5, Button_Next.Top, Button_Next.Right + 5, Button_Next.Bottom)
		  //Separator between BarcodeButton and ScreenshotButton
		  Dim x As Integer = (ChooseBarcodeButton.Right + ScreenshotButton.Left) / 2
		  g.DrawLine(x, ChooseBarcodeButton.Top, x, ChooseBarcodeButton.Bottom)
		  
		  //Separator between stateframe and TSLIST
		  Dim y As Integer = (StateFrame.Top + StateFrame.Height + TSList.Top) / 2
		  g.DrawLine(0, y, g.Width, y)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function Add_HMI_Canvas(HCSP as BasicClass) As HMI_Canvas
		  if App.HMI_Active then
		    if HCSP <> nil And HCSP isA HMI_StepClass then
		      Dim Canvas as new HMI_Canvas
		      Canvas.visible = true
		      Canvas.enabled = true
		      Canvas.Top = 0
		      Canvas.Left = 0
		      Canvas.mHMIStep=HMI_StepClass(HCSP)
		      
		      Dim TS as Test_StepClass = HCSP.GetUpperTest_Step
		      if TS<>nil then
		        if TS.Picture_Canvas<>nil then
		          Canvas.EmbedWithin(TS.Picture_Canvas,0,0)
		        else
		          Canvas.EmbedWithin(ResultPanel,0,0)
		        end
		      else
		        Canvas.EmbedWithin(ResultPanel,0,0)
		      end
		      return Canvas
		    end
		  end
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add_HMI_Page(TSSC as Test_StepClass, createCanvas as Boolean = true)
		  If App.GlobalTestSequence <> Nil Then
		    Dim Position As Integer = 0
		    if App.GlobalTestSequence.GetPreviousTestStepClassCount(TSSC.GetUniqueID, Position) Then
		      TSList.InsertRow(Position, TSSC.IndentSpaces(App.GlobalTestSequence)+TSSC.Name.GIAS)
		      TSList.RowTag(Position) = TSSC.GetUniqueID
		      TSList.Cell(Position, 1) = TSSC.TestResult.GIAS
		      if not(TSSC.Visible.GIAB) then
		        TSList.CellItalic(Position,0)=true
		      end
		      
		      if createCanvas Then
		        Dim root As BasicClass = TSSC.GetUpper_TESSA_Program
		        For i As Integer = Position Downto 0
		          Dim ts As Test_StepClass = Test_StepClass(root.FindElementByUniqueID(TSList.RowTag(i)))
		          If ts = Nil Or ts <> Nil And (ts.HMI_Page.GIAI = 2 Or ts.HMI_Page.GIAI = 1) Then
		            Position = Position - 1
		          End
		        Next
		        Position = Position + 1 'shift + 1, since 0 index is empty panel
		        
		        ResultPanel.Insert(Position)
		        ResultPanel.Value = Position
		        
		        if TSSC <>nil then
		          TSSC.Picture_Canvas=Add_HMI_Canvas(TSSC)
		          if TSSC.Picture_Canvas<>nil then
		            TSSC.InitHandlers
		            TSSC.Picture_Canvas.Left = ResultPanel.Left
		            TSSC.Picture_Canvas.Top = ResultPanel.Top
		            TSSC.Picture_Canvas.Width = ResultPanel.Width
		            TSSC.Picture_Canvas.Height = ResultPanel.Height
		            TSSC.Picture_Canvas.LockBottom = true
		            TSSC.Picture_Canvas.LockLeft = true
		            TSSC.Picture_Canvas.LockRight = true
		            TSSC.Picture_Canvas.LockTop = true
		            TSSC.UpdatePicture(true)
		          end
		        end
		      End
		    End
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add_ReportLine(ix as integer, TName as string, Descr as string, Crit as string, Meas as string, ErrMess as string, ErrCode as integer)
		  
		  TestStepReportList.AddRow(str(ix),TName,Crit,Meas,GetError(ErrCode),Descr,ErrMEss)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Adjust_Buttons(NewPage as Test_StepClass)
		  // Do adjust the buttons settings according the
		  if NewPage <> nil then
		    
		    Dim ButtonEnable As Boolean = True
		    if App.GetTESSAState <> 0 then
		      if NewPage.ExecuteSkip.GIAB then
		        ButtonEnable = false
		      ElseIf (NewPage.UserHalt.GIAI > 0) Then
		        ButtonEnable = NewPage.CheckRunState(7) or NewPage.CheckRunState(6)
		      end
		    end
		    
		    // enable setup for programm definied control buttons
		    // adjust Next Button, last one on right side
		    
		    Dim ButtonVisible As Boolean
		    ButtonVisible = (NewPage.GetStepButtonState(Test_StepClass.StepButtonEnum.ButtonNext) > 0)_
		    and ((NewPage.GetActionOnError<3) OR not(NewPage.ExecuteTest.GIAB)) OR (NewPage.UserHalt.GIAB OR NewPage.UserWait.GIAB)
		    if (NewPage.Button_Next.GIAS <> "") and (NewPage.Button_Next.Link<>nil) Then
		      Button_Next.Caption = NewPage.Button_Next.GIAS
		    else
		      if NewPage.ExecuteTest.GIAB then
		        Button_Next.Caption = "Ignore"
		      else
		        Button_Next.Caption = "Continue"
		      end
		    End
		    
		    if Button_Next.Visible <> ButtonVisible then
		      Button_Next.Visible = ButtonVisible
		    end
		    if Button_Next.Enabled <> ButtonEnable then
		      Button_Next.Enabled = ButtonEnable
		    end
		    
		    // adjust Repeat Button, third in row
		    ButtonVisible = (NewPage.GetStepButtonState(Test_StepClass.StepButtonEnum.ButtonRepeat) > 0) and App.Security_Check(1,false)
		    'Button_Repeat.Caption = "Repeat"
		    if Button_Repeat.Visible <> ButtonVisible then
		      Button_Repeat.Visible = ButtonVisible
		    end
		    if Button_Repeat.Enabled <> ButtonEnable then
		      Button_Repeat.Enabled = ButtonEnable
		    end
		    
		    // adjust Reset Button at left
		    ButtonVisible = (NewPage.GetStepButtonState(Test_StepClass.StepButtonEnum.ButtonEndTest) > 0) and App.Security_Check(1,false)
		    
		    if Button_EndTest.Visible <> ButtonVisible then
		      Button_EndTest.Visible = ButtonVisible
		    end
		    if Button_EndTest.Enabled <> ButtonEnable then
		      Button_EndTest.Enabled = ButtonEnable
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Change_HMI_Page(NewPage as Test_StepClass)
		  // set the appropiate line in the teststep list
		  If mFolowIds.Ubound >= 0 And NewPage <> Nil And mFolowIds.IndexOf(NewPage.GetUniqueID) < 0 Then
		    Return
		  End
		  If LastPage <> Nil Then
		    TSList.Cell(TSList.ListIndex,1) = LastPage.TestResult.GIAS
		  End
		  If NewPage <> Nil And NewPage <> LastPage Then
		    For i As Integer = 0 to TSList.ListCount - 1
		      If TSList.RowTag(i).StringValue = NewPage.GetUniqueID Then
		        TSList.ListIndex = i
		        Exit
		      End
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChooseBarcode() As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearReportLines()
		  
		  TestStepReportList.DeleteAllRows
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearResizeRectForAllHMIElementsOnPage(BS As BasicClass)
		  If BS <> Nil Then
		    Dim ChildStepClass As BasicClass  = BS.FirstSubStep
		    While ChildStepClass <> Nil
		      If ChildStepClass.FirstSubStep <> Nil Then
		        ClearResizeRectForAllHMIElementsOnPage(ChildStepClass)
		      End
		      If ChildStepClass isA HMI_StepClass Then
		        HMI_StepClass(ChildStepClass).ClearReszieRectangle
		      End
		      ChildStepClass = ChildStepClass.NextStep
		    Wend
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear_HMI_Window(TESSA_Prog As TESSA_Prog_StepClass)
		  AddDebugTextCR("<Clear_HMI_Window>")
		  If TESSA_Prog <> Nil Then
		    Dim BS As BasicClass = TESSA_Prog.FirstSubStep
		    While BS <> Nil
		      If BS IsA HMI_StepClass And App.HMI_Active Then
		        HMI_StepClass(BS).RemoveHMI
		      End
		      If BS IsA Test_StepClass Then
		        Me.Remove_HMI_Page(Test_StepClass(BS))
		      End
		      BS = BS.NextStep
		    Wend
		    Me.TSList.DeleteAllRows
		  End
		  AddDebugTextCR("</Clear_HMI_Window>")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSelectTestStep() As Test_StepClass
		  If TSList.ListIndex >= 0 Then
		    Dim TS As BasicClass = App.GlobalTopmostElement.FindElementByUniqueID(TSList.RowTag(TSList.ListIndex))
		    If TS IsA Test_StepClass Then
		      Return Test_StepClass(TS)
		    End
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HighlightTestResult(vTestResult as integer)
		  AddDebugTextCR("<HighlightTestResult>")
		  Dim LampColor as color
		  Dim LampText as string
		  Select Case vTestResult
		  case ErrorCode_Pass
		    LampColor=&c00EF00
		    LampText="Pass"
		    Me.Button_Change_HMI_View.Icon = Icon_Pass
		  case ErrorCode_Off
		    LampColor=&cFFFFFF
		    LampText="off"
		    Me.Button_Change_HMI_View.Icon = Icon_NotDone
		  case ErrorCode_NotDone
		    LampColor=&cFFFFFF
		    LampText="not done"
		    Me.Button_Change_HMI_View.Icon = Icon_NotDone
		  case ErrorCode_InProgress
		    LampColor=&cfff9a1
		    LampText="in progress"
		    Me.Button_Change_HMI_View.Icon = Icon_InProgress
		  case ErrorCode_Skipped
		    LampColor=&cff7a00
		    LampText="skipped"
		    Me.Button_Change_HMI_View.Icon = Icon_Fail
		  else
		    LampColor=&cFF0000
		    LampText="Fail"
		    Me.Button_Change_HMI_View.Icon = Icon_Fail
		  end
		  
		  Me.Button_Change_HMI_View.BackColor=LampColor
		  Me.Button_Change_HMI_View.Caption=LampText
		  
		  AddDebugTextCR("</HighlightTestResult>")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HMI_ResetError(TS as Test_StepClass)
		  ResultMessageFrame.Visible=false
		  TestResultMessage.Text=""
		  if TS <> nil then
		    //AddDebugTextCR("AdBu Reset Error ")
		    //Adjust_Buttons(TS)
		    TSList.Cell(TSList.ListIndex, 1) = TS.TestResult.GIAS
		    //TS.ResetErrors
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HMI_Set_View(vView as integer)
		  'AddDebugTextCR("<HMI_Set_View>")
		  if vView=-1 then
		    if Me.ViewState=0 then
		      Me.ViewState=1
		    else
		      Me.ViewState=0
		    end
		  end
		  
		  Select Case Me.ViewState
		  case 0
		    ResultMessageFrame.Visible=false
		    ResultPanel.Visible=true
		  case 1
		    ResultMessageFrame.Visible=true
		    ResultPanel.Visible=false
		  end
		  
		  if LastViewState<>ViewState then
		    Me.Refresh
		  end
		  LastViewState=ViewState
		  'AddDebugTextCR("</HMI_Set_View>")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HMI_ShowTestResultMessage(LS as BasicClass)
		  AddDebugTextCR("<HMI_ShowTestResultMessage>")
		  if LS = nil then
		    // in this case, we just want to show the status of the current page
		    LS = self.LastPage
		  end if
		  
		  if LS <> nil and LS IsA Test_StepClass then
		    Dim PS as Test_StepClass = Test_StepClass(LS)
		    if PS<>nil then
		      TSList.Cell(TSList.ListIndex,1) = PS.TestResult.GIAS
		      ClearReportLines
		      Dim ix as integer = 0
		      //new A.H TestCase_StepClass discarded
		      'if PS IsA Testcase_StepClass then
		      'PS.Refresh_Teststep_ReportList(ix,true)
		      'else
		      PS.Refresh_Teststep_ReportList(ix,false)
		      'end
		      HighlightTestResult(PS.TestResult.GIAI)
		    end
		  end
		  AddDebugTextCR("</HMI_ShowTestResultMessage>")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HMI_StartStop(Mode as string)
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
		  case is="reset"
		    SetRunMode(App.GlobalTopmostElement, false)
		    If sequenceRunMode < 2 Then
		      Start_Button.SetIcon(start_icon)
		    Else
		      Start_Button.SetIcon(start2_icon)
		    End
		    Start_Button.GraphicalButton1.Selected = False
		    Start_Button.SetEnabled(true)
		    'Reset_Button.Icon=Icon_Stop_off
		    Reset_Button.Enabled=false
		    'Halt_Button.Icon=Icon_Halt_off
		    Halt_Button.Enabled=false
		  case is ="halt"
		    SetRunMode(App.GlobalTopmostElement, false)
		    If sequenceRunMode < 2 Then
		      Start_Button.SetIcon(start_icon)
		    Else
		      Start_Button.SetIcon(start2_icon)
		    End
		    Start_Button.GraphicalButton1.Selected = False
		    Start_Button.SetEnabled(true)
		    'Reset_Button.Icon=Icon_Stop_on
		    Reset_Button.Enabled=true
		    'Halt_Button.Icon=Icon_Halt_off
		    Halt_Button.Enabled=false
		  case is ="start"
		    SetRunMode(App.GlobalTopmostElement, true)
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
		    Halt_Button.Enabled = True
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init()
		  mFolowIds = PopulateListOfFollowBasicIds(App.GlobalTestSequence, GetSelectTestStep)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub PageChanged(NewPage As Test_StepClass)
		  // this routine is called in order to change the active HMI page into another one
		  // a new page could either be Chosen by the user or by the programm when running
		  if NewPage<>nil then
		    Dim OldPageNr as Integer = 0
		    if Me.LastPage = nil then
		      OldPageNr=0
		    else
		      OldPageNr = TSList.ListIndex
		    end
		    
		    Dim Position As Integer = -1
		    Dim canvasPage As Test_StepClass = NewPage
		    If canvasPage.HMI_Page.GIAI = 2 Then
		      Dim solidTS As BasicClass = NewPage
		      While solidTS <> Nil And  Not (solidTS IsA TESSA_Prog_StepClass) And Not (solidTS IsA Test_StepClass And Test_StepClass(solidTS).HMI_Page.GIAI <= 1 Or Test_StepClass(solidTS).Picture_Canvas <> Nil)
		        solidTS = solidTS.UpperStep
		      Wend
		      If solidTS IsA Test_StepClass Then
		        canvasPage = Test_StepClass(solidTS)
		      End
		    End
		    If canvasPage <> Nil And canvasPage.HMI_Page.GIAI = 3 Then
		      For i As Integer = 0 To TSList.ListCount - 1
		        If TSList.RowTag(i) = canvasPage.GetUniqueID Then
		          Position = i
		          Exit
		        End
		      Next
		      Dim root As BasicClass = NewPage.GetUpper_TESSA_Program
		      For i As Integer = Position Downto 0
		        Dim ts As Test_StepClass = Test_StepClass(root.FindElementByUniqueID(TSList.RowTag(i)))
		        If ts = Nil Or ts <> Nil And ts.Picture_Canvas = Nil Then
		          Position = Position - 1
		        End
		      Next
		    End
		    
		    Position = Position + 1 'shift + 1, since 0 index is empty panel
		    ResultPanel.Value = Position
		    
		    // refresh the new test step now
		    if OldPageNr > TSList.ListIndex then
		      // update all
		      for i As Integer = 0 to TSList.ListCount - 1
		        Dim LS as BasicClass = NewPage.FindElementByUniqueID(TSList.RowTag(i).StringValue)
		        If LS IsA Test_StepClass then
		          TSList.Cell(TSList.ListIndex,1) = Test_StepClass(LS).TestResult.GIAS
		        end
		      next
		    else
		      // just update the new one
		      TSList.Cell(TSList.ListIndex,1) = NewPage.TestResult.GIAS
		    end
		    if NewPage.Description.GIAS="" then
		      Description.Text = NewPage.Name.GIAS
		    else
		      Description.Text = NewPage.Description.GIAS
		    end
		    
		    //set appropiate buttons
		    Adjust_Buttons(NewPage)
		    
		    //set error message
		    HMI_ShowTestResultMessage(NewPage)
		    
		    if NewPage.HMI_Page.GIAI>0 then
		      NewPage.Step_HMI_UpdateAll(1)
		    end
		    ResultPanel.Refresh
		    Me.LastPage = NewPage
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PopulateListOfFollowBasicIds(rootBasic As BasicClass, selectBasic As BasicClass) As String()
		  Dim ids(-1) As String
		  If rootBasic <> Nil Then
		    Dim BS As BasicClass = Nil
		    Dim it As BasicIteratorInterface = rootBasic.Iterator
		    While it.HasNext
		      BS = it.NextItem
		      If BS IsA Test_StepClass Then
		        ids.Append(BS.GetUniqueID)
		        'System.DebugLog bs.Name.GIAS
		      End
		      If BS IsA TestProcess_StepClass Then
		        Dim nextSubStep As BasicClass = BS.FirstSubStep
		        If selectBasic <> Nil Then
		          nextSubStep = BS.FirstSubStep
		          While nextSubStep <> Nil
		            If nextSubStep.FindElementByUniqueID(selectBasic.GetUniqueID) <> Nil Then
		              Exit While
		            End
		            nextSubStep = nextSubStep.NextStep
		          Wend
		          If nextSubStep = Nil Then
		            nextSubStep = BS.FirstSubStep
		          End
		        End
		        For Each id As String In PopulateListOfFollowBasicIds(nextSubStep, selectBasic)
		          ids.Append(id)
		        Next
		        For Each id As String In PopulateListOfFollowBasicIds(BS.NextStep, selectBasic)
		          ids.Append(id)
		        Next
		        Exit While
		      End
		    Wend
		  End
		  Return ids
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove_HMI_Page(TSC As Test_StepClass, RemoveInclude As Boolean = True)
		  If TSC <> Nil Then
		    If Me.Visible Then
		      Dim pos As Integer = -1
		      For i As Integer = 0 To TSList.ListCount - 1
		        If TSList.RowTag(i) = TSC.GetUniqueID Then
		          pos = i
		          Exit
		        End
		      Next
		      
		      If pos >= 0 Then
		        If TSC IsA Test_StepClass And Test_StepClass(TSC).Picture_Canvas <> nil Then
		          Dim panelPos As Integer = pos
		          Dim root As BasicClass = TSC.GetUpper_TESSA_Program
		          For i As Integer = panelPos Downto 0
		            Dim ts As Test_StepClass = Test_StepClass(root.FindElementByUniqueID(TSList.RowTag(i)))
		            If ts = Nil Or ts <> Nil And ts.Picture_Canvas = Nil Then
		              panelPos = panelPos - 1
		            End
		          Next
		          panelPos = panelPos + 1 'shift + 1, since 0 index is empty panel
		          ResultPanel.Remove(panelPos)
		        End
		        
		        TSList.RemoveRow(pos)
		        ResultPanel.Value  = 0
		        Description.Text = ""
		      End
		      If (TSList.ListCount - 1) <= 0 Then
		        ReDim mFolowIds(-1)
		      End
		    End
		    
		    If RemoveInclude Then
		      Dim BS As BasicClass = TSC.FirstSubStep
		      While BS <> Nil
		        If BS IsA Test_StepClass Then
		          Remove_HMI_Page(Test_StepClass(BS))
		        End
		        BS  = BS.NextStep
		      Wend
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset_to_Screen0()
		  if Top<0 then Top=200
		  if Top>screen(0).AvailableTop then Top=screen(0).AvailableTop+100
		  if Left<0 then Left=200
		  if Left>screen(0).AvailableLeft then Left=screen(0).AvailableLeft+100
		  
		  Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetButtonFrame(Pos as integer)
		  // set the ButtonFrame to the Chosen position 0=top, 1=bottom
		  if App.HMI_Active then
		    Select case Pos
		    case 0 // position on top
		      SetUserActionButton(true, 8)
		      
		      StateFrame.Top = 88
		      TSList.Top = 140
		      TextFrame.Top = 88
		      ResultPanel.Top = 165
		      ResultMessageFrame.Top = ResultPanel.Top
		      
		    case 1 // position on bottom
		      SetUserActionButton(false, Me.Height - 79)
		      
		      StateFrame.Top = 8
		      TSList.Top = 60
		      TextFrame.Top = 8
		      ResultPanel.Top = 85
		      ResultMessageFrame.Top = ResultPanel.Top
		      
		    case 3 // toggle position
		      if Exit_Button.LockTop then
		        SetButtonFrame(1)
		      else
		        SetButtonFrame(0)
		      end
		    end
		    
		    HMISplitter.Top = StateFrame.Top
		    HMISplitter.Height = TSList.Top - StateFrame.Top + TSList.Height
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetRunMode(BS As BasicClass, Enabled As Boolean)
		  If BS <> Nil Then
		    Dim ChildStepClass As BasicClass  = BS.FirstSubStep
		    While ChildStepClass <> Nil
		      If ChildStepClass.FirstSubStep <> Nil Then
		        SetRunMode(ChildStepClass, Enabled)
		      End
		      If ChildStepClass isA Test_StepClass Then
		        Test_StepClass(ChildStepClass).SetRunMode(Enabled)
		        ClearResizeRectForAllHMIElementsOnPage(ChildStepClass)
		      End
		      ChildStepClass = ChildStepClass.NextStep
		    Wend
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetUserActionButton(TopPos as Boolean, YPos as integer)
		  Dim TopLoc, ButtomLoc as Boolean
		  
		  TopLoc=TopPos
		  ButtomLoc=not(TopLoc)
		  
		  Exit_Button.LockTop=TopLoc
		  Exit_Button.LockBottom=ButtomLoc
		  Exit_Button.Top=YPos
		  
		  Reset_Button.LockTop=TopLoc
		  Reset_Button.LockBottom=ButtomLoc
		  Reset_Button.Top=YPos
		  
		  Start_Button.LockTop=TopLoc
		  Start_Button.LockBottom=ButtomLoc
		  Start_Button.Top=YPos
		  
		  Halt_Button.LockTop=TopLoc
		  Halt_Button.LockBottom=ButtomLoc
		  Halt_Button.Top=YPos
		  
		  MainWindow_Button.LockTop=TopLoc
		  MainWindow_Button.LockBottom=ButtomLoc
		  MainWindow_Button.Top=YPos
		  
		  Button_EndTest.LockTop=TopLoc
		  Button_EndTest.LockBottom=ButtomLoc
		  Button_EndTest.Top=YPos
		  
		  Button_Repeat.LockTop=TopLoc
		  Button_Repeat.LockBottom=ButtomLoc
		  Button_Repeat.Top=YPos
		  
		  Button_Next.LockTop=TopLoc
		  Button_Next.LockBottom=ButtomLoc
		  Button_Next.Top=YPos
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Show()
		  #if DebugBuild and false
		    // TT: it's always in the way and I don't need it currently
		  #else
		    Super.Show()
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCurrentStepInfo(SC As StepClass, ActTime As Double)
		  If SC <> Nil And App.HMI_Active then
		    ActiveElementName.Text = SC.Name.GOAS
		    Dim typeName As String = SC.BasicTypeName
		    If SC.DerivedType.GIAS <> "" Then
		      typeName = typeName + ":" + SC.DerivedType.GIAS
		    End
		    ActiveElementType.Text = typeName
		    ActiveElementTimeOut.Text = Format((SC.NextTime - ActTime) / 1000, "-###.#")
		    TCPLabel1.Text = Str(SC.GetRunState)
		    TCPLabel2.Text = Str(SC.SendState)
		    TCPLabel3.Text = Str(SC.GetRetries)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateHMIListWidth(newWidth As Integer)
		  HMISplitter.Move(newWidth, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateTestStepList(UpdateAttribute As AttributeClass)
		  If UpdateAttribute <> Nil Then
		    Dim BS As BasicClass = UpdateAttribute.MyStep
		    If BS IsA Test_StepClass And App.HMI_Active Then
		      Select case UpdateAttribute.Name
		      Case "Name"
		        For i As Integer = 0 to TSList.ListCount - 1
		          If BS.GetUniqueID = TSList.RowTag(i) Then
		            TSList.Cell(i, 0) = UpdateAttribute.GIAS
		            Exit
		          End
		        Next
		      Case "TestResult"
		        For i As Integer = 0 to TSList.ListCount - 1
		          If BS.GetUniqueID = TSList.RowTag(i) Then
		            TSList.Cell(i, 1) = UpdateAttribute.GIAS
		            Exit
		          End
		        Next
		      Case "Picture"
		        Test_StepClass(BS).UpdatePicture(true)
		      Case "Picture_Mode", "Picture_Scale", "Picture_X" , "Picture_Y"
		        Test_StepClass(BS).UpdatePicture
		      Case "Description"
		        Description.Text = UpdateAttribute .GIAS
		      Case "ErrorButtons", "Next","Repeat", "Back", "Reset", "ExecuteSkip","UserHalt"
		        Adjust_Buttons(Test_StepClass(BS))
		      Else
		        Change_HMI_Page(Test_StepClass(BS))
		      End
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		LastPage As Test_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastViewState As Integer = 3
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFolowIds() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgramTimer As ProgTimer
	#tag EndProperty

	#tag Property, Flags = &h0
		ViewState As Integer = 0
	#tag EndProperty


	#tag Constant, Name = HMI_Offset_X, Type = Double, Dynamic = False, Default = \"40", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SwitchToMain, Type = String, Dynamic = False, Default = \"Show in Main Tree", Scope = Protected
	#tag EndConstant


#tag EndWindowCode

#tag Events TSList
	#tag Event
		Sub Change()
		  PageChanged(GetSelectTestStep)
		  If LastPage <> Nil Then
		    mFolowIds = PopulateListOfFollowBasicIds(App.GlobalTestSequence, GetSelectTestStep)
		  End
		  Invalidate(False)
		End Sub
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  base.Append(new MenuItem(SwitchToMain, SwitchToMain))
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  Select Case hitItem.Tag.StringValue
		  Case SwitchToMain
		    MainWindow.HTL.SetScrollClass(GetSelectTestStep)
		    MainWindow.Show
		  End
		  
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ResultPanel
	#tag Event
		Sub Open()
		  ResultPanel.Insert(0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Start_Button
	#tag Event
		Sub Open()
		  Me.SetIcon(start_icon)
		  Me.SetMenu(MainWindow.Start_Button.GetMenu.Clone)
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
		    MarkMenuItemAsChekcedByTag(MainWindow.Start_Button.GetMenu, Item.Tag)
		    App.SequenceRunMode = RunSequenceModeEnum(Item.Tag.IntegerValue)
		    If App.SequenceRunMode = RunSequenceModeEnum.Normal Then
		      Me.SetIcon(start_icon)
		      MainWindow.Start_Button.SetIcon(start_icon)
		    Else
		      Me.SetIcon(start2_icon)
		      MainWindow.Start_Button.SetIcon(start2_icon)
		    End
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HMISplitter
	#tag Event
		Sub Moved(x As Integer, y As Integer)
		  TSList.Width = TSList.Width + x
		  StateFrame.Width = StateFrame.Width + x
		  
		  ResultPanel.Left = ResultPanel.Left + x
		  ResultPanel.Width = ResultPanel.Width - x
		  TextFrame.Left = TextFrame.Left + x
		  TextFrame.Width = TextFrame.Width - x
		  
		  ResultMessageFrame.Left = ResultMessageFrame.Left + x
		  ResultMessageFrame.Width = ResultMessageFrame.Width - x
		  
		  Exit_Button.Left = Exit_Button.Left + x
		  Halt_Button.Left = Halt_Button.Left + x
		  Reset_Button.Left = Reset_Button.Left + x
		  Start_Button.Left = Start_Button.Left + x
		  MainWindow_Button.Left = MainWindow_Button.Left + x
		  
		  If App.HMI_Active Then
		    App.GlobalTestSequence.HMIPageOffset.SIAI(HMISplitter.Left)
		  End
		  
		  Self.Invalidate(False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Exit_Button
	#tag Event
		Sub LeftClick()
		  If MainWindow.QuitButtonPress Then
		    Quit
		    'Hide
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
#tag Events Halt_Button
	#tag Event
		Sub LeftClick()
		  App.MainLoop("toggle")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextFrame
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  '#Pragma Unused areas
		  'g.forecolor=&cD7D7D7
		  'g.fillrect(2, 2, g.width-3, g.height-3)
		  'g.forecolor=&c000000
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button_Change_HMI_View
	#tag Event
		Sub Action()
		  HMI_Set_View(-1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TestStepReportList
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused column
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  TestName.Text=Me.Cell(row,1)
		  TestCriteria.Text=Me.Cell(row,2)
		  TestMeasurement.Text=Me.Cell(row,3)
		  TestDescription.Text=Me.Cell(row,5)
		  TestResultMessage.Text=Me.Cell(row,6)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events MainWindow_Button
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  MainWindow.Show
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Button_Repeat
	#tag Event
		Sub LeftClick()
		  //repeat the same element again
		  MainWindow.UserButton_Repeat
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button_EndTest
	#tag Event
		Sub LeftClick()
		  //reset the program to the very first step
		  MainWindow.UserButton_EndTest
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Button_Next
	#tag Event
		Sub LeftClick()
		  MainWindow.UserButton_Next(false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChooseBarcodeButton
	#tag Event
		Sub LeftClick()
		  BarcodeChoice.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ScreenshotButton
	#tag Event
		Sub LeftClick()
		  SaveScreenShot(TakeScreenShot(Self), "HMI_Debug_Index")
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
		Name="LastViewState"
		Visible=false
		Group="Behavior"
		InitialValue="3"
		Type="Integer"
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
		Name="ViewState"
		Visible=false
		Group="Behavior"
		InitialValue="0"
		Type="Integer"
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
