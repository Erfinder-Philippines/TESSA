#tag Window
Begin ContainerControl PIIOXCOMTabContainer Implements TabInterface
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
   Height          =   662
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
   Transparent     =   True
   Visible         =   True
   Width           =   810
   Begin TextArea COM_Term_Window
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
      Height          =   165
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   644
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   -379
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   182
   End
   Begin PushButton Update_COM_Terminal
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "update"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   468
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
      Top             =   -390
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label Label2
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -239
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
      Text            =   "Command"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   -289
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   51
   End
   Begin Listbox NetworkCards
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   4
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   3
      GridLinesVerticalStyle=   2
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   146
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "IP Address	Name"
      Italic          =   False
      Left            =   292
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -349
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   249
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton Connect_Button
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Connect"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -239
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -394
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton Send
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Send"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   207
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -290
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   56
   End
   Begin TextField IP_Connected
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
      Left            =   -173
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
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
      Top             =   -357
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   132
   End
   Begin TextField IP_Port
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
      Left            =   2
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
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
      Top             =   -357
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   65
   End
   Begin TextField IP_Command
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
      Height          =   63
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   -166
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   -291
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   364
   End
   Begin Label Label10
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   18
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -249
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   31
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "IP-Address"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   -354
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   64
   End
   Begin PopupMenu CommandLIst
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
      InitialValue    =   "GEV\n$601476990902RDA,\n$601476990902RBE,\n$601476990902REE,\n$601476990902WDA,\n$601476990902WBE,\n$601476990902WEE,"
      Italic          =   False
      Left            =   2
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   45
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -324
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   157
   End
   Begin CheckBox WithCR
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "CR"
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
      Left            =   -160
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      State           =   1
      TabIndex        =   47
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -323
      Transparent     =   False
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   47
   End
   Begin CheckBox WithLF
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "LF"
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
      Left            =   -198
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   48
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -323
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   37
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
      Left            =   -229
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   49
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Add"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   -323
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   38
   End
   Begin Rectangle Rectangle1
      AllowAutoDeactivate=   True
      BorderThickness =   1.0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFB010600
      Height          =   25
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   -127
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   50
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   -394
      TopLeftColor    =   &c00000000
      Transparent     =   False
      Visible         =   True
      Width           =   155
      Begin Label Label11
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "Rectangle1"
         Italic          =   False
         Left            =   -97
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
         Text            =   "Disconnected"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   -394
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   100
      End
   End
   Begin Label Label4
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   14
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   -29
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   51
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Port"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   -352
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   19
   End
   Begin AutoDiscovery AutoDiscoveryConn
      BroadcastAddress=   ""
      Handle          =   0
      Index           =   -2147483648
      IsConnected     =   False
      LocalAddress    =   ""
      LockedInPosition=   False
      PacketsAvailable=   0
      PacketsLeftToSend=   0
      Port            =   0
      RouterHops      =   32
      Scope           =   0
      SendToSelf      =   False
      TabPanelIndex   =   0
   End
   Begin PushButton btnRefreshNetwork
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   586
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   52
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu pmNetworkInterfaces
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
      Left            =   670
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   53
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin PushButton btnClearDevices
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Clear"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   710
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   54
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   44
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnSearchDevices
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Search"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   586
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   55
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   44
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin Listbox lbDiscoveredDevices
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   3
      ColumnWidths    =   "25, 100,120"
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
      Height          =   120
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "#	Address	Serial"
      Italic          =   False
      Left            =   586
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   56
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   68
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextField tfAddress
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
      Hint            =   "192.168.1.XX"
      Index           =   -2147483648
      Italic          =   False
      Left            =   586
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   57
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   191
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   204
   End
   Begin PushButton btnConnect
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Connect"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   689
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   58
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   214
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   101
   End
   Begin TextField tfPort
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
      Hint            =   "6869"
      Index           =   -2147483648
      Italic          =   False
      Left            =   586
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   59
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   2
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   214
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   100
   End
   Begin TextArea taCommsData
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
      Height          =   556
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
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
      TabIndex        =   60
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   86
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   1
      ValidationMask  =   ""
      Visible         =   True
      Width           =   554
   End
   Begin ComboBox cbCommand
      AllowAutoComplete=   False
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Hint            =   ""
      Index           =   -2147483648
      InitialValue    =   "A,0\nA,?\nS,0\nS,?\nP,0\nP,?\nC,?\nC,0\nX,0\nE,0\nE,?\nM,0\nM,?\n*IDN?\n*RST\n*IDN=M0\n*IDN?M0\n*Debug?"
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   61
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   39
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label lblCommand
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   62
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Command:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin ComboBox cbBus
      AllowAutoComplete=   False
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Hint            =   ""
      Index           =   -2147483648
      InitialValue    =   "0\n1\n2\n3\n4\n5\n6\n7"
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   63
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   39
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin Label lblBus
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
      Italic          =   False
      Left            =   101
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   64
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Bus:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin ComboBox cbModule
      AllowAutoComplete=   False
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Hint            =   ""
      Index           =   -2147483648
      InitialValue    =   "0\n1\n2\n3\n4\n5\n6\n7"
      Italic          =   False
      Left            =   152
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   65
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   39
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin Label lblModule
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
      Left            =   152
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   66
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Module:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin ComboBox cbDeviceAddress
      AllowAutoComplete=   False
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Hint            =   ""
      Index           =   -2147483648
      InitialValue    =   "0\n1\n2\n3\n4\n5\n6\n7"
      Italic          =   False
      Left            =   203
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   67
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   39
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin Label lblDevice
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
      Left            =   203
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   68
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Device:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   50
   End
   Begin ComboBox cbModuleType
      AllowAutoComplete=   False
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Hint            =   ""
      Index           =   -2147483648
      InitialValue    =   "AIN14\nREL01\nREL81\nSTEP01\nSTEP02\nSAGB"
      Italic          =   False
      Left            =   254
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   69
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   -50
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   75
   End
   Begin Label lblModuleType
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
      Left            =   254
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   70
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "I2C Add.:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin PushButton btnClear
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Clear"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   494
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   71
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   39
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TextField tfParamsField
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
      Left            =   330
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   72
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   38
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   161
   End
   Begin Label lblParams
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
      Left            =   330
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   73
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Parameter:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   70
   End
   Begin TextField tfI2CAddress
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
      Left            =   254
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   74
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   38
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   75
   End
   Begin PushButton btnSendCmd
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Send"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   494
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   75
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   62
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PopupMenu pmSavedCmd
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
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   76
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   63
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   135
   End
   Begin PushButton btnSaveCmd
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save Cmd."
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   249
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   77
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   63
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton btnManageCmd
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Manage Cmd."
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   157
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   78
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   63
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   90
   End
   Begin TextField tfCommandField
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
      Left            =   330
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   79
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "A000,0,"
      TextAlignment   =   1
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   62
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   88
   End
   Begin Timer tmrStartAutoDiscover
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   2000
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Timer tmrParseData
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   150
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin Rectangle rectConnStatus
      AllowAutoDeactivate=   True
      BorderThickness =   1.0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFF000000
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   586
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   80
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   240
      TopLeftColor    =   &c00000000
      Transparent     =   False
      Visible         =   True
      Width           =   204
      Begin Label lblConnectionStatus
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
         InitialParent   =   "rectConnStatus"
         Italic          =   False
         Left            =   593
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
         Text            =   "Disconnected"
         TextAlignment   =   2
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   240
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
   End
   Begin GroupBox gbPIIOXSysInfo
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "PIIOX System Information:"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   237
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   586
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   81
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   264
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
      Begin PopupMenu pmPIIOXSysInfo
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
         InitialParent   =   "gbPIIOXSysInfo"
         InitialValue    =   ""
         Italic          =   False
         Left            =   673
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         SelectedRowIndex=   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   284
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   113
      End
      Begin PushButton btnRefresh
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Refresh"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   591
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   6
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   284
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin TextField tfType
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   653
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
         Text            =   ""
         TextAlignment   =   1
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   310
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   133
      End
      Begin Label lblType
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   591
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
         Text            =   "Type:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   311
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   55
      End
      Begin Label lblVersion
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   591
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
         Text            =   "Version:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   334
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   55
      End
      Begin TextField tfVersion
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   653
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   1
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   333
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   133
      End
      Begin Label lblName
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   591
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Name:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   357
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   55
      End
      Begin TextField tfName
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   653
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   1
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   356
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   133
      End
      Begin Label lblSerialNo
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   591
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Serial #:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   380
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   55
      End
      Begin TextField tfSerialNo
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   653
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   1
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   379
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   133
      End
      Begin Label lblQC
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   591
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
         Text            =   "QC:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   403
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   55
      End
      Begin TextField tfQC
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   653
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   1
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   402
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   133
      End
      Begin Label lblTestNo
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   591
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
         Text            =   "Test #:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   426
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   55
      End
      Begin TextField tfTestNo
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   653
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MaximumCharactersAllowed=   0
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   13
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextAlignment   =   1
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   425
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   133
      End
      Begin Label lblDate
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   591
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
         Text            =   "Date:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   449
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   55
      End
      Begin TextField tfDate
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
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   653
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
         TextAlignment   =   1
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   448
         Transparent     =   False
         Underline       =   False
         ValidationMask  =   ""
         Visible         =   True
         Width           =   133
      End
      Begin PushButton btnSetSysData
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Reconfigure"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "gbPIIOXSysInfo"
         Italic          =   False
         Left            =   593
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   6
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   474
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   190
      End
   End
   Begin GroupBox gbPIIOXUpdater
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "PIIOX Updater:"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   140
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   586
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   84
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   502
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   204
      Begin Label lblPIIOXUpdateFile
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
         InitialParent   =   "gbPIIOXUpdater"
         Italic          =   False
         Left            =   593
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Path:"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   522
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   35
      End
      Begin TextArea taBrowsePIIOXFile
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
         Height          =   66
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "gbPIIOXUpdater"
         Italic          =   False
         Left            =   630
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
         TabIndex        =   20
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Click here to browse..."
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   522
         Transparent     =   False
         Underline       =   False
         UnicodeMode     =   1
         ValidationMask  =   ""
         Visible         =   True
         Width           =   153
      End
      Begin CheckBox cbPIIOXIncludeLibs
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   "Include Libs"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "gbPIIOXUpdater"
         Italic          =   False
         Left            =   682
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   21
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   589
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         VisualState     =   0
         Width           =   101
      End
      Begin PushButton btnPIIOXUpdate
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Update PIIOX"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "gbPIIOXUpdater"
         Italic          =   False
         Left            =   593
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   6
         Scope           =   0
         TabIndex        =   22
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   613
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   95
      End
      Begin PushButton btnPIIOXUpdateClear
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Clear"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   22
         Index           =   -2147483648
         InitialParent   =   "gbPIIOXUpdater"
         Italic          =   False
         Left            =   690
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   6
         Scope           =   0
         TabIndex        =   23
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   613
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   95
      End
   End
   Begin PopupMenu pmReturnTypes
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
      InitialValue    =   "None\nCR\nLF\nCRLF"
      Italic          =   False
      Left            =   420
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   85
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   63
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   71
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ApplyToResource()
		  // Apply changes from PIIOX to Resource tab
		  if TCP_Resource <> Nil then
		    TCP_Resource.IP_Address.SIAS(tfAddress.Text)
		    TCP_Resource.IP_Port.SIAS(tfPort.Text)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return  New PIIOXCOMTabContainer(Self.mPIIOXCOMTabClass)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CommandExecute(command As String)
		  // Trim for whitespaces and send command
		  
		  command = command.Trim
		  
		  If TCP_Resource <> Nil AND TCP_Resource.connected.GIAB Then
		    tmrParseData.Enabled = True
		    TCP_Resource.Command.SIAS(command)
		    TCP_Resource.Send(TCP_Resource.Command.GIAS)
		  else
		    MessageBox("Please connect to device first.")
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mPIIOXCOMTabClass = PIIOXCOMTabClass(ParentTabClass)
		  
		  btnRefreshNetwork.Press
		  tmrParseData.Enabled = False
		  
		  // AutoDiscovery
		  tmrStartAutoDiscover.Enabled = False
		  AutoDiscoveryConn.Bind(9696)
		  if AutoDiscoveryConn.IsConnected then
		    AutoDiscoveryConn.Register("PIIOX")
		    AutoDiscoveryConn.UpdateMemberList
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_COMs()
		  // this routine initializes all definied and connected IEDs
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadXML()
		  Var f As FolderItem = App.GetConfigFolderItem(False)
		  
		  if NOT f.Exists then
		    f.CreateFolder
		  end if
		  
		  if f.IsFolder then
		    f = f.Child("commands.xml")
		  end if
		  
		  if f.Exists then
		    pmSavedCmd.RemoveAllRows
		    Var reader As New XmlReadr
		    reader.menu = pmSavedCmd
		    reader.type = 1
		    reader.Parse(f)
		    
		    MainWindow.commandsFile = f
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MergeCommand()
		  // Merge options and values to one textfield
		  
		  Var command As String = cbCommand.Text.Left(1)
		  Var type As String = cbCommand.Text.Right(1)
		  Var address As String = cbBus.Text + cbModule.Text + cbDeviceAddress.Text
		  
		  if command = "*" then
		    command = cbCommand.Text
		  else
		    if command <> "M" then
		      address = address + tfI2CAddress.Text
		    end if
		    
		    if command.Trim.IsEmpty then
		      command = tfParamsField.Text
		    else
		      if command = "M" then
		        command = command + address + "," + type + "," + cbModuleType.Text + "," + tfParamsField.Text
		      else
		        command = command + address + "," + type + "," + tfParamsField.Text
		      end if
		    end if
		  end if
		  
		  tfCommandField.Text = command
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PIIOXData(data As String)
		  data = data.Trim
		  
		  taCommsData.AddText(data + CHR(13))
		  
		  if data.Middle(data.Length, 1) = ">" then
		    data = data.Middle(1, data.Length - 1)
		  end if
		  
		  if CatchData then
		    If data.IndexOf("DebugInfo") > 0 Then
		      Return
		    end if
		    
		    pmPIIOXSysInfo.RemoveAllRows
		    pmPIIOXSysInfo.AddRow("Software")
		    pmPIIOXSysInfo.AddRow("PIIOX")
		    pmPIIOXSysInfo.AddRow("BUS 01")
		    pmPIIOXSysInfo.RowTagAt(0) = data.NthField(CHR(10), 1)
		    pmPIIOXSysInfo.RowTagAt(1) = data.NthField(CHR(10), 2)
		    pmPIIOXSysInfo.RowTagAt(2) = data.NthField(CHR(10), 3)
		    
		    For i As Integer = 1 To 7
		      pmPIIOXSysInfo.AddRow("Module " + i.ToString)
		      pmPIIOXSysInfo.RowTagAt(pmPIIOXSysInfo.LastAddedRowIndex) = data.NthField(CHR(10), 3 + i)
		    Next
		    
		    Select Case CatchType
		    Case -1
		      pmPIIOXSysInfo.SelectedRowIndex = 0
		    Case 0
		      // Software
		      data = data.Middle(data.InStr(1, ":") + 1, data.Length)
		      pmPIIOXSysInfo.SelectedRowIndex = CatchType
		    Case 1
		      // System
		      data = data.NthField(":", 2)
		      pmPIIOXSysInfo.SelectedRowIndex = CatchType
		    Case 2
		      // Bus
		    Else
		      data = data.NthField(":", 2)
		    End Select
		    
		    tfType.Text = data.NthField(",", 1)
		    tfName.Text = data.NthField(",", 2)
		    tfVersion.Text = data.NthField(",", 3)
		    tfDate.Text = data.NthField(",", 4)
		    tfSerialNo.Text = data.NthField(",", 5)
		    tfTestNo.Text = data.NthField(",", 6)
		    tfQC.Text = data.NthField(",", 7)
		    
		    CatchType = -1
		    CatchData = False
		    
		    //TCP_Resource.ComLog.SIAS(data)
		    //Local_TCP.PIIOXResponse = ""
		  end if
		  
		  tmrParseData.Enabled = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendLine()
		  if Local_TCP<>nil then
		    if Local_TCP.IsConnected then
		      Dim S as string = IP_Command.Text
		      if  WithLF.Value then
		        S=S+chr(10)
		      end
		      if  WithCR.Value then
		        S=S+chr(13)
		      end
		      
		      COM_Term_Window.AppendText(S+chr(13))
		      Local_TCP.Write(S)
		      Local_TCP.Flush
		    else
		      COM_Term_Window.AppendText("no IP-connection, connect first"+chr(13))
		    end
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ServerCheck()
		  // Check textfields before connect/disconnect
		  
		  if btnConnect.Caption = "Connect" then
		    Var address As String = tfAddress.Text.Trim
		    Var port As String = tfPort.Text.Trim
		    
		    if address.IsEmpty OR port.IsEmpty then
		      taCommsData.AddText("Address or Port must not be empty.")
		    else
		      ServerConnect(address, Val(port))
		    end if
		  else
		    if TCP_Resource <> Nil AND TCP_Resource.connected.GIAB then
		      TCP_Resource.Disconnect
		      taCommsData.AddText("Device " + tfAddress.Text + ":" + tfPort.Text + " disconnected.")
		    end if
		    
		    btnConnect.Caption = "Connect"
		    tmrParseData.Enabled = False
		    
		    lblConnectionStatus.Text = "Disconnected"
		    rectConnStatus.FillColor = RGB(255, 0, 0)
		    
		    pmPIIOXSysInfo.RemoveAllRows
		    
		    tfType.Text = ""
		    tfName.Text = ""
		    tfVersion.Text = ""
		    tfDate.Text = ""
		    tfSerialNo.Text = ""
		    tfTestNo.Text = ""
		    tfQC.Text = ""
		    
		    btnSetSysData.Caption = "Reconfigure"
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ServerConnect(address As String, port As Integer)
		  ApplyToResource
		  if TCP_Resource <> Nil then
		    TCP_Resource.Connect(2, 100)
		    taCommsData.AddText(TCP_Resource.ComLog.GIAS)
		    if TCP_Resource.Connected.GIAB then
		      btnConnect.Caption = "Disconnect"
		      lblConnectionStatus.Text = "Connected"
		      rectConnStatus.FillColor = RGB(0, 255, 0)
		      
		      CatchType = -1
		      CatchData = True
		      tmrParseData.Enabled = True
		      
		      CommandExecute("*IDN?")
		    else
		      btnConnect.Caption = "Connect"
		      lblConnectionStatus.Text = "Disconnected"
		      rectConnStatus.FillColor = RGB(255, 0, 0)
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepSelected(BS as BasicClass)
		  // Part of the TabInterface interface.
		  
		  if BS <> Nil then
		    if BS IsA TCP_ResourceClass then
		      // does not load rowtag in constructor, so thats why the loadxml method is here
		      LoadXML
		      
		      TCP_Resource = TCP_ResourceClass(BS)
		      tfAddress.Text = TCP_Resource.IP_Address.GIAS
		      tfPort.Text = TCP_Resource.IP_Port.GIAS
		      taCommsData.Text = TCP_Resource.ComLog.GIAS
		      
		      if TCP_Resource.connected.GIAB then
		        btnConnect.Caption = "Disconnect"
		        lblConnectionStatus.Text = "Connected"
		        rectConnStatus.FillColor = RGB(0, 255, 0)
		      else
		        btnConnect.Caption = "Connect"
		        lblConnectionStatus.Text = "Disconnected"
		        rectConnStatus.FillColor = RGB(255, 0, 0)
		      end if
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		CatchData As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		CatchType As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		LastChangePosition As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Local_TCP As TestTCP_Class
	#tag EndProperty

	#tag Property, Flags = &h0
		MainInterface As NetworkInterface
	#tag EndProperty

	#tag Property, Flags = &h0
		mPIIOXCOMTabClass As PIIOXCOMTabClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PIIOXKeyword As String = "PIIOXsystemUPDATE2019"
	#tag EndProperty

	#tag Property, Flags = &h0
		SerialActive As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		SerialLastLetter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SerialLastTime As double
	#tag EndProperty

	#tag Property, Flags = &h0
		TCP_Resource As TCP_ResourceClass
	#tag EndProperty


#tag EndWindowCode

#tag Events COM_Term_Window
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if (Key=CR) or (Key=NL) then
		    
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Update_COM_Terminal
	#tag Event
		Sub Action()
		  
		  
		  Dim i as integer
		  Dim n as NetworkInterface
		  NetworkCards.DeleteAllRows
		  
		  For i = 0 to System.NetworkInterfaceCount-1
		    
		    //Get the NetworkInterface object for the selected item
		    n = System.GetNetworkInterface(i)
		    NetworkCards.AddRow(str(i))
		    NetworkCards.Cell(i,1)=n.IPAddress
		    NetworkCards.Cell(i,2)=n.SubnetMask
		    NetworkCards.Cell(i,3)=n.MACAddress
		    NetworkCards.RowTag(i)=n
		    COM_Term_Window.AppendText(n.IPAddress+chr(13))
		  Next
		  
		  if i=0 then
		    COM_Term_Window.AppendText("no adapter in use")
		  end
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NetworkCards
	#tag Event
		Sub Change()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Connect_Button
	#tag Event
		Sub Action()
		  Dim start, stop as integer
		  
		  if Connect_Button.Caption="Connect" then
		    
		    if Local_TCP=nil then
		      Local_TCP=new TestTCP_Class(COM_Term_Window)
		    end
		    
		    if (NetworkCards.ListIndex<0) or (NetworkCards.ListCount=0) or (NetworkCards.RowTag(NetworkCards.ListIndex)=nil) then
		      COM_Term_Window.AppendText("Define Networkinterface first"+chr(13))
		    else
		      
		      Local_TCP.NetworkInterface=NetworkCards.RowTag(NetworkCards.ListIndex)
		      
		      Local_TCP.Address=IP_Connected.Text
		      
		      Local_TCP.Port=val(IP_Port.Text)
		      
		      Local_TCP.Connect
		      
		      start = Ticks
		      //while the socket isn't connected 1 tick= 1/60 sec
		      While (Not Local_TCP.IsConnected) and ((Ticks-start)<300)
		        //poll the socket to let it do its thing
		        Local_TCP.Poll
		        //check to see if the socket got an error
		        If Local_TCP.LastErrorCode <> 0 then
		          COM_Term_Window.AppendText( "Socket Error: " + str(Local_TCP.LastErrorCode)+chr(13))
		          Exit
		        End If
		      Wend
		      stop = Ticks
		      
		      //if we broke the loop because we're connected
		      If Local_TCP.IsConnected then
		        COM_Term_Window.AppendText("   Socket Connected in " + Str(stop - start) + "  ticks"+chr(13))
		        Connect_Button.Caption="Disconnect"
		      else
		        COM_Term_Window.AppendText("   Device "+IP_Connected.Text+":"+IP_Port.Text+" could not be connected."+chr(13))
		      End If
		    end
		  else
		    If Local_TCP.IsConnected then
		      Local_TCP.Disconnect
		    end
		    Connect_Button.Caption="Connect"
		  end
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Send
	#tag Event
		Sub Action()
		  SendLine
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events IP_Command
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if (Key=CR) or (Key = NL) then
		    SendLine
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CommandLIst
	#tag Event
		Sub Change()
		  if CommandLIst.ListIndex<4 then
		    IP_Command.Text=CommandList.Text
		  else
		    IP_Command.AppendText(CommandList.Text)
		  end
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AutoDiscoveryConn
	#tag Event
		Sub ReceivedMessage(fromIP as String, command as Int32, data as String)
		  if command = 2 then
		    For i As Integer = 0 To lbDiscoveredDevices.RowCount - 1
		      if lbDiscoveredDevices.CellValueAt(i, 1) = fromIP then
		        lbDiscoveredDevices.CellValueAt(i, 2) = data
		      end if
		    Next
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRefreshNetwork
	#tag Event
		Sub Action()
		  // Refresh and scan for network interfaces
		  
		  pmNetworkInterfaces.RemoveAllRows
		  
		  For i As Integer = 0 To System.NetworkInterfaceCount - 1
		    Var network As NetworkInterface = System.NetworkInterface(i)
		    pmNetworkInterfaces.AddRow(network.IPAddress)
		    pmNetworkInterfaces.RowTag(i) = network
		  Next
		  
		  if pmNetworkInterfaces.RowCount = 0 then
		    pmNetworkInterfaces.AddRow("No adapter in use")
		  end if
		  
		  pmNetworkInterfaces.SelectedRowIndex = 0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmNetworkInterfaces
	#tag Event
		Sub Change()
		  if pmNetworkInterfaces.SelectedRow <> "No adapter in use" then
		    For i As Integer = 0 To System.NetworkInterfaceCount - 1
		      Var net As NetworkInterface = System.NetworkInterface(i)
		      
		      if pmNetworkInterfaces.SelectedRow = net.IPAddress then
		        MainInterface = net
		      end if
		    Next
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClearDevices
	#tag Event
		Sub Action()
		  // Clear discovered devices
		  lbDiscoveredDevices.RemoveAllRows
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSearchDevices
	#tag Event
		Sub Action()
		  // Scan for PIIOX devices on the same network
		  
		  if NOT pmNetworkInterfaces.SelectedRow.IsEmpty OR pmNetworkInterfaces.SelectedRow <> "No adapter in use" then
		    lbDiscoveredDevices.RemoveAllRows
		    
		    AutoDiscoveryConn.Unregister("PIIOX")
		    AutoDiscoveryConn.Register("PIIOX")
		    AutoDiscoveryConn.UpdateMemberList
		    
		    tmrStartAutoDiscover.Enabled = True
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbDiscoveredDevices
	#tag Event
		Sub DoubleClick()
		  // Connect to selected PIIOX device
		  If Me.SelectedRowIndex >= 0 Then
		    tfAddress.Text = Me.CellValueAt(Me.SelectedRowIndex, 1)
		    tfPort.Text = "6869"
		    
		    ServerCheck
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnConnect
	#tag Event
		Sub Action()
		  // Do connect
		  ServerCheck
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbCommand
	#tag Event
		Sub Change()
		  // Merge values to one command
		  
		  if Me.Text.Left(1) = "M" then
		    lblModuleType.Text = "Type:"
		    tfI2CAddress.Top = -50
		    tfI2CAddress.Visible = False
		    cbModuleType.Top = 38
		    cbModuleType.Visible = True
		    cbModuleType.SelectedRowIndex = 0
		  else
		    lblModuleType.Text = "I2C Add.:"
		    tfI2CAddress.Top = 38
		    tfI2CAddress.Visible = True
		    cbModuleType.Top = -50
		    cbModuleType.Visible = False
		  end if
		  
		  MergeCommand
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbBus
	#tag Event
		Sub Change()
		  // Merge values to one command
		  MergeCommand
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbModule
	#tag Event
		Sub Change()
		  // Merge values to one command
		  MergeCommand
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbDeviceAddress
	#tag Event
		Sub Change()
		  // Merge values to one command
		  MergeCommand
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbModuleType
	#tag Event
		Sub Change()
		  // Merge values to one command
		  
		  Select Case Me.Text
		  Case "REL01"
		    tfParamsField.Text = "Command=Set,Channel=1,State=1"
		  Case "AIN14"
		    tfParamsField.Text = "Command=meas,Mode=pos,Channel=1,Samples=100"
		  End Select
		  
		  MergeCommand
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClear
	#tag Event
		Sub Action()
		  // Clear textfields
		  tfParamsField.Text = ""
		  tfCommandField.Text = ""
		  taCommsData.Text = ""
		  
		  if TCP_Resource <> Nil then
		    TCP_Resource.ComLog.SIAS("")
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfI2CAddress
	#tag Event
		Sub TextChange()
		  // Merge values to one command
		  MergeCommand
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSendCmd
	#tag Event
		Sub Action()
		  // Send command
		  
		  Var command As String = tfCommandField.Text.Trim
		  Var returns As String
		  
		  if NOT command.IsEmpty then
		    Select Case pmReturnTypes.SelectedRowIndex
		    Case 1
		      command = command + CHR(13)
		    Case 2
		      command = command + CHR(10)
		    Case 3
		      command = command + CHR(10) + CHR(13)
		    End Select
		    
		    CommandExecute(command)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmSavedCmd
	#tag Event
		Sub Change()
		  tfCommandField.Text = Me.RowTagAt(Me.SelectedRowIndex)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSaveCmd
	#tag Event
		Sub Action()
		  Var xml As New XmlDocument
		  Var root, cmd As XmlNode
		  Var dt As DateTime = DateTime.Now
		  
		  Var cmdCommand As String = tfCommandField.Text
		  Var f As FolderItem = MainWindow.commandsFile
		  
		  if NOT cmdCommand.Trim.IsEmpty then
		    if f.Exists then
		      xml.LoadXml(f)
		      root = xml.LastChild
		    else
		      root = xml.AppendChild(xml.CreateElement("commands"))
		    end if
		    
		    cmd = root.AppendChild(xml.CreateElement("command"))
		    cmd.SetAttribute("id", dt.Nanosecond.ToString)
		    cmd.SetAttribute("name", cmdCommand)
		    cmd.SetAttribute("cmd", cmdCommand)
		  else
		    MessageBox("Field is empty, no command to save.")
		    Return
		  end if
		  
		  Try
		    xml.SaveXml(f)
		  Catch io As IOException
		    MessageBox("Save error: " + io.Message)
		  Catch xmle As XmlException
		    MessageBox("XML error: " + xmle.Message)
		  End Try
		  
		  For i As Integer = 0 To App.WindowCount - 1
		    Var w As Window = App.Window(i)
		    
		    if w IsA MainWindow then
		      Self.LoadXML
		    end if
		    
		    if w IsA PIIOXCommandsWindow then
		      PIIOXCommandsWindow.LoadXML
		    end if
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnManageCmd
	#tag Event
		Sub Action()
		  // Open commands window
		  PIIOXCommandsWindow.Show
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrStartAutoDiscover
	#tag Event
		Sub Action()
		  // Added code so it won't show duplicate PIIOX devices if we are connected both on Wi-Fi and on ethernet
		  
		  Var deviceNo As Integer = 1
		  
		  For Each device As String In AutoDiscoveryConn.GetMemberList
		    Var currentDevice As String = device
		    Var isDevice As Boolean = False
		    
		    For host As Integer = 0 To pmNetworkInterfaces.RowCount - 1
		      Var currentHost As String = pmNetworkInterfaces.RowValueAt(host)
		      
		      if currentHost = currentDevice then
		        isDevice = False
		        Exit
		      else
		        isDevice = True
		      end if
		    Next
		    
		    if isDevice then
		      lbDiscoveredDevices.AddRow("#" + Str(deviceNo), currentDevice)
		      deviceNo = deviceNo + 1
		    end if
		  Next
		  
		  AutoDiscoveryConn.SendMessageToGroup(2, "")
		  
		  Me.Enabled = False
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrParseData
	#tag Event
		Sub Action()
		  // Fetch PIIOX result
		  'if Local_TCP.IsConnected then
		  'if NOT Local_TCP.PIIOXResponse.Trim.IsEmpty then
		  'PIIOXData(Local_TCP.PIIOXResponse)
		  'end if
		  'end if
		  
		  Var data As String = TCP_Resource.Reply.GIAS
		  
		  if NOT data.IsEmpty then
		    PIIOXData(data)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmPIIOXSysInfo
	#tag Event
		Sub Change()
		  // Set PIIOX info to textfields
		  
		  if TCP_Resource <> Nil AND TCP_Resource.connected.GIAB then
		    Var sys As String = Me.RowTagAt(Me.SelectedRowIndex)
		    sys = sys.Middle(sys.IndexOf(1, ":") + 1, sys.Length)
		    
		    Var info() As String = sys.Split(",")
		    tfType.Text = info(0)
		    tfName.Text = info(1)
		    tfVersion.Text = info(2)
		    tfDate.Text = info(3)
		    tfSerialNo.Text = info(4)
		    tfTestNo.Text = info(5)
		    tfQC.Text = info(6)
		    
		    CatchType = Me.SelectedRowIndex
		    btnSetSysData.Caption = "Reconfigure " + Me.SelectedRow
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnRefresh
	#tag Event
		Sub Action()
		  // Fetch fresh PIIOX system info
		  
		  if TCP_Resource <> Nil AND TCP_Resource.Connected.GIAB then
		    CatchType = -1
		    CatchData = True
		    CommandExecute("*IDN?")
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnSetSysData
	#tag Event
		Sub Action()
		  // Reconfigure PIIOX data
		  
		  if TCP_Resource <> Nil AND TCP_Resource.connected.GIAB then
		    if (CatchType <> 0) AND (CatchType <> -1) then
		      Var md As New MessageDialog
		      Var mdb As MessageDialogButton
		      md.Icon = MessageDialog.GraphicCaution
		      md.ActionButton.Caption = "Save changes"
		      md.CancelButton.Visible = True
		      md.AlternateActionButton.Visible = False
		      md.AlternateActionButton.Caption = "Don't Save"
		      md.Message = "You are about to reprogram " + pmPIIOXSysInfo.SelectedRow + " EEPROM!"
		      md.Explanation = "Do you want to proceed?"
		      
		      mdb = md.ShowModal
		      
		      Select Case mdb
		      Case md.ActionButton
		        Select Case pmPIIOXSysInfo.SelectedRowIndex
		        Case 1
		          CommandExecute("*IDN=PIIOX System:" + tfType.Text + "," + tfName.Text + "," + tfVersion.Text + "," + tfDate.Text + "," + tfSerialNo.Text + "," + tfTestNo.Text + "," + tfQC.Text)
		        Case 2
		          CommandExecute("*IDN=M003:PX,BUS," + tfName.Text + "," + tfVersion.Text + "," + tfDate.Text + "," + tfSerialNo.Text + "," + tfTestNo.Text + "," + tfQC.Text)
		        Else
		          CommandExecute("*IDN=M0" + Str(pmPIIOXSysInfo.SelectedRowIndex - 2) + "3:PX," + tfType.Text + "," + tfName.Text + "," + tfVersion.Text + "," + tfDate.Text + "," + tfSerialNo.Text + "," + tfTestNo.Text + "," + tfQC.Text)
		        End Select
		      End Select
		    else
		      MessageBox("You cannot set " + pmPIIOXSysInfo.SelectedRow + " information!")
		    end if
		  else
		    MessageBox("Please connect to device first.")
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events taBrowsePIIOXFile
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  if TCP_Resource <> Nil AND TCP_Resource.connected.GIAB then
		    Var dlg As OpenFileDialog
		    Var f As FolderItem
		    dlg = New OpenFileDialog
		    
		    #If TargetLinux
		      dlg.InitialFolder = SpecialFolder.Documents
		    #Else
		      dlg.InitialFolder = SpecialFolder.Desktop
		    #Endif
		    
		    dlg.Title = "Select PIIOXListener"
		    dlg.Filter = FileTypes1.SpecialAny
		    f = dlg.ShowModal
		    
		    if f <> Nil then
		      if f.DisplayName = "PIIOXListener" then
		        taBrowsePIIOXFile.Text = f.NativePath
		      else
		        MessageBox("File selected is not a valid PIIOX update file.")
		      end if
		    end if
		  else
		    MessageBox("Please connect to device first.")
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Return True
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events btnPIIOXUpdate
	#tag Event
		Sub Action()
		  if TCP_Resource <> Nil AND TCP_Resource.connected.GIAB then
		    TCP_Resource.connected.SIAB(False)
		    btnConnect.Caption = "Connect"
		    
		    if Local_TCP = Nil then
		      Local_TCP = New TestTCP_Class(taCommsData)
		    end if
		    
		    Local_TCP.NetworkInterface = MainInterface
		    Local_TCP.Address = tfAddress.Text
		    Local_TCP.Port = Val(tfPort.Text)
		    
		    Var rep As Integer = 0
		    Var start, stop As Double
		    Var timeout As Double = 1000
		    
		    While (rep < 5) AND NOT (Local_TCP.IsConnected)
		      Local_TCP.Connect
		      
		      start = System.Ticks
		      While (NOT Local_TCP.IsConnected) AND (((System.Ticks - start) < timeout) OR (System.Ticks < start))
		        Local_TCP.Poll
		        if Local_TCP.LastErrorCode <> 0 then
		          Exit
		        end if
		      Wend
		      
		      stop = System.Ticks
		      rep = rep + 1
		    Wend
		  end if
		  
		  if Local_TCP.IsConnected then
		    lblConnectionStatus.Text = "Connected: Updating..."
		    rectConnStatus.FillColor = RGB(0, 255, 0)
		    
		    Var f As FolderItem = New FolderItem(taBrowsePIIOXFile.Text)
		    if f.Exists then
		      Var sh As New Shell
		      Var name As String = f.DisplayName
		      if cbPIIOXIncludeLibs.Value then
		        f = f.Parent
		        #If TargetMacOS OR TargetLinux
		          sh.Execute("cd " + f.ShellPath + "; zip -r -q " + f.ShellPath + " *")
		          f.Name = f.Parent.NativePath + "/" + name
		        #ElseIf TargetWindows
		          sh.Execute("powershell.exe cd " + f.Parent.ShellPath + """; Compress-Archive " + f.ShellPath + " " + f.Parent.ShellPath + "\" + name)
		        #Endif
		        f = f.Parent.Child(name + ".zip")
		      else
		        f.Name = name + "_new"
		      end if
		      
		      Var bs As BinaryStream = BinaryStream.Open(f, False)
		      Var flen As UInt64 = bs.Length
		      
		      Local_TCP.Write("Update#" + PIIOXKeyword + "#")
		      While NOT bs.EndOfFile
		        Var chunk As String = bs.Read(65536)
		        flen = flen - chunk.Bytes
		        Local_TCP.Write(chunk)
		        Local_TCP.Flush
		      Wend
		      
		      if cbPIIOXIncludeLibs.Value then
		        Local_TCP.Write(PIIOXKeyword + "#UpLibs")
		        f.Delete
		      else
		        Local_TCP.Write(PIIOXKeyword + "#UpSUF")
		        f.Name = name
		      end if
		      
		      Local_TCP.Flush
		      bs.Close
		    end if
		  else
		    lblConnectionStatus.Text = "Disconnected"
		    rectConnStatus.FillColor = RGB(255, 0, 0)
		  end if
		  
		  if Local_TCP.IsConnected then
		    Local_TCP.Disconnect
		    Local_TCP = Nil
		    lblConnectionStatus.Text = "Disconnected"
		    rectConnStatus.FillColor = RGB(255, 0, 0)
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnPIIOXUpdateClear
	#tag Event
		Sub Action()
		  taBrowsePIIOXFile.Text = "Click here to browse..."
		  cbPIIOXIncludeLibs.Value = False
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
		Name="LastChangePosition"
		Visible=false
		Group="Behavior"
		InitialValue="0"
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
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SerialActive"
		Visible=false
		Group="Behavior"
		InitialValue="false"
		Type="boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SerialLastLetter"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="SerialLastTime"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="double"
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
	#tag ViewProperty
		Name="CatchData"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="CatchType"
		Visible=false
		Group="Behavior"
		InitialValue="-1"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
