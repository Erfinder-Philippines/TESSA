#tag Window
Begin Window BarcodeChoice
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   True
   HasBackColor    =   False
   Height          =   364
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
   Placement       =   0
   Resizeable      =   True
   Title           =   "Choose a Barcode"
   Visible         =   True
   Width           =   790
   Begin TextArea BarcodeTextArea
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
      Height          =   245
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   542
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   228
   End
   Begin PushButton PushButtonOk
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
      Left            =   668
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   311
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButtonCancel
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
      Left            =   542
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   335
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PushButton PushButtonAdd
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   True
      Caption         =   "<< add"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   542
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   311
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin TextField BarcodeName
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
      Left            =   542
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   277
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   228
   End
   Begin TabPanel TabPanel1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   355
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   3
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "User defined\rHistory"
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Value           =   0
      Visible         =   True
      Width           =   523
      Begin Listbox TypeListbox
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   True
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   1
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   24
         DropIndicatorVisible=   False
         Enabled         =   True
         FontName        =   "System"
         FontSize        =   0.0
         FontUnit        =   0
         GridLinesHorizontalStyle=   2
         GridLinesVerticalStyle=   0
         HasBorder       =   True
         HasHeader       =   False
         HasHorizontalScrollbar=   False
         HasVerticalScrollbar=   True
         HeadingIndex    =   -1
         Height          =   308
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   13
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         RowSelectionType=   0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Tooltip         =   ""
         Top             =   38
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   503
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
      Begin Listbox HistoryList
         AllowAutoDeactivate=   True
         AllowAutoHideScrollbars=   True
         AllowExpandableRows=   False
         AllowFocusRing  =   False
         AllowResizableColumns=   False
         AllowRowDragging=   False
         AllowRowReordering=   False
         Bold            =   False
         ColumnCount     =   3
         ColumnWidths    =   ""
         DataField       =   ""
         DataSource      =   ""
         DefaultRowHeight=   24
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
         Height          =   308
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   "Content	Serial No	Date"
         Italic          =   False
         Left            =   13
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         RequiresSelection=   False
         RowSelectionType=   0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Tooltip         =   ""
         Top             =   38
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   503
         _ScrollOffset   =   0
         _ScrollWidth    =   -1
      End
   End
   Begin PushButton PushButtonOkClose
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "OK & close"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   668
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   335
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  OpenUserList
		  OpenHistoryList
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub OpenHistoryList()
		  Dim BFolder as string = GetWorkingFolder+"Barcodes"+PathSeparator+"ScannedBarcodes"
		  Dim bf as FolderItem = GetFolderItem(BFolder)
		  
		  if (bf<>nil) and bf.exists and bf.Directory then
		    Dim f as FolderItem
		    Dim n as integer
		    Dim Content as string
		    Dim t As TextInputStream = Nil 
		    Dim ShTime as string
		    HistoryList.DeleteAllRows
		    for n=1 to bf.Count
		      f = bf.Item(n)
		      if not(f.Directory) and not(f.DisplayName.Mid(1,2)="._") then
		        
		        t=TextInputStream.Open(f)
		        if t<>nil then
		          Content=t.ReadAll(Encodings.UTF8)
		          t.Close
		          HistoryList.AddRow(Content)
		        else
		          HistoryList.AddRow(f.DisplayName)
		        end
		        
		        HistoryList.Cell(HistoryList.ListCount-1,1)=f.DisplayName
		        ShTime = f.ModificationDate.ShortTime
		        if ShTime.Instr(1,":")=2 then
		          ShTime="0"+ShTime
		        end
		        HistoryList.Cell(HistoryList.ListCount-1,2)=f.ModificationDate.ShortDate+" "+ShTime
		      end
		    next
		    HistoryList.SortedColumn=2
		    HistoryList.ColumnSortDirection(2)=-1
		    HistoryList.Sort
		    TabPanel1.Value=1       
		  else
		    MsgBox("No 'Barcodes/ScannedBarcodes'-folder in working folder found")
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenUserList()
		  Dim BFolder as string = GetWorkingFolder+"Barcodes"
		  Dim bf as FolderItem = GetFolderItem(BFolder)
		  
		  if (bf<>nil) and bf.exists and bf.Directory then
		    Dim f as FolderItem
		    Dim n as integer
		    TypeListbox.DeleteAllRows
		    for n=1 to bf.Count
		      f = bf.Item(n)
		      if not(f.Directory) and not(f.DisplayName.Mid(1,2)="._") then
		        TypeListbox.AddRow(f.DisplayName)
		      end
		    next
		  else
		    MsgBox("No 'barcodes'-folder in working folder found")
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBarcode(CloseAfter as boolean)
		  if BarcodeTextArea.Text<>"" then
		    Dim c As new Clipboard
		    c.Text = BarcodeTextArea.Text
		    c.close
		    Dim BS as BasicClass = App.EventLoop.GetActiveMeasStep
		    If (BS<>Nil) Then
		      
		    end
		  end
		  
		  If CloseAfter Then
		    
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ChosenBarcode As string
	#tag EndProperty


#tag EndWindowCode

#tag Events PushButtonOk
	#tag Event
		Sub Action()
		  SetBarCode(false)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButtonCancel
	#tag Event
		Sub Action()
		  BarcodeChoice.close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButtonAdd
	#tag Event
		Sub Action()
		  if (BarcodeTextArea.Text<>"") and (BarcodeName.Text<>"") then
		    // find if Name exists
		    Dim BCF as string = GetWorkingFolder+"Barcodes"+PathSeparator+BarcodeName.Text
		    Dim bf as FolderItem = GetFolderItem(BCF)
		    if (bf<>nil) then
		      if bf.exists then
		        MsgBox("Please choose a different name")
		      else
		        Dim ErrS as string =""
		        if File_Save(BarcodeTextArea.Text,ErrS,bf.NativePath,"",1,true,false) then
		          TypeListbox.AddRow(BarcodeName.Text)
		        else
		          MsgBox(ErrS)
		        end
		      end
		    else
		      MsgBox("Folder could not be found or opend!")
		    end
		  else
		    MsgBox("Barcode and name must be defined!")
		  end
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TypeListbox
	#tag Event
		Sub Change()
		  Dim BCN as string = TypeListbox.Cell(TypeListbox.ListIndex,0)
		  Dim BC as string = GetWorkingFolder+"Barcodes"+PathSeparator+BCN
		  if BC<>"" then
		    Dim BarcodeContent as string = ""
		    if File_Load(BarcodeContent,BC) then
		      ChosenBarcode=BarcodeContent
		      BarcodeTextArea.Text=ChosenBarcode
		      BarcodeName.Text=BCN
		    end
		  else
		    MsgBox("No 'barcodes'-folder in working folder found")
		  end
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HistoryList
	#tag Event
		Sub Change()
		  Dim BCN as string = HistoryList.Cell(HistoryList.ListIndex,1)
		  Dim BC as string = GetWorkingFolder+"Barcodes"+PathSeparator+"ScannedBarcodes"+PathSeparator+BCN
		  if BC<>"" then
		    Dim BarcodeContent as string = ""
		    if File_Load(BarcodeContent,BC) then
		      ChosenBarcode=BarcodeContent
		      BarcodeTextArea.Text=ChosenBarcode
		      BarcodeName.Text=BCN
		    end
		  else
		    MsgBox("No 'barcodes'-folder in working folder found")
		  end
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PushButtonOkClose
	#tag Event
		Sub Action()
		  SetBarCode(true)
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
		Name="ChosenBarcode"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="string"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=false
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
		Visible=false
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
		Visible=false
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
