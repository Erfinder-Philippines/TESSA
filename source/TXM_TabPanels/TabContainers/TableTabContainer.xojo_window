#tag Window
Begin GraphicalTabContainer TableTabContainer Implements TabInterface
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cF5F6F700
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   True
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
   Transparent     =   False
   Visible         =   True
   Width           =   1035
   Begin GraphicalListbox GenericTable
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
      ColumnCount     =   3
      ColumnWidths    =   "30"
      darkModeEnabled =   False
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   25
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
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   558
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "0"
      Italic          =   False
      Left            =   20
      ListboxType     =   2
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   True
      RowSelectionType=   1
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   114
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   995
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin GroupBox GroupBox1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   91
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   158
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   133
      Begin PushButton DeleteColumn
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "-"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   225
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   "Delete selected value (line or column)"
         Top             =   35
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin PushButton MoveColumnRight
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   ">"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   225
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   64
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin PushButton MoveColumnLeft
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "<"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   165
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   64
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin MenuBevelButton AddColumn
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
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Left            =   165
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
         Top             =   35
         Transparent     =   True
         Visible         =   True
         Width           =   50
      End
   End
   Begin GroupBox GroupBox2
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   91
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   544
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   471
      Begin Label TablePath
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   10.0
         FontUnit        =   0
         Height          =   59
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   False
         Left            =   552
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
         Text            =   "Ohne Titel"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   37
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   390
      End
      Begin PushButton TableLoad
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "load"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   False
         Left            =   947
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   75
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   60
      End
      Begin PushButton TableSave
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "save"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   False
         Left            =   947
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   51
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   60
      End
      Begin PushButton SetTablePath
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   ">>"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   23
         Index           =   -2147483648
         InitialParent   =   "GroupBox2"
         Italic          =   False
         Left            =   947
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
         Top             =   27
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   60
      End
   End
   Begin GroupBox GroupBox3
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   91
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   21
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
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   126
      Begin PushButton DeleteRow
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "-"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   False
         Left            =   85
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   "Delete the selected attribute from this element and table"
         Top             =   34
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin PushButton TableSetActiveLine
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "set *"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   False
         Left            =   28
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   "Set selected value as active line"
         Top             =   64
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin PushButton FillButton
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "fill"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Italic          =   False
         Left            =   85
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   0
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   64
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   50
      End
      Begin MenuBevelButton AddRowsButton
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
         Height          =   25
         Index           =   -2147483648
         InitialParent   =   "GroupBox3"
         Left            =   28
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
         Top             =   34
         Transparent     =   True
         Visible         =   True
         Width           =   50
      End
   End
   Begin GroupBox GroupBox4
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   91
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   301
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   237
      Begin PopupMenu TableDim
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   24
         Index           =   0
         InitialParent   =   "GroupBox4"
         InitialValue    =   "All\n0"
         Italic          =   False
         Left            =   310
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
         Tooltip         =   ""
         Top             =   47
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   121
      End
      Begin CheckBox HorizontalCB
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   35
         Index           =   -2147483648
         InitialParent   =   "GroupBox4"
         Italic          =   False
         Left            =   446
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
         Top             =   42
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   False
         VisualState     =   0
         Width           =   87
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
            InitialParent   =   "HorizontalCB"
            Italic          =   False
            Left            =   463
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
            Text            =   "horizontal"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   50
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   67
         End
      End
      Begin Label DimLabel
         AllowAutoDeactivate=   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   17
         Index           =   0
         InitialParent   =   "GroupBox4"
         Italic          =   False
         Left            =   310
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
         Text            =   "Dimension"
         TextAlignment   =   0
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   27
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   121
      End
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
      Left            =   30
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   23
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Rows"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   44
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   168
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
      Text            =   "Columns"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   54
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
      Left            =   311
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   25
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Selection"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   71
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
      Left            =   557
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   26
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Load/save"
      TextAlignment   =   3
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   10
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   71
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DarkModeTabElements(value as Boolean)
		  GenericTable.darkModeEnabled = value
		  AddColumn.darkModeEnabled = value
		  AddRowsButton.darkModeEnabled = value
		  Dim labelColor As Color
		  If value Then
		    Self.BackgroundColor = &c2D3137
		    DimLabel(0).TextColor = Color.White
		    TablePath.TextColor = Color.White
		    labelColor = Color.White
		  Else
		    Self.BackgroundColor = &cF5F6F7
		    DimLabel(0).TextColor = Color.Black
		    TablePath.TextColor = Color.Black
		    labelColor = Color.Black
		  End If
		  
		  Dim i, c As Integer
		  Dim obj As Control
		  c = Self.ControlCount - 1
		  For i = 0 To c Step 1
		    obj = Self.Control(i)
		    
		    If obj IsA Label Then
		      Dim objLabel As Label = Label(obj)
		      objLabel.TextColor = labelColor
		    End If
		  Next
		  
		  Self.Invalidate(False)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddAttribute()
		  If mUserSelectedTable <> Nil Then
		    Dim d As new CreateAttributeWindow(nil,mUserSelectedTable.NumberOfRows.GIAI,"")
		    d.ShowModalWithin(MainWindow)
		    Dim Attr As AttributeClass = d.createdAttribute
		    If Attr <> Nil Then
		      Attr.MyStep = mUserSelectedTable
		      mUserSelectedTable.AddAttributetoList(Attr)
		      RedrawTable(True, True)
		      MainWindow.RedrawAttributeList
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AllPossibleDimensions(BS as BasicClass, ByRef newDimesions() as String, LinePart as string)
		  If BS Isa TableDimension_StepClass Then
		    Dim TD As TableDimension_StepClass = TableDimension_StepClass(BS)
		    for i as Integer = 0 to TD.DimensionList.GIAN - 1
		      if BS.NextStep = nil then
		        newDimesions.Append(LinePart + TD.DimensionList.GIAS(i))
		      ElseIf BS.NextStep isA TableDimension_StepClass then
		        AllPossibleDimensions(BS.NextStep, newDimesions, LinePart + TD.DimensionList.GIAS(i)+" ")
		      end
		    next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChangeAttribute(attrName As String)
		  If attrName <> "" Then
		    Dim attr As AttributeClass = mUserSelectedTable.GetAttribute(attrName)
		    If attr <> Nil Then
		      Dim index As Integer = mUserSelectedTable.GetAttributeNumber(attrName)
		      Dim d As New CreateAttributeWindow(attr, mUserSelectedTable.NumberOfRows.GIAI, "", True)
		      d.ShowModalWithin(MainWindow)
		      mColumnSort = d.SortDirection
		      Dim newAttr As AttributeClass = d.createdAttribute
		      If newAttr <> Nil Then
		        If Introspection.GetType(newAttr) <> Introspection.GetType(attr) Then
		          newAttr.MyStep = mUserSelectedTable
		          Call mUserSelectedTable.RemoveAttribute(index)
		          mUserSelectedTable.InsertAttribute(index, newAttr)
		        End
		        RedrawTable(True, True)
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ChangeDisplayingMode()
		  AddRowsButton.SetVisibleMenu(Not HorizontalCB.Value)
		  AddColumn.SetVisibleMenu(HorizontalCB.Value)
		  
		  If HorizontalCB.Value Then
		    AddRowsButton.SetButtonTitle("+")
		    AddRowsButton.HelpTag = AddColumnTag
		    DeleteRow.Caption = "-"
		    DeleteRow.HelpTag = DeleteColumnTag
		    TableSetActiveLine.Caption = "<"
		    TableSetActiveLine.HelpTag = MoveColumnLeftTag
		    FillButton.Caption = ">"
		    FillButton.HelpTag = MoveColumnRightTag
		    
		    AddColumn.SetButtonTitle("+")
		    AddColumn.HelpTag = AddRowTag
		    DeleteColumn.Caption = "-"
		    DeleteColumn.HelpTag = DeleteRowTag
		    MoveColumnLeft.Caption = "Set *"
		    MoveColumnLeft.HelpTag = SetCurrentLineTag
		    MoveColumnRight.Caption = "Fill"
		    MoveColumnRight.HelpTag = FillTag
		  Else
		    AddRowsButton.SetButtonTitle("+")
		    AddRowsButton.HelpTag = AddRowTag
		    DeleteRow.Caption = "-"
		    DeleteRow.HelpTag = DeleteRowTag
		    FillButton.Caption = "Fill"
		    FillButton.HelpTag = FillTag
		    TableSetActiveLine.Caption = "Set *"
		    TableSetActiveLine.HelpTag = SetCurrentLineTag
		    
		    AddColumn.SetButtonTitle("+")
		    AddColumn.HelpTag = AddColumnTag
		    DeleteColumn.Caption = "-"
		    DeleteColumn.HelpTag = DeleteColumnTag
		    MoveColumnLeft.Caption = "<"
		    MoveColumnLeft.HelpTag = MoveColumnLeftTag
		    MoveColumnRight.Caption = ">"
		    MoveColumnRight.HelpTag = MoveColumnRightTag
		  End
		  
		  GenericTable.genericTblHorizontal = HorizontalCB.Value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckDimesionName(dims() As String, value As String) As Boolean
		  if dims.Ubound >= 0 And value <> "" Then
		    Dim values(-1) as String = value.Trim.Split(" ")
		    For i as Integer = 0 to dims.Ubound
		      if I <= values.Ubound And dims(i).Lowercase = "all" Then
		        values.Insert(i, "All")
		        values.Remove(i + 1)
		      End
		    Next
		    value = Join(values)
		    Dim s As String = Join(dims).Trim
		    if s <> value Then
		      Return False
		    End
		  End
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return New TableTabContainer(Self.mTableTabClass)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mTableTabClass = TableTabClass(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateMenu() As MenuItem
		  Dim menu As new MenuItem
		  menu.Append(new MenuItem("Beginning", 0))
		  menu.Append(new MenuItem("Before Selected", 1))
		  menu.Append(new MenuItem("After Selected", 2))
		  
		  Dim index As Integer = 0
		  If mTableTabClass <> Nil Then
		    index = mTableTabClass.RowsAddingType.GIAI
		  End
		  If index < 0 Or index > 2 Then
		    index = 0
		  End
		  menu.Item(index).Checked = True
		  Return menu
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Fill()
		  if mUserSelectedTable <> Nil then
		    Dim maxArraySize As Integer = mUserSelectedTable.GetMaxNumberofValues
		    if maxArraySize > 0 Then
		      For i as Integer = 0 To mUserSelectedTable.AttributesUbound
		        Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(mUserSelectedTable.GetAttribute(i))
		        If attr <> Nil And attr.IsArray Then
		          if attr.GOAN < maxArraySize Then
		            Dim lastValue As String = attr.GIAS(attr.GOAN - 1)
		            Dim count As Integer = maxArraySize - attr.GOAN
		            For j as Integer = 1 to count
		              attr.SOAA(attr.GOAN - 1)
		              attr.AddValue(lastValue)
		            Next
		          End
		        End
		      Next
		      RedrawTable(True, False)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetCorrectDimensionListIndex(row As Integer) As Integer
		  Dim column As Integer = -1
		  For i as Integer = 0 to GenericTable.ListCount - 1
		    if GenericTable.Heading(i) = Table_StepClass.cDimension Then
		      column = i
		      Exit For i
		    End
		  Next
		  Dim DimAttr As AttributeClass = mUserSelectedTable.GetAttribute(Table_StepClass.cDimension)
		  if DimAttr <> Nil And column >= 0 Then
		    Dim value As String = GenericTable.Cell(row, column)
		    If value <> "" Then
		      Dim DirectVar as Boolean = DimAttr.GOAN >= DimAttr.GIAN
		      Dim count As Integer = 0
		      if DirectVar Then
		        count = DimAttr.GOAN
		      Else
		        count = DimAttr.GIAN
		      End
		      Dim attrValue As String = ""
		      For i as Integer = 0 to count - 1
		        If DirectVar Then
		          attrValue = DimAttr.GOAS(i)
		        Else
		          attrValue = DimAttr.GIAS(i)
		        End
		        if value = attrValue Then
		          Return i
		        End
		      Next
		    End
		  End
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertRowInVerticalMode(index As Integer)
		  For i as Integer = 1 to GenericTable.ColumnCount
		    Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(mUserSelectedTable.GetAttribute(GenericTable.Heading(i)))
		    If attr <> Nil Then
		      Dim value As String = ""
		      Select Case attr
		      Case IsA Boolean_AttributeClass
		        value = "false"
		      Case IsA Integer_AttributeClass, IsA UInt8_AttributeClass, IsA UInt16_AttributeClass, IsA UInt32_AttributeClass, IsA Double_AttributeClass
		        value = "0"
		      End
		      attr.InsertValue(index, value)
		    End
		  Next
		  If mUserSelectedTable <> Nil Then
		    mUserSelectedTable.NumberOfRows.SIAI(mUserSelectedTable.NumberOfRows.GIAI + 1)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDimensionMode() As Boolean
		  if mUserSelectedTable <> Nil Then
		    Return mUserSelectedTable.NumDimensions > 0
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedrawTable(CompleteRedraw as Boolean, Rebuilt_Dimension_Selection as Boolean)
		  // see if table has dimensions and adjust the dropdown menus accordingly
		  Dim dimensions(-1) As String
		  if mUserSelectedTable<>nil then
		    
		    HorizontalCB.Visible = not IsDimensionMode // don't show Horizontal CB when sveral dimension
		    if not HorizontalCB.Visible Then
		      HorizontalCB.Value = False
		    End
		    if CompleteRedraw then
		      TablePath.Text=mUserSelectedTable.File.GIAS
		      Dim n as integer = 0
		      if Rebuilt_Dimension_Selection then
		        //delete all
		        while TableDim(n) <> nil
		          TableDim(n).Visible = false
		          DimLabel(n).Visible = false
		          n = n + 1
		        wend
		        
		        // set up
		        Dim c as PopupMenu
		        Dim d as Label
		        Dim EA as AttributeClass
		        AddRowsButton.Visible = HorizontalCB.Visible // don't show Add row as we have the "Add Row" in the DropDown Filter
		        FillButton.Visible = HorizontalCB.Visible //don't show Fill button as we have "Add row"
		        for n = 0 to mUserSelectedTable.NumDimensions - 1
		          if TableDim(n) = nil then
		            c = new TableDim
		            c.left = c.left + n * 135
		            d = new DimLabel
		            d.left = d.left + n * 135
		          else
		            c = TableDim(n)
		            d = DimLabel(n)
		          end
		          c.Visible = true
		          d.Visible = true
		          d.Text = mUserSelectedTable.GetDimensionName(n)
		          EA = mUserSelectedTable.GetDimensionChoice(n)
		          c.DeleteAllRows
		          c.AddRow("All") // used to filter all items of this dimension
		          if EA <> nil then
		            Dim S as string
		            for k as Integer = 0 to EA.GIAN - 1
		              S = EA.GIAS(k)
		              if S = "-" then // this hack was needed as a menu with a simple - would not appear
		                S = " -"
		              end
		              c.AddRow(S) // one entry for each dimension
		            next
		          end
		          c.AddRow(cAddRow) // used to add a new row to this dimension
		          c.ListIndex = 0
		        next
		      end
		      for n = 0 to mUserSelectedTable.NumDimensions - 1
		        if TableDim(n) <> nil then
		          dimensions.Append(TableDim(n).Text)
		        end
		      next
		    end
		    
		    if mUserSelectedTable.GetMaxNumberofValues > 64 Then
		      if HorizontalCB.Value Then
		        Call MsgBox("It is not possible to convert to the horizontal mode as there are too many values.", 48)
		        HorizontalCB.Value = False
		        Return
		      End
		      HorizontalCB.Visible = False
		    End
		  End
		  
		  // draw the table
		  if HorizontalCB.Value then
		    RedrawTableHorizontal(CompleteRedraw)
		  else
		    RedrawTableVertical(CompleteRedraw, dimensions)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RedrawTableHorizontal(CompleteRedraw as Boolean)
		  // select appropriate table and display it horizontally ,meaning that each attribute and it's values are on one row
		  if mUserSelectedTable<>nil then
		    CompleteRedraw = true
		    If CompleteRedraw then
		      GenericTable.DeleteAllRows
		    end
		    
		    Dim NumValues As Integer = mUserSelectedTable.GetMaxNumberofValues + 2
		    GenericTable.ColumnCount = NumValues
		    
		    If CompleteRedraw then
		      GenericTable.Heading(0) = "No"
		      GenericTable.Heading(1) = "Name"
		      GenericTable.ColumnType(0) = ListBox.TypeNormal
		      GenericTable.ColumnType(1) = ListBox.TypeNormal
		      for i as Integer = 2 to NumValues - 1
		        GenericTable.ColumnType(i) = ListBox.TypeEditable
		        If (i - 2) = mUserSelectedTable.ActiveRowInternal Then
		          GenericTable.ActiveColumn = i
		          GenericTable.Heading(i) = "*Value " + Str (i - 2)
		        Else
		          GenericTable.Heading(i) = "Value " + Str (i - 2)
		        End
		      next
		    end
		    
		    Dim DirectVar As Boolean
		    Dim ArrayNr as Integer = 0
		    Dim NumVars as Integer = mUserSelectedTable.AttributesUbound
		    Dim arrayAttr As MultipleValuesAttributeClass = Nil
		    for i as Integer = 0 to NumVars
		      arrayAttr = MultipleValuesAttributeClass(mUserSelectedTable.GetAttribute(i))
		      If arrayAttr <> Nil And arrayAttr.IsArray Then
		        DirectVar = arrayAttr.GOAN >= arrayAttr.GIAN
		        // DirectVar indicates if the Values have to be taken from a linked table at the source attribute or
		        // from the table attribute itself (=true)
		        if DirectVar then
		          NumValues = arrayAttr.GOAN
		        else
		          NumValues = arrayAttr.GIAN
		        end
		        GenericTable.AddRow(Str(ArrayNr))
		        GenericTable.Cell(ArrayNr, 1) = arrayAttr.Name
		        
		        for j as Integer  = 0 to NumValues - 1
		          if DirectVar then
		            GenericTable.Cell(ArrayNr, j + 2) = arrayAttr.GOAS(j)
		          else
		            GenericTable.Cell(ArrayNr, j + 2) = arrayAttr.GIAS(j)
		          end
		        next
		        ArrayNr = ArrayNr + 1
		      End
		    next
		    
		    // resize column size array
		    Dim CW(-1) as string
		    //copy size of first column to rest
		    CW.Append("30")
		    Dim MaxField as integer
		    for i as Integer = 1 to GenericTable.ColumnCount - 1
		      MaxField = GenericTable.Heading(i).len
		      for k as Integer = 0 to GenericTable.ListCount - 1
		        if GenericTable.Cell(k, i).Len > MaxField then
		          MaxField = GenericTable.Cell(k, i).len
		        end
		      next
		      CW.Append(str(30 + MaxField * 8))
		    next
		    ReDim CW(GenericTable.ColumnCount)
		    //set column width according array
		    GenericTable.ColumnWidths = Join(CW, ",")
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RedrawTableVertical(CompleteRedraw as Boolean, dims() As String)
		  // select appropriate table and display it horizontally ,meaning that each attributeand it's values are in one column
		  if mUserSelectedTable<>nil then
		    TablePath.Text=mUserSelectedTable.File.GIAS
		    
		    If CompleteRedraw then
		      GenericTable.DeleteAllRows
		    end
		    
		    Dim NumVars as Integer = mUserSelectedTable.AttributesUbound
		    // count the numbers of arrays
		    Dim NumArrays As Integer = 0
		    Dim showDateTimeColumn As Boolean = True
		    For n As Integer = 0 To NumVars
		      Dim arrayAttr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(mUserSelectedTable.GetAttribute(n))
		      
		      If arrayAttr.Name = "DateTimeControling" And arrayAttr.GOAS = "none" Then
		        showDateTimeColumn = False
		      End If
		      If Not showDateTimeColumn And (arrayAttr.Name = "Date" Or arrayAttr.Name = "Time") Then
		        Continue
		      End If
		      
		      If arrayAttr <> Nil And arrayAttr.IsArray Then
		        NumArrays = NumArrays + 1
		      End
		    Next
		    GenericTable.ColumnCount = NumArrays + 1
		    
		    If CompleteRedraw then
		      GenericTable.Heading(0) = "No"
		      GenericTable.ColumnType(0) = ListBox.TypeNormal
		      for n as Integer = 1 to NumArrays
		        GenericTable.ColumnType(n) = ListBox.TypeEditable
		      next
		    end
		    
		    Dim ArrayNr as Integer = 0
		    Dim NumValues As Integer
		    Dim DirectVar as boolean
		    Dim DimAttr As AttributeClass = mUserSelectedTable.GetAttribute(Table_StepClass.cDimension)
		    Dim arrayAttr As MultipleValuesAttributeClass = Nil
		    for n as Integer = 0 to NumVars
		      arrayAttr = MultipleValuesAttributeClass(mUserSelectedTable.GetAttribute(n))
		      
		      If arrayAttr.Name = "DateTimeControling" And arrayAttr.GOAS = "none" Then
		        showDateTimeColumn = False
		      End If
		      If Not showDateTimeColumn And (arrayAttr.Name = "Date" Or arrayAttr.Name = "Time") Then
		        Continue
		      End If
		      
		      If arrayAttr <> Nil And arrayAttr.IsArray Then
		        GenericTable.Heading(ArrayNr + 1) = arrayAttr.Name
		        DirectVar = arrayAttr.GOAN >= arrayAttr.GIAN
		        // DirectVar indicates if the Values have to be taken from a linked table at the source attribute or
		        // from the table attribute itself (=true)
		        If DirectVar Then
		          NumValues = arrayAttr.GOAN
		        Else
		          NumValues = arrayAttr.GIAN
		        End
		        
		        Dim j As Integer = 0
		        Dim canAdd As Boolean = True
		        for i as Integer = 0 to NumValues - 1
		          if DimAttr <> Nil And mUserSelectedTable.NumDimensions > 0 Then
		            Dim s As String = ""
		            if DirectVar then
		              s = DimAttr.GOAS(i)
		            else
		              s = DimAttr.GIAS(i)
		            end
		            canAdd = CheckDimesionName(dims, s)
		          End
		          
		          If canAdd Then
		            if j >= GenericTable.ListCount Then
		              GenericTable.AddRow("")
		            End
		            if DirectVar then
		              GenericTable.Cell(j, ArrayNr + 1) = arrayAttr.GOAS(i)
		            Else
		              GenericTable.Cell(j, ArrayNr + 1) = arrayAttr.GIAS(i)
		            End
		            if i = mUserSelectedTable.ActiveRowInternal then
		              GenericTable.Cell(j, 0) = Str(j) + "*"
		              
		              // for row highlighting GraphicalListbox
		              GenericTable.RowTagAt(j) = j
		              'GenericTable.ActiveRow = row
		            else
		              GenericTable.Cell(j, 0) = Str(j)
		            end
		            j = j + 1
		          End
		        next
		        ArrayNr = ArrayNr + 1
		      end
		    next
		    
		    // resize column size array
		    Dim CW(-1) as string
		    //copy size of first column to rest
		    CW.Append("30")
		    Dim MaxField as integer
		    for i as Integer = 1 to GenericTable.ColumnCount - 1
		      MaxField = GenericTable.Heading(i).len
		      for k as Integer = 0 to GenericTable.ListCount - 1
		        if GenericTable.Cell(k, i).Len > MaxField then
		          MaxField = GenericTable.Cell(k, i).len
		        end
		      next
		      CW.Append(str(30 + MaxField * 8))
		    next
		    ReDim CW(GenericTable.ColumnCount)
		    //set column width according array
		    GenericTable.ColumnWidths = Join(CW, ",")
		  end
		  
		  If App.GetTESSAState = 0 Then
		    GenericTable.ScrollPosition = 100000
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetActiveLine(index As Integer)
		  // set the selected row as the active one
		  if mUserSelectedTable <> nil And GenericTable.ListIndex > -1 And GenericTable.Selected(GenericTable.ListIndex) Then
		    mUserSelectedTable.SetTableRow(index)
		    RedrawTable(True, False)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StepSelected(BS as BasicClass)
		  If BS IsA Table_StepClass Then
		    mUserSelectedTable = Table_StepClass (BS)
		  else
		    mUserSelectedTable = Nil
		  end if
		  
		  If mUserSelectedTable <> Nil Then
		    RedrawTable(true, true)
		    Return
		  End
		  
		  HorizontalCB.Value = False
		  GenericTable.DeleteAllRows
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mColumnSort As Listbox.SortDirections = Listbox.SortDirections.None
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTableTabClass As TableTabClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserSelectedColumn As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserSelectedTable As Table_StepClass = nil
	#tag EndProperty


	#tag Constant, Name = AddColumnTag, Type = String, Dynamic = False, Default = \"Add new value (column)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = AddRowTag, Type = String, Dynamic = False, Default = \"Add new value (row)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = cAddRow, Type = String, Dynamic = False, Default = \"Add Row", Scope = Private
	#tag EndConstant

	#tag Constant, Name = DeleteColumnTag, Type = String, Dynamic = False, Default = \"Delete selected value (column)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = DeleteRowTag, Type = String, Dynamic = False, Default = \"Delete selected value (row)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = FillTag, Type = String, Dynamic = False, Default = \"Makes the arrays all equal and fills the empty spaces with a copy of the last value", Scope = Private
	#tag EndConstant

	#tag Constant, Name = MoveColumnLeftTag, Type = String, Dynamic = False, Default = \"change the sequence of the columns(move left)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = MoveColumnRightTag, Type = String, Dynamic = False, Default = \"change the sequence of the columns(move right)", Scope = Private
	#tag EndConstant

	#tag Constant, Name = SetCurrentLineTag, Type = String, Dynamic = False, Default = \"Set selected value as active line", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events GenericTable
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  if App.Security_Check(3) then
		    if mUserSelectedTable <> Nil Then
		      mUserSelectedTable.SOAS(Me.Heading(column), Me.Cell(row, column), row)
		    End
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.ColumnWidths = "80"
		End Sub
	#tag EndEvent
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused row
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  mUserSelectedColumn = column
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  
		  if App.Security_Check(3) then
		    If mUserSelectedTable <> Nil Then
		      if HorizontalCB.Value Then
		        Dim column As Integer = Me.ColumnFromXY(x, y)
		        Dim row As Integer = Me.RowFromXY(x, y)
		        If column = 1 And row >= 0 And row < Me.ListCount Then
		          ChangeAttribute(Me.Cell(row, column))
		        End
		      End
		    End
		  end
		  Return False
		End Function
	#tag EndEvent
	#tag Event
		Function HeaderPressed(column as Integer) As Boolean
		  If App.Security_Check(3) Then
		    If mUserSelectedTable <> Nil Then
		      If Not HorizontalCB.Value And column > 0 And column < Me.ColumnCount Then
		        ChangeAttribute(Me.Heading(column))
		        
		        Me.ColumnSortDirectionAt(column) = mColumnSort
		        Me.SortingColumn = column
		        Me.Sort
		      Elseif Not HorizontalCB.Value And column = 0 And column < Me.ColumnCount Then
		        Return False
		      End
		      Me.SortingColumn = -1
		    End If
		  End
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function CompareRows(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  Select Case column
		  Case 0 // This is our numerical value column. Let's do the work ourselves
		    If Val(Me.CellValueAt(row1, column )) < Val(Me.CellValueAt(row2, column)) Then
		      result = -1
		    Elseif Val(Me.CellValueAt(row1, column)) > Val(Me.CellValueAt(row2, column)) Then
		      result = 1
		    Else
		      result = 0
		    End If
		    Return True
		    
		  Else //some other column for which we let the listbox handle comparison
		    Return False
		  End Select
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events DeleteColumn
	#tag Event
		Sub Action()
		  if App.Security_Check(3) then
		    if mUserSelectedTable <> Nil Then
		      If HorizontalCB.Value Then
		        'horizontal mode
		        if mUserSelectedColumn >= 2 And mUserSelectedColumn < GenericTable.ColumnCount Then
		          For i as Integer = 0 to GenericTable.ListCount - 1
		            Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(mUserSelectedTable.GetAttribute(GenericTable.Cell(i, 1)))
		            If attr <> Nil Then
		              Call attr.RemoveValue(mUserSelectedColumn - 2)
		            End
		          Next
		          RedrawTable(True, False)
		        End
		      Else
		        If mUserSelectedColumn > 0 And mUserSelectedColumn < GenericTable.ColumnCount Then
		          if IsDimensionMode And GenericTable.Heading(mUserSelectedColumn) = Table_StepClass.cDimension Then
		            Return
		          End
		          Call mUserSelectedTable.RemoveAttribute(GenericTable.Heading(mUserSelectedColumn))
		          RedrawTable(True, True)
		        End
		      End
		    End
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MoveColumnRight
	#tag Event
		Sub Action()
		  if App.Security_Check(3) then
		    if mUserSelectedTable <> Nil Then
		      If HorizontalCB.Value Then
		        'horizontal mode
		        Fill
		      Elseif mUserSelectedColumn > 0 And (mUserSelectedColumn + 1) < GenericTable.ColumnCount then
		        if IsDimensionMode And GenericTable.Heading(mUserSelectedColumn) = Table_StepClass.cDimension Then
		          Return
		        End
		        
		        mUserSelectedTable.Swap(GenericTable.Heading(mUserSelectedColumn), GenericTable.Heading(mUserSelectedColumn + 1))
		        RedrawTable(True, True)
		        mUserSelectedColumn = mUserSelectedColumn + 1
		        GenericTable.Refresh
		      End
		    End
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events MoveColumnLeft
	#tag Event
		Sub Action()
		  if App.Security_Check(3) then
		    if mUserSelectedTable <> Nil Then
		      if HorizontalCB.Value Then
		        'horizontal mode
		        if mUserSelectedColumn > 1 then
		          SetActiveLine(mUserSelectedColumn - 2)
		        End
		      Elseif (mUserSelectedColumn - 1)  > 0 then
		        if IsDimensionMode And (GenericTable.Heading(mUserSelectedColumn) = Table_StepClass.cDimension _
		          Or GenericTable.Heading(mUserSelectedColumn - 1) = Table_StepClass.cDimension) Then
		          Return
		        End
		        
		        mUserSelectedTable.Swap(GenericTable.Heading(mUserSelectedColumn), GenericTable.Heading(mUserSelectedColumn - 1))
		        RedrawTable(True, True)
		        mUserSelectedColumn = mUserSelectedColumn - 1
		        GenericTable.Refresh
		      end
		    End
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddColumn
	#tag Event
		Sub ButtonToggled()
		  if App.Security_Check(3) then
		    if HorizontalCB.Value Then
		      'horizontal mode
		      
		      Dim index As Integer = 0
		      mUserSelectedColumn = mUserSelectedColumn - 2
		      Select Case mTableTabClass.RowsAddingType.GIAI
		      Case 1
		        if mUserSelectedColumn >= 0 And mUserSelectedColumn < GenericTable.ColumnCount Then
		          index = mUserSelectedColumn
		        Else
		          Return
		        End
		      Case 2
		        if mUserSelectedColumn >= 0 And mUserSelectedColumn < GenericTable.ColumnCount Then
		          index = mUserSelectedColumn + 1
		        Else
		          Return
		        End
		      End
		      
		      For i as Integer = 0 to GenericTable.ListCount - 1
		        Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(mUserSelectedTable.GetAttribute(GenericTable.Cell(i, 1)))
		        If attr <> Nil Then
		          Dim value As String = ""
		          Select Case attr
		          Case IsA Boolean_AttributeClass
		            value = "false"
		          Case IsA Integer_AttributeClass, IsA UInt8_AttributeClass, IsA UInt16_AttributeClass, IsA UInt32_AttributeClass, IsA Double_AttributeClass
		            value = "0"
		          End
		          attr.InsertValue(index, value)
		        End
		      Next
		      RedrawTable(True, False)
		      Select Case mTableTabClass.RowsAddingType.GIAI
		      Case 0
		        mUserSelectedColumn = 0
		      Case 1
		        mUserSelectedColumn = index + 1
		      Case 2
		        mUserSelectedColumn = index - 1
		      End
		      mUserSelectedColumn = mUserSelectedColumn + 2
		      
		    Else
		      AddAttribute
		    End
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.SetButtonTitle("+")
		  Me.SetIcon(nil)
		  Me.SetMenu(CreateMenu)
		End Sub
	#tag EndEvent
	#tag Event
		Sub AboutToShowMenu(menu As MenuItem)
		  if menu <> Nil and mTableTabClass <> Nil then
		    For i as Integer = 0 to menu.Count - 1
		      menu.Item(i).Checked = (i = mTableTabClass.RowsAddingType.GIAI)
		    Next
		  End
		End Sub
	#tag EndEvent
	#tag Event
		Sub MenuTriggered(Item As MenuItem)
		  if App.Security_Check(3) then
		    if mTableTabClass <> Nil And Item <> Nil Then
		      mTableTabClass.RowsAddingType.SIAI(Item.Tag.IntegerValue)
		    End
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TableLoad
	#tag Event
		Sub Action()
		  // select appropriate table and load it
		  if App.Security_Check(4) then
		    if mUserSelectedTable <> Nil Then
		      mUserSelectedTable.Load("",TablePath.Text)
		      RedrawTable(True, False)
		    end
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TableSave
	#tag Event
		Sub Action()
		  // select appropriate table and save it
		  if App.Security_Check(2) then
		    if mUserSelectedTable <> nil then
		      mUserSelectedTable.Save(mUserSelectedTable.BasicPath.GIAS,mUserSelectedTable.File.GIAS,-1,mUserSelectedTable.GetMaxNumberofValues)
		      TablePath.Text = mUserSelectedTable.File.GIAS
		    end
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SetTablePath
	#tag Event
		Sub Action()
		  if mUserSelectedTable <> Nil Then
		    Dim txtType as New FileType
		    txtType.Name = "Text tables"
		    txtType.MacType = "txt"
		    txtType.Extensions = "txt"
		    //using the addition and conversion operators...
		    Dim f As FolderItem =GetOpenFolderItem(txtType)
		    if f <> nil then
		      TablePath.Text = f.NativePath // absolut => native
		      if TablePath.Text <> "" then
		        mUserSelectedTable.File.SIAS(TablePath.Text)
		      end
		    end
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DeleteRow
	#tag Event
		Sub Action()
		  if App.Security_Check(3) then
		    if mUserSelectedTable <> Nil Then
		      If HorizontalCB.Value Then
		        'horizontal mode
		        If GenericTable.ListIndex >= 0 And GenericTable.ListIndex < GenericTable.ColumnCount Then
		          Call mUserSelectedTable.RemoveAttribute(GenericTable.Cell(GenericTable.ListIndex, 1))
		          RedrawTable(True, True)
		        End
		      Else
		        Dim row As Integer = GenericTable.ListIndex
		        if row >= 0 And row < GenericTable.ListCount Then
		          
		          if IsDimensionMode Then
		            row = GetCorrectDimensionListIndex(row)
		            if row < 0 Then
		              Return
		            End
		          End
		          
		          For i as Integer = 1 to GenericTable.ColumnCount
		            Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(mUserSelectedTable.GetAttribute(GenericTable.Heading(i)))
		            If attr <> Nil Then
		              Call attr.RemoveValue(row)
		            End
		          Next
		          if mUserSelectedTable.ActiveRowInternal = row Then
		            mUserSelectedTable.SetTableRow(row)
		          End
		          RedrawTable(True, False)
		          GenericTable.ListIndex = row
		        End
		      End
		    End
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TableSetActiveLine
	#tag Event
		Sub Action()
		  If App.Security_Check(3) Then
		    if HorizontalCB.Value Then
		      'horizontal mode
		      Dim index As Integer = GenericTable.ListIndex
		      If (index - 1) >= 0 And Index < GenericTable.ListCount Then
		        mUserSelectedTable.Swap(GenericTable.Cell(Index, 1), GenericTable.Cell(index - 1, 1))
		        RedrawTable(True, True)
		        GenericTable.ListIndex = index - 1
		      End
		    Elseif GenericTable.ListIndex >- 1 Then
		      Dim row As Integer = GenericTable.ListIndex
		      
		      if IsDimensionMode Then
		        row = GetCorrectDimensionListIndex(row)
		        if row < 0 Then
		          Return
		        End
		      End
		      
		      // set the selected row as the active one
		      SetActiveLine(row)
		    End
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FillButton
	#tag Event
		Sub Action()
		  if App.Security_Check(3) then
		    if HorizontalCB.Value Then
		      'horizontal mode
		      Dim index As Integer = GenericTable.ListIndex
		      If mUserSelectedTable <> Nil And index >= 0 And (Index + 1) < GenericTable.ListCount Then
		        mUserSelectedTable.Swap(GenericTable.Cell(Index, 1), GenericTable.Cell(index + 1, 1))
		        RedrawTable(True, True)
		        GenericTable.ListIndex = index + 1
		      End
		    Else
		      Fill
		    End
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddRowsButton
	#tag Event
		Sub Open()
		  Me.SetButtonTitle("+")
		  Me.SetIcon(nil)
		  Me.SetMenu(CreateMenu)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MenuTriggered(Item As MenuItem)
		  if App.Security_Check(3) then
		    if mTableTabClass <> Nil And Item <> Nil Then
		      mTableTabClass.RowsAddingType.SIAI(Item.Tag.IntegerValue)
		    End
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub ButtonToggled()
		  if App.Security_Check(3) then
		    if mTableTabClass <> Nil And mUserSelectedTable <> Nil Then
		      if HorizontalCB.Value Then
		        'horizontal mode
		        AddAttribute
		      Else
		        Dim index As Integer = 0
		        Select Case mTableTabClass.RowsAddingType.GIAI
		        Case 1
		          if GenericTable.ListIndex >= 0 And GenericTable.ListIndex < GenericTable.ListCount Then
		            index = GenericTable.ListIndex
		          Else
		            Return
		          End
		        Case 2
		          if GenericTable.ListIndex >= 0 And GenericTable.ListIndex < GenericTable.ListCount Then
		            index = GenericTable.ListIndex + 1
		          Else
		            Return
		          End
		        End
		        
		        InsertRowInVerticalMode(index)
		        RedrawTable(True, False)
		        Select Case mTableTabClass.RowsAddingType.GIAI
		        Case 0
		          GenericTable.ListIndex = 0
		        Case 1
		          GenericTable.ListIndex = index + 1
		        Case 2
		          GenericTable.ListIndex = index - 1
		        End
		      End
		    End
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub AboutToShowMenu(menu As MenuItem)
		  if menu <> Nil and mTableTabClass <> Nil then
		    For i as Integer = 0 to menu.Count - 1
		      menu.Item(i).Checked = (i = mTableTabClass.RowsAddingType.GIAI)
		    Next
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TableDim
	#tag Event
		Sub Change(index as Integer)
		  // set the appropriate value of the dimension
		  if mUserSelectedTable <> nil then
		    If TableDim(index).Text = cAddRow Then
		      Dim DA As AttributeClass = mUserSelectedTable.GetAttribute(Table_StepClass.cDimension)
		      Dim DC As TableDimension_StepClass = mUserSelectedTable.GetDimension(DimLabel(index).Text)
		      If DC <> Nil And DA <> Nil Then
		        Dim d As new AddDimesionWindow(DimLabel(index).Text)
		        d.ShowModalWithin(MainWindow)
		        Dim newValue As String = d.CreatedName
		        DC.DimensionList.SOAA(DC.DimensionList.GOAN - 1)
		        DC.DimensionList.AddValue(newValue)
		        
		        Dim newDimesions(-1) As String
		        AllPossibleDimensions(mUserSelectedTable.FirstSubStep, newDimesions, "")
		        Dim item As String
		        For i as Integer = newDimesions.Ubound DownTo 0
		          item = newDimesions(i)
		          if not DA.ContainsValue(item) And item.InStr(newValue) = 0 Then
		            newDimesions.Remove(i)
		          End
		        Next
		        
		        For i as Integer = 0 to newDimesions.Ubound
		          item = newDimesions(i)
		          If Not DA.ContainsValue(item) Then
		            InsertRowInVerticalMode(i)
		            DA.SIAS(item, i)
		          End
		        Next
		        
		        RedrawTable(True, True)
		      End
		      Return
		    End
		  end
		  RedrawTable(True, False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HorizontalCB
	#tag Event
		Sub Action()
		  ChangeDisplayingMode
		  RedrawTable(True, False)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="darkModeEnabled"
		Visible=true
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
