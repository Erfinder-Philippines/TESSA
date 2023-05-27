#tag Window
Begin ContainerControl EEPROMTabContainer Implements TabInterface
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
   Height          =   582
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   "Add an EEPROM to the local storage"
   Top             =   32
   Transparent     =   True
   Visible         =   True
   Width           =   954
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
      Left            =   686
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
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   47
   End
   Begin PopupMenu EEPROMSectionSelection
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
      InitialValue    =   "no Section selected"
      Italic          =   False
      Left            =   430
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
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   244
   End
   Begin PopupMenu EEPROMSelection
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
      InitialValue    =   "no EEPROMs definied\n------------------"
      Italic          =   False
      Left            =   108
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   305
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
      Height          =   492
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   108
      LockBottom      =   True
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
      Top             =   70
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   826
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton EEPROM_Send
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "send"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
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
      Top             =   196
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   76
   End
   Begin PushButton EEPROM_Receive
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "receive"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   164
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   76
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
      InitialValue    =   "DEF\nHEX\nNUM\nCHAR"
      Italic          =   False
      Left            =   742
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
      Tooltip         =   ""
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   82
   End
   Begin PushButton EEPROM_Save
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "save"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   100
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   75
   End
   Begin PushButton EEPROM_Load
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "load"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   68
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   75
   End
   Begin PushButton AddEEPROM
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   29
   End
   Begin PushButton DeleteEEPROM
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
      InitialParent   =   ""
      Italic          =   False
      Left            =   60
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   37
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   29
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  If mEEPROMTabClass <> Nil Then
		    mEEPROMTabClass.InitTab
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub ADD_EEPROMSectionSelection(FS as BasicClass)
		  While FS <> Nil
		    ADD_EEPROMSectionSelection(FS.FirstSubStep)
		    If FS IsA EEPROM_Module.EEPROM_Content_StepClass Then
		      EEPROMSectionSelection.AddRow(FS.Name.GIAS)
		      EEPROMSectionSelection.RowTag(EEPROMSectionSelection.ListCount - 1) = FS.GetUniqueID
		    End
		    FS = FS.NextStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Add_EEPROMSelection(Name as string, RowTag As String)
		  // adds a table in the table-selection-list
		  // if it is the first entry then "no tables definied" is being removed
		  
		  if  EEPROMSelection.Text = "no EEPROMs definied" then
		    EEPROMSelection.DeleteAllRows
		  end
		  For i As Integer = 0 to EEPROMSelection.ListCount - 1
		    If EEPROMSelection.List(i) = Name Then
		      Return
		    End
		  Next
		  
		  EEPROMSelection.AddRow(Name)
		  EEPROMSelection.RowTag(EEPROMSelection.ListCount - 1) = RowTag
		  
		  'If EEPROMSelection.ListCount = 1 Then
		  'EEPROMSelection.ListIndex = 0
		  'EEPROMSelection.AddRow("------------------")
		  ''EEPROMSelection.AddRow("Add free EEPROM storage")
		  'End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return  New EEPROMTabContainer(Self.mEEPROMTabClass)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mEEPROMTabClass = EEPROMTabClass(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Redraw_EEPROM_Table()
		  If UserSelectedEEPROM <> Nil Then
		    // EEPROM has been selected, set it as Standard EEPROM
		    Dim n As Integer = 0
		    For i As Integer = 0 to (UserSelectedEEPROM.EEPROM.Size/16-1)
		      If  i >= EPTab.ListCount Then
		        EPTab.AddRow
		      End
		      EPTab.Cell(i, 0) = Hex(i * 16)
		      EPTab.CellBold(i, 0) = False
		      Select Case EPROMView.Text
		      Case Is = "HEX"
		        For k As Integer = 0 To 15
		          'EPTab.Cell(i, k + 1) = StrHex(UserSelectedEEPROM.EEPROM.EP(n).BY, 2)
		          EPTab.Cell(i, k + 1) = UserSelectedEEPROM.EEPROM.GetFormatedContent(n,0)
		          EPTab.CellBold(i, k + 1) = False
		          n = n + 1
		        Next
		      Case Is = "NUM"
		        For k As Integer = 0 To 15
		          'EPTab.Cell(i, k + 1) = Str(UserSelectedEEPROM.EEPROM.EP(n).BY)
		          EPTab.Cell(i, k + 1) = UserSelectedEEPROM.EEPROM.GetFormatedContent(n,3)
		          EPTab.CellBold(i, k + 1) = False
		          n = n + 1
		        Next
		      Case Is = "CHAR"
		        For k As Integer = 0 to 15
		          'EPTab.Cell(i, k + 1) = chr(UserSelectedEEPROM.EEPROM.EP(n).BY)
		          EPTab.Cell(i, k + 1) = UserSelectedEEPROM.EEPROM.GetFormatedContent(n,2)
		          EPTab.CellBold(i, k + 1) = False
		          n = n + 1
		        Next
		      case is = "DEF"
		        For k As Integer = 0 to 15
		          'EPTab.Cell(i, k + 1) = chr(UserSelectedEEPROM.EEPROM.EP(n).BY)
		          EPTab.Cell(i, k + 1) = UserSelectedEEPROM.EEPROM.GetFormatedContent(n,-1)
		          EPTab.CellBold(i, k + 1) = False
		          n = n + 1
		        Next
		      End
		    Next
		    Dim LowP, HighP,Segm As Integer
		    Segm = val(SegmentSelection.Text) * (EEPROMHighMark-EEPROMLowMark + 1)
		    LowP = EEPROMLowMark + Segm
		    HighP = EEPROMHighMark + Segm
		    If (LowP > -1) and (HighP>0) and  (HighP >= LowP) Then
		      For n = LowP to HighP
		        EPTab.CellBold((n / 16), (n mod 16)+ 1) = True
		      Next
		    End
		  Else
		    // no EEPROM has been selected
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove_EEPROMSelection(EEPROM As EEPROM_Module.HMI_EEPROM_StepClass)
		  If EEPROM <> Nil Then
		    For i As Integer = 0 to EEPROMSelection.ListCount - 1
		      If EEPROMSelection.RowTag(i) = EEPROM.GetUniqueID Then
		        EEPROMSelection.RemoveRow(i)
		        If i = EEPROMSelection.ListIndex Then
		          EEPROMSelection.ListIndex = 0
		        End
		        Exit
		      End
		    Next
		    If EEPROMSelection.ListCount <= 0 Then
		      UserSelectedEEPROM = Nil
		      Add_EEPROMSelection("no EEPROMs definied", "no EEPROMs definied")
		      EEPROMSectionSelection.DeleteAllRows
		      EEPROMSectionSelection.AddRow("no Section selected")
		      EEPROMSectionSelection.ListIndex = 0
		      EPTab.DeleteAllRows
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StepSelected(BS as BasicClass)
		  // Nothing to do here, apparently, because this class does not use any data from the current step
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateEEPROMTab(UpdateAttribute As AttributeClass)
		  If UpdateAttribute <> Nil Then
		    Dim BS As BasicClass = UpdateAttribute.MyStep
		    if (BS <> Nil) And (BS IsA EEPROM_Module.HMI_EEPROM_StepClass) Then
		      Select Case UpdateAttribute.Name
		      Case "Name"
		        For i As Integer = 0 to EEPROMSelection.ListCount - 1
		          if EEPROMSelection.RowTag(i) = BS.GetUniqueID Then
		            EEPROMSelection.RemoveRow(i)
		            EEPROMSelection.InsertRow(i, UpdateAttribute.GIAS)
		            EEPROMSelection.RowTag(i) = BS.GetUniqueID
		            EEPROMSelection.ListIndex = i
		            Exit
		          End
		        Next
		      End
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private EEPROMHighMark As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EEPROMLowMark As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LocalEEPROM() As EEPROM_Module.HMI_EEPROM_StepClass
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mEEPROMTabClass As EEPROMTabClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UserSelectedEEPROM As EEPROM_Module.HMI_EEPROM_StepClass = nil
	#tag EndProperty


#tag EndWindowCode

#tag Events SegmentSelection
	#tag Event
		Sub Change()
		  Redraw_EEPROM_Table
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EEPROMSectionSelection
	#tag Event
		Sub Change()
		  //find EEPROM_StepClass
		  If mEEPROMTabClass <> Nil And mEEPROMTabClass.GetGlobalTopmostElement <> Nil Then
		    If Me.ListIndex >= 0 And Me.ListIndex < Me.ListCount Then
		      Dim FS As BasicClass = mEEPROMTabClass.GetGlobalTopmostElement.FindElementByUniqueID(Me.RowTag(Me.ListIndex))
		      If FS <> Nil And FS IsA EEPROM_Module.EEPROM_Content_StepClass Then
		        Dim ES As EEPROM_Module.EEPROM_Content_StepClass = EEPROM_Module.EEPROM_Content_StepClass(FS)
		        //Mark fields
		        EEPROMLowMark = ES.Byte_Offset.GIAI
		        EEPROMHighMark = ES.Byte_Offset.GIAI + ES.Size.GIAI - 1
		        Redraw_EEPROM_Table
		      End
		    End
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EEPROMSelection
	#tag Event
		Sub Change()
		  // select appropriate eeprom and display it
		  If mEEPROMTabClass <> Nil And mEEPROMTabClass.GetGlobalTopmostElement <> Nil Then
		    if Me.ListIndex >= 0 And Me.ListIndex < Me.ListCount Then
		      UserSelectedEEPROM = EEPROM_Module.HMI_EEPROM_StepClass(mEEPROMTabClass.GetGlobalTopmostElement.FindElementByUniqueID(Me.RowTag(Me.ListIndex)))
		      
		      //Fill section selection popup menu
		      If UserSelectedEEPROM <> Nil Then
		        EEPROMSectionSelection.DeleteAllRows
		        ADD_EEPROMSectionSelection(UserSelectedEEPROM.FirstSubStep)
		        If EEPROMSectionSelection.ListCount = 0 Then
		          EEPROMSectionSelection.AddRow("no Section selected")
		        End
		      else
		        for i as integer = 0 to UBound(LocalEEPROM())
		          if LocalEEPROM(i).GetUniqueID=Me.RowTag(Me.ListIndex) then
		            UserSelectedEEPROM=LocalEEPROM(i)
		          end
		        next
		      End
		      Redraw_EEPROM_Table
		    End
		  End
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
		  'If (Row < Me.ListCount) And (Column < Me.ColumnCount) Then
		  'If Me.CellBold(Row, Column) Then
		  'If Me.CellItalic(Row,Column) Then
		  'g.foreColor = &cA0FFA0
		  'Else
		  'g.foreColor = &cFFA0A0
		  'End
		  'g.FillRect(0, 0, g.width, g.height)
		  'Return True
		  'end
		  'Else
		  'Return False
		  'End
		  if UserSelectedEEPROM<>nil then
		    Dim mEEPROM as EEPROM_Module.HMI_EEPROM_StepClass = UserSelectedEEPROM
		    
		    If (Row < EPTab.ListCount) And (Column < EPTab.ColumnCount) Then
		      If (mEEPROM <> Nil) and (mEEPROM.EEPROM<>nil) Then
		        Dim vEP as EEPROM_Class = mEEPROM.EEPROM
		        Dim n as integer = 16*row + (column-1)
		        if column=0 then
		          g.foreColor = &cFFFFFF
		        else
		          if (n>=0) and (n<vEP.Size) then
		            If Me.CellItalic(Row,Column) Then
		              g.foreColor = &cA0FFA0
		            else
		              if (n>-1) and (n<vEP.Size-1) then
		                g.foreColor = vEP.EP(n).Col
		              else
		                g.foreColor = &cFFFFFF
		              end
		            end
		          end
		        end
		      end
		      g.FillRect(0, 0, g.width, g.height)
		      Return True
		    Else
		      Return False
		    End
		  end
		End Function
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Dim n As Integer = row * 16 + column - 1
		  Dim S As String = EPTab.Cell(row, column)
		  If (UserSelectedEEPROM<>Nil) Then
		    if (n>=0) and (n<UserSelectedEEPROM.EEPROM.Size) then
		      Dim i As Integer = 0
		      Select Case EPROMView.Text
		      Case Is = "HEX"
		        i = ValHex(S)
		      Case Is = "NUM"
		        i = Val(S)
		      Case Is = "CHAR"
		        i = Asc(Right(S,1))
		      Case Is = "DEF"
		        Select case UserSelectedEEPROM.EEPROM.EP(n).Format
		        case 0,1 // hex
		          i = ValHex(S)
		        case 2 // char
		          i = Asc(Right(S,1))
		        case 3 // num
		          i = Val(S)
		        end
		        
		      End
		      UserSelectedEEPROM.EEPROM.EP(n).BY = i
		      UserSelectedEEPROM.SetMemoryOUT
		    end
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EEPROM_Send
	#tag Event
		Sub Action()
		  // lsend an eeprom from to an IED
		  If UserSelectedEEPROM <> Nil Then
		    Dim fu as UserFunction = UserSelectedEEPROM.GetUserFunction("send")
		    if fu<>nil then 
		      UserSelectedEEPROM.StartUserFunction(fu)
		    end
		  End
		  Redraw_EEPROM_Table
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EEPROM_Receive
	#tag Event
		Sub Action()
		  // receive an eeprom from a IED
		  if UserSelectedEEPROM <> nil Then
		    Dim fu as UserFunction = UserSelectedEEPROM.GetUserFunction("receive")
		    if fu<>nil then 
		      UserSelectedEEPROM.StartUserFunction(fu)
		    end
		  End
		  Redraw_EEPROM_Table
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
#tag Events EEPROM_Save
	#tag Event
		Sub Action()
		  // save an eeprom to a file
		  if UserSelectedEEPROM <> nil Then
		    //show fiel dialog first
		    Dim dlg as New SaveAsDialog
		    dlg.InitialDirectory=SpecialFolder.Documents
		    dlg.promptText = ""
		    dlg.SuggestedFileName = ""
		    dlg.Title = "Save EEPROM"
		    dlg.Filter = "txt,xml" //defined as a file type in FileTypes1 file type set
		    Dim f as FolderItem = dlg.ShowModal()
		    If f <> Nil then
		      //save file
		      UserSelectedEEPROM.SaveEEPROM(f.NativePath) // absolut => native
		    Else
		      //user canceled
		    End
		  end
		  Redraw_EEPROM_Table
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events EEPROM_Load
	#tag Event
		Sub Action()
		  // load an eeprom from a file
		  
		  If UserSelectedEEPROM<>nil then
		    Dim txtType as New FileType
		    txtType.Name = "TXT/txt"
		    txtType.MacType = "txt"
		    txtType.Extensions = "txt"
		    
		    Dim xmlType as New FileType
		    xmlType.Name = "TextXML"
		    xmlType.MacType = "txt"
		    xmlType.Extensions = "xml"
		    
		    Dim f As FolderItem = GetOpenFolderItem(txtType+xmlType)
		    If f <> Nil then
		      //load file
		      UserSelectedEEPROM.LoadEEPROM(f.NativePath)
		    Else
		      //user canceled
		    End
		  end
		  Redraw_EEPROM_Table
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AddEEPROM
	#tag Event
		Sub Action()
		  Dim i as integer  = UBound(LocalEEPROM())
		  Redim LocalEEPROM(i+1)
		  
		  LocalEEPROM(i+1)=new EEPROM_Module.HMI_EEPROM_StepClass("")
		  
		  UserSelectedEEPROM = LocalEEPROM(i+1)
		  
		  UserSelectedEEPROM.Name.SIAS("UserEEPROM_"+str(i+2))
		  
		  ADD_EEPROMSelection(UserSelectedEEPROM.Name.GIAS,UserSelectedEEPROM.GetUniqueID)
		  
		  
		  
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
