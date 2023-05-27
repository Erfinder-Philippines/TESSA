#tag Window
Begin Window PIIOXCommandsWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   Composite       =   False
   DefaultLocation =   1
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   Height          =   406
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinimumHeight   =   64
   MinimumWidth    =   64
   Resizeable      =   True
   Title           =   "PIIOX Saved Commands"
   Type            =   0
   Visible         =   True
   Width           =   550
   Begin PushButton btnAddCommand
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Add Command"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   410
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   366
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   120
   End
   Begin PushButton btnDeleteCommand
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Delete"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   326
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
      Top             =   366
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   80
   End
   Begin Listbox lbCommands
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   "30%,500"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   0
      GridLinesVerticalStyle=   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   334
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name	Command"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   510
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  LoadXML
		End Sub
	#tag EndEvent


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
		    PIIOXCommandsWindow.lbCommands.RemoveAllRows
		    Var reader As New XmlReadr
		    reader.list = PIIOXCommandsWindow.lbCommands
		    reader.type = 2
		    reader.Parse(f)
		    
		    MainWindow.commandsFile = f
		  end if
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events btnAddCommand
	#tag Event
		Sub Action()
		  Var xml As New XmlDocument
		  Var root, cmd As XmlNode
		  Var dt As DateTime = DateTime.Now
		  
		  Var f As FolderItem = MainWindow.commandsFile
		  
		  if f.Exists then
		    xml.LoadXml(f)
		    root = xml.LastChild
		  else
		    root = xml.AppendChild(xml.CreateElement("commands"))
		  end if
		  
		  cmd = root.AppendChild(xml.CreateElement("command"))
		  cmd.SetAttribute("id", dt.Nanosecond.ToString)
		  cmd.SetAttribute("name", "Name")
		  cmd.SetAttribute("cmd", "Command")
		  
		  Try
		    xml.SaveXml(f)
		  Catch io As IOException
		    MessageBox("Save error: " + io.Message)
		  Catch xmle As XmlException
		    MessageBox("XML error: " + xmle.Message)
		  End Try
		  
		  For i As Integer = 0 To App.WindowCount - 1
		    Var w As Window = App.Window(i)
		    
		    if w IsA PIIOXCommandsWindow then
		      Self.LoadXML
		    end if
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnDeleteCommand
	#tag Event
		Sub Action()
		  Var index As Integer = lbCommands.SelectedRowIndex
		  Var f As FolderItem = MainWindow.commandsFile
		  
		  Var prompt As Integer = MsgBox("Are you sure you want to delete selected command?", 36)
		  
		  if prompt = 6 then
		    if f.Exists then
		      Var xml As New XmlDocument
		      Var root, cmd As XmlNode
		      Var dt As DateTime = DateTime.Now
		      Var cmdID As String = lbCommands.RowTagAt(index)
		      
		      xml.LoadXml(f)
		      
		      root = xml.DocumentElement.FirstChild
		      Var list As XmlNodeList = xml.Xql("//command")
		      
		      For i As Integer = 0 To list.Length - 1
		        Var id As String = root.GetAttribute("id")
		        
		        if id = cmdID then
		          Call xml.DocumentElement.RemoveChild(root)
		          Exit
		        end if
		        
		        root = root.NextSibling
		      Next
		      
		      Try
		        xml.SaveXml(f)
		      Catch io As IOException
		        MessageBox("Save error: " + io.Message)
		      Catch xmle As XmlException
		        MessageBox("XML error: " + xmle.Message)
		      End Try
		      
		      For i As Integer = 0 To App.WindowCount - 1
		        Var w As Window = App.Window(i)
		        
		        if w IsA PIIOXCommandsWindow then
		          Self.LoadXML
		        end if
		      Next
		    end if
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbCommands
	#tag Event
		Sub Change()
		  if Me.SelectedRowIndex >= 0 then
		    btnDeleteCommand.Visible = True
		  else
		    btnDeleteCommand.Visible = False
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  Me.ColumnTypeAt(0) = ListBox.CellTypes.TextField
		  Me.ColumnTypeAt(1) = ListBox.CellTypes.TextField
		End Sub
	#tag EndEvent
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  Var xml As New XmlDocument
		  Var root, cmd As XmlNode
		  Var dt As DateTime = DateTime.Now
		  
		  Var cmdName As String = Me.CellValueAt(row, 0)
		  Var cmdCommand As String = Me.CellValueAt(row, 1)
		  Var cmdID As String = Me.RowTagAt(row)
		  
		  Var f As FolderItem = MainWindow.commandsFile
		  
		  if f.Exists then
		    if cmdName.IsEmpty then
		      MsgBox "Please type name."
		      Return
		    elseif cmdCommand.IsEmpty then
		      MsgBox "Please type command."
		      Return
		    else
		      xml.LoadXml(f)
		      
		      root = xml.DocumentElement.FirstChild
		      Var list As XmlNodeList = xml.Xql("//command")
		      
		      For i As Integer = 0 To list.Length - 1
		        Var id As String = root.GetAttribute("id")
		        
		        if id = cmdID then
		          Call xml.DocumentElement.RemoveChild(root)
		          cmd = xml.DocumentElement.AppendChild(xml.CreateElement("command"))
		          cmd.SetAttribute("id", dt.NanoSecond.ToString)
		          cmd.SetAttribute("name", cmdName)
		          cmd.SetAttribute("cmd", cmdCommand)
		          Exit
		        end if
		        
		        root = root.NextSibling
		      Next
		    end if
		  else
		    Return
		  end if
		  
		  Try
		    xml.SaveXml(f)
		  Catch ioe As IOException
		    MessageBox("Save error: " + ioe.Message)
		  Catch xmle As XmlException
		    MessageBox("XML error: " + xmle.Message)
		  End Try
		  
		  For i As Integer = 0 To App.WindowCount - 1
		    Var w As Window = App.Window(i)
		    
		    if w IsA PIIOXCommandsWindow then
		      Self.loadXML
		    end if
		  Next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
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
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
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
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
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
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
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
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
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
		Name="ImplicitInstance"
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
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
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="MenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
