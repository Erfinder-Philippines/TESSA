#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Activate()
		  // #59 - it would be good to reload the Elements here so that if the user adds
		  // a new Element manually, Tessa would see them immediately. However, this
		  // load operation can take several seconds, and unless that's optimized or done
		  // in a background thread, we don't want to do that here:
		  #if false
		    ElementTypeFactory.instance.LoadAllElements
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Function CancelClose() As Boolean
		  If not MainWindow.QuitButtonPress Then
		    Return True
		  End
		End Function
	#tag EndEvent

	#tag Event
		Sub Close()
		  If mMutex <> Nil Then
		    mMutex.Leave
		    mMutex = nil
		  End If
		  
		  If Not mQuitImmediately Then
		    If mUICaller <> Nil Then
		      mUICaller.ClearAllCallings
		    End
		    MainSettings.Instance.SaveSettings
		    Call SaveSYNCSettings
		  End
		  mQuitImmediately = False
		End Sub
	#tag EndEvent

	#tag Event
		Sub NewDocument()
		  
		  #if DebugBuild
		    // Automatically open "text.xml" if it's in the working folder. This file can be an Alias on the Mac.
		    dim f as FolderItem = GetWorkingFolderItem().Child("test.xml")
		    if f <> nil and f.Exists then
		      MainWindow.OpenTestSequence (f.NativePath, 0)
		    end if
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  Dim versionStage As String = "Alpha"
		  Me.VersionString = versionStage + " " + str(MajorVersion) + "." + str(MinorVersion) + "." + str(BugVersion) + " Build " + str(NonReleaseVersion)
		  VersionCopyRight = "© by Tri-B-Werk, Switzerland" 
		  SplashWindow.SetVersionText("Version " + Me.VersionString) '+ chr(13) + Me.VersionCopyRight)
		  SplashWindow.Show
		  SplashWindow.Refresh
		  
		  // make sure only one instance is open
		  mMutex = New Mutex("TESSA-app-mutex")
		  If Not mMutex.TryEnter Then
		    MsgBox("You cannot have more than one copy of this app running!")
		    mMutex = Nil
		    Quit
		  End If
		  
		  // Handle commandline options
		  If CommandLineHandler.Instance.Contains(CommandLineOptions.cHelpOption) Or _
		    CommandLineHandler.Instance.Contains(CommandLineOptions.cHelpLongOption) Then
		    System.DebugLog(EndOfLine + CommandLineOptions.cHelpText)
		    QuitApp(True)
		  End
		  
		  If CommandLineHandler.Instance.Contains(CommandLineOptions.cVersionOption) Or _
		    CommandLineHandler.Instance.Contains(CommandLineOptions.cVersionLongOption) Then
		    System.DebugLog(chr(13) + VersionString + EndOfLine + VersionCopyRight)
		    QuitApp(True)
		  End
		  
		  #if TargetMacOS
		    mAVFoundationMBS = New MyAVFoundationMBS
		  #Endif
		  
		  InitGlobalConstants
		  Init_AppFolder
		  
		  MainSettings.Instance.Init(GetAppFolder)
		  
		  TESSA_DarkMode = WorkspaceSettings.DarkModeEnabled.GOAB
		  SplashWindow.darkModeSplash(TESSA_DarkMode)
		  
		  Init_ElementTypeList
		  
		  Init_System_Elements
		  
		  Security_Init
		  
		  MainWindow.checkDarkMode
		  MainWindow.Show
		  
		  SplashWindow.Close
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  AddDebugTextCR(CurrentMethodName)
		  If error <> Nil Then
		    Dim type As String = Introspection.GetType(error).Name
		    MsgBox(type + EndOfLine + EndOfLine + Join(error.Stack, EndOfLine))
		    return true
		  End If
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddDefinedProgram(FullPath As String)
		  If FullPath.Len > 0 Then
		    If DefinedProgrammFiles.IndexOf(FullPath) < 0 Then
		      DefinedProgrammFiles.Append(FullPath)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateConfigFolder(parentFolder As FolderItem, parentBasicClass As BasicClass)
		  If parentBasicClass <> Nil And parentFolder <> Nil Then
		    Dim SaveData As String = ""
		    parentBasicClass.SaveWithoutSubSubStep(SaveData, 0)
		    If SaveData <> "" Then
		      Dim file As FolderItem = parentFolder.Child(parentFolder.DisplayName + ".xml")
		      If file <> Nil And OpenMeasFileForSave(SaveData, file) Then
		        'MsgBox "Saved"
		      End
		    End
		    
		    Dim BS As BasicClass = parentBasicClass.FirstSubStep
		    While BS <> Nil
		      If BS.FirstSubStep <> Nil Then
		        Dim folder As FolderItem = parentFolder.Child(BS.Name.GIAS)
		        If folder <> Nil Then
		          folder.CreateAsFolder
		          CreateConfigFolder(folder, BS)
		        End
		      End
		      BS = BS.NextStep
		    Wend
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Debug_CheckWait(SC as StepClass) As boolean
		  // will return true if element is not on debug or it is the first run after pressing the release button on the DebugWindow
		  Dim RV as boolean = true
		  
		  if SC<>nil then
		    if SC.DebugOn then
		      if (SC=LastDebugElement)  then //and (SC.GetRunState=LastDebugRunState) then
		        RV=not(DebugHalt)
		      else
		        LastDebugRunState=SC.GetRunState
		        DebugHalt=true
		        RV=false
		      end
		    end
		    LastDebugElement=SC
		  end
		  
		  return RV
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Debug_GetHalt() As Boolean
		  return DebugHalt
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Debug_Reset()
		  
		  DebugHalt=false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Debug_Start()
		  DebugHalt=false
		  LastDebugElement = nil
		  LastDebugRunState = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConfigFolderItem(ShowMsg As Boolean = true) As FolderItem
		  Dim result As FolderItem = Nil
		  Dim f As FolderItem = GetWorkingFolderItem
		  If f <> Nil And f.Exists Then
		    Dim ConfigFolder As FolderItem = f.Child("TESSA_Config")
		    If ConfigFolder = Nil Or (not ConfigFolder.Exists) Then
		      ConfigFolder= GetWorkingFolderItem
		      ConfigFolder = f.Child("TESSA_Config") // no more AXTDL
		      If ConfigFolder <> Nil And ConfigFolder.Exists Then
		        result = ConfigFolder
		      End
		    Else
		      result = ConfigFolder
		    End
		  End
		  If ShowMsg And Not CheckFolder(result) Then
		    MsgBox("No configuration folder 'TESSA_Config' or 'AXTDL_config' found"+chr(13)+chr(13)+"Full path would be:"+chr(13)+f.NativePath) // absolut => native
		  End
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDefinedProgramFiles() As String()
		  Return DefinedProgrammFiles
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTESSAState() As Integer
		  '0 - running
		  '1 - waiting
		  '2 - Suspended
		  '3 - sleeping
		  '4 - not running
		  '5 - Loop not started yet
		  
		  Dim State As Integer = 4
		  If EventLoop <> Nil Then
		    State = EventLoop.State
		  else
		    State=5
		  End
		  Return State
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleAutomaticTestSequenceLoad(sequencePath As String)
		  If sequencePath = "" Then
		    // now check for definied autostart programms
		    Dim AuEl As BasicClass = nil
		    if GlobalResources<>nil then AuEl = GlobalResources.FindElement(GetTypeInfo(Autostart))
		    If AuEl <> nil And Autostart(AuEl).Autostart.GIAB Then
		      Dim  AuProg As BasicClass = AuEl.FindElement(GetTypeInfo(TESSA_Program))
		      If AuProg <> Nil Then
		        // load this programm
		        Dim P_Name As String = TESSA_Program(AuProg).Program_Name_with_Version.GIAS
		        Dim F_Name As String = TESSA_Program(AuProg).Folder.GIAS
		        If F_Name = "" Then
		          F_Name = Autostart(AuEl).Folder.GIAS
		        End
		        Dim programPath As String = GetFullFilePath(F_Name, P_Name)
		        AddDefinedProgram(programPath)
		        // open test programm
		        If TESSA_Program(AuProg).Autoload.GIAB Then
		          MainWindow.OpenTestSequence(programPath, False, 0)
		          If TESSA_Program(AuProg).Autostart.GIAB And GlobalTestSequence <> Nil Then
		            GlobalTestSequence.AutomaticStartup.SIAB(True)
		            MainLoop("toggle")
		          End
		        End
		      End
		    End
		  Else
		    AddDefinedProgram(sequencePath)
		    MainWindow.OpenTestSequence(sequencePath, False, 0)
		  End
		  If mStartupProgram <> "" And GlobalTestSequence <> Nil Then
		    For Each argument As String In CommandLineHandler.Instance.Arguments
		      Dim pos As Integer = argument.InStr("=")
		      if pos > 0 Then
		        Dim attr As AttributeClass = GlobalTestSequence.GetAttribute(argument.Left(pos - 1))
		        If attr <> Nil Then
		          attr.SIAS(argument.Mid(pos + 1))
		        End
		      End
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HMI_Active() As Boolean
		  //return True if HMI Attribute in AXTDL_Prog_Step is True
		  If GlobalTestSequence <> Nil Then
		    Return GlobalTestSequence.HMI.GIAB
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitTabs(CurrentStep As BasicClass)
		  If CurrentStep <> Nil Then
		    if CurrentStep IsA TabClass Then
		      TabClass(CurrentStep).SetGlobalTopmostElement(GlobalTopmostElement)
		      TabClass(CurrentStep).InitTab
		    End
		    
		    Dim BS As BasicClass = CurrentStep.FirstSubStep
		    While BS <> Nil
		      InitTabs(BS)
		      BS = BS.NextStep
		    Wend
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init_AppFolder()
		  Dim AppFolder As String = ""
		  Dim f As FolderItem = GetFolderItem("")
		  If f <> Nil And f.Exists Then
		    AppFolder = f.NativePath // absolut => native
		    #if DebugBuild And TargetWin32 Then
		      If f.NativePath.InStr("Debug") > 0 And f.Parent <> Nil Then
		        AppFolder = f.Parent.NativePath
		      End
		    #endif
		  End
		  SetAppFolder(AppFolder)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init_ElementTypeList()
		  SplashWindow.ClearProgressText
		  SplashWindow.AddToProgressText("Initialize and Load elements",true,true)
		  
		  // load elements folder
		  ElementTypeFactory.instance.LoadAllElements
		  SplashWindow.AddToProgressText(" - ok",false,false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init_ResourceLogNShowSplash(S as string, NewLine as boolean, LogoShift as boolean)
		  SplashWindow.AddToProgressText(S,NewLine,LogoShift)
		  if NewLine then
		    GlobalResources.AddRemarkToComLog(CR+S)
		  else
		    GlobalResources.AddRemarkToComLog(S)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init_Resource_Element(LA as BasicClass, Indent as integer)
		  
		  if LA IsA ResourceClass then
		    Dim IDT as string =""
		    Dim i as integer
		    for  i=0 to Indent
		      IDT=IDT+"  "
		    next
		    Init_ResourceLogNShowSplash(IDT+" - "+LA.Name.GIAS,true,false)
		    ResourceClass(LA).InitialState
		    IDT=" - "+ResourceClass(LA).Init_Resource
		    Init_ResourceLogNShowSplash(IDT,false,false)
		  end
		  LA=LA.FirstSubStep
		  while LA<>nil
		    Init_Resource_Element(LA,Indent+1)
		    LA=LA.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Init_System_Elements()
		  mUICaller = new Caller
		  // init loop for manual operation
		  ManualOperation = new Manual_OP_Loop
		  // init main loop
		  EventLoop = new LoopThread
		  
		  // init all global resources as TCP/IP connections, load reference tables
		  SplashWindow.AddToProgressText("Load configuration",true,true)
		  LoadConfig
		  if GlobalTopmostElement <> nil then
		    // handle special gui element function such as tables, graphs
		    MainWindow.Handle_All_Special_GUI_Elements(GlobalTopmostElement)
		  end
		  SplashWindow.AddToProgressText(" - ok",false,false)
		  
		  if GlobalTopmostElement.FirstSubStep<>nil then
		    if GlobalTopmostElement.FirstSubStep IsA TESSA_Config then
		      GlobalResources = ResourceClass(GlobalTopmostElement.FirstSubStep)
		      Init_ResourceLogNShowSplash("Initialize resources",true,true)
		      //try to connect included resources
		      Init_Resource_Element(GlobalResources,0)
		      //connect resources
		      'Dim it As BasicIteratorInterface = GlobalTopmostElement.Iterator
		      'While it.HasNext
		      'Dim BS As BasicClass = it.NextItem
		      'If Bs IsA Resource_StepClass Then
		      'Resource_StepClass(BS).Connect
		      'End
		      'Wend
		    end
		  end
		  
		  SplashWindow.AddToProgressText("Init Tabs",true,true)
		  InitTabs(GlobalTopmostElement) // The tabs were previously created by TabManager.AddElements()
		  SplashWindow.AddToProgressText(" - ok",false,false)
		  
		  SplashWindow.AddToProgressText("Load testprogram list",true,true)
		  MainWindow.initMenuBar("Testsequences")
		  
		  SplashWindow.AddToProgressText(" - ok",false,false)
		  
		  MainWindow.RefillTreeMenu("Resource")
		  
		  'initialize SYNC
		  SplashWindow.AddToProgressText("Load Sync settings",true,true)
		  LoadSYNCSettings
		  SplashWindow.AddToProgressText(" - ok",false,false)
		  
		  // check status of Resources and update StartupTab
		  
		  SplashWindow.AddToProgressText("Check Resource State",true,true)
		  Dim StartupTab As StartupTabClass = TabManager.GetStartupTabClass
		  If StartupTab <> Nil Then
		    StartupTab.CheckResourcesState
		  end
		  SplashWindow.AddToProgressText(" - ok",false,false)
		  
		  SplashWindow.AddToProgressText("Check Automatic Startup",true,true)
		  mStartupProgram = ""
		  Dim arguments(-1) As String = CommandLineHandler.Instance.Arguments
		  If arguments.Ubound > 1 And arguments(2).InStr("=") = 0 Then
		    mStartupProgram = arguments(2)
		  ElseIf arguments.Ubound > 0 And arguments(1).InStr("=") = 0 Then
		    mStartupProgram = arguments(1)
		  End
		  If mStartupProgram = "" And CommandLineHandler.Instance.Contains(CommandLineOptions.cTestSequenceOption) Then
		    mStartupProgram = CommandLineHandler.Instance.Value(CommandLineOptions.cTestSequenceOption)
		  End
		  HandleAutomaticTestSequenceLoad(mStartupProgram)
		  SplashWindow.AddToProgressText(" - ok",false,false)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadConfig()
		  // initialize global element
		  GlobalTopmostElement= new StepClass("")
		  GlobalTopmostElement.Name.SIAS("TESSA_FrameWork")
		  StepClass(GlobalTopmostElement).RunMode=0
		  GlobalTopmostElement.AddAttribute("SystemState","","",AT_String,0,0)
		  
		  //new configuration  version
		  //all configuration data contain in the hierarchy folders
		  Dim ConfigFolder As FolderItem = GetConfigFolderItem(false)
		  If CheckFolder(ConfigFolder) Then
		    LoadFolders(ConfigFolder, GlobalTopmostElement)
		  Else
		    MsgBox "There is no TESSA_Config folder. Please add one with the config files inside."
		    quit
		  End
		  
		  If not GlobalTopmostElement.FirstSubStep IsA TESSA_Config Then
		    Dim XML_Text_Pointer As integer = 1
		    Parse_XML(GlobalTopmostElement, DefaultConfig, XML_Text_Pointer)
		  End
		  
		  Dim MS as SettingsClass = WorkspaceSettings
		  if MS<>nil then
		    Global_SYNC_ID = MS.WorkSpace_SYNC_ID.GIAS
		  end
		  
		  TabManager.RegisterAllTabs (GlobalTopmostElement)
		  
		  // check for configuration links
		  GlobalTopmostElement.ConnectAllLinks
		  GlobalTopmostElement.CheckAllSubNames
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadFolders(f as FolderItem, UppersStep as BasicClass, mustExist as Boolean = true)
		  Assert f.Directory, "f must be a  folder"
		  
		  If f <> Nil And UppersStep <> Nil Then
		    
		    Dim ConfigFile As FolderItem = f
		    ConfigFile = f.Child(f.Name + ".xml")
		    
		    If ConfigFile <> Nil And ConfigFile.Exists  And not ConfigFile.Directory Then
		      Dim ConfigText As String = OpenMeasFileForLoad(ConfigFile, False)
		      if ConfigText = "" then
		        AddDebugTextCR("No XML content to parse")
		      else
		        Dim XML_Text_Pointer As integer = 1
		        Parse_XML(UppersStep, ConfigText, XML_Text_Pointer)
		      End
		    ElseIf mustExist then
		      MsgBox ("ConfigFile could not be opened")
		      quit
		    End
		    
		    Dim UpStep As BasicClass = UppersStep.FirstSubStep
		    If UpStep <> Nil Then
		      While UpStep.NextStep <> Nil
		        UpStep = UpStep.NextStep
		      Wend
		    Else
		      UpStep = UppersStep
		    End
		    
		    For i As Integer = 1 to f.Count
		      Dim item As FolderItem = f.Item(i)
		      If item <> Nil And item.DisplayName <> ConfigFile.DisplayName And item.DisplayName.Left(1) <> "." And item.DisplayName <> SyncFileName Then
		        if item.Directory then
		          LoadFolders(item, UpStep, false)
		        End If
		      End
		    Next
		  Else
		    AddDebugTextCR("Parent Element does not exist")
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadSYNCSettings()
		  Dim fileItem As FolderItem = GetConfigFolderItem
		  if fileItem <> Nil And fileItem.Exists And fileItem.Directory Then
		    fileItem = fileItem.Child(SyncFileName)
		    If fileItem <> Nil And fileItem.Exists Then
		      Dim SettingsData As String = OpenMeasFileForLoad(fileItem, False)
		      If SettingsData <> "" Then
		        Dim XML_Text_Pointer As Integer = 1
		        Parse_XML(GlobalTopmostElement, SettingsData, XML_Text_Pointer)
		        Dim BS As BasicClass = GlobalTopmostElement.FindElement(GetTypeInfo(SYNCModule.SYNCClass))
		        if BS <> Nil And BS IsA SYNCModule.SYNCClass Then
		          GlobalSYNC = SYNCModule.SYNCClass(BS)
		        End
		      End
		    End
		  End
		  If GlobalSYNC = Nil Then
		    GlobalSYNC = new SYNCModule.SYNCClass("")
		    GlobalSYNC = SYNCModule.SYNCClass(SNMS(GlobalSYNC, "SYNC", 1, ""))
		    GlobalSYNC.Name.SIAS("SYNC")
		    GlobalTopmostElement.AddSubElement(GlobalSYNC)
		  End
		  GlobalSYNC.StartChecking
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MainLoop(Command as string)
		  Select Case Command
		  Case Is = "stop"
		    If GlobalTestSequence <> Nil Then
		      GlobalTestSequence.Step_Exit
		    End
		    If EventLoop.State <> Thread.NotRunning Then
		      Call mUICaller.PushMethod (AddressOf MainWindow.Adjust_Buttons, "Adjust_Buttons", Nil)
		      
		      If mStartupProgram <> "" And CommandLineHandler.Instance.Contains(CommandLineOptions.cAutomaticEnd) Then
		        Call mUICaller.PushMethod (AddressOf App.QuitApp, "QuitApp", False, 0)
		      End
		      ActiveStartFromStep = Nil
		      ActiveRunOnceStep = Nil
		      Call mUICaller.PushMethod (AddressOf MainWindow.StartStop, "StartStop", "reset")
		      EventLoop.Kill
		    End
		  Case Is = "toggle"
		    'AddDebugText_("toggle "+str(GetTESSAState))
		    Select Case GetTESSAState
		    Case Thread.Running  //Running. The thread is running normally => put it into suspended mode
		      EventLoop.Suspend
		      Call mUICaller.PushMethod (AddressOf MainWindow.StartStop, "StartStop", "halt")
		    Case Thread.Suspended //suspend . The Thread is suspend => resume it from suspend mode
		      Call mUICaller.PushMethod (AddressOf MainWindow.StartStop, "StartStop", "start")
		      EventLoop.Resume
		    Case Thread.NotRunning  // NotRunning. The thread will be in this state prior to a call to Run or after the thread has finished running. => run it normaly
		      If Not SetActiveTestsequence Then
		        'AddDebugText_("no active Test Sequence to start")
		        Return
		      End
		      Call mUICaller.PushMethod (AddressOf MainWindow.StartStop, "StartStop", "start")
		      EventLoop.Run
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParseTestsequenceFile(ByRef parse_input as string, withDialog As Boolean = True, SP as ProgressWindow = nil, MergingMode as integer = 0) As Boolean
		  // mergingmode: 0 = delete existing testsequence, 1 = merge the 2 testsequences into the existing, 2 = merge & sync testsequences using the sync feature 
		  
		  if parse_input <> "" then
		    if GlobalTopmostElement <> nil then
		      If withDialog Then
		        if MergingMode=0 then
		          If not MainWindow.CloseSequence Then
		            Return False
		          End
		        end
		      Else
		        if MergingMode=0 then
		          MainWindow.Element_Delete(App.GlobalTestSequence)
		        end
		      End
		      Dim XML_Text_Pointer as integer = 1
		      Select case MergingMode
		      case 0 // delete existing sequence
		        Parse_XML(GlobalTopmostElement,parse_input,XML_Text_Pointer,SP )
		      case 1 // merge into new one
		        if App.GlobalTestSequence <> Nil then
		          // remove Testsequence/Testprogram  parts
		          Dim i1 as integer = parse_input.Instr(1,"<Testprogram")
		          if i1=0 then
		            i1 = parse_input.Instr(1,"<Testsequence")
		            if i1>0 then
		              Dim i2 as integer = parse_input.Instr(i1+1,">")
		              parse_input = parse_input.Mid(i2+1,parse_input.len-i2-15)
		            end
		          else
		            Dim i2 as integer = parse_input.Instr(i1+1,">")
		            parse_input = parse_input.Mid(i2+1,parse_input.len-i2-14)
		          end
		          Parse_XML(GlobalTestSequence,parse_input,XML_Text_Pointer,SP )
		        else
		          Parse_XML(GlobalTopmostElement,parse_input,XML_Text_Pointer,SP )
		        end
		      case 2 // merge with SYNC
		        // remove Testsequence/Testprogram  parts
		        #if SYNC_Feature
		          Dim SYNC_Element as BasicClass = new BasicClass("")
		          SYNC_Element.Name.SIAS("SYNC_Element")
		          Parse_XML(SYNC_Element,parse_input,XML_Text_Pointer,SP )
		          if App.GlobalTestSequence = Nil then
		            if SYNC_Element.FirstSubStep IsA TESSA_Prog_StepClass then
		              App.GlobalTestSequence=TESSA_Prog_StepClass(SYNC_Element.FirstSubStep)
		              GlobalTopmostElement.AddSubElement(SYNC_Element.FirstSubStep)
		            end
		          else
		            GlobalTopmostElement.AddSubElement(SYNC_Element)
		            Dim BS1,BS2 AS BasicClass
		            // for all elements in the SYNC_Elements do:
		            // find partner in MainProgram if found sync, if not add to GlobalTestSequence at same place
		            BS1=SYNC_Element.FirstSubStep
		            BS1.SyncElement(App.GlobalTestSequence)
		            
		            DeleteBasicStepClass(SYNC_Element,true)
		          end
		        #else
		          MsgBox("Feature not yet implemented")
		        #endif
		      end
		      if GlobalTopmostElement <> nil then
		        // load external elements
		        GlobalTopmostElement.LoadExternals
		        // handle special gui element function such as tables, graphs
		        MainWindow.Handle_All_Special_GUI_Elements(GlobalTopmostElement)
		        // establish all links
		        GlobalTopmostElement.ConnectAllLinks
		        GlobalTopmostElement.CheckAllSubNames
		      end
		      if App.GlobalTestSequence <> Nil then
		        App.GlobalTestSequence.Step_Init_AfterLoad
		        MainWindow.RefillTreeMenu("Active_TestSequence")
		      End
		      Return True
		    End
		  Else
		    AddDebugTextCR("An error occurred when opening the file")
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub QuitApp(immediately As Boolean, status As Integer = 0)
		  mQuitImmediately = immediately
		  Quit(status)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetChanges()
		  if GlobalTestSequence<>nil then
		    GlobalTestSequence.ClearChangeProperty
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveConfigFile() As Boolean
		  Dim result As Boolean = False
		  If GlobalResources <> Nil Then
		    Dim folder As FolderItem = GetWorkingFolderItem
		    if folder <> Nil Then
		      Dim f As FolderItem = folder.Child("TESSA_Config")
		      If f = Nil or (not f.Exists) Then
		        f = folder.Child("TESSA_Config") // no more AXTDL
		      End
		      If f <> Nil Then
		        If f.Exists And f.Directory And DeleteFolder(f) = 0 Then
		        End
		        
		        If not f.Exists Then
		          f.CreateAsFolder
		        End
		        CreateConfigFolder(f, GlobalResources)
		        result = True
		      End
		    End
		  End
		  Return result
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveSYNCSettings() As Boolean
		  Dim fileItem As FolderItem = GetConfigFolderItem
		  if fileItem <> Nil Then
		    if not fileItem.Exists Then
		      fileItem.CreateAsFolder
		    End
		    fileItem = fileItem.Child(SyncFileName)
		    if fileItem <> Nil And GlobalSYNC <> Nil Then
		      Dim SaveData As String = ""
		      GlobalSYNC.Save(SaveData, 0)
		      Return ((SaveData <> "") And (OpenMeasFileForSave(SaveData, fileItem)))
		    End
		  End
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Security_Check(OperationSecurityLevel as integer, ShowWarning as boolean = true) As boolean
		  // gives back the active Security level 
		  // if active Security level is not enough for the required operationLevel
		  // then the password group is being displayed
		  Security_LastAccessLevel = OperationSecurityLevel
		  
		  if OperationSecurityLevel>=SecurityLevel then
		    if ShowWarning then
		      MainWindow.TF_SecurityLevel.BackColor = &c00FF00
		      MainWindow.TF_SecurityLevel.Text=str(SecurityLevel)
		    end
		    return true
		  else
		    if ShowWarning then
		      MainWindow.TF_SecurityLevel.BackColor = &cFF0000
		      MainWindow.TF_SecurityLevel.Text=str(SecurityLevel)
		      MainWindow.SecurityGroup.Visible=true
		      SecurityState=1
		      PasswordWindow.show
		    end
		    return false
		  end
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Security_GetLevel() As integer
		  return SecurityLevel
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Security_GetNeededLevel() As integer
		  return Security_LastAccessLevel
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Security_Init()
		  Security_Unlock(MainSettings.Instance.Password_Init)
		  MainWindow.SecurityGroup.Visible=false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Security_Lock()
		  MainWindow.SecurityGroup.Visible=false
		  SecurityState=0
		  if SecurityLevel>0 then SecurityLevel=5
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Security_ResetTimer()
		  // reset the security timer
		  App.Security_Unlock(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Security_Unlock(value as integer)
		  MainWindow.SecurityGroup.Visible=true
		  if value>=0 then SecurityLevel = value
		  SecurityState=1
		  MainWindow.mPasswordTimer.StartTimer(MainSettings.Instance.GetResetTime)
		  MainWindow.TF_SecurityLevel.Text=str(SecurityLevel)
		  MainWindow.TF_SecurityLevel.BackColor = &c00FF00
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function SetActiveTestsequence() As Boolean
		  Dim NewActiveMeasStep as StepClass = Nil
		  
		  If mActiveRunOnceStep <> Nil Then
		    NewActiveMeasStep = mActiveRunOnceStep
		  ElseIf mActiveStartFromStep <> Nil Then
		    NewActiveMeasStep = mActiveStartFromStep
		  Else
		    Dim BS As BasicClass = GlobalTestSequence
		    If BS IsA StepClass Then
		      NewActiveMeasStep = StepClass(BS)
		    Else
		      MsgBox "You cannot run because You didn't open any Testsequence."
		      Return False
		    End
		  End
		  
		  If HMI_Active Then
		    // activate HMI Window
		    HMI_Window.Init
		    If mActiveStartFromStep <> Nil Or mActiveRunOnceStep <> Nil Then
		      HMI_Window.Change_HMI_Page(NewActiveMeasStep.GetUpperTest_Step)
		    End
		  else
		    HMI_Window.Close
		  end
		  
		  If EventLoop.GetActiveMeasStep <> Nil Then
		    EventLoop.GetActiveMeasStep.Reset
		  End
		  
		  EventLoop.SetStartStep(NewActiveMeasStep)
		  
		  NewActiveMeasStep.Reset
		  NewActiveMeasStep.ResetErrors
		  NewActiveMeasStep.Step_Init
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwitchGlobalDebug()
		  
		  if GlobalDebug then
		    DebugWindow.Hide
		    GlobalDebug=false
		  else
		    DebugWindow.Show
		    GlobalDebug=true
		  end
		  MainWindow.SwitchDebugMode(GlobalDebug)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TestConditionalCompilation()
		  #If PIIOXCompilation
		    using TestModulePIIOX
		  #else
		    using TestModule
		  #endif
		  
		  ShowDialog
		End Sub
	#tag EndMethod


	#tag Note, Name = Programing rules
		nS1. Never use a pointer of a return function without checking
		wrong:
		  Dim folder as FolderItem = GetFolderItem(GetWorkingFolder).Child("Templates")
		right:
		  Dim folder as FolderItem = GetFolderItem(GetWorkingFolder)
		  if CheckFolder(folder) then
		     folder= folder.Child("Templates")
		  else
		     ...
		  end
		
	#tag EndNote


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mActiveRunOnceStep
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mActiveRunOnceStep = value
			  If mActiveRunOnceStep <> Nil then
			    MainLoop("toggle")
			  End
			End Set
		#tag EndSetter
		ActiveRunOnceStep As StepClass
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mActiveStartFromStep
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mActiveStartFromStep = value
			  If mActiveStartFromStep <> Nil Then
			    If GetTESSAState = Thread.Suspended And Not SetActiveTestsequence Then
			      Return
			    End
			    MainLoop("toggle")
			  End
			End Set
		#tag EndSetter
		ActiveStartFromStep As StepClass
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DebugHalt As boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DefaultConfig As string = "<XTDL_ConfigName=""TESSA_Config""User=""User""version=""0""><StartupTabName=""StartupTab""TabName=""Startup""Type=""600COM03""Autostart=""on""/><TableTabName=""TableTab""TabName=""Tables""Position=""2""/><GraphTabName=""GraphTab""TabName=""Graphs""Position=""3""/><IEDTabName=""IEDTab""TabName=""IEDTab""Position=""4""/><EEPROMTabName=""EEPROMTab""TabName=""EEPROM""Position=""5""/><SourceTabName=""SourceTab""TabName=""Source""Position=""6""/><LogTabName=""Log""TabName=""Log""Position=""7""/><ReportTabName=""ReportTab""TabName=""Reports""Position=""8""/></XTDL_Config>"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DefinedProgrammFiles(-1) As String
	#tag EndProperty

	#tag Property, Flags = &h0
		EventLoop As LoopThread = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		GlobalDebug As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		GlobalResources As ResourceClass
	#tag EndProperty

	#tag Property, Flags = &h0
		GlobalSYNC As SYNCModule.SYNCClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		GlobalTestSequence As TESSA_Prog_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		GlobalTopmostElement As BasicClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastDebugElement As StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastDebugRunState As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActiveRunOnceStep As StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActiveStartFromStep As StepClass = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ManualOperation As Manual_OP_Loop = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAVFoundationMBS As MyAVFoundationMBS = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		mMutex As Mutex
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mQuitImmediately As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartupProgram As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUICaller As Caller = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			// security level:
			// 0 = no security
			// 1 = highest security level, can do everything (=Admin)
			// 2 = can change and save changes but not save
			// 3 = can make changes but not save them
			// 4 = can load but not change nor save
			// 5 = cannot load/change/save anything
		#tag EndNote
		Private SecurityLevel As integer = 5
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// security state:
			// 0 = no display
			// 1 = display no timing
			// 2 = running timer
		#tag EndNote
		SecurityState As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SecurityWindow As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Security_LastAccessLevel As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SequenceRunMode As RunSequenceModeEnum = RunSequenceModeEnum.Normal
	#tag EndProperty

	#tag Property, Flags = &h0
		VersionCopyRight As string
	#tag EndProperty

	#tag Property, Flags = &h0
		VersionString As string
	#tag EndProperty


	#tag Constant, Name = kCopyEditShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+C"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Ctrl+C"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+C"
	#tag EndConstant

	#tag Constant, Name = kCutEditShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Ctrl+X"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+X"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+X"
	#tag EndConstant

	#tag Constant, Name = kDelEditShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"Beenden", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"E&xit"
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"&Quit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant

	#tag Constant, Name = kPasteEditShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+V"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Ctrl+V"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+V"
	#tag EndConstant

	#tag Constant, Name = kSelAllEditShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+A"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"Ctrl+A"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+A"
	#tag EndConstant

	#tag Constant, Name = ManualFolderName, Type = String, Dynamic = False, Default = \"Docs", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PIIOXCompilation, Type = Boolean, Dynamic = False, Default = \"false", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SyncFileName, Type = String, Dynamic = False, Default = \"SYNCPrefs.xml", Scope = Private
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="DebugHalt"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="GlobalDebug"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastDebugRunState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SecurityState"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Security_LastAccessLevel"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SequenceRunMode"
			Visible=false
			Group="Behavior"
			InitialValue="RunSequenceModeEnum.Normal"
			Type="RunSequenceModeEnum"
			EditorType="Enum"
			#tag EnumValues
				"0 - Normal"
				"1 - StepByStep"
				"2 - ElementByElement"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="VersionCopyRight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VersionString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
