#tag Class
Protected Class SettingsClass
Inherits BasicClass
	#tag Method, Flags = &h0
		Sub AddRecentFile(fullFilePath As String)
		  If fullFilePath <> "" Then
		    Dim index As Integer = mRecentFiles.IndexOf(fullFilePath)
		    If index >= 0 Then
		      mRecentFiles.Remove(index)
		    End
		    mRecentFiles.Insert(0, fullFilePath)
		    While mRecentFiles.Ubound > MaxRecentFiles
		      mRecentFiles.Remove(mRecentFiles.Ubound)
		    Wend
		    RecentFileAttr.SIAS(Join(mRecentFiles, ";;;"))
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  If ChangedAttribute.Name = MainWindowGeometry.Name Then
		    MainWindow.Left = MainWindowGeometry.X
		    MainWindow.Top = MainWindowGeometry.Y
		    If MainWindowGeometry.Width > MainWindow.MinWidth Then
		      MainWindow.Width = MainWindowGeometry.Width
		    End
		    If MainWindowGeometry.Height > MainWindow.Height Then
		      MainWindow.Height = MainWindowGeometry.Height
		    End
		  ElseIf ChangedAttribute.Name = ElementsFolder.Name Then
		    ElementTypeFactory.instance.LoadAllElements
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  MainWindowGeometry = IAX("MainWindowGeometry", "100 0 100 1200 800", False, AttributeGroups.Appearance)
		  MainWindowGeometry.EnableOffset = False
		  MainWindowGeometry.CanBeNegative = False
		  
		  Debugging = IAB("Debugging", False, False)
		  OnlyHMI = IAB("OnlyHMI", True, False)
		  ShowEditor = IAB("ShowEditor", False, False)
		  RecentFileAttr = IAS("RecentFiles", "", False, AttributeGroups.Settings)
		  RecentFileAttr.ReadOnly = True
		  
		  Passwords=IAS("Passwords","",false)
		  Password_SecurityLevels=IAI("Password_SecurityLevels",0,false)
		  Password_ResetTime=IAI("Password_ResetTime",600,false)
		  
		  DataBaseTestSeq = IAPath("DBTestSequenceFolder","", False, False)// changed to path
		  DataBaseTestSeq.isNativePath = True
		  
		  WorkingFolder = IAPath("WorkingFolder", "", False, True)
		  WorkingFolder.isNativePath = True
		  ConfigFolder = IAPath("ConfigFolder", "", False, True)
		  ConfigFolder.isNativePath = True
		  ElementsFolder = IAPath("ElementsFolder", "", False, True)
		  ElementsFolder.isNativePath = True
		  SequenceFolder = IAPath("SequenceFolder", "", False, True)
		  SequenceFolder.isNativePath = True
		  ReportFolder = IAPath("ReportFolder", "", False, True)
		  ReportFolder.isNativePath = True
		  
		  ScreenshotsFolder = IAPath("ScreenshotsFolder", "", False, True)
		  ScreenshotsFolder.isNativePath = True
		  
		  MainTreeContrast = IAD("MainTreeContrast", 10, False)
		  HMITreeContrast = IAD("HMITreeContrast", 10, False)
		  Workspace_SYNC_ID = IAS("Workspace_SYNC_ID","")
		  
		  WorkingFolder.SIAS(GetAppFolder)
		  WorkingFolder.Changed = False
		  
		  DarkModeEnabled = IAB("DarkModeEnabled", False, False)
		  
		  mDefaultTemplates = new Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConfigFolder() As String
		  Dim f As FolderItem = ConfigFolder.GIAF
		  If Not CheckFolder(f) Then
		    f = WorkingFolder.GIAF
		    If CheckFolder(f) Then
		      If Not CheckFolder(f.Child("TESSA_Config")) Then
		        f = MainSettings.Instance.GlobalWorkFolder.GIAF
		      End
		    Else
		      f = MainSettings.Instance.GlobalWorkFolder.GIAF
		    End
		  End
		  Return f.NativePath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContextMenuItems() As MenuItem()
		  Dim items(-1) As MenuItem
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDataBaseTestSeqFolderItem() As FolderItem
		  Return DataBaseTestSeq.GIAF
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetElementsFolder() As String
		  Dim f As FolderItem = ElementsFolder.GIAF
		  If Not CheckFolder(f) Then
		    f = WorkingFolder.GIAF
		    If CheckFolder(f) Then
		      If Not CheckFolder(f.Child("Elements")) Then
		        f = MainSettings.Instance.GlobalWorkFolder.GIAF
		      End
		    Else
		      f = MainSettings.Instance.GlobalWorkFolder.GIAF
		    End
		  End
		  Return f.NativePath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetPathValue(path As String, templates() As PathTemplate) As String
		  Dim result As String = path
		  If result <> "" Then
		    For Each template As PathTemplate in templates
		      Dim key As String = template.Template.GIAS
		      If key <> "" And result.InStr(key) > 0 Then
		        result = result.ReplaceAll(key, template.PathValue.GIAS)
		        
		        if TargetMacOS Then
		          result = result.ReplaceAll("::", ":")
		        End
		        result = result.ReplaceAll("//", "/")
		        
		      End
		    Next
		  End
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRecentFiles() As String()
		  Return mRecentFiles
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReportFolder() As String
		  Dim f As FolderItem = ReportFolder.GIAF
		  If Not CheckFolder(f) Then
		    f = WorkingFolder.GIAF
		    If CheckFolder(f) Then
		      If Not CheckFolder(f.Child("ReportFolder")) Then
		        f = MainSettings.Instance.GlobalWorkFolder.GIAF
		      End
		    Else
		      f = MainSettings.Instance.GlobalWorkFolder.GIAF
		    End
		  End
		  Return f.NativePath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetScreenshotsFolder() As String
		  Dim f As FolderItem = ScreenshotsFolder.GIAF
		  If Not CheckFolder(f) Then
		    f = WorkingFolder.GIAF
		    If CheckFolder(f) Then
		      If Not CheckFolder(f.Child("DebugPics")) Then
		        f = MainSettings.Instance.GlobalWorkFolder.GIAF
		      End
		    Else
		      f = MainSettings.Instance.GlobalWorkFolder.GIAF
		    End
		  End
		  Return f.NativePath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSequenceFolder() As String
		  Dim f As FolderItem = SequenceFolder.GIAF
		  If Not CheckFolder(f) Then
		    f = WorkingFolder.GIAF
		    If CheckFolder(f) Then
		      If Not CheckFolder(f.Child("Testsequences")) Then
		        f = MainSettings.Instance.GlobalWorkFolder.GIAF
		      End
		    Else
		      f = MainSettings.Instance.GlobalWorkFolder.GIAF
		    End
		  End
		  Return f.NativePath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetTemplateByName(TemplateName As String) As PathTemplate
		  Dim templates(-1) As PathTemplate = PathTemplate.GetPathTemplates(Self)
		  For Each t As PathTemplate in templates
		    If t <> Nil And t.Template.GIAS = TemplateName Then
		      Return t
		    end
		  Next
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWorkingFolder() As String
		  Return WorkingFolder.GIAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitAfterLoad()
		  mRecentFiles = Split(RecentFileAttr.GIAS, ";;;")
		  if Workspace_SYNC_ID.GIAS="" then
		    if (UpperStep<>nil) and (UpperStep IsA MainSettings) then
		      Workspace_SYNC_ID.SIAS(MainSettings(UpperStep).SYNC_ID.GIAS)
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitAppFolderTemplate()
		  Const name = "%APPFOLDER%"
		  Dim t As PathTemplate = GetTemplateByName(name)
		  If t = Nil Then
		    t = New PathTemplate("")
		    t.BasicTypeName = "PathTemplate"
		    t.Template.SIAS(name)
		    t.Name.SIAS(ReplaceAll(name, "%", ""))
		    AddSubElement(t)
		  End
		  t.PathValue.isNativePath = True
		  t.PathValue.SIAS(GetAppFolder)
		  t.SetSystem(True)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitBasicTemplates()
		  mDefaultTemplates.Value("%WORKINGFOLDER%") = GetWorkingFolder
		  mDefaultTemplates.Value("%ELEMENTSFOLDER%") = GetElementsFolder
		  mDefaultTemplates.Value("%CONFIGFOLDER%") = GetConfigFolder
		  mDefaultTemplates.Value("%REPORTFOLDER%") = GetReportFolder
		  mDefaultTemplates.Value("%SEQUENCEFOLDER%") = GetSequenceFolder
		  
		  For Each name As String In mDefaultTemplates.Keys
		    Dim t As PathTemplate = GetTemplateByName(name)
		    If t = Nil Then
		      Dim template As New PathTemplate("")
		      template.BasicTypeName = "PathTemplate"
		      template.SetSystem(True)
		      template.Template.SIAS(Name)
		      template.Name.SIAS(name.ReplaceAll("%", ""))
		      template.PathValue.SIAS(mDefaultTemplates.Value(name))
		      AddSubElement(template)
		    Else
		      t.SetSystem(True)
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ParseSettings(workFolder As FolderItem, useGlobal As Boolean) As SettingsClass
		  Dim workingFolder As FolderItem = workFolder
		  If Not CheckFolder(workingFolder) Then
		    workingFolder = GetAppFolderItem
		  End
		  Dim f As FolderItem = workingFolder
		  Dim settings As SettingsClass = Nil
		  If CheckFolder(f) Then
		    f = f.Child("WorkFolderPrefs.xml")
		    If CheckFile(f) Then
		      Dim SettingsContent As String = OpenMeasFileForLoad(f, False)
		      If SettingsContent <> "" Then
		        Dim XMLPointer As Integer = 1
		        Dim BS As BasicClass = Parse_XML(SettingsContent, XMLPointer)
		        If BS IsA SettingsClass Then
		          settings = SettingsClass(BS)
		        End
		      End
		    End
		  End
		  If settings = Nil Then
		    settings = New SettingsClass("")
		    settings = SettingsClass(SNMS(settings, "Settings", 1,""))
		    settings.Name.SIAS("Settings")
		    settings.Name.Changed = False
		  End
		  
		  If CheckFolder(workingFolder) Then
		    settings.WorkingFolder.SIAF(workingFolder)
		    settings.WorkingFolder.Changed = False
		  End
		  
		  If useGlobal Then
		    Dim globalWorkFolderPath As String = MainSettings.Instance.GlobalWorkFolder.GIAS
		    settings.ElementsFolder.SIAS(globalWorkFolderPath)
		  ElseIf CheckFolder(workingFolder) Then
		    // We also copy the Global Elements to the Workspace Elements
		    Dim globalWorkFolder As FolderItem = MainSettings.Instance.GlobalWorkFolder.GIAF
		    If CheckFolder(globalWorkFolder) Then
		      Dim globalElementsFolder As FolderItem = globalWorkFolder.Child("Elements")
		      If CheckFolder(globalElementsFolder) And _ 
		        globalWorkFolder.NativePath <> workingFolder.NativePath Then
		        If Not GenericCopyFileOrFolder(globalElementsFolder, workingFolder) Then
		          // Some files are not copied
		        End If
		      End If
		    End If
		    settings.ElementsFolder.SIAS(workingFolder.NativePath)
		  End
		  
		  settings.InitAppFolderTemplate
		  settings.InitBasicTemplates
		  Return settings
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveRecentFile(fullFilePath As String)
		  If fullFilePath <> "" Then
		    Dim index As Integer = mRecentFiles.IndexOf(fullFilePath)
		    If index >= 0 Then
		      mRecentFiles.Remove(index)
		    End
		    RecentFileAttr.SIAS(Join(mRecentFiles, ";;;"))
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveSettings()
		  if IsChanged(False) Then
		    Dim f As FolderItem = WorkingFolder.GIAF
		    If CheckFolder(f) Then
		      f = f.Child("WorkFolderPrefs.xml")
		      If f <> Nil Then
		        Dim SaveData As String = ""
		        Save(SaveData, 0)
		        If  SaveData <> "" Then
		          Call OpenMeasFileForSave(SaveData, f)
		        End
		      End
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ConfigFolder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DarkModeEnabled As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DataBaseTestSeq As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Debugging As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ElementsFolder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		HMITreeContrast As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MainTreeContrast As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MainWindowGeometry As Coordinates_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDefaultTemplates As Dictionary = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRecentFiles(-1) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		OnlyHMI As Boolean_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Passwords As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Password_ResetTime As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Password_SecurityLevels As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RecentFileAttr As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ReportFolder As Path_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected ScreenshotsFolder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected SequenceFolder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowEditor As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected WorkingFolder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Workspace_SYNC_ID As String_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = MaxRecentFiles, Type = Double, Dynamic = False, Default = \"5", Scope = Protected
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
