#tag Window
Begin GraphicalTabContainer GraphTabContainer Implements TabInterface
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
   Height          =   694
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
   Width           =   952
   Begin GroupBox GroupBox1
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Zoom/Pan"
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   76
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   250
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   6
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   209
      Begin RadioButton ZoomOutRadio
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   261
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   51
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   80
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
            InitialParent   =   "ZoomOutRadio"
            Italic          =   False
            Left            =   280
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
            Text            =   "Zoom out"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   51
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   60
         End
      End
      Begin RadioButton PanRadio
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   374
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   26
         Transparent     =   False
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   80
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
            InitialParent   =   "PanRadio"
            Italic          =   False
            Left            =   394
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
            Text            =   "Pan"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   26
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   60
         End
      End
      Begin PushButton Graph_ResetZoom
         AllowAutoDeactivate=   True
         Bold            =   False
         Cancel          =   False
         Caption         =   "Reset Zoom"
         Default         =   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   11.0
         FontUnit        =   2
         Height          =   24
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   379
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         MacButtonStyle  =   6
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   52
         Transparent     =   False
         Underline       =   False
         Visible         =   False
         Width           =   80
      End
      Begin RadioButton ZoomInRadio
         AllowAutoDeactivate=   True
         Bold            =   False
         Caption         =   ""
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         Height          =   20
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   261
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   2
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Tooltip         =   ""
         Top             =   31
         Transparent     =   False
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   80
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
            InitialParent   =   "ZoomInRadio"
            Italic          =   False
            Left            =   280
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
            Text            =   "Zoom in"
            TextAlignment   =   0
            TextColor       =   &c00000000
            Tooltip         =   ""
            Top             =   31
            Transparent     =   False
            Underline       =   False
            Visible         =   True
            Width           =   60
         End
      End
   End
   Begin PushButton Graph_Configure
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Configure"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   132
   End
   Begin PushButton Graph_CopyToClipboard
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Copy to Clipboard"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   51
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   132
   End
   Begin PushButton Graph_SaveAs
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save as"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   164
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   6
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   51
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   76
   End
   Begin ViewportCanvas Graphcanvas
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      CleanGraphicsBeforeDrawing=   False
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   590
      Index           =   -2147483648
      InitialParent   =   ""
      lastpicture     =   0
      Left            =   15
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      myCanvasMouseX  =   0
      myCanvasMouseY  =   0
      Overlay         =   0
      rectangleHeight =   0
      rectangleLeft   =   0
      rectanglePicture=   0
      rectangleTop    =   0
      rectangleWidth  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   88
      Transparent     =   True
      Visible         =   True
      Width           =   912
      ZoomMode        =   0
   End
   Begin PopupMenu pm_LineType
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
      InitialParent   =   ""
      InitialValue    =   "Line\nPoints\nLine+Points\nBargraph\nUpperLimit\nLowerLimit"
      Italic          =   False
      Left            =   471
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "type of curve to be shown"
      Top             =   45
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   113
   End
   Begin ComboBox cb_PenWidth
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
      Height          =   19
      Hint            =   ""
      Index           =   -2147483648
      InitialValue    =   "1\r\n2\r\n3\r\n4\r\n5"
      Italic          =   False
      Left            =   708
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Pen-Width of the curve"
      Top             =   50
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   62
   End
   Begin Rectangle ColorChoice
      AllowAutoDeactivate=   True
      BorderThickness =   1.0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFB010600
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   782
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   47
      TopLeftColor    =   &c00000000
      Transparent     =   True
      Visible         =   True
      Width           =   36
   End
   Begin PopupMenu pm_CurveVisibility
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
      InitialParent   =   ""
      InitialValue    =   "Active-1\nActive\nAll\nNone"
      Italic          =   False
      Left            =   830
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Define what part of the data is visible, Active-1 means the graph stops before the active point"
      Top             =   45
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   97
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
      Left            =   471
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
      Text            =   "Graph Type"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   75
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
      Left            =   708
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Pen Width"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   62
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
      Left            =   782
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
      Text            =   "Color"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   36
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
      Left            =   830
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Curve visible to"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   102
   End
   Begin PopupMenu pm_PointForm
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
      InitialParent   =   ""
      InitialValue    =   "Rectangle\nCircle\nTriangle\nCross"
      Italic          =   False
      Left            =   596
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   17
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "type of curve to be shown"
      Top             =   45
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
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
      Left            =   596
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Point Form"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   75
   End
   Begin Timer Timer1
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   500
      RunMode         =   2
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DarkModeTabElements(value as Boolean)
		  Graphcanvas.darkModeEnabled = value
		  
		  Dim labelColor As Color
		  If value Then
		    Self.BackgroundColor = &c2D3137
		    labelColor = Color.White
		  Else
		    Self.BackgroundColor = &cF5F6F7
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

	#tag Event
		Sub Open()
		  EnableControls(False)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return New GraphTabContainer(Self.mGraphTabClass)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mGraphTabClass = GraphTabClass(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentGraphPicture() As Picture
		  If UserSelectedGraph <> Nil Then
		    'Dim pic As New Picture(Graphcanvas.Width, Graphcanvas.Height, 32)
		    'UserSelectedGraph.Paint(pic.Graphics, 0)
		    'Return pic
		    
		    Dim chart As CDXYChartMBS = UserSelectedGraph.GetGraphChart
		    If chart <> Nil Then
		      Return chart.makeChartPicture
		    End If
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub EnableControls(enabled As Boolean)
		  //set the controls begin state
		  Graphcanvas.Visible = enabled
		  
		  Graph_Configure.Enabled = enabled
		  Graph_ResetZoom.Enabled = enabled
		  Graph_SaveAs.Enabled = enabled
		  Graph_CopyToClipboard.Enabled = enabled
		  
		  if UserSelectedCurve = nil then
		    pm_LineType.Enabled = false
		    pm_PointForm.Enabled = false
		    pm_CurveVisibility.Enabled = false
		    cb_PenWidth.Enabled = false
		    ColorChoice.Enabled = false
		    'Label1.Enabled = False
		    'Label2.Enabled = false
		    'Label3.Enabled = false
		    'Label4.Enabled = false
		    'Label5.Enabled = false
		  else
		    cb_PenWidth.Text=UserSelectedCurve.PenWidth.GIAS
		    pm_LineType.ListIndex=UserSelectedCurve.GraphType.GIAI
		    pm_PointForm.ListIndex=UserSelectedCurve.PointType.GIAI
		    pm_CurveVisibility.ListIndex=UserSelectedCurve.ValueMode.GIAI
		    ColorChoice.FillColor=UserSelectedCurve.LineColor.GIAC
		    pm_LineType.Enabled = enabled
		    pm_PointForm.Enabled = enabled
		    pm_CurveVisibility.Enabled = enabled
		    cb_PenWidth.Enabled = enabled
		    ColorChoice.Enabled = enabled
		    'Label1.Enabled = enabled
		    'Label2.Enabled = enabled
		    'Label3.Enabled = enabled
		    'Label4.Enabled = enabled
		    'Label5.Enabled = enabled
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserSelectedGraph() As Graph_StepClass
		  return UserSelectedGraph
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Redraw()
		  Graphcanvas.redraw
		  Graphcanvas.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StepSelected(BS as BasicClass)
		  // select appropriate graph and display it
		  Dim LS as BasicClass = BS
		  If LS IsA Graph_StepClass Then
		    UserSelectedGraph = Graph_StepClass(LS)
		    UserSelectedCurve = Nil
		    Redraw
		  elseif LS IsA XYCurve_StepClass then
		    if LS.UpperStep<>nil then UserSelectedGraph = Graph_StepClass(LS.UpperStep)
		    UserSelectedCurve = XYCurve_StepClass(LS)
		  elseif LS IsA HMI_GraphDataPlot_StepClass then
		    UserSelectedGraph1 = HMI_GraphDataPlot_StepClass(LS)
		  else
		    UserSelectedGraph = Nil
		  End
		  
		  If UserSelectedGraph <> Nil Then
		    Graphcanvas.mHMIGraphClass = UserSelectedGraph
		    Graphcanvas.redraw
		  End If
		  
		  EnableControls (UserSelectedGraph <> Nil)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Zoom()
		  If UserSelectedGraph <> Nil Then
		    Dim viewportZoomMode As Integer = 0
		    // 0 is Pan
		    // 1 is Zoom in
		    // 2 is Zoom out
		    
		    If PanRadio.Value Then
		      viewportZoomMode  = 0
		    Elseif ZoomInRadio.Value Then
		      viewportZoomMode  = 1
		    Elseif ZoomOutRadio.Value Then
		      viewportZoomMode  = 2
		    Else
		      viewportZoomMode  = 0
		      PanRadio.Value = True
		    End If
		    
		    Graphcanvas.ZoomMode = viewportZoomMode
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Zoom(Mode as integer, X as integer, Y as integer)
		  If UserSelectedGraph()<>Nil Then
		    Select case Mode
		    case 0 // Initialize zoom
		      Graph_ResetZoom.Visible=true
		      Graph_ResetZoom.Enabled=true
		      UserSelectedGraph().Zoom(0, X, Y)
		    case 1 // set zoom
		      Graph_ResetZoom.Visible=true
		      Graph_ResetZoom.Enabled=true
		      'UserSelectedGraph().Zoom(1, X, Y)
		    case 2 // reset zoom
		      Graph_ResetZoom.Visible=false
		      Graph_ResetZoom.Enabled=false
		      UserSelectedGraph().Zoom(2, X, Y)
		    end
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		drawSelection As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mGraphTabClass As GraphTabClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		mouseOldX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mouseOldY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		UserSelectedCurve As XYCurve_StepClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UserSelectedGraph As Graph_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UserSelectedGraph1 As HMI_GraphDataPlot_StepClass = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events ZoomOutRadio
	#tag Event
		Sub Action()
		  Zoom
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PanRadio
	#tag Event
		Sub Action()
		  Zoom
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Graph_ResetZoom
	#tag Event
		Sub Action()
		  Zoom(2,0,0)
		  Invalidate(false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ZoomInRadio
	#tag Event
		Sub Action()
		  Zoom
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Graph_Configure
	#tag Event
		Sub Action()
		  If UserSelectedGraph <> Nil Then
		    GraphProperties.Show
		    Redraw()
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Graph_CopyToClipboard
	#tag Event
		Sub Action()
		  if UserSelectedGraph <> Nil Then
		    Dim clip As new Clipboard
		    clip.Picture = CurrentGraphPicture
		    clip.Close
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Graph_SaveAs
	#tag Event
		Sub Action()
		  Dim pic As Picture = CurrentGraphPicture
		  if pic <> Nil Then
		    Dim name As String = UserSelectedGraph.Name.GIAS
		    if name.Right(4) <> ".png" And name.Right(4) <> ".PNG" Then
		      name = name + ".png"
		    End
		    dim f as FolderItem = GetSaveFolderItem(FileTypes1.Png, name)
		    if f <> Nil Then
		      pic.Save(f, Picture.SaveAsPNG)
		    End
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Graphcanvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  If UserSelectedGraph <> Nil Then
		    g.FillRectangle 0,0,g.Width,g.Height
		    UserSelectedGraph.Paint(g, 2, 0, 0)
		    
		    Zoom(2,0,0)
		    'UserSelectedGraph.Paint(g, 1)
		    
		    
		    'If UserSelectedGraph <> nil Then
		    'GetUserSelectedGraph.trackLineLegend(mouseOldX,mouseOldY)
		    'g.DrawPicture CurrentGraphPicture,0,0
		    'End If
		    
		    'return
		    
		    'If UserSelectedGraph <> nil Then
		    'Graphcanvas.setChart(UserSelectedGraph.GetGraphChart)
		    'End If
		    
		    If Me.overlay <> Nil Then
		      g.DrawPicture Me.overlay,0,0
		    Else
		      g.DrawPicture Me.lastpicture,0,0
		      
		      If Me.rectangleWidth > 0 Then
		        g.DrawPicture Me.rectanglePicture, Me.rectangleLeft, Me.rectangleTop, Me.rectangleWidth, Me.rectangleHeight, 0, 0, Me.rectanglePicture.Width, Me.rectanglePicture.Height
		      End If
		    End If
		    
		    
		  End
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  Me.EventMouseDown(X,Y)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  // end zoom
		  'Zoom(2,0,0)
		  
		  Me.EventMouseUp(X,Y)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  Me.EventMouseDrag(X,Y)
		End Sub
	#tag EndEvent
	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  mouseOldX = x
		  mouseOldY = y
		  
		  Me.EventMouseMove(X,Y)
		End Sub
	#tag EndEvent
	#tag Event
		Sub SetKeyboardTimer(value As Integer)
		  Timer1.Mode = value
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pm_LineType
	#tag Event
		Sub Change()
		  UserSelectedCurve.GraphType.SIAI(pm_LineType.ListIndex)
		  Redraw()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cb_PenWidth
	#tag Event
		Sub Change()
		  UserSelectedCurve.PenWidth.SIAS(cb_PenWidth.Text)
		  Redraw()
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ColorChoice
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  Dim col as Color = ColorChoice.FillColor
		  Dim ok as Boolean = SelectColor(col, "Select custom color")
		  if ok then
		    ColorChoice.FillColor = col
		    UserSelectedCurve.LineColor.SIAC(col)
		  end
		  Redraw()
		  Return true
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pm_CurveVisibility
	#tag Event
		Sub Change()
		  UserSelectedCurve.ValueMode.SIAI(pm_CurveVisibility.ListIndex)
		  Redraw
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pm_PointForm
	#tag Event
		Sub Change()
		  UserSelectedCurve.PointType.SIAI(pm_PointForm.ListIndex)
		  Redraw()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  Graphcanvas.UpdateMouseCursor
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
	#tag ViewProperty
		Name="mouseOldX"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="mouseOldY"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="drawSelection"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
