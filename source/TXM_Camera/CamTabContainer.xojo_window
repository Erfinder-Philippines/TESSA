#tag Window
Begin ContainerControl CamTabContainer Implements CamCanvasInterface,TabInterface
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
   Height          =   738
   Index           =   -2147483648
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
   Transparent     =   False
   Visible         =   True
   Width           =   1040
   Begin PushButton UpdateDevicesButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Update"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   925
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   60
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   75
   End
   Begin Listbox CamListbox
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   "70%,30%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   2
      GridLinesVerticalStyle=   2
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   158
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Camera devices	Input"
      Italic          =   False
      Left            =   691
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   84
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   309
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas cvsPreview
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      Height          =   618
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
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
      Top             =   60
      Transparent     =   True
      Visible         =   True
      Width           =   659
      Begin Rectangle CorrectionProgressGroup
         AllowAutoDeactivate=   True
         BorderThickness =   1.0
         BottomRightColor=   &c00000000
         Enabled         =   True
         FillColor       =   &cFFCC6600
         Height          =   141
         Index           =   -2147483648
         InitialParent   =   "cvsPreview"
         Left            =   126
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         Tooltip         =   ""
         Top             =   127
         TopLeftColor    =   &c00000000
         Transparent     =   False
         Visible         =   False
         Width           =   472
         Begin ProgressBar CorrectionProgressBar
            AllowAutoDeactivate=   True
            Enabled         =   True
            Height          =   20
            Indeterminate   =   False
            Index           =   -2147483648
            InitialParent   =   "CorrectionProgressGroup"
            Left            =   146
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            MaximumValue    =   0
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   0
            TabStop         =   True
            Tooltip         =   ""
            Top             =   220
            Transparent     =   False
            Value           =   0.0
            Visible         =   True
            Width           =   432
         End
         Begin Label Label14
            AllowAutoDeactivate=   True
            Bold            =   False
            DataField       =   ""
            DataSource      =   ""
            Enabled         =   True
            FontName        =   "System"
            FontSize        =   0.0
            FontUnit        =   0
            Height          =   43
            Index           =   -2147483648
            InitialParent   =   "CorrectionProgressGroup"
            Italic          =   False
            Left            =   146
            LockBottom      =   False
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   False
            LockTop         =   True
            Multiline       =   True
            Scope           =   0
            Selectable      =   False
            TabIndex        =   1
            TabPanelIndex   =   0
            TabStop         =   True
            Text            =   "Please be patient, TESSA tries to find a correction for the current setup"
            TextAlignment   =   2
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   155
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   432
         End
      End
      Begin Canvas ReferencePicture
         AllowAutoDeactivate=   True
         AllowFocus      =   False
         AllowFocusRing  =   True
         AllowTabs       =   False
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         Height          =   159
         Index           =   -2147483648
         InitialParent   =   "cvsPreview"
         Left            =   126
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   303
         Transparent     =   True
         Visible         =   False
         Width           =   237
      End
   End
   Begin PushButton AssignButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "<< Assign Cam to Resource"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   691
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   60
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   222
   End
   Begin PushButton TakeButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Take Reference Picture"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   817
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   445
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   165
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
      Left            =   703
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
      Text            =   "Left"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   353
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   26
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
      Left            =   702
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Top"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   380
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   31
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
      Left            =   850
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Width"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   353
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   32
   End
   Begin Label Label6
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
      Left            =   847
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Height"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   381
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   45
   End
   Begin NumbericValidator LeftField
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
      Italic          =   False
      Left            =   742
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   352
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   70
   End
   Begin NumbericValidator TopField
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
      Italic          =   False
      Left            =   742
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   379
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   70
   End
   Begin NumbericValidator WidthField
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
      Italic          =   False
      Left            =   896
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   352
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   70
   End
   Begin NumbericValidator HeightField
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
      Italic          =   False
      Left            =   896
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   380
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   70
   End
   Begin CheckBox Rotate
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Rotate"
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
      Left            =   893
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   263
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   67
   End
   Begin NumbericValidator AngleField
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
      Italic          =   False
      Left            =   896
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   24
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   288
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   55
   End
   Begin CheckBox MirrorV
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Mirror Vertically"
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
      Left            =   700
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   263
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   131
   End
   Begin CheckBox MirrorH
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Mirror Horizontally"
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
      Left            =   700
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   289
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   145
   End
   Begin CheckBox AutoCorrectBox
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Automatic frame position correction:"
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
      Left            =   703
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   27
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   515
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   294
   End
   Begin NumbericValidator XField
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
      Italic          =   False
      Left            =   747
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   28
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   554
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   70
   End
   Begin NumbericValidator YField
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
      Italic          =   False
      Left            =   747
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   29
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   588
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   70
   End
   Begin Label Label7
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
      Left            =   711
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   30
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "X"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   555
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   13
   End
   Begin Label Label8
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
      Left            =   711
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Y"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   589
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   10
   End
   Begin PushButton StartCorrection
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Start automatic frame correction"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   747
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   32
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   623
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   227
   End
   Begin Label Label10
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
      Left            =   834
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Vectors"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   556
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   49
   End
   Begin Label Label11
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
      Left            =   834
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Diffvalue"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   589
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   64
   End
   Begin NumbericValidator VectorsField
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
      Italic          =   False
      Left            =   904
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   36
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   555
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   70
   End
   Begin NumbericValidator diffField
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
      Italic          =   False
      Left            =   904
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   37
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   589
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   70
   End
   Begin Label Label12
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
      Left            =   955
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   38
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Degrees"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   289
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin Label Label13
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
      Left            =   702
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   39
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Reference Frame Definition (Pixels):"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   322
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   309
   End
   Begin PushButton UpdateFrameButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Update Frame"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   817
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   40
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   413
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   164
   End
   Begin GroupBox GroupBox1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   84
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   703
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   51
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   412
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   81
      Begin BevelButton Down10
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &c00000000
         BevelStyle      =   4
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
         Height          =   11
         Icon            =   832814737
         IconAlignment   =   1
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   732
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   479
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   22
      End
      Begin BevelButton Down1
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &c00000000
         BevelStyle      =   4
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
         Height          =   11
         Icon            =   832814737
         IconAlignment   =   1
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   732
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   467
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   22
      End
      Begin Oval Oval1
         AllowAutoDeactivate=   True
         BorderColor     =   &c00000000
         BorderThickness =   0.0
         Enabled         =   True
         FillColor       =   &cB3B3B300
         Height          =   18
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Left            =   734
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         Tooltip         =   ""
         Top             =   444
         Transparent     =   False
         Visible         =   True
         Width           =   18
      End
      Begin BevelButton Right10
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &c00000000
         BevelStyle      =   4
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
         Icon            =   1223100385
         IconAlignment   =   1
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   768
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   442
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   11
      End
      Begin BevelButton Right1
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &c00000000
         BevelStyle      =   4
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
         Icon            =   1223100385
         IconAlignment   =   1
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   756
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   442
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   11
      End
      Begin BevelButton Left1
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &c00000000
         BevelStyle      =   4
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
         Icon            =   1966374066
         IconAlignment   =   1
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   719
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   442
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   11
      End
      Begin BevelButton Left10
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &c00000000
         BevelStyle      =   4
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
         Icon            =   1966374066
         IconAlignment   =   1
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   707
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   442
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   11
      End
      Begin BevelButton Up1
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &c00000000
         BevelStyle      =   4
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
         Height          =   11
         Icon            =   1295158389
         IconAlignment   =   1
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   732
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   429
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   22
      End
      Begin BevelButton Up10
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &cFFFFFF00
         BevelStyle      =   4
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
         Height          =   11
         Icon            =   1295158389
         IconAlignment   =   1
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   732
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   417
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   22
      End
   End
   Begin PushButton ShowButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Show Reference Picture"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   817
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   52
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   477
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   165
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return  New CamTabContainer(Self.mCamTabClass)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mCamTabClass = CameraModule.CamTabClass(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawFrameRectOnVideoLayer()
		  #If TargetMacOS Then
		    If mCurrentCamResourceClass <> Nil And mCurrentCamGrabber <> Nil Then
		      Dim c As CALayerMBS = mCurrentCamGrabber.VideoPreviewLayer
		      If c <> Nil Then
		        Dim X As Integer = mCurrentCamResourceClass.FrameCoordinates.X
		        Dim Y As Integer = mCurrentCamResourceClass.FrameCoordinates.Y
		        Dim W As Integer = mCurrentCamResourceClass.FrameCoordinates.Width
		        If W<=0 Then
		          W=DisplayFrame.Width
		        End
		        Dim H As Integer = mCurrentCamResourceClass.FrameCoordinates.Height
		        If H<=0 Then
		          H=DisplayFrame.Height
		        End
		        If mCurrentCamResourceClass.AutomaticCorection.GIAB Then
		          X=X + mCurrentCamResourceClass.CorectionPoint.X
		          Y=Y + mCurrentCamResourceClass.CorectionPoint.Y
		        End
		        Dim lays(-1) As CALayerMBS = c.sublayers
		        Dim rectLayer As CALayerMBS = Nil
		        If lays.Ubound > 0 Then
		          rectLayer = lays(lays.Ubound)
		        Else
		          rectLayer = New CALayerMBS
		        End
		        
		        rectLayer.borderWidth = 1
		        rectLayer.frame = CGMakeRectMBS(X, Y, W, H)
		        c.addSublayer rectLayer
		      End
		    End
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnterTab()
		  UpdateCamResourceControls
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExitTab()
		  if mCurrentCamGrabber <> Nil Then
		    mCurrentCamGrabber.CloseGrabber
		    mCurrentCamGrabber = Nil
		    cvsPreview.Refresh
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Cams()
		  // this routine initializes all definied and connected Cam
		  mCurrentCamResourceClass = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessFrame(frame As Picture)
		  // Part of the CamCanvasInterface interface.
		  If frame <> Nil Then
		    If (frame.Width <> VIDEO_WIDTH) Or (frame.Height <> VIDEO_HEIGHT) Then
		      DisplayFrame = frame.ScaleMBS(VIDEO_WIDTH, VIDEO_HEIGHT)
		    Else
		      DisplayFrame = frame
		    End If
		    if cvsPreview <> Nil Then
		      cvsPreview.Refresh
		    End
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResetVideoSource(BS as BasicClass)
		  'Reset the video source
		  If BS IsA CameraModule.Cam_ResourceClass Then
		    mCurrentCamResourceClass = CameraModule.Cam_ResourceClass(BS)
		    UpdateCamList
		    If Not SelectDevice(mCurrentCamResourceClass) Then
		      If mCurrentCamGrabber <> Nil Then
		        mCurrentCamGrabber.CloseGrabber
		      End
		      mCurrentCamGrabber = Nil
		      cvsPreview.Refresh
		    End
		    
		    UpdateCamResourceControls
		  End
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SelectDevice(CamRes As CameraModule.Cam_ResourceClass) As Boolean
		  If CamRes <> Nil Then
		    for i as Integer = 0 to CamListbox.LastIndex
		      If CamListbox.RowTag(i) = CamRes.VideoName.GIAS And CamListbox.Cell(i, 1).Val = CamRes.VideoIndex.GIAI Then
		        CamListbox.ListIndex = i
		        Return True
		      End
		    Next
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StepSelected(BS as BasicClass)
		  // Part of the TabInterface interface.
		  
		  If BS IsA CameraModule.Cam_ResourceClass Then
		    mCurrentCamResourceClass = CameraModule.Cam_ResourceClass(BS)
		  End If
		  ResetVideoSource(BS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub TransformVideoLayer()
		  #If TargetMacOS Then
		    If mCurrentCamResourceClass <> Nil And mCurrentCamGrabber <> Nil Then
		      Dim c As CALayerMBS = mCurrentCamGrabber.VideoPreviewLayer
		      If c <> Nil Then
		        Dim xValue As Integer = 1
		        Dim yValue As Integer = 1
		        If mCurrentCamResourceClass.VerticalMirroring.GIAB Then
		          yValue = -1
		        End
		        If mCurrentCamResourceClass.HorizontalMirroring.GIAB Then
		          xValue = -1
		        End
		        c.affineTransform = CGAffineTransformMBS.MakeScale(xValue, yValue)
		        
		        If mCurrentCamResourceClass.Rotate.GIAB Then
		          c.affineTransform = c.affineTransform.Rotate(mCurrentCamResourceClass.RotateAngle.GIAD * 3.1415 / 180)
		        End
		      End
		    End
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateCamList()
		  Dim devices() As Pair = CamGrabbersManager.instance.VideoDevices
		  CamListbox.DeleteAllRows
		  For Each device As Pair in devices
		    CamListbox.AddRow(Pair(device.Right).Left.StringValue)
		    CamListbox.Cell(CamListbox.ListCount - 1, 1) = device.Left
		    CamListbox.RowTag(CamListbox.ListCount - 1) = Pair(device.Right).Right
		  Next
		  if CamListbox.ListCount <= 0 Then
		    CamListbox.AddRow("None")
		    CamListbox.Cell(CamListbox.ListCount - 1, 1) = "-1"
		    CamListbox.RowTag(CamListbox.ListCount - 1) = "None"
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateCamResourceControls()
		  Dim DoSetup As Boolean = mCurrentCamResourceClass <> Nil
		  MirrorH.Enabled = DoSetup
		  MirrorV.Enabled = DoSetup
		  
		  AngleField.Enabled = DoSetup
		  Rotate.Enabled = DoSetup
		  
		  LeftField.Enabled = DoSetup
		  TopField.Enabled = DoSetup
		  WidthField.Enabled = DoSetup
		  HeightField.Enabled = DoSetup
		  
		  If DoSetup Then
		    MirrorH.Value = mCurrentCamResourceClass.HorizontalMirroring.GIAB
		    MirrorV.Value = mCurrentCamResourceClass.VerticalMirroring.GIAB
		    
		    AngleField.Text = Str(mCurrentCamResourceClass.RotateAngle.GIAD)
		    Rotate.Value = mCurrentCamResourceClass.Rotate.GIAB
		    
		    LeftField.Text = Str(mCurrentCamResourceClass.FrameCoordinates.X)
		    TopField.Text = Str(mCurrentCamResourceClass.FrameCoordinates.Y)
		    WidthField.Text = Str(mCurrentCamResourceClass.FrameCoordinates.Width)
		    HeightField.Text = Str(mCurrentCamResourceClass.FrameCoordinates.Height)
		    
		    AutoCorrectBox.Value = mCurrentCamResourceClass.AutomaticCorection.GIAB
		    XField.Text = Str(mCurrentCamResourceClass.CorectionPoint.X)
		    YField.Text = Str(mCurrentCamResourceClass.CorectionPoint.Y)
		    XField.Enabled = AutoCorrectBox.Value
		    YField.Enabled = AutoCorrectBox.Value
		    
		    diffField.Text = Str(mCurrentCamResourceClass.DiffValue.GIAI)
		    VectorsField.Text = Str(mCurrentCamResourceClass.VectorsCount.GIAI)
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private DisplayFrame As Picture = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		mCamTabClass As CameraModule.CamTabClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentCamGrabber As CamGrabber = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentCamResourceClass As CameraModule.Cam_ResourceClass = nil
	#tag EndProperty


	#tag Constant, Name = VIDEO_HEIGHT, Type = Double, Dynamic = False, Default = \"480", Scope = Private
	#tag EndConstant

	#tag Constant, Name = VIDEO_WIDTH, Type = Double, Dynamic = False, Default = \"640", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events UpdateDevicesButton
	#tag Event
		Sub Action()
		  'Initialize the video grabber
		  CamGrabbersManager.instance.UpdateGrabbers
		  mCurrentCamGrabber = Nil
		  cvsPreview.Refresh
		  UpdateCamList
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CamListbox
	#tag Event
		Sub Change()
		  if Me.ListIndex >= 0 Then
		    Dim tempGrab As CamGrabber  = CamGrabbersManager.instance.GetGrabber(CamListbox.RowTag(CamListbox.ListIndex), Val(CamListbox.Cell(CamListbox.ListIndex,1)))
		    If tempGrab <> Nil then
		      if mCurrentCamGrabber <> Nil Then
		        If mCurrentCamGrabber.VideoDevice = tempGrab.VideoDevice then
		          Return
		        End
		      End
		      if mCurrentCamGrabber <> Nil Then
		        mCurrentCamGrabber.CloseGrabber
		        cvsPreview.Refresh
		      End
		      mCurrentCamGrabber = tempGrab
		      if not mCurrentCamGrabber.IsInitialized Then
		        mCurrentCamGrabber.InitGrabber
		      End
		      if not mCurrentCamGrabber.IsPreviewing Then
		        mCurrentCamGrabber.StartPreview
		      End
		      mCurrentCamGrabber.SetVideoCanvas(Self, cvsPreview)
		    End
		    cvsPreview.Refresh
		  End
		  TransformVideoLayer
		  DrawFrameRectOnVideoLayer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvsPreview
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  Dim drawError As Boolean = true
		  'Overlay the error text
		  Dim tmpStr As String
		  if not CamGrabbersManager.instance.IsAnyVideoDeviceFound Then
		    tmpStr = "No Video Device Found"
		  ElseIf mCurrentCamGrabber = Nil Then
		    tmpStr = "No Video Source Selected"
		  else
		    drawError = False
		  End
		  If drawError Then
		    'Create a DisplayFrame with a blue background and the appropriate message
		    DisplayFrame = New Picture(CamGrabber.VIDEO_WIDTH, VIDEO_HEIGHT, 32)
		    
		    'Fill the canvas with a blue background
		    DisplayFrame.Graphics.ForeColor = &c0000FF
		    DisplayFrame.Graphics.FillRect(0, 0, DisplayFrame.Width, DisplayFrame.Height)
		    
		    DisplayFrame.Graphics.ForeColor = &cFFFFFF
		    DisplayFrame.Graphics.TextSize = 18
		    Call DisplayFrame.Graphics.DrawString(tmpStr, (DisplayFrame.Width - DisplayFrame.Graphics.StringWidth(tmpStr)) / 2, _
		    (DisplayFrame.Height - DisplayFrame.Graphics.StringHeight(tmpStr, DisplayFrame.Width)) / 2)
		  End
		  
		  #If Not TargetMacOS Then
		    if (mCurrentCamResourceClass<>Nil) And (DisplayFrame<>nil) Then
		      DisplayFrame = mCurrentCamResourceClass.TransformPicture(DisplayFrame, False, false)
		      Dim X As Integer = mCurrentCamResourceClass.FrameCoordinates.X
		      Dim Y As Integer = mCurrentCamResourceClass.FrameCoordinates.Y
		      Dim W As Integer = mCurrentCamResourceClass.FrameCoordinates.Width
		      if W<=0 then
		        W=DisplayFrame.Width
		      end
		      Dim H As Integer = mCurrentCamResourceClass.FrameCoordinates.Height
		      if H<=0 then
		        H=DisplayFrame.Height
		      end
		      if mCurrentCamResourceClass.AutomaticCorection.GIAB Then
		        X=X + mCurrentCamResourceClass.CorectionPoint.X
		        Y=Y + mCurrentCamResourceClass.CorectionPoint.Y
		      End
		      
		      DisplayFrame.Graphics.ForeColor = &cFEFA39
		      DisplayFrame.Graphics.DrawRect(X, Y, W, H)
		    end
		  #Endif
		  
		  'Draw the picture onto the preview canvas
		  If DisplayFrame <> Nil Then
		    g.DrawPicture(DisplayFrame,0,0, DisplayFrame.Width, DisplayFrame.Height)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AssignButton
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil And mCurrentCamGrabber <> Nil Then
		    mCurrentCamResourceClass.VideoName.SIAS(mCurrentCamGrabber.VideoDevice)
		    mCurrentCamResourceClass.VideoInputName.SIAS(mCurrentCamGrabber.VideoDeviceInputName)
		    mCurrentCamResourceClass.VideoIndex.SIAI(mCurrentCamGrabber.VideoDeviceIndex)
		  End
		  UpdateCamResourceControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TakeButton
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    mCurrentCamResourceClass.ReferencePicture.SIAP(mCurrentCamResourceClass.TakePhoto)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events LeftField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.UnsignedIntegerType)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TopField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.UnsignedIntegerType)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WidthField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.UnsignedIntegerType)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HeightField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.UnsignedIntegerType)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Rotate
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    mCurrentCamResourceClass.Rotate.SIAB(Me.Value)
		    Dim angel As Double = Val(AngleField.Text)
		    If angel < -360 Then
		      AngleField.Text = "-360"
		    ElseIf angel > 360 Then
		      AngleField.Text = "360"
		    End
		    mCurrentCamResourceClass.RotateAngle.SIAD(Val(AngleField.Text))
		  End
		  TransformVideoLayer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AngleField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.DoubleType)
		End Sub
	#tag EndEvent
	#tag Event
		Sub ValidTextChange()
		  Dim angel As Double = Val(Me.Text)
		  If angel < -360 Then
		    Me.Text = "-360"
		  ElseIf angel > 360 Then
		    Me.Text = "360"
		  End
		  if mCurrentCamResourceClass <> Nil Then
		    mCurrentCamResourceClass.RotateAngle.SIAD(Val(Me.Text))
		  End
		  TransformVideoLayer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MirrorV
	#tag Event
		Sub Action()
		  if mCurrentCamResourceClass <> Nil Then
		    mCurrentCamResourceClass.VerticalMirroring.SIAB(Me.Value)
		  End
		  TransformVideoLayer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MirrorH
	#tag Event
		Sub Action()
		  if mCurrentCamResourceClass <> Nil Then
		    mCurrentCamResourceClass.HorizontalMirroring.SIAB(Me.Value)
		  End
		  TransformVideoLayer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AutoCorrectBox
	#tag Event
		Sub Action()
		  if mCurrentCamResourceClass <> Nil Then
		    mCurrentCamResourceClass.AutomaticCorection.SIAB(Me.Value)
		  End
		  UpdateCamResourceControls
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events XField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.IntegerType)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events YField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.IntegerType)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events StartCorrection
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    CorrectionProgressGroup.Visible=true
		    mCurrentCamResourceClass.DiffValue.SIAI(Val(diffField.Text))
		    mCurrentCamResourceClass.VectorsCount.SIAI(Val(VectorsField.Text))
		    Dim pic As Picture = mCurrentCamResourceClass.TakePhoto(False)
		    if pic <> Nil then
		      mCurrentCamResourceClass.CorrectionPicture.SIAP(pic)
		      Dim X As Integer = 0
		      Dim Y As Integer = 0
		      mCurrentCamResourceClass.CorectionPoint.X = 0
		      mCurrentCamResourceClass.CorectionPoint.Y = 0
		      
		      If mCurrentCamResourceClass.GetCorrectedPosition(pic, mCurrentCamResourceClass.ReferencePicture.GIAP, X, Y, mCurrentCamResourceClass.DiffValue.GIAI, mCurrentCamResourceClass.VectorsCount.GIAI) Then
		        mCurrentCamResourceClass.CorectionPoint.X = X - mCurrentCamResourceClass.FrameCoordinates.X
		        mCurrentCamResourceClass.CorectionPoint.Y = Y - mCurrentCamResourceClass.FrameCoordinates.Y
		      End
		      UpdateCamResourceControls
		    End
		    CorrectionProgressGroup.Visible=false
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events VectorsField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.UnsignedIntegerType)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events diffField
	#tag Event
		Sub Open()
		  Me.SetType(NumbericValidator.Types.UnsignedIntegerType)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events UpdateFrameButton
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    mCurrentCamResourceClass.FrameCoordinates.X = Val(LeftField.Text)
		    mCurrentCamResourceClass.FrameCoordinates.Y = Val(TopField.Text)
		    mCurrentCamResourceClass.FrameCoordinates.Width = Val(WidthField.Text)
		    mCurrentCamResourceClass.FrameCoordinates.Height = Val(HeightField.Text)
		    mCurrentCamResourceClass.CorectionPoint.X = Val(XField.Text)
		    mCurrentCamResourceClass.CorectionPoint.Y = Val(YField.Text)
		  End
		  DrawFrameRectOnVideoLayer
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Down10
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    TopField.Text=str(val(TopField.Text)+10)
		    mCurrentCamResourceClass.FrameCoordinates.Y = Val(TopField.Text)
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Down1
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    TopField.Text=str(val(TopField.Text)+1)
		    mCurrentCamResourceClass.FrameCoordinates.Y = Val(TopField.Text)
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Right10
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    LeftField.Text=str(val(LeftField.Text)+10)
		    mCurrentCamResourceClass.FrameCoordinates.X = Val(LeftField.Text)
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Right1
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    LeftField.Text=str(val(LeftField.Text)+1)
		    mCurrentCamResourceClass.FrameCoordinates.X = Val(LeftField.Text)
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Left1
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    LeftField.Text=str(val(LeftField.Text)-1)
		    mCurrentCamResourceClass.FrameCoordinates.X = Val(LeftField.Text)
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Left10
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    LeftField.Text=str(val(LeftField.Text)-10)
		    mCurrentCamResourceClass.FrameCoordinates.X = Val(LeftField.Text)
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Up1
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    TopField.Text=str(val(TopField.Text)-1)
		    mCurrentCamResourceClass.FrameCoordinates.Y = Val(TopField.Text)
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Up10
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    TopField.Text=str(val(TopField.Text)-10)
		    mCurrentCamResourceClass.FrameCoordinates.Y = Val(TopField.Text)
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ShowButton
	#tag Event
		Sub Action()
		  If mCurrentCamResourceClass <> Nil Then
		    if not(ReferencePicture.Visible) then
		      Dim RefP as Picture = mCurrentCamResourceClass.ReferencePicture.GIAP
		      if RefP<>nil then
		        ReferencePicture.Backdrop=RefP
		        ReferencePicture.Left=cvsPreview.left+mCurrentCamResourceClass.FrameCoordinates.X
		        ReferencePicture.Top=cvsPreview.top+mCurrentCamResourceClass.FrameCoordinates.Y
		        ReferencePicture.Width=ReferencePicture.Backdrop.Width
		        ReferencePicture.Height=ReferencePicture.Backdrop.Height
		        ReferencePicture.Visible=true
		        ShowButton.Caption="Hide Reference Picture"
		      else
		        MsgBox("No Reference Picture found, may be make one first")
		      end
		    else
		      ShowButton.Caption="Show Reference Picture"
		      ReferencePicture.Visible=false
		    end
		  else
		    MsgBox("No Reference Picture found")
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
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
