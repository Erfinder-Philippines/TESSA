#tag Window
Begin Window SyncProgressWindow
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   280
   ImplicitInstance=   True
   LiveResize      =   "True"
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   False
   Title           =   "Sync"
   Visible         =   True
   Width           =   660
   Begin ProgressBar MainProgressBar
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   22
      Indeterminate   =   False
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      Scope           =   2
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   "True"
      Tooltip         =   ""
      Top             =   40
      Transparent     =   False
      Value           =   0.0
      Visible         =   True
      Width           =   525
   End
   Begin Label CurrentFileLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   40
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   110
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   200
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   539
   End
   Begin Label CurrentSyncLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   108
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   639
   End
   Begin Label CurrentFolderLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   40
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   110
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   155
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   545
   End
   Begin Timer UpdateTimer
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   10
      RunMode         =   0
      Scope           =   2
      TabPanelIndex   =   0
   End
   Begin ProgressBar CurrentFileProgressBar
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   20
      Indeterminate   =   False
      Index           =   0
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      Scope           =   2
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   "True"
      Tooltip         =   ""
      Top             =   240
      Transparent     =   False
      Value           =   0.0
      Visible         =   True
      Width           =   639
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
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   2
      Selectable      =   False
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Current Folder:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   155
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   108
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
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   10
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
      Text            =   "Curent File:"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   200
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   108
   End
   Begin Separator CurrentSeparator
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   3
      Index           =   0
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   270
      Transparent     =   False
      Visible         =   True
      Width           =   660
   End
   Begin ProgressBar CurrentSyncProgressBar
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   20
      Indeterminate   =   False
      Index           =   0
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumValue    =   100
      Scope           =   2
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   "True"
      Tooltip         =   ""
      Top             =   130
      Transparent     =   False
      Value           =   0.0
      Visible         =   True
      Width           =   639
   End
   Begin Label SynFolderLabel
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
      Left            =   -5
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
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   75
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   35
   End
   Begin Separator Separator2
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   4
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   2
      TabIndex        =   18
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   96
      Transparent     =   False
      Visible         =   True
      Width           =   660
   End
   Begin Label CurrentLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   40
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   2
      Selectable      =   False
      TabIndex        =   19
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "1"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   10
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   549
   End
   Begin ImageWell SyncImage
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   80
      Image           =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   2
      TabIndex        =   20
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   8
      Transparent     =   False
      Visible         =   True
      Width           =   80
   End
   Begin BevelButton CancelButton
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      BackgroundColor =   &c00000000
      BevelStyle      =   5
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
      Icon            =   1782114303
      IconAlignment   =   1
      IconDeltaX      =   0
      IconDeltaY      =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   623
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuStyle       =   0
      MenuValue       =   "0"
      Scope           =   0
      TabIndex        =   21
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   40
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   37
   End
   Begin DisclosureTriangle DetailsTriangle
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      Enabled         =   True
      FacingDirection =   0
      Height          =   18
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   100
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   22
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   62
      Transparent     =   False
      Value           =   True
      Visible         =   True
      Width           =   18
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  If mWorkerThread = Nil Then
		    Close
		  Else
		    If InitControls Then
		      DetailsTriangle.Value = False
		      UpdateTimer.Mode = Timer.ModeMultiple
		      UpdateData
		    Else
		      Close
		    End
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub CheckFinish()
		  If mWorkerThread.TransferLocation.Status.GIAI > 1 Then
		    Close
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(worker As WorkerThread)
		  // Calling the overridden superclass constructor.
		  mWorkerThread = worker
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InitControls() As Boolean
		  mSyncItems = mWorkerThread.AllTransferClasses(mWorkerThread.TransferLocation)
		  Dim count As Integer = mSyncItems.Ubound
		  
		  Dim newCurrentSyncLabel As CurrentSyncLabel
		  Dim newCurrentSyncProgressBar As CurrentSyncProgressBar
		  Dim newLabel1 As Label1
		  Dim newCurrentFolderLabel As CurrentFolderLabel
		  Dim newLabel2 As Label2
		  Dim newCurrentFileLabel As CurrentFileLabel
		  Dim newCurrentFileProgressBar As CurrentFileProgressBar
		  Dim newCurrentSeparator As CurrentSeparator
		  
		  For i As Integer = 1 To count
		    newCurrentSyncLabel = New CurrentSyncLabel
		    newCurrentSyncLabel.Top = CurrentSyncLabel(i - 1).Top + cSectionHeight
		    newCurrentSyncLabel.Visible = CurrentSyncLabel(i - 1).Visible
		    
		    newCurrentSyncProgressBar = New CurrentSyncProgressBar
		    newCurrentSyncProgressBar.Top = CurrentSyncProgressBar(i - 1).Top + cSectionHeight
		    newCurrentSyncProgressBar.Visible= CurrentSyncProgressBar(i - 1).Visible
		    
		    newLabel1 = New Label1
		    newLabel1.Top = Label1(i - 1).Top + cSectionHeight
		    newLabel1.Visible = Label1(i - 1).Visible
		    
		    newCurrentFolderLabel = New CurrentFolderLabel
		    newCurrentFolderLabel.Top = CurrentFolderLabel(i - 1).Top + cSectionHeight
		    newCurrentFolderLabel.Visible = CurrentFolderLabel(i - 1).Visible
		    
		    newLabel2 = New Label2
		    newLabel2.Top = Label2(i - 1).Top + cSectionHeight
		    newLabel2.Visible = Label2(i - 1).Visible
		    
		    newCurrentFileLabel = New CurrentFileLabel
		    newCurrentFileLabel.Top = CurrentFileLabel(i - 1).Top + cSectionHeight
		    newCurrentFileLabel.Visible = CurrentFileLabel(i - 1).Visible
		    
		    newCurrentFileProgressBar = New CurrentFileProgressBar
		    newCurrentFileProgressBar.Top = CurrentFileProgressBar(i - 1).Top + cSectionHeight
		    newCurrentFileProgressBar.Visible = CurrentFileProgressBar(i - 1).Visible
		    
		    newCurrentSeparator = New CurrentSeparator
		    newCurrentSeparator.Top = CurrentSeparator(i - 1).Top + cSectionHeight
		    newCurrentSeparator.Visible = CurrentSeparator(i - 1).Visible
		  Next
		  Return mSyncItems.Ubound >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateCurrents()
		  CurrentLabel.Text = mWorkerThread.TransferLocation.CurrentFile.GIAS
		  Dim count As Integer = mSyncItems.Ubound
		  If count >= 0 And CurrentSyncLabel(0).Visible Then
		    For i As Integer = 0 To count
		      Dim syncItem As SyncBasicItem = mSyncItems(i)
		      CurrentSyncLabel(i).Text = syncItem.Name.GIAS
		      CurrentSyncProgressBar(i).Value = syncItem.Progress.GIAI
		      If syncItem IsA SYNCModule.SYNC_Folder Then
		        Dim syncFolderItem As SYNCModule.SYNC_Folder = SYNCModule.SYNC_Folder(syncItem)
		        CurrentFolderLabel(i).Text = syncFolderItem.CurrentFolder.GIAS
		        CurrentFileLabel(i).Text = syncFolderItem.CurrentFile.GIAS
		        CurrentFileProgressBar(i).Value = syncFolderItem.CurrentProgress.GIAI
		      End
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateData()
		  Title = mWorkerThread.TransferLocation.Name.GIAS
		  SyncImage.Image = ElementTypeFactory.instance.GetBasicStepBigIcon(mWorkerThread.TransferLocation)
		  UpdateMainProgress
		  UpdateCurrents
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateMainProgress()
		  MainProgressBar.Value = mWorkerThread.TransferLocation.Progress.GIAI
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mSyncItems(-1) As SyncBasicItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWorkerThread As WorkerThread = nil
	#tag EndProperty


	#tag Constant, Name = cBaseHeight, Type = Double, Dynamic = False, Default = \"95", Scope = Private
	#tag EndConstant

	#tag Constant, Name = cSectionHeight, Type = Double, Dynamic = False, Default = \"175", Scope = Private
	#tag EndConstant


#tag EndWindowCode

#tag Events UpdateTimer
	#tag Event
		Sub Action()
		  UpdateMainProgress
		  UpdateCurrents
		  CheckFinish
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CancelButton
	#tag Event
		Sub Action()
		  If mWorkerThread <> Nil And mWorkerThread.TransferLocation.isRunning Then
		    mWorkerThread.TransferLocation.Cancel
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DetailsTriangle
	#tag Event
		Sub Action()
		  Dim isFull As Boolean = Me.Value
		  
		  Dim count As Integer = mSyncItems.Ubound
		  For i As Integer = 0 To count
		    CurrentSyncLabel(i).Visible = isFull
		    CurrentSyncProgressBar(i).Visible = isFull
		    Label1(i).Visible = isFull
		    CurrentFolderLabel(i).Visible = isFull
		    Label2(i).Visible = isFull
		    CurrentFileLabel(i).Visible = isFull
		    CurrentFileProgressBar(i).Visible = isFull
		    CurrentSeparator(i).Visible = isFull
		  Next
		  
		  If isFull Then
		    Self.Height = cBaseHeight + (count + 1) * cSectionHeight
		  Else
		    Self.Height = cBaseHeight
		    UpdateCurrents
		  End
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
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
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
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=false
		Group="Behavior"
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
		Group="Frame"
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
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
