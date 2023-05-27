#tag Class
Protected Class SYNC_Location
Inherits BasicSyncClass
	#tag Method, Flags = &h0
		Sub Cancel()
		  if Transfer <> Nil then
		    Transfer.Kill
		    Status.SIAI(4)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearCurrentValues()
		  FilesCount.SIAI(0)
		  FoldersCount.SIAI(0)
		  CurrentFile.SIAS("")
		  CurrentFolder.SIAS("")
		  CurrentSYNCFolder.SIAS("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From BasicTransferClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  SaveLog  = IAB("SaveLog", True, False)
		  LogFolder = IAPath("LogFolder", "Folder", False, True)
		  LastLog = IAS("LastLog", "", False)
		  
		  CopyMode = IAE("Copy-Mode", "0 Copy Push Backup", False)
		  CheckNewerVersion = IAB("CheckForNewerVersion", False, False)
		  
		  AtAppStartup = IAB("atAppStartup", False, False)
		  AtAppClose = IAB("atAppClose", False, False)
		  AtTime = IAB("atTime", False, False)
		  StartTime = IAS("StartTime","none", false)
		  AtInterval = IAB("atInterval", False, False)
		  Interval = IAD("Interval", 0, False)
		  
		  TargetOption = IAE("TargetOption", "0 Default DayFolder DayTimeFolder", False)
		  Status = IAE("Status", "0 Pennding InProgress Finished Failed Canceled", False, AttributeGroups.Settings)
		  Progress = IAD("Progress", 0.0, False, AttributeGroups.Settings)
		  LastExecutionDate = IAS("LastExecutionDate", "", False, AttributeGroups.Settings)
		  LastExecutionTime = IAS("LastExecutionTime", "00.00.00", False, AttributeGroups.Settings)
		  
		  FilesCount = IAI("FilesCount", 0, False, AttributeGroups.System)
		  FoldersCount = IAI("FoldersCount", 0, False, AttributeGroups.System)
		  CurrentFile = IAS("CurrentFile", "", False, AttributeGroups.System)
		  CurrentFolder = IAS("CurrentFolder", "", False, AttributeGroups.System)
		  CurrentSYNCFolder = IAS("CurrentSYNCFolder", "", False, AttributeGroups.System)
		  
		  TargetOption.ReadOnly = True
		  Status.ReadOnly = True
		  LastExecutionDate.ReadOnly = True
		  LastExecutionTime.ReadOnly = True
		  FilesCount.ReadOnly = True
		  FoldersCount.ReadOnly = True
		  CurrentFile.ReadOnly = True
		  CurrentFolder.ReadOnly = True
		  CurrentSYNCFolder.ReadOnly = True
		  
		  AddUserFunction(ShowLogs, LogFolder)
		  AddUserFunction(ShowLastLog, LogFolder)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContextMenuItems() As MenuItem()
		  Dim items(-1) As MenuItem = Super.GetContextMenuItems
		  
		  Dim startItem As new MenuItem(StartMenuItem, StartMenuItem)
		  AddHandler startItem.Action, AddressOf OnMenuItemTriggered
		  startItem.Enabled = Not Me.isRunning
		  Dim endItem As new MenuItem(EndMenuItem, EndMenuItem)
		  AddHandler endItem.Action, AddressOf OnMenuItemTriggered
		  endItem.Enabled = Not startItem.Enabled
		  
		  items.Append(startItem)
		  items.Append(endItem)
		  items.Append(new MenuItem(MenuItem.TextSeparator))
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IncrementFiles(inc As Integer)
		  If inc > 0 Then
		    FilesCount.SIAI(FilesCount.GIAI + inc)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IncrementFolders(inc As Integer)
		  If inc > 0 Then
		    FoldersCount.SIAI(FoldersCount.GIAI + inc)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isRunning() As Boolean
		  If Transfer <> Nil Then
		    Return Transfer.State <> Thread.NotRunning
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function logFolderPath() As FolderItem
		  Dim LogPath As String = LogFolder.GIAS
		  If LogPath = "" Then
		    Return SystemHelper.GetLogFolder
		  End
		  Return GetFolderItemFromPath(LogPath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OnMenuItemTriggered(item As MenuItem) As Boolean
		  Dim result As Boolean = Super.OnMenuItemTriggered(item)
		  If item <> Nil Then
		    Select Case item.Tag.StringValue
		    Case StartMenuItem
		      Me.StartTransfering
		    Case EndMenuItem
		      Me.Cancel
		    End
		  End
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCurrentFile(Path As String)
		  CurrentFile.SIAS(Path)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCurrentFolder(Path As String)
		  CurrentFolder.SIAS(Path)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCurrentSYNCFolder(SYNCName As String)
		  CurrentSYNCFolder.SIAS(SYNCName)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartTransfering()
		  'virtual method
		  'need to start transfering
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  Select case FuncName
		  Case Is = ShowLogs
		    Dim logFolder As FolderItem = logFolderPath
		    If CheckFolder(logFolder) Then
		      Dim shell As New Shell
		      Dim cmd as string
		      #IF TargetWin32 then
		        cmd  = "explorer.exe /select,"+ chr(34)+ logFolder.NativePath+ chr(34)
		        shell.execute(cmd)
		      #elseIf TargetMachO or TargetMacOS then
		        cmd = "osascript -e 'Tell application ""Finder"" to reveal """ + logFolder.NativePath + """' -e 'Tell application ""Finder"" to activate'"
		        shell.execute(cmd)
		      #Endif
		    End
		  Case Is = ShowLastLog
		    Dim logFile As FolderItem = Transfer.logFilePath
		    If CheckFile(logFile) Then
		      logFile.Launch
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AtAppClose As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AtAppStartup As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AtInterval As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AtTime As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CheckNewerVersion As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CopyMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentFile As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentFolder As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentSYNCFolder As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FilesCount As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FoldersCount As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Interval As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastExecutionDate As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastExecutionTime As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastLog As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LogFolder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Progress As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SaveLog As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartTime As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Status As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TargetOption As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Transfer As WorkerThread = nil
	#tag EndProperty


	#tag Constant, Name = EndMenuItem, Type = String, Dynamic = False, Default = \"End Transfer", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ShowLastLog, Type = String, Dynamic = False, Default = \"Show Last Log", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = ShowLogs, Type = String, Dynamic = False, Default = \"Show Logs", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = StartMenuItem, Type = String, Dynamic = False, Default = \"Start Transfer", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="mUpdateCanvasMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BasicTypeName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoSYNC"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Expanded"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="Local_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Name_Error"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Included_Elements"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Links"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SAMStepID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendState"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sub_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
