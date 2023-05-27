#tag Class
Protected Class MainSettings
Inherits BasicClass
	#tag Method, Flags = &h0
		Function CheckPassword(PW as string, ByRef SecLevel as integer) As boolean
		  Dim PasswordOk as boolean = false
		  
		  If WorkspaceSettings <> Nil Then
		    Dim i as integer
		    for i=0 to WorkspaceSettings.Passwords.GIAN-1
		      if WorkspaceSettings.Passwords.GIAS(i)=PW then
		        PasswordOk = true
		        SecLevel=WorkspaceSettings.Password_SecurityLevels.GIAI(i)
		      end
		    next
		  End
		  
		  return PasswordOk
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1021
		Private Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  GlobalWorkFolder = IAPath("GlobaWorkFolder", "", False, True)
		  
		  GlobalWorkFolder.isNativePath = true
		  GlobalWorkFolder.SIAS(GetAppFolder)
		  
		  SYNC_ID = IAS("SYNC_ID","")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CopyData(MS As MainSettings)
		  If MS <> Nil Then
		    GlobalWorkFolder.SIAS(MS.GlobalWorkFolder.GIAS)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContextMenuItems() As MenuItem()
		  Dim items(-1) As MenuItem
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResetTime() As integer
		  
		  If WorkspaceSettings <> Nil Then
		    return WorkspaceSettings.Password_ResetTime.GIAI
		  else
		    return 600
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init(appFolder As String)
		  If appFolder <> "" Then
		    Dim f As FolderItem = GetFolderItem(appFolder)
		    If CheckFolder(f) Then
		      f = f.Child("TESSA_Prefs.xml")
		      If CheckFile(f) Then
		        Dim SettingsData As String = OpenMeasFileForLoad(f, False)
		        If SettingsData <> "" Then
		          Dim XMLPointer As Integer = 1
		          Dim BS As BasicClass = Parse_XML(SettingsData, XMLPointer)
		          If BS IsA MainSettings Then
		            CopyData(MainSettings(BS))
		          End
		        End
		      End
		    End
		  End
		  if Not CheckFolder(GlobalWorkFolder.GIAF) Then
		    GlobalWorkFolder.SIAS(appFolder)
		  End
		  InitWorkspace(GlobalWorkFolder.GIAF)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitWorkspace(globalWorkingFolder As FolderItem)
		  If mWorkspaceSettings <> Nil Then
		    DeleteBasicStepClass(mWorkspaceSettings)
		  End
		  Dim workspaceData As Pair = ParseWorkspaces(globalWorkingFolder)
		  mWorkspaceSettings = SettingsClass.ParseSettings(workspaceData.Left, workspaceData.Right)
		  if mWorkspaceSettings <> Nil Then
		    AddSubElement(mWorkspaceSettings)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Instance() As MainSettings
		  If mInstance = Nil Then
		    mInstance = new MainSettings("")
		    mInstance = MainSettings(SNMS(mInstance, "MainSettings", 1,""))
		    mInstance.Name.SIAS("MainSettings")
		  End
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseWorkspaces(globalWorkingFolder As FolderItem) As Pair
		  // check if there is a folder Workspaces
		  Dim useGlobalResource As Boolean = False
		  Dim chosenWorkspaceFolder As FolderItem = globalWorkingFolder
		  Dim  WorkspaceFolder As FolderItem = chosenWorkspaceFolder
		  If CheckFolder(WorkspaceFolder) Then
		    WorkspaceFolder = WorkspaceFolder.Child("Workspaces")
		    If CheckFolder(WorkspaceFolder) And WorkspaceFolder.Count > 0 Then
		      
		      Dim commandLineWorkspace As String = ""
		      Dim arguments(-1) As String = CommandLineHandler.Instance.Arguments
		      If arguments.Ubound > 1 And arguments(1).InStr("=") = 0 Then
		        commandLineWorkspace = arguments(1)
		      End
		      If commandLineWorkspace = "" And CommandLineHandler.Instance.Contains(CommandLineOptions.cWorkspaceOption) Then
		        commandLineWorkspace = CommandLineHandler.Instance.Value(CommandLineOptions.cWorkspaceOption)
		      End
		      
		      if commandLineWorkspace <> "" And CheckFolder(WorkspaceFolder.Child(commandLineWorkspace)) Then
		        chosenWorkspaceFolder = WorkspaceFolder.Child(commandLineWorkspace)
		        useGlobalResource = CommandLineHandler.Instance.Contains(CommandLineOptions.cUseGlobalResourceOption)
		      Else
		        Dim d as new WorkspaceWindow
		        d.SetVersionText(App.VersionString)
		        d.WorkspacesFolder = WorkspaceFolder
		        d.ShowModal
		        If d.Immediate_Exit Then
		          Quit
		        Else
		          chosenWorkspaceFolder = d.ChosenWorkspace
		          useGlobalResource = d.GlobalResources
		        End
		      End
		    End
		  End
		  Return (chosenWorkspaceFolder : useGlobalResource)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Password_Init() As integer
		  
		  Dim SecLevel as integer = 0
		  
		  If WorkspaceSettings <> Nil Then
		    if WorkspaceSettings.Passwords.GIAS<>"" then
		      SecLevel=5
		    End
		  end
		  
		  return SecLevel
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveSettings()
		  Dim f As FolderItem = GetAppFolderItem
		  If CheckFolder(f) Then
		    f = f.Child("TESSA_Prefs.xml")
		    If f <> Nil Then
		      Dim SettingsData As String = ""
		      Save(SettingsData, 0, False)
		      If  SettingsData <> "" Then
		        Call OpenMeasFileForSave(SettingsData, f)
		      End
		    End
		  End
		  If WorkspaceSettings <> Nil Then
		    WorkspaceSettings.SaveSettings
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WorkspaceSettings() As SettingsClass
		  Return mWorkspaceSettings
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		GlobalWorkFolder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mInstance As MainSettings = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mWorkspaceSettings As SettingsClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SYNC_ID As String_AttributeClass = nil
	#tag EndProperty


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
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
