#tag Window
Begin ContainerControl ReportTabContainer Implements TabInterface
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
   Height          =   692
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
   Width           =   1035
   Begin DisclosureTriangle ShowFilter
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      Enabled         =   True
      FacingDirection =   0
      Height          =   18
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Click here to edit/add filters"
      Top             =   46
      Transparent     =   False
      Value           =   False
      Visible         =   True
      Width           =   18
   End
   Begin Listbox ReportList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   True
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   2
      GridLinesVerticalStyle=   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   64
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Report Files"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   608
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   304
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin GroupBox FilterGroup
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Filter Definition"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   494
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
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
      Top             =   102
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   304
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   30
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
         Text            =   "Type/Revision"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   193
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   89
      End
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   29
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
         Text            =   "Article Number"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   224
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   30
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
         Text            =   "Serial Number"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   353
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   94
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   30
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
         Text            =   "Result"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   254
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   87
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   30
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
         Text            =   "Test Type"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   286
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   78
      End
      Begin TextField TypeField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   141
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   "Type of report, e.g. COM03, 600PSM01"
         Top             =   192
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   127
      End
      Begin TextArea BarcodeField
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
         Height          =   58
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   81
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
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
         Tooltip         =   "Select reports with this barcode, if you place a barcode here, if will be analyzed and Serial-, Article-, and Workorder-Number set accordingly.\nBe aware that each file has to be opened and analyzed in order to select certain features."
         Top             =   418
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   0
         ValidationMask  =   ""
         Visible         =   True
         Width           =   233
      End
      Begin TextField ArticleField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   141
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
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
         Tooltip         =   "Article number, e.g. 1KHL178089R00004, be as specific as needed.\nBe aware that each file has to be opened and analyzed in order to select it."
         Top             =   223
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   173
      End
      Begin TextField SerialField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   141
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
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
         Tooltip         =   "Select reports with this serial number"
         Top             =   351
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   173
      End
      Begin TextField ResultField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   141
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   "Result of the test, P for Pass, F for Fail, S for Skipped"
         Top             =   254
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   173
      End
      Begin TextField TestField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   141
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   "Type of Test being performed, e.g. FCT_Long"
         Top             =   285
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   173
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   29
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
         Text            =   "Name"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   130
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   86
      End
      Begin TextField NameField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   141
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   "Name of the filter"
         Top             =   129
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   172
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   29
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
         Text            =   "Barcode"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   418
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   29
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   14
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Date"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   319
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   86
      End
      Begin TextField DateFromField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   141
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   "Select reports with test dates higher than... (format dd.mm.yyyy). \nBe aware that each file has to be opened and analyzed in order to select it."
         Top             =   318
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   83
      End
      Begin TextField DateToField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   229
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
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
         Tooltip         =   "Select reports with test dates lower than... (format dd.mm.yyyy). \nBe aware that each file has to be opened and analyzed in order to select it."
         Top             =   318
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   84
      End
      Begin PushButton PushButtonDelete
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "-"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   33
      End
      Begin PushButton PushButtonCopy
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Copy"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   112
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   18
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   58
      End
      Begin PushButton PushButtonSave
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   182
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   19
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   57
      End
      Begin PushButton PushButtonAdd
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "+"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   72
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   20
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   30
      End
      Begin PushButton PushButtonApply
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Apply"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   251
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   23
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   565
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   58
      End
      Begin Label Label9
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   29
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   24
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Report Template"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   161
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   113
      End
      Begin PopupMenu ReportTemplate
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
         InitialParent   =   "FilterGroup"
         InitialValue    =   ""
         Italic          =   False
         Left            =   141
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   0
         TabIndex        =   25
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   "Defined report types in folder ""Reports/ReportFilters/ReportTemplates""\n"
         Top             =   161
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   171
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   26
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Workorder"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   387
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   94
      End
      Begin TextField WorkorderField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   141
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   27
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   "Select reports with this Workorder number. \nBe aware that each file has to be opened and analyzed in order to select it."
         Top             =   385
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   173
      End
      Begin CheckBox CBTemporaryFiles
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Inlcude temp. files"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   28
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   519
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   137
      End
      Begin CheckBox CBRepetitions
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Inlcude repetitions"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   177
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   29
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   519
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   138
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   29
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   30
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Folder"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   489
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   40
      End
      Begin TextField FolderField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   81
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   31
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   3
         TextColor       =   &c00000000
         Tooltip         =   "Select reports with this Workorder number. \nBe aware that each file has to be opened and analyzed in order to select it."
         Top             =   489
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   195
      End
      Begin BevelButton FolderDialog
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &c00000000
         BevelStyle      =   0
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
         Icon            =   2139840804
         IconAlignment   =   1
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   283
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   32
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   488
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   31
      End
      Begin TextField RevisionField
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
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   280
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   33
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   "Type of report, e.g. COM03, 600PSM01"
         Top             =   192
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   32
      End
      Begin CheckBox CBFYP
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "First Yield Pass"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "FilterGroup"
         Italic          =   False
         Left            =   30
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   34
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   540
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   137
      End
   End
   Begin Listbox Report_AttributeList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   3
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   2
      GridLinesVerticalStyle=   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   179
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Value 1	Value 2"
      Italic          =   False
      Left            =   346
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   316
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox Report_TeststepList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   10
      ColumnWidths    =   "20%,30%,"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   2
      GridLinesVerticalStyle=   3
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   101
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Description	Criteria	Meas	Dev.	Result	Fails	Min	Mean	Max"
      Italic          =   False
      Left            =   346
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   275
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   669
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Histogramm Histogramm1
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   176
      HighLimit       =   0.0
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   674
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      LowLimit        =   0.0
      MaxValue        =   0.0
      MeanValue       =   0.0
      MinValue        =   0.0
      NumberofValues  =   0
      NumSteps        =   10
      ScaleStep       =   0.0
      Scope           =   0
      ShowValue       =   0.0
      SubTitle        =   ""
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Title           =   "Title"
      Tooltip         =   ""
      Top             =   76
      Transparent     =   True
      Visible         =   True
      Width           =   338
      YScaleMax       =   0.0
   End
   Begin TextArea ReportContent
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
      Height          =   53
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   346
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
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   383
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   669
   End
   BeginSegmented SegmentedControl ViewSelection
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   346
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacControlStyle =   0
      Scope           =   0
      Segments        =   "Overview\n\nTrue\rText\n\nTrue\rTeststeps\n\nTrue\rEEPROM\n\nTrue\rEEPROM content\n\nTrue"
      SelectionType   =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   "True"
      Top             =   44
      Transparent     =   False
      Visible         =   True
      Width           =   562
   End
   Begin Listbox EPTab
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   17
      ColumnWidths    =   ""
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
      Height          =   128
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   346
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   544
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   669
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PopupMenu EPROMView
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
      InitialValue    =   "HEX\rNUM\rCHAR"
      Italic          =   False
      Left            =   930
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   512
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   82
   End
   Begin PopupMenu SegmentSelection
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
      InitialValue    =   "0\r1\r2\r3\r4\r5\r6\r7\r"
      Italic          =   False
      Left            =   849
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   512
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   69
   End
   Begin Canvas PageSeparator
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   1800477473
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   21
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   324
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   253
      Transparent     =   True
      Visible         =   True
      Width           =   23
   End
   Begin PopupMenu FilterSelection
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   19
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Choose a filter\nManual\nCurrent Testrun\nAdd Filter"
      Italic          =   False
      Left            =   50
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Select a filter here"
      Top             =   45
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   274
   End
   Begin TextArea OverViewReport
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
      Height          =   54
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   346
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
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   446
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   False
      Width           =   669
   End
   Begin BevelButton ManualSelect
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Select"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   79
   End
   Begin BevelButton ManualUnselect
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   0
      Bold            =   False
      ButtonStyle     =   0
      Caption         =   "Unselect"
      CaptionAlignment=   3
      CaptionDelta    =   0
      CaptionPosition =   1
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      HasBackgroundColor=   False
      Height          =   22
      Icon            =   0
      IconAlignment   =   0
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   111
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   74
   End
   Begin PopupMenu ReportTemplateManual
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
      InitialValue    =   ""
      Italic          =   False
      Left            =   197
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Defined report types in folder ""Reports/ReportFilters/ReportTemplates""\n"
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   127
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  CheckFold(false)
		  EEPROMDisplay=new EEPROM_Class
		  
		  FillFilterSelection("")
		  
		  AddReportTemplates
		  
		  
		  Dim s As SegmentedControlItem
		  Dim i as integer
		  for i=0 to 2
		    s = ViewSelection.Items(i)
		    s.Selected=false
		  next
		  s = ViewSelection.Items(0)
		  s.Selected=true
		  
		  SetControlsVisibility(0)
		  AdjustControlSizes
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddNewFilter(CopyCurrent as boolean, NewName as string)
		  Dim RF as ReportModule.ReportFilterClass = New ReportModule.ReportFilterClass("")
		  RF=ReportModule.ReportFilterClass(SNMS(RF, "ReportFilter", 1,""))
		  
		  RF.Name.SIAS("New FIlter")
		  if ReportFilters=nil then
		    ReportFilters = New ReportModule.ReportFilterClass("")
		    ReportFilters = ReportModule.ReportFilterClass(SNMS(ReportFilters, "GobalFilter", 1,""))
		  end
		  if ReportFilters<>nil then
		    ReportFilters.AddSubElement(RF)
		    
		    SelectedFilter=RF
		    
		    if not(CopyCurrent) then
		      ClearFilterFields
		      if NewName="" then
		        NameField.Text="New Filter"
		      else
		        NameField.Text=NewName
		      end
		    else
		      if NewName="" then
		        NameField.Text=NameField.Text+" copy"
		      else
		        NameField.Text=NewName
		      end
		    end
		    RF.Name.SIAS(NameField.Text)
		    
		    SaveFilters(NameField.Text)
		  else
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddReportTemplates()
		  Dim f as FolderItem
		  Dim file as FolderItem
		  Dim LocItem as FolderItem = nil
		  Dim i, findex as integer =1
		  Dim SN as string
		  // load names of last used intrument in file Last_used.txt
		  
		  ReportTemplate.DeleteAllRows
		  ReportTemplateManual.DeleteAllRows
		  ReportTemplate.AddRow ("Automatic")
		  // load all files with .xml ending into the drop down menu
		  f=GetWorkingFolderItem
		  if CheckFolder(f) then
		    f=f.Child("Reports")
		    if CheckFolder(f) then
		      f=f.Child("ReportFilter")
		      if CheckFolder(f) then
		        f=f.Child("ReportTemplates")
		        if CheckFolder(f) then
		          For i=1 to f.Count
		            LocItem = f.Item(i)
		            if LocItem<>nil then
		              SN=LocItem.DisplayName
		              if left(SN,1)="." then
		              else
		                // add test definition to list clip off file extention (.txt)
		                file=f.Child(SN)
		                if CheckFile(file) then
		                  if SN.Instr(1,".txt")>0 then
		                    ReportTemplate.AddRow (SN.Mid(1,SN.len-4))
		                    ReportTemplate.RowTag(findex)=file
		                    ReportTemplateManual.AddRow (SN.Mid(1,SN.len-4))
		                    ReportTemplateManual.RowTag(findex-1)=file
		                  else
		                    ReportTemplate.InsertRow (findex,SN)
		                    ReportTemplate.RowTag(findex)=nil
		                    ReportTemplateManual.InsertRow (findex-1,SN)
		                    ReportTemplateManual.RowTag(findex-1)=nil
		                  end
		                  findex=findex+1
		                end
		                //load test definition
		                'LoadTestReportMatrix(SN)
		              end
		            end
		          Next
		        end
		      end
		    end
		  end
		  ReportTemplate.ListIndex=0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AdjustControlSizes()
		  Dim d as integer = 2
		  Dim d2 as integer = 4
		  
		  FilterSelection.Width=PageSeparator.Left-FilterSelection.Left-d
		  ReportList.Width= PageSeparator.Left-ReportList.Left-d
		  FilterGroup.Width= PageSeparator.Left-ReportList.Left-d
		  
		  'if FilterGroup.Visible then
		  'ReportList.Top=FilterGroup.Top+FilterGroup.Height+20
		  'ReportList.Height=Me.Parent.Height-FilterGroup.Height-110
		  'else
		  'ReportList.Height= Me.Parent.Height-ReportList.Top-20
		  'ReportList.Top=FilterGroup.Top
		  'ReportList.Height=Me.Height-90
		  'end
		  
		  Report_AttributeList.Left=PageSeparator.Left+PageSeparator.Width+d2
		  Report_AttributeList.Height=PageSeparator.Top-d-Report_AttributeList.Top
		  Histogramm1.Height=Report_AttributeList.Height
		  Histogramm1.Width=Histogramm1.Height*5/3
		  Histogramm1.Left=Me.Parent.Width-Histogramm1.Width-20
		  Report_AttributeList.Width=Me.Parent.Width-Report_AttributeList.Left-Histogramm1.Width-20
		  
		  Report_TeststepList.Left=PageSeparator.Left+PageSeparator.Width+d2
		  Report_TeststepList.Top=PageSeparator.Top+PageSeparator.Height+d2
		  Report_TeststepList.Width=Me.Parent.Width-Report_TeststepList.Left-20
		  Report_TeststepList.Height=Me.Parent.Height-Report_TeststepList.Top-20
		  
		  PageSeparator.MouseCursor=System.Cursors.StandardPointer
		  
		  ReportContent.left=Report_TeststepList.Left
		  ReportContent.Width=Report_TeststepList.Width
		  ReportContent.Top=Report_AttributeList.top
		  ReportContent.Height=Me.Parent.Height-ReportContent.Top-20
		  
		  EPROMView.Top=Report_AttributeList.top
		  SegmentSelection.Top=Report_AttributeList.top
		  
		  EPTab.left=Report_TeststepList.Left
		  EPTab.Top=Report_AttributeList.top+30
		  EPTab.Height=Me.Parent.Height-EPTab.Top-32
		  EPTab.Width=Report_TeststepList.Width
		  
		  OverViewReport.left=Report_TeststepList.Left
		  OverViewReport.Width=Report_TeststepList.Width
		  OverViewReport.Top=Report_AttributeList.top
		  OverViewReport.Height=ReportContent.Height
		  
		  ViewSelection.left=Report_TeststepList.Left
		  ViewSelection.Width=Report_TeststepList.Width
		  
		  ReportTemplateManual.Width=ReportList.Width-ReportTemplateManual.left+ReportList.left
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AdjustFilterFields()
		  
		  
		  If ResultField.Text="" then
		    ResultField.BackColor=Unused
		  else
		    ResultField.BackColor=Highlighted
		  end
		  
		  If SerialField.Text="" then
		    SerialField.BackColor=Unused
		  else
		    SerialField.BackColor=Highlighted
		  end
		  
		  If TestField.Text="" then
		    TestField.BackColor=Unused
		  else
		    TestField.BackColor=Highlighted
		  end
		  
		  If TypeField.Text="" then
		    TypeField.BackColor=Unused
		  else
		    TypeField.BackColor=Highlighted
		  end
		  
		  If RevisionField.Text="" then
		    RevisionField.BackColor=Unused
		  else
		    RevisionField.BackColor=Highlighted
		  end
		  
		  If ArticleField.Text="" then
		    ArticleField.BackColor=Unused
		  else
		    ArticleField.BackColor=Highlighted
		  end
		  
		  If BarcodeField.Text="" then
		    BarcodeField.BackColor=Unused
		  else
		    BarcodeField.BackColor=Highlighted
		  end
		  
		  If DateFromField.Text="" then
		    DateFromField.BackColor=Unused
		  else
		    DateFromField.BackColor=Highlighted
		  end
		  
		  If DateToField.Text="" then
		    DateToField.BackColor=Unused
		  else
		    DateToField.BackColor=Highlighted
		  end
		  
		  if WorkorderField.Text="" then
		    WorkorderField.BackColor=Unused
		  else
		    WorkorderField.BackColor=Highlighted
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckFold(fold as boolean)
		  if fold then
		    if FilterGroup.Visible then
		    else
		      FilterGroup.Visible=true
		      FilterGroup.Top=76
		      ReportList.Top=FilterGroup.Top+FilterGroup.Height+20
		      AdjustFilterFields
		    end
		  else
		    FilterGroup.Visible=false
		    FilterGroup.Top=Me.Height+100
		    if FilterSelection.Text="Manual" then
		      ReportList.Top=112
		    else
		      ReportList.Top=76
		    end
		  end
		  ReportList.Height=Me.Parent.Height-ReportList.Top-20
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearFilterFields()
		  
		  SelectedFilter=nil
		  NameField.Text=""
		  ArticleField.Text=""
		  TypeField.Text=""
		  RevisionField.Text=""
		  TestField.Text=""
		  ResultField.Text=""
		  DateFromField.Text=""
		  DateToField.Text=""
		  ReportTemplate.ListIndex=0
		  CBTemporaryFiles.Value=false
		  CBRepetitions.Value=false
		  FolderField.Text=""
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearLists()
		  ReportList.DeleteAllRows
		  ReportList.Heading(0)="no reports selected"
		  Report_TeststepList.DeleteAllRows
		  Report_AttributeList.DeleteAllRows
		  ReportContent.Text=""
		  OverViewReport.Text=""
		  ClearFilterFields
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return New ReportTabContainer(Self.mReportTabClass)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mReportTabClass = ReportTabClass(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyFieldsToFilter()
		  if SelectedFilter <>nil then
		    SelectedFilter.Name.SIAS(NameField.Text)
		    SelectedFilter.ArticleNumber.SIAS(ArticleField.Text)
		    SelectedFilter.Type.SIAS(TypeField.Text)
		    SelectedFilter.Revision.SIAS(RevisionField.Text)
		    SelectedFilter.TestType.SIAS(TestField.Text)
		    SelectedFilter.Result.SIAS(ResultField.Text)
		    SelectedFilter.DateFrom.SIAS(DateFromField.Text)
		    SelectedFilter.DateTo.SIAS(DateToField.Text)
		    SelectedFilter.ReportTemplate.SIAS(ReportTemplate.Text)
		    SelectedFilter.Include_TemporaryFiles.SIAB(CBTemporaryFiles.Value)
		    SelectedFilter.Include_Repetitions.SIAB(CBRepetitions.Value)
		    SelectedFilter.Include_FYP.SIAB(CBFYP.Value)
		    SelectedFilter.Folder.SIAS(FolderField.Text)
		    
		    SelectedFilter.TransferToNewForm
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyFilterToFields()
		  if SelectedFilter <>nil then
		    NameField.Text=SelectedFilter.Name.GIAS
		    ArticleField.Text=SelectedFilter.ArticleNumber.GIAS
		    TypeField.Text=SelectedFilter.Type.GIAS
		    RevisionField.Text=SelectedFilter.Revision.GIAS
		    TestField.Text=SelectedFilter.TestType.GIAS
		    ResultField.Text=SelectedFilter.Result.GIAS
		    DateFromField.Text=SelectedFilter.DateFrom.GIAS
		    DateToField.Text=SelectedFilter.DateTo.GIAS
		    Dim i as integer = 0
		    for i=0 to ReportTemplate.ListCount-1
		      if SelectedFilter.ReportTemplate.GIAS=ReportTemplate.List(i) then
		        ReportTemplate.ListIndex=i
		      end
		    next
		    CBTemporaryFiles.Value=SelectedFilter.Include_TemporaryFiles.GIAB
		    CBRepetitions.Value=SelectedFilter.Include_Repetitions.GIAB
		    CBFYP.Value=SelectedFilter.Include_FYP.GIAB
		    FolderField.Text=SelectedFilter.Folder.GIAS
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillFilterSelection(ActiveSelection as string)
		  
		  Dim i as integer=3
		  Dim n as integer=0
		  
		  FilterSelection.DeleteAllRows
		  FilterSelection.AddRow("Choose a filter")
		  FilterSelection.AddRow("Manual")
		  FilterSelection.AddRow("Current Test Run")
		  FilterSelection.AddRow("Barcode")
		  
		  // load names of last used intrument in file Last_used.txt
		  Dim fileItem As FolderItem = GetWorkingFolderItem
		  If fileItem <> Nil Then
		    fileItem = fileItem.Child("Reports")
		    if CheckFolder(fileItem) then
		      fileItem = fileItem.Child("ReportFilter")
		      if CheckFolder(fileItem) then
		        fileItem = fileItem.Child("ReportFilter.xml")
		        if CheckFile(fileItem) then
		          Dim SettingsData As String = OpenMeasFileForLoad(fileItem, False)
		          If SettingsData <> "" Then
		            Dim XMLPointer As Integer = 1
		            Dim BS As BasicClass = Parse_XML(SettingsData, XMLPointer)
		            if BS <> Nil And BS IsA ReportModule.ReportFilterClass Then
		              ReportFilters = ReportModule.ReportFilterClass(BS)
		              BS=ReportFilters.FirstSubStep
		              while BS<>nil
		                FilterSelection.AddRow (BS.Name.GIAS)
		                if ActiveSelection<>"" then
		                  if ActiveSelection=BS.Name.GIAS then
		                    n=i
		                  end
		                end
		                i=i+1
		                BS=BS.NextStep
		              wend
		            End
		          end
		        end
		      end
		    End
		  End
		  
		  FilterSelection.ListIndex=n
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillReportFolder(directory As FolderItem, ByRef row As Integer, Indent As Integer)
		  // this method fills the report list with the current structure of the "reports" folder, leaving out the folder ReportFilter
		  
		  If directory <> Nil and directory.Exists Then
		    Dim count As Integer = directory.Count
		    For i As Integer = 1 to count
		      Dim item As FolderItem = directory.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.DisplayName.Left(1) <> "." Then
		          If item.Directory Then
		            If (item.DisplayName <> "ReportFilter") and (not IsEmptyFolder(item)) Then
		              ReportList.InsertFolder(row, item.DisplayName, Indent)
		              ReportList.CellTag(row,0)=-1
		              ReportList.Expanded(row) =False
		              ReportList.RowTag(row) = item
		              ReportList.CellTag(row,0)=Indent
		              ReportList.RowPicture(row) = GetPicture("img", "Dir.png")
		              row = row + 1
		            End
		          End
		        End
		      End
		    Next
		    
		    For i As Integer = 1 to count
		      Dim item As FolderItem = directory.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.DisplayName.Left(1) <> "." Then
		          If not(item.Directory)  Then
		            ReportList.InsertRow(row, item.DisplayName, Indent)
		            ReportList.RowTag(row) = item
		            ReportList.CellTag(row,0)=Indent
		            row = row + 1
		          End
		        End
		      End
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillReportFolder(directory As FolderItem, ByRef row As Integer, Indent As Integer, byref NumFound as integer, byref NumFolder as integer, reportProgress as ProgressWindow)
		  // this method fills the report list with the current structure of the "reports" folder, leaving out the folder ReportFilter
		  
		  If directory <> Nil and directory.Exists Then
		    Dim count As Integer = directory.Count
		    Dim StartRow as integer = row
		    For i As Integer = 1 to count
		      Dim item As FolderItem = directory.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.DisplayName.Left(1) <> "." Then
		          If item.Directory Then
		            If (item.DisplayName <> "ReportFilter") and (not IsEmptyFolder(item)) Then
		              ReportList.InsertFolder(row, item.DisplayName, Indent)
		              ReportList.RowTag(row) = item
		              ReportList.CellTag(row,0)=Indent
		              ReportList.RowPicture(row) = GetPicture("img", "Dir.png")
		              ReportList.Expanded(row)=not( IsEmptyFolder(item))
		              row = row + 1
		              NumFound=NumFound+1
		              NumFolder=NumFolder+1
		              if reportProgress<>nil then
		                if (NumFound mod 50) = 0 then
		                  reportProgress.SetProgress(NumFound)
		                end
		              end
		              //OldRow=row
		              FillReportFolder(item, row,Indent+1,NumFound,NumFolder,reportProgress)
		              //ReportList.Expanded(OldRow) =(OldRow+1)<row
		            End
		          End
		        End
		      End
		    Next
		    
		    if (StartRow < row) then // don't include if only files are included
		      For i As Integer = 1 to count
		        Dim item As FolderItem = directory.Item(i)
		        If item <> Nil and item.Exists Then
		          If item.DisplayName.Left(1) <> "." Then
		            If not(item.Directory)  Then
		              ReportList.InsertRow(row, item.DisplayName, Indent)
		              ReportList.RowTag(row) = item
		              ReportList.CellTag(row,0)=Indent
		              row = row + 1
		              NumFound=NumFound+1
		              if reportProgress<>nil then
		                if (NumFound mod 50) = 0 then
		                  reportProgress.SetProgress(NumFound)
		                end
		              end
		            End
		          End
		        End
		      Next
		    end
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillReportFolder(directory As FolderItem, ByRef row As Integer, byref NumFound as integer, TRT as TestReportMatrix, byref TR as integer, byref NumPass as integer, byref NumFail as integer, byref NumSkipped as integer, byref NumOthers as integer, reportProgress as ProgressWindow)
		  // this methode fills the reportlist with the selected reports only
		  // the reports are loaded into the memory also for analysis
		  
		  Dim item As FolderItem
		  If directory <> Nil and directory.Exists Then
		    Dim count As Integer = directory.Count
		    For i As Integer = 1 to count
		      item = directory.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.DisplayName.Left(1) <> "." Then
		          If item.Directory Then
		            If (item.DisplayName <> "Definitions") and (not IsEmptyFolder(item)) Then
		              FillReportFolder(item, row, NumFound, TRT, TR, NumPass, NumFail, NumSkipped, NumOthers, reportProgress )
		            End
		          End
		        End
		      End
		    Next
		    
		    For i As Integer = 1 to count
		      item = directory.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.DisplayName.Left(1) <> "." Then
		          If not(item.Directory)  Then
		            ReportList.InsertRow(row, item.DisplayName, 0)
		            ReportList.RowTag(row) = item
		            Dim t As TextInputStream = TextInputStream.Open(item)
		            if t <> nil then
		              Dim FileCont as string = t.ReadAll(Encodings.UTF8)
		              t.Close
		              
		              if TRT<>nil then
		                TRT.FileContent = FileCont
		                TRT.Parse(TR)  // TR is the number of the place where the information has to be put to
		              end
		            end
		            row = row + 1
		            // open item and read data
		            if reportProgress<>nil then
		              if (NumFound mod 50) = 0 then
		                reportProgress.SetProgress(NumFound)
		              end
		            end
		            NumFound=NumFound+1
		          End
		        End
		      End
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillTestReportHeaderList(FileContent as string)
		  Dim tsb as integer=FileContent.Instr(1,"Teststep")
		  
		  Report_AttributeList.DeleteAllRows
		  
		  if tsb>0 then
		    FileContent=FileContent.Mid(1,tsb-1)
		  end
		  Dim i as integer= 0
		  Dim LineS as string = NthField(FileContent,chr(13),i+1)
		  while not((LineS="") and (i>10)) and (NthField(LineS,chr(9),1).Instr(1,"Teststep")=0)and (NthField(LineS,chr(9),1).Instr(1,"EEPROM Data")=0)
		    Report_AttributeList_SetItem(NthField(LineS,chr(9),1),NthField(LineS,chr(9),2),NthField(LineS,chr(9),3),i)
		    LineS  = NthField(FileContent,chr(13),i+1)
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillTestReportHeaderList(T as TestReportHeader)
		  
		  if T<>nil then
		    Report_AttributeList.DeleteAllRows
		    Dim n as integer =0
		    Report_AttributeList_SetItem("FielName",T.FileName,n)
		    Report_AttributeList_SetItem("SerialNumber",T.SerialNumber,n)
		    Report_AttributeList_SetItem("Barcode",T.Barcode,n)
		    Report_AttributeList_SetItem("Testprogram",T.Testprogram,n)
		    Report_AttributeList_SetItem("Testprogram Version",T.Testprogram_Version,n)
		    Report_AttributeList_SetItem("Teststation",T.Teststation,n)
		    Report_AttributeList_SetItem("Teststation Version",T.Teststation_Version,n)
		    Report_AttributeList_SetItem("Tester",T.Tester,n)
		    Report_AttributeList_SetItem("TestDate",T.TestDate,n)
		    Report_AttributeList_SetItem("Testresult",T.Testresult,n)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Fill_Report_TeststepList(FS as TestReportMatrix, SelectedReport as integer)
		  
		  if FS<>nil then
		    if FS.TS<>nil then
		      if (SelectedReport>0) and (Ubound(FS.TS())>=0) then
		        Report_TeststepList.DeleteAllRows
		        if  (SelectedReport<UBound(FS.TS(0).Values())) then
		          Dim n as integer
		          for n=0 to UBound(FS.TS())-1
		            Report_TeststepList_SetItem(n,SelectedReport, FS.TS(n))
		          next
		          if UserSelectedTeststep<0 then
		            UserSelectedTeststep=0
		          else
		            if UserSelectedTeststep<(UBound(FS.TS())-1) then
		              Report_TeststepList.ListIndex=UserSelectedTeststep
		            else
		              UserSelectedTeststep=Report_TeststepList.ListIndex
		            end
		          end
		          'Histogramm1.SetHistogramm(FS.TS(UserSelectedTeststep).Values(),5,"Histogram "+FS.TRH(SelectedReport).SerialNumber,FS.TS(UserSelectedTeststep).Name,FS.TS(UserSelectedTeststep).Values(SelectedReport))
		          'Histogramm1.SetHistogramm(FS,SelectedReport,UserSelectedTeststep)
		        end
		      end
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Manual_LoadFileStructure()
		  Dim r as integer = 0
		  Dim Indent as integer = 0
		  // load the normal unselected folder structure
		  FolderStructureLoaded=false
		  ReportList.DeleteAllRows
		  Dim folder as FolderItem
		  Dim sNumFound as integer= 0
		  Dim sNumFolder as integer = 0
		  Dim FolderName as string= "Reports"
		  Dim reportProgress As New ProgressWindow("Loading","Loading the file structure",Me.NumberofAllFiles,googles)
		  reportProgress.Show
		  r=0
		  Indent=0
		  folder = GetWorkingFolderItem
		  If (folder<>Nil) and folder.Exists Then
		    folder = folder.Child(FolderName)
		    FillReportFolder(folder,r,Indent,sNumFound,sNumFolder,reportProgress)
		  End
		  reportProgress.Close
		  Me.NumberofAllFiles=sNumFound
		  ReportList.SelectionType=ListBox.SelectionMultiple
		  ReportList.Heading(0)="Report Folder"
		  OverViewReport.Text="Structure for Reports Folder:"+chr(13)
		  OverViewReport.AppendText(str(sNumFolder)+" folders found "+chr(13))
		  OverViewReport.AppendText(str(sNumFound-sNumFolder)+" files found (files in folders with no subfolders not included)"+chr(13))
		  FolderStructureLoaded=true
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Manual_LoadSelection()
		  Dim r,i,n as integer = 0
		  Dim item as FolderItem
		  Dim FilesLoaded as boolean = false
		  Dim sType as string = ""
		  Dim sNumFound as integer=0
		  Dim sNumPass as integer=0
		  Dim sNumFail as integer=0
		  Dim sNumSkipped as integer=0
		  Dim sNotDone as integer = 0
		  Dim sNumOthers as integer=0
		  Dim TR as integer=0
		  
		  Dim reportProgress As New ProgressWindow("Loading","Loading the selected files ",1000,googles)
		  reportProgress.Show
		  
		  // load teststeps into memory
		  UserSelectedReportMatrix=nil
		  TR=1
		  r=0
		  
		  // load all included folder and files
		  While r<ReportList.ListCount
		    item=ReportList.RowTag(r)
		    If item <> Nil and item.Exists Then
		      if ReportList.Selected(r) then
		        If item.DisplayName.Left(r) <> "." Then
		          If item.Directory Then
		            If (item.DisplayName <> "ReportTemplates") and (not IsEmptyFolder(item)) Then
		              // load included files then delete folder
		              ReportList.CellTag(r,0)=99
		              r=r+1
		              FillReportFolder(item, r, sNumFound, UserSelectedReportMatrix, TR, sNumPass, sNumFail, sNumSkipped, sNumOthers, reportProgress)
		              FilesLoaded=true
		            end
		          else
		            ReportList.CellTag(r,0)=0
		            // load directly selected files too
		            Dim t As TextInputStream = TextInputStream.Open(item)
		            if t <> nil then
		              Dim FileCont as string = t.ReadAll(Encodings.UTF8)
		              t.Close
		              if UserSelectedReportMatrix<>nil then
		                UserSelectedReportMatrix.FileContent = FileCont
		                UserSelectedReportMatrix.Parse(TR)  // TR is the number of the place where the information has to be put to
		              end
		            end
		          end
		        end
		      else
		        ReportList.CellTag(r,0)=99
		      end
		    end
		    if FilesLoaded then
		      FilesLoaded=false
		    else
		      r=r+1
		    end
		  wend
		  r=0
		  // remove all unselected rows
		  While r<ReportList.ListCount
		    if ReportList.CellTag(r,0)=99 then
		      ReportList.RemoveRow(r)
		    else
		      r=r+1
		    end
		  wend
		  
		  // determine the right template
		  Dim TempStat() as integer
		  Redim TempStat(ReportTemplateManual.ListCount)
		  for r=0 to ReportList.ListCount-1
		    item=ReportList.RowTag(r)
		    Dim TestTemp as string = NthField(item.DisplayName,"-",3)
		    
		    for i=0 to ReportTemplateManual.ListCount-1
		      if TestTemp.Instr(1,ReportTemplateManual.List(i))>0 then
		        TempStat(i)=TempStat(i)+1
		      end
		    next
		  next
		  
		  n=0
		  for i=1 to ReportTemplateManual.ListCount-1
		    if  TempStat(i)>TempStat(n) then
		      n=i
		    end
		  next
		  ReportTemplateManual.ListIndex=n
		  
		  // now load cleaned selection
		  UserSelectedReportMatrix=nil
		  UserSelectedReportMatrix=new TestReportMatrix("")
		  UserSelectedReportMatrix.open(ReportTemplateManual.RowTag(ReportTemplateManual.ListIndex))
		  TR=1
		  
		  Dim t As TextInputStream
		  for r=0 to ReportList.ListCount-1
		    item=ReportList.RowTag(r)
		    t = TextInputStream.Open(item)
		    if t <> nil then
		      Dim FileCont as string = t.ReadAll(Encodings.UTF8)
		      t.Close
		      if UserSelectedReportMatrix<>nil then
		        UserSelectedReportMatrix.FileContent = FileCont
		        n=TR
		        UserSelectedReportMatrix.Parse(TR)  // TR is the number of the place where the information has to be put to
		        Select case UserSelectedReportMatrix.TRH(n).Testresult
		        case is="Pass"
		          sNumPass=sNumPass+1
		        case is="Fail"
		          sNumFail=sNumFail+1
		        case is="Skipped"
		          sNumSkipped=sNumSkipped+1
		        case is="NotDone"
		          sNotDone=sNotDone+1
		        else
		          sNumOthers=sNumOthers+1
		        end
		      end
		    end
		    
		    
		  next
		  
		  
		  reportProgress.Close
		  
		  ReportList.SelectionType=ListBox.SelectionSingle
		  ReportList.Heading(0)="Report Files selected: "+str(sNumFound)
		  OverViewReport.Text="Overview for selected Reports :"+chr(13)
		  OverViewReport.AppendText("_______________________________________"+chr(13)+chr(13))
		  OverViewReport.AppendText("Selected Type for Display : "+sType+chr(13)+chr(13))
		  OverViewReport.AppendText("Found  "+str(sNumFound))
		  if sNumFound>0 then
		    OverViewReport.AppendText("   number of  Pass :  "+str(sNumPass)+" ( "+Format(100*sNumPass/sNumFound,"###.#")+" %)"+chr(13))
		    OverViewReport.AppendText("   number of  Fail :  "+str(sNumFail)+" ( "+Format(100*sNumFail/sNumFound,"###.#")+" %)"+chr(13))
		    OverViewReport.AppendText("   number of  Skipped :  "+str(sNumSkipped)+" ( "+Format(100*sNumSkipped/sNumFound,"###.#")+" %)"+chr(13))
		    OverViewReport.AppendText("   number of  NotDone :  "+str(sNotDone)+" ( "+Format(100*sNotDone/sNumFound,"###.#")+" %)"+chr(13))
		    OverViewReport.AppendText("   number of  Others :  "+str(sNumOthers)+" ( "+Format(100*sNumOthers/sNumFound,"###.#")+" %)"+chr(13))
		  end
		  UserSelectedReport=1
		  ReportList.ListIndex=0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Redraw_EEPROM_Table()
		  If EEPROMDisplay <> Nil Then
		    // EEPROM has been selected, set it as Standard EEPROM
		    Dim n As Integer = 0
		    For i As Integer = 0 to 31
		      If  i >= EPTab.ListCount Then
		        EPTab.AddRow
		      End
		      EPTab.Cell(i, 0) = Hex(i * 16)
		      EPTab.CellBold(i, 0) = False
		      Select Case EPROMView.Text
		      Case Is = "HEX"
		        For k As Integer = 0 To 15
		          if UBound(EEPROMDisplay.EP())>n then
		            EPTab.Cell(i, k + 1) = StrHex(EEPROMDisplay.EP(n).BY, 2)
		          end
		          EPTab.CellBold(i, k + 1) = False
		          n = n + 1
		        Next
		      Case Is = "NUM"
		        For k As Integer = 0 To 15
		          if UBound(EEPROMDisplay.EP())>n then
		            EPTab.Cell(i, k + 1) = Str(EEPROMDisplay.EP(n).BY)
		          end
		          EPTab.CellBold(i, k + 1) = False
		          n = n + 1
		        Next
		      Case Is = "CHAR"
		        For k As Integer = 0 to 15
		          if UBound(EEPROMDisplay.EP())>n then
		            EPTab.Cell(i, k + 1) = chr(EEPROMDisplay.EP(n).BY)
		          end
		          EPTab.CellBold(i, k + 1) = False
		          n = n + 1
		        Next
		      End
		    Next
		    Dim LowP, HighP,Segm As Integer
		    Segm = val(SegmentSelection.Text) * (EEPROMHighMark-EEPROMLowMark + 1)
		    LowP = EEPROMLowMark + Segm
		    HighP = EEPROMHighMark + Segm
		    If (LowP > 0) and  (HighP >= LowP) Then
		      For n = LowP to HighP
		        EPTab.CellBold((n / 16), (n mod 16)+ 1) = True
		      Next
		    End
		  Else
		    
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Report_AttributeList_SetItem(ItemName as string, ItemValue1 as string, ByRef RowNr as integer)
		  
		  Report_AttributeList_SetItem(ItemName,ItemValue1,"",RowNr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Report_AttributeList_SetItem(ItemName as string, ItemValue1 as string, ItemValue2 as string, ByRef RowNr as integer)
		  
		  Report_AttributeList.AddRow(ItemName)
		  Report_AttributeList.Cell(RowNr,1)=ItemValue1
		  Report_AttributeList.Cell(RowNr,2)=ItemValue2
		  RowNr=RowNr+1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Report_TeststepList_SetItem(RowNr as integer, SelectedReport as integer, T as Teststep)
		  if T<>nil then
		    T.CalcMean
		    Report_TeststepList.AddRow(T.Name)
		    Report_TeststepList.Cell(RowNr,1)=T.Description
		    Report_TeststepList.Cell(RowNr,2)=T.Criteria
		    
		    if (SelectedReport>=0) and (SelectedReport<T.NumberofValues) then
		      if T.TestType=T.ttPassFail then
		        Report_TeststepList.Cell(RowNr,3)=""
		        Report_TeststepList.Cell(RowNr,4)=""
		        Report_TeststepList.Cell(RowNr,7)=""
		        Report_TeststepList.Cell(RowNr,8)=""
		        Report_TeststepList.Cell(RowNr,9)=""
		      else
		        if (T.Results(SelectedReport)<3) then
		          Report_TeststepList.Cell(RowNr,3)=AutoFormat(T.Values(SelectedReport),4)
		          if abs(T.MeanValue)>10e-10 then
		            Report_TeststepList.Cell(RowNr,4)=format(100*(T.Values(SelectedReport)-T.MeanValue)/T.MeanValue,"+###.0")+" %"
		          else
		            Report_TeststepList.Cell(RowNr,4)=""
		          end
		        end
		        Report_TeststepList.Cell(RowNr,7)=AutoFormat(T.MinValue,4)
		        Report_TeststepList.Cell(RowNr,8)=AutoFormat(T.MeanValue,4)
		        Report_TeststepList.Cell(RowNr,9)=AutoFormat(T.MaxValue,4)
		      end
		      
		      Select case T.Results(SelectedReport)
		      case 0
		        Report_TeststepList.Cell(RowNr,5)="Pass"
		      case 1
		        Report_TeststepList.Cell(RowNr,5)="Fail"
		      case 2
		        Report_TeststepList.Cell(RowNr,5)="Skipped"
		      case 3
		        Report_TeststepList.Cell(RowNr,5)="NotDone"
		      else
		        Report_TeststepList.Cell(RowNr,5)=""
		      end
		    else
		      Report_TeststepList.Cell(RowNr,4)="x"
		      Report_TeststepList.Cell(RowNr,5)="x"
		      Report_TeststepList.Cell(RowNr,7)="x"
		      Report_TeststepList.Cell(RowNr,8)="x"
		      Report_TeststepList.Cell(RowNr,9)="x"
		    end
		    
		    if abs(T.NumCorrectValues)>0 then
		      Report_TeststepList.Cell(RowNr,6)=format(100*T.NumFail/(T.NumCorrectValues),"+###.0")+" %"
		    else
		      Report_TeststepList.Cell(RowNr,6)=""
		    end
		    
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveFilters(ActiveSelection as string)
		  
		  CopyFieldsToFilter
		  
		  // load names of last used intrument in file Last_used.txt
		  Dim fileItem As FolderItem = GetWorkingFolderItem
		  If fileItem <> Nil Then
		    fileItem = fileItem.Child("Reports")
		    if CheckFolder(fileItem) then
		      fileItem = fileItem.Child("ReportFilter")
		      if CheckFolder(fileItem) then
		        fileItem = fileItem.Child("ReportFilter.xml")
		        if CheckFile(fileItem) then
		          Dim SaveData As String = ""
		          ReportFilters.TransferToNewForm
		          ReportFilters.Save(SaveData, 0)
		          If  SaveData <> "" And OpenMeasFileForSave(SaveData, fileItem) Then
		            
		          End
		        end
		      end
		    End
		  End
		  
		  if ActiveSelection<>FilterSelection.Text then
		    FillFilterSelection(ActiveSelection)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Search_File(FileList as ListBox, SubFolder as folderItem, byref Type as string, byref Revision as string, byref SerNr as string, byref WorkNr as string, byref Test as string, byref Result as string, CheckDate as boolean, FromDate as date, ToDate as date, byref NumTotal as integer, byref NumFound as integer, TRT as TestReportMatrix, byref TR as integer, byref NumPass as integer, byref NumFail as integer, byref NumSkipped as integer, byref NumOthers as integer, ExcludeU as boolean, ExcludeRepetitions as boolean, sIncFYP as boolean, reportProgress as ProgressWindow, UpperDate as date)
		  Dim NextDate as date = new date
		  NextDate = UpperDate
		  if UpperDate.Month=12 then
		    NextDate.Month = 1
		    NextDate.Year = UpperDate.Year+1
		  else
		    NextDate.Month = UpperDate.Month+1
		  end
		  
		  if SubFolder <> nil and SubFolder.exists then
		    Dim count As Integer = SubFolder.Count
		    For i As Integer = 1 to count
		      Dim item As FolderItem = SubFolder.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.DisplayName.Left(1) <> "." Then
		          If item.Directory Then
		            if Item.DisplayName.Instr("-")>1 then
		              Dim S1,S2 as string
		              Dim AcDate as date = new date
		              S1 = NthField(Item.DisplayName,"-",1)
		              S2 = NthField(Item.DisplayName,"-",2)
		              AcDate.Year = Val(S1)
		              AcDate.Month = Val(S2)-1
		              AcDate.Day=1
		              if AcDate.Year>2012 then
		                UpperDate=AcDate
		              end
		            end
		            Search_File(FileList, Item, Type, Revision, SerNr,WorkNr,Test,Result,CheckDate,FromDate, ToDate, NumTotal,NumFound,TRT, TR, NumPass, NumFail,NumSkipped,NumOthers, ExcludeU, ExcludeRepetitions,sIncFYP,reportProgress,UpperDate)
		          Else
		            'if (Item.ModificationDate<UpperDate) or (Item.ModificationDate>NextDate) then
		            Dim AcDate as date = new date
		            AcDate=UpperDate
		            'AcDate.Month=AcDate.Month-1
		            Item.ModificationDate=AcDate
		            'end
		            Dim vResult as string=item.DisplayName
		            Dim include as boolean = true
		            // first check for multiple runs -----------------------------------
		            if ExcludeRepetitions then
		              Dim MoreDoubles as boolean = true
		              Dim item2 As FolderItem
		              Dim vName2 as string
		              while (i<count) and MoreDoubles
		                item2 = SubFolder.Item(i+1)
		                if (item2<>nil) and Item2.exists then
		                  vName2=Item2.DisplayName
		                  if (NthField(vResult,"-",1)+"-"+NthField(vResult,"-",2)+"-"+NthField(vResult,"-",3)) =(NthField(vName2,"-",1)+"-"+NthField(vName2,"-",2)+"-"+NthField(vName2,"-",3)) then
		                    Dim N1 as integer = val(NthField(vResult,"-",4).Mid(2,2))
		                    Dim N2 as integer = val(NthField(vName2,"-",4).Mid(2,2))
		                    if N2>N1 then
		                      item=item2
		                      vResult=vName2
		                      i=i+1
		                      NumTotal=NumTotal+1
		                    else
		                      MoreDoubles=false
		                    end
		                  else
		                    MoreDoubles=false
		                  end
		                else
		                  MoreDoubles=false
		                end
		              wend
		            end
		            
		            // now check if the file should be included ------------------------------
		            if (Type<>"") then
		              include=(item.DisplayName.Instr(1,Type)>0)
		            end
		            if  include and (SerNr<>"")  then
		              Dim vSerNr as string = NthField(vResult,"-",2)
		              include=  (vSerNr.Instr(1,SerNr)>0)
		            end
		            if include and (Test<>"") then
		              Dim vTest as string = NthField(vResult,"-",3)
		              include= (vTest.Instr(1,Test)>0)
		            end
		            // check if the file name has run information in it (-R1-..-.Rx-) and set the Result field accordingly
		            Dim vRep as string = NthField(vResult,"-",4)
		            // check for First Yield Pass
		            if include and sIncFYP then
		              include=(vResult.Instr(1,"-R1-")>0)
		            end
		            if vRep.Instr(1,"R")>0 then
		              vResult = NthField(vResult,"-",5)
		            else
		              vResult=vRep
		              vRep=""
		            end
		            if include and ExcludeU then
		              include=not(vResult.Instr(1,"U")>0)
		            end
		            if include and not(sIncFYP) and (Result<>"") then
		              include=(vResult.Instr(1,Result)>0)
		            end
		            if  include and ((WorkNr<>"")  or CheckDate or (TRT<>nil) or (Revision<>"")) then
		              //  open the file in order to find get the data inside
		              Dim t As TextInputStream = TextInputStream.Open(item)
		              if t <> nil then
		                Dim FileContent as string = t.ReadAll(Encodings.UTF8)
		                t.Close
		                if  include and (WorkNr<>"")  then
		                  //  look inside the file
		                  if FileContent.Instr(1,"Barcode")>0 then
		                    Dim vWorkNr as string = NthField(FileContent,",",3)
		                    include= vWorkNr.Instr(1,WorkNr)>0
		                  else
		                    include=false
		                  end
		                end
		                if  include and CheckDate then
		                  Dim p1 as integer = FileContent.Instr(1,"TestDate")
		                  p1 = FileContent.Instr(p1,chr(9))+1
		                  Dim p2 as integer = FileContent.Instr(p1,chr(13))-1
		                  Dim vDate as string = FileContent.Mid(p1,p2-p1)
		                  Dim d1 As Date = ConvertDate(vDate,0,"-")
		                  'AddDebugTextCR("vDate: "+vDate+" d1: "+d1.LongDate)
		                  include=(AcDate>=FromDate) and (AcDate<=ToDate)
		                  
		                  'if  include and (FromDate<>"")  then
		                  '//  open the file in order to find out
		                  'Dim d2 as Date = ConvertDate(FromDate,0,".")
		                  'include = d1>=d2
		                  ''AddDebugTextCR("d1: "+d1.LongDate+" d2: "+d2.LongDate)
		                  'end
		                  'if  include and (ToDate<>"")  then
		                  '//  open the file in order to find out
		                  'Dim d3 as Date = ConvertDate(ToDate,0,".")
		                  'include = d1<=d3
		                  ''AddDebugTextCR("d1: "+d1.LongDate+" d3: "+d3.LongDate)
		                  'end
		                end
		                if include and (Revision<>"") then
		                  Dim p1 as integer = FileContent.Instr(1,"ModuleRevision")
		                  p1 = FileContent.Instr(p1,chr(9))+1
		                  Dim p2 as integer = FileContent.Instr(p1,chr(13))
		                  if p2>p1 then
		                    Dim vRev as string = FileContent.Mid(p1,p2-p1)
		                    include=vRev.Instr(1,Revision)>0
		                  end
		                end
		                if include and (TRT<>nil) then
		                  TRT.FileContent=FileContent
		                end
		              end
		            end
		            if include then
		              FileList.InsertRow(NumFound,item.DisplayName)
		              //FileList.AddRow(item.DisplayName)
		              FileList.RowTag(NumFound)=item
		              NumFound=NumFound+1
		              if TRT<>nil then
		                TRT.Parse(TR)  // TR is the number of the place where the information has to be put to
		              end
		              if (vResult.Instr(1,"P")>0) then
		                NumPass=NumPass+1
		              else
		                if (vResult.Instr(1,"F")>0) then
		                  NumFail=NumFail+1
		                else
		                  if (vResult.Instr(1,"S")>0) then
		                    NumSkipped=NumSkipped+1
		                  else
		                    NumOthers=NumOthers+1
		                  end
		                end
		              end
		            end
		            NumTotal=NumTotal+1
		            if (NumTotal mod 50) = 0 then
		              reportProgress.SetProgress(NumTotal)
		            end
		          end
		        end
		      end
		    next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Search_Testreports()
		  Dim folder as FolderItem
		  Dim FolderName as string= "Reports"
		  Dim TR as integer=0
		  
		  ReportList.DeleteAllRows
		  
		  if SelectedFilter<>nil then
		    if SelectedFilter.Folder.GIAS<>"" then
		      folder = GetFolderItem(SelectedFilter.Folder.GIAS)
		    end
		  end
		  if (folder=nil ) or not(Folder.exists) then
		    folder = GetWorkingFolderItem
		    If CheckFolder(folder) Then
		      folder = folder.Child(FolderName)
		    End
		  end
		  
		  If CheckFolder(folder) and (SelectedFilter<>nil) Then
		    
		    CopyFilterToFields
		    
		    if ReportTemplate.Text<>"Automatic" then
		      //prepare for loading reports while scanning
		      UserSelectedReportMatrix=nil
		      UserSelectedReportMatrix=new TestReportMatrix("")
		      UserSelectedReportMatrix.open(ReportTemplate.RowTag(ReportTemplate.ListIndex))
		      TR=1
		    end
		    
		    Dim sType as string = SelectedFilter.Type.GIAS
		    Dim sRevision as string=SelectedFilter.Revision.GIAS
		    Dim sSerNr as String=SerialField.Text
		    Dim sWorkNr as string=WorkorderField.Text
		    Dim sTest as string=SelectedFilter.TestType.GIAS
		    Dim sResult as string = SelectedFilter.Result.GIAS
		    Dim sFromDateS as string =SelectedFilter.DateFrom.GIAS
		    Dim sToDateS as string = SelectedFilter.DateTo.GIAS
		    Dim sFromDate as date = new Date(2012,1,1)
		    Dim sToDate as date = new Date
		    Dim CheckDate as boolean = false
		    if sFromDateS<>"" then
		      sFromDate = ConvertDate(sFromDateS,0,".")
		      CheckDate=true
		    end
		    if sToDateS<>"" then
		      sToDate = ConvertDate(sToDateS,0,".")
		      CheckDate=true
		    end
		    
		    Dim sIncTemp as boolean = not(SelectedFilter.Include_TemporaryFiles.GIAB)
		    Dim sIncRep as boolean = not(SelectedFilter.Include_Repetitions.GIAB)
		    Dim sIncFYP as boolean = (SelectedFilter.Include_FYP.GIAB)
		    Dim sNumTotal as integer=0
		    Dim sNumFound as integer=0
		    Dim sNumPass as integer=0
		    Dim sNumFail as integer=0
		    Dim sNumSkipped as integer=0
		    Dim sNumOthers as integer=0
		    Dim sDate as date = new date
		    sDate.Year=2012
		    sDate.Month=1
		    sDate.Day=1
		    
		    Dim reportProgress As New ProgressWindow("Search","Searching with filter " + SelectedFilter.Name.GIAS,Me.SelectedFilter.TotalNumFiles.GIAI,googles)
		    reportProgress.Show
		    
		    Me.Search_File(ReportList,folder,sType,sRevision,sSerNr,sWorkNr,sTest,sResult,CheckDate,sFromDate,sToDate,sNumTotal,sNumFound, UserSelectedReportMatrix, TR,sNumPass,sNumFail,sNumSkipped,sNumOthers,sIncTemp,sIncRep,sIncFYP,reportProgress,sDate)
		    
		    reportProgress.Close
		    SelectedFilter.TotalNumFiles.SIAI(sNumTotal)
		    SaveFilters(SelectedFilter.Name.GIAS)
		    
		    ReportList.Heading(0)="Report Files ("+str(sNumFound)+" of "+str(sNumTotal)+")"
		    
		    OverViewReport.Text="Overview for selected Reports :"+chr(13)
		    OverViewReport.AppendText("_______________________________________"+chr(13)+chr(13))
		    OverViewReport.AppendText("Applied Filter : "+chr(13))
		    if sSerNr<>"" then
		      OverViewReport.AppendText("Serial Number: "+sSerNr+chr(13))
		    end
		    if sWorkNr<>"" then
		      OverViewReport.AppendText("Workorder Number: "+sWorkNr+chr(13))
		    end
		    if sTest<>"" then
		      OverViewReport.AppendText("Test Type : "+sTest+chr(13))
		    end
		    
		    if sResult<>"" then
		      OverViewReport.AppendText("Result : "+sResult+chr(13))
		    end
		    if CheckDate then
		      OverViewReport.AppendText("Selected Periode : "+str(sFromDate)+" to "+str(sToDate)+chr(13))
		    end
		    OverViewReport.AppendText("------------------------"+chr(13))
		    
		    OverViewReport.AppendText("Selected Type for Display : "+sType+chr(13)+chr(13))
		    
		    OverViewReport.AppendText("Found  "+str(sNumFound)+" of "+str(sNumTotal)+" total"+chr(13))
		    if sNumFound>0 then
		      OverViewReport.AppendText("   number of  Pass :  "+str(sNumPass)+" ( "+Format(100*sNumPass/sNumFound,"###.#")+" %)"+chr(13))
		      OverViewReport.AppendText("   number of  Fail :  "+str(sNumFail)+" ( "+Format(100*sNumFail/sNumFound,"###.#")+" %)"+chr(13))
		      OverViewReport.AppendText("   number of  Skipped :  "+str(sNumSkipped)+" ( "+Format(100*sNumSkipped/sNumFound,"###.#")+" %)"+chr(13))
		      OverViewReport.AppendText("   number of  Others :  "+str(sNumOthers)+" ( "+Format(100*sNumOthers/sNumFound,"###.#")+" %)"+chr(13))
		    end
		    UserSelectedReport=1
		    ReportList.ListIndex=0
		  else
		    ReportList.Heading(0)="No Report Files found"
		    OverViewReport.Text="No Report Files found"+chr(13)
		  end
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetControlsVisibility(ItemIndex as integer)
		  Dim TextVis as boolean=false
		  Dim TeststepVis as boolean=false
		  Dim EEPROMVis as boolean=false
		  Dim EERPOMSecVis as boolean=false
		  Dim OverviewVis as boolean=false
		  
		  Select case ItemIndex
		  case 0
		    // overview data
		    OverviewVis=true
		  case 1
		    // text mode is active
		    TextVis =true
		  case 2
		    // teststep mode is active
		    TeststepVis =true
		  case 3
		    // eeprom mode is active
		    EEPROMVis =true
		  case 4
		    // eeprom sections are shown
		    EERPOMSecVis=true
		  Else
		    
		    
		  End
		  
		  ReportContent.Visible=TextVis
		  
		  Report_AttributeList.Visible=TeststepVis
		  Report_TeststepList.Visible=TeststepVis
		  Histogramm1.Visible=TeststepVis
		  
		  EPTab.Visible=EEPROMVis
		  EPROMView.Visible=EEPROMVis
		  
		  OverViewReport.Visible=OverviewVis
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFilterTo(FilterName as string)
		  if FilterName<>"" then
		    Dim found as Boolean=false
		    Dim i as integer
		    for i=0 to FilterSelection.ListCount-1
		      if FilterName=FilterSelection.List(i) then
		        found=true
		        FilterSelection.ListIndex=i
		      end
		    next
		    if found then
		    else
		      AddNewFilter(false,"Barcode")
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StepSelected(BS as BasicClass)
		  // Nothing to do here?
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private EEPROMDisplay As EEPROM_Class = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EEPROMHighMark As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		EEPROMLowMark As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		FolderStructureLoaded As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		ManualSelected As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mReportTabClass As ReportTabClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberofAllFiles As Integer = 7000
	#tag EndProperty

	#tag Property, Flags = &h0
		ReportFilters As ReportModule.ReportFilterClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectedFilter As ReportModule.ReportFilterClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowFilterTag As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		SingleReportDisplay As boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		SizeStartX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SizeStartY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		UserSelectedReport As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		UserSelectedReportMatrix As TestReportMatrix = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		UserSelectedTeststep As Integer
	#tag EndProperty


	#tag Constant, Name = Highlighted, Type = Color, Dynamic = False, Default = \"&cE9FFB8", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Unused, Type = Color, Dynamic = False, Default = \"&cE8E8E8", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events ShowFilter
	#tag Event
		Sub Action()
		  CheckFold(ShowFilter.Value)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ReportList
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #Pragma Unused column
		  // paint background according report result fail=red, pass=green, skipped=yellow
		  If FilterSelection.Text <> "All" Then
		    if (Row<Me.ListCount)  then
		      Dim ErrState as integer
		      if  (row=Me.ListIndex) then
		        if Me.Selected(row) then
		          ErrState=55
		        else
		          ErrState=56
		        end
		      else
		        Dim vRep as integer = asc(NthField(ReportList.Cell(Row,0),"-",4).Mid(1,1))
		        if vRep=82 then // = R
		          vRep= asc(NthField(ReportList.Cell(Row,0),"-",5).Mid(1,1))
		        end
		        if vRep=80 then // =P
		          ErrState=ErrorCode_Pass
		        else
		          if vRep=70 then //= F
		            ErrState=ErrorCode_Fail
		          else
		            if vRep=83 then //=S
		              ErrState=ErrorCode_Skipped
		            else
		              ErrState=999
		            end
		          end
		        end
		      end
		      Select case ErrState
		      case ErrorCode_Pass
		        g.foreColor=&cA0FFA0
		      case ErrorCode_Fail
		        g.foreColor=&cFFA0A0
		      case ErrorCode_Skipped
		        g.foreColor=&cFFFFA0
		      case 55
		        g.foreColor=&c0080ff
		      case 56
		        g.foreColor=&cd9d9d9
		      else
		        g.foreColor=&cFFFFFF
		      end
		      
		      if ErrState=999 then
		        return false
		      else
		        g.FillRect 0,0,g.width,g.height
		        return true
		      end
		    else
		      return false
		    end
		  End
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  if (ReportList.ListIndex>-1) and (ReportList.ListIndex<ReportList.ListCount) then
		    UserSelectedReport = ReportList.ListIndex+1
		    Select Case FilterSelection.Text
		    case is="Choose a filter"
		      
		      'case is="Manual"
		      'if ManualSelected then
		      'else
		      'end
		    case is="Current Test Run"
		      
		    case is="Barcode"
		      
		    else
		      
		      // load the test report into the ReportContent text area
		      Dim F as folderItem = ReportList.RowTag(UserSelectedReport-1)
		      Dim S as string = ""
		      if (F<>nil) and F.exists and not(f.Directory) then
		        Dim t As TextInputStream = TextInputStream.Open(F)
		        if t <> nil then
		          S= t.ReadAll(Encodings.ASCII)
		          S=S.ReplaceAll(NL,CR)
		          t.Close
		          ReportContent.text = S
		          // load EEPROM into EPTab
		          S=ReportContent.text
		          FillTestReportHeaderList(S)
		          Dim i as integer = S.Instr(1,"EEPROM data")
		          EEPROMDisplay.Erease(0)
		          if i>0 then
		            S=S.Mid(i+11)
		            EEPROMDisplay.Fill_Line(S )
		          end
		          Redraw_EEPROM_Table
		        end
		      end
		      
		      // display the Test Report
		      if FilterSelection.Text="Manual" then
		        Dim i as integer
		        // set the right template
		        Dim TestTemp as string = NthField(F.DisplayName,"-",3)
		        for i=0 to ReportTemplateManual.ListCount-1
		          if TestTemp.Instr(1,ReportTemplateManual.List(i))>0 then
		            ReportTemplateManual.ListINdex=i
		          end
		        next
		        
		        if (UserSelectedReportMatrix<>nil) and UserSelectedReportMatrix.ParsedOk then
		          Fill_Report_TeststepList(UserSelectedReportMatrix,UserSelectedReport)
		        end
		      else
		        if ReportTemplate.Text<>"Automatic" then
		          if UserSelectedReportMatrix.ParsedOk then
		            Fill_Report_TeststepList(UserSelectedReportMatrix,UserSelectedReport)
		          end
		        end
		      end
		    end
		  else
		    
		  end
		  Me.Refresh
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  if FolderStructureLoaded then
		    Dim folder as FolderItem = Me.RowTag(row)
		    If folder <> Nil Then
		      Dim ind As Integer = ReportList.CellTag(row,0)+1
		      row =row+1
		      FillReportFolder(folder, row, ind)
		    End
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TypeField
	#tag Event
		Sub TextChange()
		  If TypeField.Text="" then
		    TypeField.BackColor=Unused
		  else
		    TypeField.BackColor=Highlighted
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events BarcodeField
	#tag Event
		Sub TextChange()
		  If BarcodeField.Text="" then
		    BarcodeField.BackColor=Unused
		  else
		    Dim S,S2 as string
		    Dim k1,k2,k3,m1 as integer
		    Dim ModulNamePos, OrderingPos, RevisionPos, ReservedPos as integer
		    
		    BarcodeField.BackColor=Highlighted
		    
		    S=BarcodeField.Text
		    
		    k1=S.InStr(0,",")
		    k2=0
		    k3=0
		    if k1>0 then
		      k2=S.InStr(k1+1,",")
		      if k2>0 then
		        k3=S.InStr(K2+1,",")
		      end
		    else
		      k1=38
		      k2=51
		    end
		    ModulNamePos=13
		    OrderingPos=k1-17
		    RevisionPos=k1-2
		    ReservedPos=k1+1
		    
		    m1=S.InStr(1,chr(&h7C))
		    
		    if m1>0 then
		      S2=S.Mid(m1+1)
		      S=S.Left(m1-1)
		    end
		    
		    SerialField.Text=S.Left(12)
		    
		    WorkorderField.Text=""
		    
		    ArticleField.Text=S.Mid(OrderingPos,15)
		    
		    SetFilterTo("Barcode")
		    
		    'Search_Testreports
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ArticleField
	#tag Event
		Sub TextChange()
		  If ArticleField.Text="" then
		    ArticleField.BackColor=Unused
		  else
		    ArticleField.BackColor=Highlighted
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SerialField
	#tag Event
		Sub TextChange()
		  If SerialField.Text="" then
		    SerialField.BackColor=Unused
		  else
		    SerialField.BackColor=Highlighted
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResultField
	#tag Event
		Sub TextChange()
		  If ResultField.Text="" then
		    ResultField.BackColor=Unused
		  else
		    ResultField.BackColor=Highlighted
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TestField
	#tag Event
		Sub TextChange()
		  If TestField.Text="" then
		    TestField.BackColor=Unused
		  else
		    TestField.BackColor=Highlighted
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NameField
	#tag Event
		Sub TextChange()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DateFromField
	#tag Event
		Sub TextChange()
		  If DateFromField.Text="" then
		    DateFromField.BackColor=Unused
		  else
		    DateFromField.BackColor=Highlighted
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DateToField
	#tag Event
		Sub TextChange()
		  If DateToField.Text="" then
		    DateToField.BackColor=Unused
		  else
		    DateToField.BackColor=Highlighted
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButtonDelete
	#tag Event
		Sub Action()
		  
		  if SelectedFilter<>nil then
		    DeleteBasicStepClass(SelectedFilter)
		  end
		  SelectedFilter=nil
		  ClearFilterFields
		  SaveFilters("")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButtonCopy
	#tag Event
		Sub Action()
		  AddNewFilter(true,"")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButtonSave
	#tag Event
		Sub Action()
		  SaveFilters (NameField.Text)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButtonAdd
	#tag Event
		Sub Action()
		  AddNewFilter(false,"")
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButtonApply
	#tag Event
		Sub Action()
		  SaveFilters (NameField.Text)
		  
		  Search_Testreports
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events WorkorderField
	#tag Event
		Sub TextChange()
		  If WorkorderField.Text="" then
		    WorkorderField.BackColor=Unused
		  else
		    WorkorderField.BackColor=Highlighted
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FolderField
	#tag Event
		Sub TextChange()
		  If FolderField.Text="" then
		    FolderField.BackColor=Unused
		  else
		    FolderField.BackColor=Highlighted
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FolderDialog
	#tag Event
		Sub Action()
		  if SelectedFilter<>nil then
		    Dim f As FolderItem = Nil
		    If SelectedFilter.Folder.IsFolder Then
		      Dim dlg As New SelectFolderDialog
		      dlg.Title =  SelectedFilter.Folder.GIAS + "..."
		      dlg.ActionButtonCaption = "Select"
		      dlg.PromptText = "Please Select " + SelectedFilter.Folder.Name
		      Dim path As String = FolderField.Text
		      If path = "" Then
		        path = SelectedFilter.Folder.GIAS
		      End
		      f = GetFolderItem(path)
		      if f <> Nil And f.Exists Then
		        dlg.InitialDirectory = f
		      Else
		        dlg.InitialDirectory = GetFolderItem("")
		      End
		      f= dlg.ShowModal
		    Else
		      f = GetOpenFolderItem(FileTypes1.SpecialFolder+FileTypes1.SpecialAny)
		    End
		    if f <> Nil And f.Exists Then
		      FolderField.Text = f.NativePath
		      SelectedFilter.Folder.SIAS( f.NativePath)
		    End
		  end
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events RevisionField
	#tag Event
		Sub TextChange()
		  If RevisionField.Text="" then
		    RevisionField.BackColor=Unused
		  else
		    RevisionField.BackColor=Highlighted
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Report_AttributeList
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #Pragma Unused column
		  // paint background according report result fail=red, pass=green, skipped=yellow
		  
		  if (Row<Report_AttributeList.ListCount)  then
		    
		    if InStr(1,Report_AttributeList.Cell(Row,0),"TestResult")>0 then
		      if InStr(1,Report_AttributeList.Cell(Row,1),"Pass")>0 then
		        g.foreColor=&cA0FFA0
		      else
		        if InStr(1,Report_AttributeList.Cell(Row,1),"Fail")>0 then
		          g.foreColor=&cFFA0A0
		        else
		          if InStr(1,Report_AttributeList.Cell(Row,1),"Skipped")>0 then
		            g.foreColor=&cFFFFA0
		          else
		            g.foreColor=&cFFFFFF
		          end
		        end
		      end
		      g.FillRect 0,0,g.width,g.height
		      return true
		    else
		      return true
		    end
		  else
		    return true
		  end
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Report_TeststepList
	#tag Event
		Sub Change()
		  //Get the right number of
		  if Me.ListCount>1 then
		    UserSelectedTeststep=Me.ListIndex
		  end
		  if UserSelectedReportMatrix<>nil then
		    if  (UserSelectedTeststep>=0) and (UserSelectedTeststep<=UBound(UserSelectedReportMatrix.TS())) then
		      if (UserSelectedReport>=0) and (UserSelectedReport<=UBound(UserSelectedReportMatrix.TRH()))  then
		        'Histogramm1.SetHistogramm(UserSelectedReportMatrix.TS(UserSelectedTeststep).Values(),5,"Histogram "+UserSelectedReportMatrix.TRH(UserSelectedReport).SerialNumber,UserSelectedReportMatrix.TS(UserSelectedTeststep).Name,UserSelectedReportMatrix.TS(UserSelectedTeststep).Values(UserSelectedReport))
		        Histogramm1.SetHistogramm(UserSelectedReportMatrix,UserSelectedReport,UserSelectedTeststep)
		      end
		    end
		  end
		  'ReportList.ListIndex=UserSelectedReport-1
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  #Pragma Unused column
		  if  (row=Me.ListIndex) then
		    if Me.Selected(row) then
		      g.foreColor=&c0080ff
		      g.FillRect 0,0,g.width,g.height
		    else
		      g.foreColor=&cd9d9d9
		      g.FillRect 0,0,g.width,g.height
		    end
		    Return true
		  else
		    Return true
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ViewSelection
	#tag Event
		Sub Action(itemIndex as integer)
		  SetControlsVisibility(ItemIndex)
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EPTab
	#tag Event
		Sub Open()
		  Me.Heading(0) = ""
		  for i As Integer = 1 to 16
		    Me.HeaderType(i - 1) = Listbox.HeaderTypes.NotSortable
		    Me.Heading(i) = StrHex(i - 1, 2)
		    Me.ColumnType(i) = ListBox.TypeEditable
		  next
		End Sub
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  If (Row < Me.ListCount) And (Column < Me.ColumnCount) Then
		    If Me.CellBold(Row, Column) Then
		      If Me.CellItalic(Row,Column) Then
		        g.foreColor = &cA0FFA0
		      Else
		        g.foreColor = &cFFA0A0
		      End
		      g.FillRect(0, 0, g.width, g.height)
		      Return True
		    end
		  Else
		    Return False
		  End
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Dim n As Integer = row * 16 + column - 1
		  Dim S As String = EPTab.Cell(row, column)
		  If EEPROMDisplay <> Nil Then
		    Dim i As Integer = 0
		    Select Case EPROMView.Text
		    Case Is = "HEX"
		      i = ValHex(S)
		    Case Is = "NUM"
		      i = Val(S)
		    Case Is = "CHAR"
		      i = Asc(Right(S,1))
		    End
		    EEPROMDisplay.EP(n).BY = i
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EPROMView
	#tag Event
		Sub Change()
		  Redraw_EEPROM_Table
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SegmentSelection
	#tag Event
		Sub Change()
		  Redraw_EEPROM_Table
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PageSeparator
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  // follow with the middle of the PageSeparator to the cursor
		  PageSeparator.Left=SizeStartX+X-PageSeparator.Width/2
		  PageSeparator.Top=SizeStartY+Y-PageSeparator.Height/2
		  SizeStartX=PageSeparator.Left
		  SizeStartY=PageSeparator.Top
		  
		  
		  PageSeparator.MouseCursor=System.Cursors.SplitterEastWest
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  PageSeparator.MouseCursor=System.Cursors.ArrowAllDirections
		  
		  SizeStartX=PageSeparator.Left
		  SizeStartY=PageSeparator.Top
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  
		  
		  PageSeparator.Left=SizeStartX+X-PageSeparator.Width/2
		  PageSeparator.Top=SizeStartY+Y-PageSeparator.Height/2
		  SizeStartX=PageSeparator.Left
		  SizeStartY=PageSeparator.Top
		  
		  AdjustControlSizes
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FilterSelection
	#tag Event
		Sub Change()
		  // new filter has been Chosen
		  // unfold the filter definition
		  if not(FilterSelection.Text="Barcode") then
		    BarcodeField.Text=""
		    SerialField.Text=""
		    WorkorderField.Text=""
		  end
		  ReportList.SelectionType=ListBox.SelectionSingle
		  ReportContent.Text=""
		  ManualSelect.Visible=false
		  ManualUnselect.Visible=false
		  ReportTemplateManual.Visible=false
		  
		  Select Case FilterSelection.Text
		  case is="Choose a filter"
		    ShowFilter.Value=false
		    CheckFold(ShowFilter.Value)
		    ShowFilter.Enabled=true
		    ClearLists
		  case is="Manual"
		    ShowFilter.Value=false
		    CheckFold(ShowFilter.Value)
		    ShowFilter.Enabled=false
		    ManualSelect.Visible=true
		    ManualUnselect.Visible=true
		    ReportTemplateManual.Visible=true
		    ManualSelected=false
		    ManualSelect.Enabled=not(ManualSelected)
		    ManualUnselect.Enabled=ManualSelected
		    ClearLists
		    Manual_LoadFileStructure
		  case is="Current Test Run"
		    ShowFilter.Value=false
		    CheckFold(ShowFilter.Value)
		    ShowFilter.Enabled=false
		  case is="Barcode"
		    ShowFilter.Value=true
		    CheckFold(ShowFilter.Value)
		    ShowFilter.Enabled=true
		    ClearLists
		  else
		    ShowFilter.Enabled=true
		    Dim BS As BasicClass
		    BS=ReportFilters.FirstSubStep
		    while BS<>nil
		      if  FilterSelection.Text= BS.Name.GIAS then
		        SelectedFilter=ReportModule.ReportFilterClass(BS)
		        CopyFilterToFields
		      end
		      BS=BS.NextStep
		    wend
		    if ShowFilter.Value then
		    else
		      Search_Testreports
		    end
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ManualSelect
	#tag Event
		Sub Action()
		  ManualSelected=true
		  ManualSelect.Enabled=not(ManualSelected)
		  ManualUnselect.Enabled=ManualSelected
		  Manual_LoadSelection
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ManualUnselect
	#tag Event
		Sub Action()
		  ManualSelected=false
		  ManualSelect.Enabled=not(ManualSelected)
		  ManualUnselect.Enabled=ManualSelected
		  Manual_LoadFileStructure
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
		Name="EEPROMHighMark"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EEPROMLowMark"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
		Name="FolderStructureLoaded"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="boolean"
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
		Name="ManualSelected"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="boolean"
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
		Name="NumberofAllFiles"
		Visible=false
		Group="Behavior"
		InitialValue="7000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ShowFilterTag"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SingleReportDisplay"
		Visible=false
		Group="Behavior"
		InitialValue="true"
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SizeStartX"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SizeStartY"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
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
		Name="UserSelectedReport"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="UserSelectedTeststep"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
