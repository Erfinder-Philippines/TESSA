#tag Window
Begin ContainerControl COMTabContainer Implements TabInterface
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
      Height          =   437
      HideSelection   =   True
      Index           =   -2147483648
      Italic          =   False
      Left            =   9
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
      Top             =   205
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   375
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
      Left            =   9
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
      Top             =   152
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   51
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
      Left            =   300
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
      Top             =   171
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
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
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   9
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
      Top             =   171
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   279
   End
   Begin PushButton Update_COM_Terminal1
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
      Left            =   716
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
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Listbox SerialPortsList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   4
      ColumnWidths    =   "25,"
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
      Height          =   208
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "	Name	InputDriver	OutputDriver"
      Italic          =   False
      Left            =   403
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   33
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   62
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   387
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox USBPortsList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   5
      ColumnWidths    =   "10%,30%,10%,30%"
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
      Height          =   218
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Vendor ID	Vendor Name	Product ID	Product Name	Serial Number"
      Italic          =   False
      Left            =   403
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   34
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   282
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   387
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton ConnectButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "connect"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   300
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   56
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin Serial COM_Port
      Baud            =   13
      Bits            =   3
      CTS             =   False
      DTR             =   False
      Enabled         =   True
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Parity          =   0
      Scope           =   0
      Stop            =   0
      TabPanelIndex   =   0
      XON             =   False
   End
   Begin PopupMenu PMBaudrate
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
      InitialValue    =   "300\n600\n1200\n1800\n2400\n3600\n4800\n7200\n9600\n14400\n19200\n28800\n36400\n57600\n115200\n230400"
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   39
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   55
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   113
   End
   Begin PopupMenu PMBits
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
      InitialValue    =   "5 Bits\n6 Bits\n7 Bits\n8 Bits"
      Italic          =   False
      Left            =   145
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   40
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   55
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin PopupMenu PMStopBits
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
      InitialValue    =   "1 Stopbit\n1.5 Stopbits\n2 Stopbits"
      Italic          =   False
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   41
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   88
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   113
   End
   Begin PopupMenu PMParity
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
      InitialValue    =   "No parity\nOdd parity\nEven parity"
      Italic          =   False
      Left            =   145
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   43
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   88
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   100
   End
   Begin CheckBox CheckXon
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Xon"
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
      Scope           =   0
      TabIndex        =   44
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   120
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   46
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
      Left            =   710
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
      Top             =   564
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin CheckBox LetterbyLetter
      AllowAutoDeactivate=   True
      Bold            =   False
      Caption         =   "Letter by letter sending"
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
      Left            =   114
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   46
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   140
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   172
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
      Left            =   114
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   47
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   120
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
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
      Left            =   72
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   48
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   121
      Transparent     =   False
      Underline       =   False
      Value           =   False
      Visible         =   True
      VisualState     =   0
      Width           =   37
   End
   Begin Rectangle ConnectedRect
      AllowAutoDeactivate=   True
      BorderThickness =   1.0
      BottomRightColor=   &c00000000
      Enabled         =   True
      FillColor       =   &cFB010600
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   303
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   49
      TabPanelIndex   =   0
      TabStop         =   "True"
      Tooltip         =   ""
      Top             =   17
      TopLeftColor    =   &c00000000
      Transparent     =   False
      Visible         =   True
      Width           =   81
   End
   Begin TextField COM_PortName
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
      Left            =   9
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   50
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   17
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   279
   End
   Begin PushButton SaveButton
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
      Left            =   300
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   51
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   139
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
   Begin PushButton TransferButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "<<"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   403
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
      Top             =   22
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
   Begin PushButton DisconnectButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "disconnect"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   300
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   53
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   89
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   84
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return  New COMTabContainer(Self.mCOMTabClass)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mCOMTabClass = COMTabClass(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_COMs()
		  // this routine initializes all definied and connected IEDs
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SendLine()
		  
		  if COM_Resource<>nil then
		    Dim S as string = IP_Command.Text
		    if  WithLF.Value then
		      S=S+chr(10)
		    end
		    if  WithCR.Value then
		      S=S+chr(13)
		    end
		    COM_Term_Window.AppendText(S)
		    if COM_Resource.Send(S,CR) then
		      
		      WaitSecs(COM_Resource.GetTimeouttime/1000+1)
		      
		      COM_Term_Window.Text=COM_Resource.ComLog.GIAS
		    end
		    
		  else
		    COM_Term_Window.AppendText("no connection, connect first"+chr(13))
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepSelected(BS as BasicClass)
		  // Part of the TabInterface interface.
		  
		  // select appropriate compiort and connect it
		  Dim LS as USB_ResourceClass
		  if BS<>nil then
		    if BS isA USB_ResourceClass then
		      LS=USB_ResourceClass(BS)
		      COM_Resource=LS
		      COM_Term_Window.Text=LS.ComLog.GIAS
		      COM_PortName.Text=LS.Com_PortNr.GIAS
		      PMBaudrate.SelectedRowIndex=LS.Baudrate.GIAI
		      PMBits.SelectedRowIndex=LS.Bits.GIAI
		      PMStopBits.SelectedRowIndex=LS.StopBits.GIAI
		      PMParity.SelectedRowIndex=LS.Parity.GIAI
		      CheckXon.Value=LS.XonXoff.GIAB
		      select case LS.EOL.GIAS
		      case "None"
		        WithCR.Value=false
		        WithLF.Value=False
		      case "NL"
		        WithCR.Value=false
		        WithLF.Value=true
		      case "CR"
		        WithCR.Value=true
		        WithLF.Value=False
		      case "NL+CR"
		        WithCR.Value=true
		        WithLF.Value=true
		      end
		      if LS.connected.GIAB then
		        ConnectedRect.FillColor=RGB(0,255,0)
		      else
		        ConnectedRect.FillColor=RGB(255,0,0)
		      end
		    else
		      COM_Resource=nil
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TransferSettingstoResource()
		  //this routine will transfer all the settings back to the resource
		  
		  if COM_Resource<>nil then
		    COM_Resource.Com_PortNr.SIAS(COM_PortName.Text)
		    COM_Resource.Baudrate.SIAI(PMBaudrate.SelectedRowIndex)
		    COM_Resource.Bits.SIAI(PMBits.SelectedRowIndex)
		    COM_Resource.StopBits.SIAI(PMStopBits.SelectedRowIndex)
		    COM_Resource.Parity.SIAI(PMParity.SelectedRowIndex)
		    COM_Resource.XonXoff.SIAB(CheckXon.Value)
		    
		    if WithCR.Value then
		      if WithLF.Value then
		        COM_Resource.EOL.SIAI(3)
		      else
		        COM_Resource.EOL.SIAI(2)
		      end
		    else
		      if WithLF.Value then
		        COM_Resource.EOL.SIAI(1)
		      else
		        COM_Resource.EOL.SIAI(0)
		      end
		    end
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		COM_Resource As USB_ResourceClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastChangePosition As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Local_TCP As TestTCP_Class
	#tag EndProperty

	#tag Property, Flags = &h0
		mCOMTabClass As COMTabClass
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


#tag EndWindowCode

#tag Events COM_Term_Window
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if (Key=CR) or (Key=NL) then
		    
		  end
		End Function
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
#tag Events Update_COM_Terminal1
	#tag Event
		Sub Action()
		  
		  
		  Dim i as integer
		  SerialPortsList.DeleteAllRows
		  
		  For i = 0 To System.SerialPortCount-1
		    SerialPortsList.AddRow(str(i))
		    SerialPortsList.Cell(i,1)=System.SerialPort(i).Name
		    SerialPortsList.Cell(i,2)=System.SerialPort(i).InputDriverName
		    SerialPortsList.Cell(i,3)=System.SerialPort(i).OutputDriverName
		  Next
		  
		  if i=0 then
		    COM_Term_Window.AppendText("no serial adapter in use")
		  end
		  
		  dim m as new MacHIDMBS
		  USBPortsList.DeleteAllRows
		  #if TargetMacOS
		    if m.FindFirstDevice then
		      do
		        USBPortsList.AddRow ""
		        USBPortsList.Cell(USBPortsList.LastIndex,0)=hex(m.ProductID)
		        USBPortsList.Cell(USBPortsList.LastIndex,1)=hex(m.VendorID)
		        USBPortsList.cell(USBPortsList.LastIndex,2)=m.Product
		        USBPortsList.cell(USBPortsList.LastIndex,3)=m.Manufacturer
		        USBPortsList.cell(USBPortsList.LastIndex,4)=m.SerialNumber
		        USBPortsList.cell(USBPortsList.LastIndex,5)=hex(m.VersionNumber)
		      loop until not m.FindNextDevice
		    end if
		  #endif
		  
		  #if TargetWin32
		    dim devices(-1) as WinUSBDeviceMBS = WinUSBDeviceMBS.Devices
		    for each d as WinUSBDeviceMBS in devices
		      USBPortsList.AddRow hex(d.VendorID)
		      USBPortsList.Cell(USBPortsList.LastIndex,1) = d.Vendor
		      USBPortsList.Cell(USBPortsList.LastIndex,2) = hex(d.ProductID)
		      USBPortsList.Cell(USBPortsList.LastIndex,3) = d.Product
		      USBPortsList.Cell(USBPortsList.LastIndex,4) = d.SerialNumber
		    next
		  #endif
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SerialPortsList
	#tag Event
		Sub Change()
		  'Dim S as string = NetworkCards.Cell(NetworkCards.ListIndex,2)
		  'Dim i as integer
		  '
		  'IP_From.Text="0"
		  'i = val(NthField(S,".",4))
		  'i = 255-i
		  'IP_To.Text=str(i)
		  'S=NetworkCards.Cell(NetworkCards.ListIndex,1)
		  'S=NthField(S,".",1)+"."+NthField(S,".",2)+"."+NthField(S,".",3)+"."
		  'IP_Base.Text=S
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ConnectButton
	#tag Event
		Sub Action()
		  TransferSettingstoResource()
		  
		  if COM_Resource<>nil then
		    COM_Resource.Connect()
		    COM_Term_Window.Text=COM_Resource.ComLog.GIAS
		    if COM_Resource.connected.GIAB then
		      ConnectedRect.FillColor=RGB(0,255,0)
		    else
		      ConnectedRect.FillColor=RGB(255,0,0)
		    end
		  else
		    
		  end
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events COM_Port
	#tag Event
		Sub DataAvailable()
		  
		  Dim S as string = COM_Port.ReadAll(Encodings.UTF8)
		  
		  COM_Term_Window.AppendText(S)
		  LastChangePosition=COM_Term_Window.Text.Len
		  
		  if LetterbyLetter.Value then
		    if SerialActive then
		      if S=IP_Command.Text.Mid(SerialLastLetter,1) then
		        SerialLastLetter=SerialLastLetter+1
		        if SerialLastLetter>IP_Command.Text.Len then
		          if SerialLastLetter>IP_Command.Text.Len+1 then
		            SerialActive=false
		            S=""
		          else
		            S=chr(13)
		          end
		        else
		          S=IP_Command.Text.Mid(SerialLastLetter,1)
		        end
		        SerialLastTime=GetActTime_msec
		        COM_Port.Write(S)
		        COM_Port.Flush
		      end
		    else
		      COM_Term_Window.AppendText(chr(13)+"Error when receiving **"+S+"**"+chr(13))
		      SerialActive=false
		    end
		  end
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Error()
		  COM_Term_Window.AppendText("Error occured "+str(COM_Port.LastErrorCode)+chr(13))
		End Sub
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
#tag Events COM_PortName
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if (Key=CR) or (Key = NL) then
		    SendLine
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events SaveButton
	#tag Event
		Sub Action()
		  TransferSettingstoResource()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TransferButton
	#tag Event
		Sub Action()
		  
		  
		  COM_PortName.Text = SerialPortsList.CellValueAt(SerialPortsList.SelectedRowIndex,1)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DisconnectButton
	#tag Event
		Sub Action()
		  
		  
		  if COM_Resource<>nil then
		    COM_Resource.Disconnect()
		    COM_Term_Window.Text=COM_Resource.ComLog.GIAS
		    if COM_Resource.connected.GIAB then
		      ConnectedRect.FillColor=RGB(0,255,0)
		    else
		      ConnectedRect.FillColor=RGB(255,0,0)
		    end
		  else
		    
		  end
		  
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
#tag EndViewBehavior
