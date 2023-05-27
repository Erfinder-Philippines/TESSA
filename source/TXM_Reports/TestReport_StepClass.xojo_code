#tag Class
Protected Class TestReport_StepClass
Inherits ReportStepClass
Implements ElementCall
	#tag Method, Flags = &h0
		Sub AddTestreport()
		  // make a new Testreport headder and increase counter by one
		  
		  'CurrentTestreports.Add
		  
		  
		  // search for that name and determine the right run
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTestreportHeader()
		  
		  Dim t as integer =0
		  
		  CurrentTestreports.Set_Headder(t,Me.SerialNumber.GIAS, Me.Barcode.GIAS, "")
		  
		  CurrentTestreports.Set(t,"Barcode",Me.Barcode.GIAS,"","","","")
		  
		  
		  CurrentTestreports.Set(t,"Teststation",Me.Teststation_Name.GIAS,"","","","")
		  CurrentTestreports.Set(t,"Testprogram version",Me.Testprogramm_Version.GIAS,"","","","")
		  CurrentTestreports.Set(t,"Testsequence",Me.Testprogramm_Name.GIAS,"","","","")
		  CurrentTestreports.Set(t,"TestDate",Me.TestDate.GIAS,"","","","")
		  CurrentTestreports.Set(t,"Operator",Me.Tester_Name.GIAS,"","","","")
		  CurrentTestreports.Set(t,"ModuleType",Me.ModuleType.GIAS,"","","","")
		  CurrentTestreports.Set(t,"SerialNumber",Me.SerialNumber.GIAS,"","","","")
		  CurrentTestreports.Set(t,"ArticleNumber",Me.ArticleNumber.GIAS,"","","","")
		  CurrentTestreports.Set(t,"ModuleRevision",Me.ModuleRevision.GIAS,"","","","")
		  CurrentTestreports.Set(t,"FPGAVersion",Me.FPGAVersion.GIAS,"","","","")
		  
		  
		  
		  
		  
		  CurrentTestreports.Set(t,"Testresult",Me.TestResult.GIAS,"","","","")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CollectErrors(Headder as boolean, Collection as boolean, EndTest as boolean, RTS as string)
		  Dim LS as BasicClass
		  Dim S, RM, EM as string
		  Dim ErrState as integer
		  Dim i as integer
		  
		  if Headder then
		    if Collection then
		      ErrState=ErrorCode_Pass
		    else
		      ErrState=ErrorCode_NotDone
		    end
		  else
		    ErrState=Me.TestResult.GIAI
		  end
		  
		  if RTS="" then
		    LS=FindStep(Me.Report_Teststep_Name.GIAS)
		  else
		    LS=FindStep(RTS)
		  end
		  if LS=nil then
		    LS=self
		    while LS.UpperStep<>nil
		      LS=LS.UpperStep
		    wend
		  end
		  if Collection then
		    EM=""
		    RM=""
		    LS.CollectErrorMessages(RM,EM,ErrState,false)
		    if (ErrState=ErrorCode_NotDone) and EndTest then
		      ErrState=ErrorCode_Pass
		    end
		    Me.TestResult.SIAI(ErrState)
		    
		  end
		  if Headder then
		    // set the header information
		    S="Barcode"+TAB+Me.Barcode.GIAS+CR
		    S=S+GetHeader
		    
		    S=S+RM
		  else
		    S=RM
		  end
		  
		  // add the test steps information
		  Select case ErrState
		  case ErrorCode_NotDone, ErrorCode_Pass
		    Me.ErrorMessage.SIAS("All tests passed ok")
		  case ErrorCode_InProgress
		    EM="One or more test steps still in progress - thus end result is failed:"+CR+CR+EM
		    Me.ErrorMessage.SIAS(EM)
		  case ErrorCode_Skipped
		    EM="One or more test steps have been skipped - thus end result is failed:"+CR+CR+EM
		    Me.ErrorMessage.SIAS(EM)
		  case ErrorCode_Fail
		    EM="Following Error(s) occured during this test:"+CR+CR+EM
		    Me.ErrorMessage.SIAS(EM)
		  end
		  
		  Me.ReportContent.SIAS(S)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CollectErrors_old(Headder as boolean, Collection as boolean, EndTest as boolean, RTS as string)
		  Dim LS as BasicClass
		  Dim S, RM, EM as string
		  Dim ErrState as integer
		  
		  if Headder then
		    if Collection then
		      ErrState=ErrorCode_Pass
		    else
		      ErrState=ErrorCode_NotDone
		    end
		  else
		    ErrState=Me.TestResult.GIAI
		  end
		  
		  if RTS="" then
		    LS=FindStep(Me.Report_Teststep_Name.GIAS)
		  else
		    LS=FindStep(RTS)
		  end
		  if LS=nil then
		    LS=self
		    while LS.UpperStep<>nil
		      LS=LS.UpperStep
		    wend
		  end
		  if Collection then
		    EM=""
		    RM=""
		    LS.CollectErrorMessages(RM,EM,ErrState,false)
		    Me.TestResult.SIAI(ErrState)
		    if (ErrState=ErrorCode_NotDone) and EndTest then
		      ErrState=ErrorCode_Pass
		    end
		  end
		  if Headder then
		    // set the header information
		    S="Barcode"+TAB+Me.Barcode.GIAS+CR
		    S=S+"Teststation"+TAB+Me.Teststation_Name.GIAS+TAB+Me.Teststation_Version.GIAS+CR
		    S=S+"Testprogram version"+TAB+App.VersionString+CR
		    S=S+"Testsequence"+TAB+Me.Testprogramm_Name.GIAS+TAB+Me.Testprogramm_Version.GIAS+CR
		    S=S+"TestDate"+TAB+Me.TestDate.GIAS+CR
		    S=S+"Tester"+TAB+TrimString(Me.Tester_Name.GIAS,CR)+CR
		    S=S+"ModuleType"+TAB+Me.ModuleType.GIAS+CR
		    S=S+"SerialNumber"+TAB+Me.SerialNumber.GIAS+CR
		    S=S+"ArticleNumber"+TAB+Me.ArticleNumber.GIAS+CR
		    S=S+"ModuleRevision"+TAB+Me.ModuleRevision.GIAS+CR
		    S=S+"Testresult"+TAB+Me.TestResult.GIAS+CR
		    S=S+RM
		  else
		    S=RM
		  end
		  
		  // add the test steps information
		  Select case ErrState
		  case ErrorCode_NotDone, ErrorCode_Pass
		    Me.ErrorMessage.SIAS("All tests passed ok")
		  case ErrorCode_InProgress, ErrorCode_Skipped
		    EM="One or more test steps have been skipped - thus end result is failed:"+CR+CR+EM
		    Me.ErrorMessage.SIAS(EM)
		  case ErrorCode_Fail
		    EM="Following Error(s) occured during this test:"+CR+CR+EM
		    Me.ErrorMessage.SIAS(EM)
		  end
		  
		  Me.ReportContent.SIAS(S)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CollectReportLines() As string
		  // this routine collects all testreport result lines
		  Dim FS as BasicClass = GetTESSAProgram
		  Dim S as string
		  if FS<>nil then
		    'S=FS.GetAllReportLines
		  end
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  ReportContent=IAS("ReportContent","",false)
		  ReportTable=IAS("ReportTable","",false)
		  ReportTableHeadder=IAS("ReportTableHeadder","",false)
		  Mode=IAE("Mode","4 off single multiple permanent collect",false)
		  NumberofTestRuns=IAI("NumberofTestRuns",1,false)
		  Report_Teststep_Name=IAS("Report_Teststep_Name","",false)
		  Barcode=IAS("Barcode","",false)
		  EEPROM=IAS("EEPROM","",false)
		  
		  Teststation_Name=IAS("Teststation_Name","",false)
		  Teststation_Version=IAS("Teststation_Version","",false)
		  Testprogramm_Name=IAS("Testprogramm_Name","",false)
		  Testprogramm_Version=IAS("Testprogramm_Version","",false)
		  TestDate=IAS("TestDate","",false)
		  Tester_Name=IAS("Tester_Name","",false)
		  
		  FileName=IAS("FileName","",false)
		  
		  ModuleType=IAS("ModuleType","",false)
		  ArticleNumber=IAS("ArticleNumber","",false)
		  ModuleRevision=IAS("ModuleRevision","",false)
		  SerialNumber=IAS("SerialNumber","",false)
		  MAC1=IAI("MAC1",0,false)
		  MAC2=IAI("MAC2",0,false)
		  MAC3=IAI("MAC3",0,false)
		  MAC4=IAI("MAC4",0,false)
		  MAC5=IAI("MAC5",0,false)
		  // MAC-hex display:
		  MAC1.Format=3                     
		  MAC2.Format=3
		  MAC3.Format=3
		  MAC4.Format=3
		  MAC5.Format=3
		  TestType=IAS("TestType","",false)
		  SubFolder=IAS("SubFolder","",false)
		  AutomaticFolder=IAE("AutomaticFolder","0 none monthly",false)
		  FPGAVersion=IAS("FPGAVersion","",false)
		  AddSystemState=IAB("AddSystemState",false,false)
		  
		  CurrentTestreports=new TestReportMatrix("CurrentTestRun")
		  
		  SubStrings_toReport=IAS("SubStrings_toReport","",true)
		  
		  ReportContent.NoSave=true
		  
		  AddUserFunction("make",ReportContent)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Poll(FunctionName as string, Parameter as string) As integer
		  // Teil des Interfaces von ElementCall
		  #Pragma Unused FunctionName
		  #Pragma Unused Parameter
		  return 2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Run(FunctionName as string, Parameter as string) As boolean
		  // Teil des Interfaces von ElementCall
		  
		  Select case FunctionName
		  case is="Init"
		    Me.Step_Init
		  case is="Start"
		    Me.ResetReportedErrors(Me.Report_Teststep_Name.GIAS)
		    Me.ReportTable.SIAS("")
		    Me.ReportContent.SIAS("")
		    Me.CollectErrors(true, false, false, Parameter)
		    if Me.SaveReport(1) then
		    end
		  case is="Collect"
		    Me.CollectErrors(false,true,false, Parameter)
		    if Me.SaveReport(2) then
		    end
		  case is="CollectTemporary"
		    Me.CollectErrors(false,true,false, Parameter)
		    if Me.SaveReport(2) then
		    end
		  case is="End"
		    Me.CollectErrors(true, true, true, Me.Report_Teststep_Name.GIAS)
		    if Me.SaveReport(0) then
		      if Me.SaveReport(5) then
		      end
		    end
		    if AddSystemState.GIAB then
		      // find upper TESSA_Testprogram
		      Dim BS as BasicClass = UpperStep
		      while (BS<>nil) and not(BS IsA TESSA_Prog_StepClass)
		        BS = BS.UpperStep
		      wend
		      if (BS<>nil) and (BS IsA TESSA_Prog_StepClass) then
		        TESSA_Prog_StepClass(BS).DoCollectSystemState
		      end
		    end
		  case is="Add"
		    Me.ReportContent.SIASAdd_CR(Parameter)
		    if Me.SaveReport(2) then
		    end
		  case is="Table"
		    Me.ReportTable.SIASAdd_CR(Parameter)
		  case is="TableHeadder"
		    Me.ReportTableHeadder.SIASAdd_CR(Parameter)
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Start(FunctionName as string) As boolean
		  // Teil des Interfaces von ElementCall
		  #Pragma Unused FunctionName
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorMessage(ByRef RM as string, ByRef EM as string, ByRef ErrState as integer)
		  if Me.ExecuteTest.GIAB then
		    RM=RM+"Teststep"+TAB+Me.Name.GIAS+TAB+Me.TestDescription.GIAS+TAB+Me.TestCriteria.GIAS+TAB+Me.TestMeasurement.GIAS+TAB+Me.TestResult.GIAS+CR
		    
		    EM=Me.GIAS("ErrorMessage")+CR
		    
		    if ErrState<Me.TestResult.GIAI then
		      ErrState=Me.TestResult.GIAI
		    end
		  end
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHeader() As string
		  Dim S as string
		  
		  // set the header information
		  S=S+"Teststation"+TAB+Me.Teststation_Name.GIAS+TAB+Me.Teststation_Version.GIAS+CR
		  S=S+"Testprogram version"+TAB+App.VersionString+CR
		  S=S+"Testsequence"+TAB+Me.Testprogramm_Name.GIAS+TAB+Me.Testprogramm_Version.GIAS+CR
		  S=S+"TestDate"+TAB+Me.TestDate.GIAS+TAB+"TestrunNumber"+TAB+Me.NumberofTestRuns.GIAS+CR
		  S=S+"Tester"+TAB+TrimString(Me.Tester_Name.GIAS,CR)+CR
		  S=S+"ModuleType"+TAB+Me.ModuleType.GIAS+CR
		  S=S+"SerialNumber"+TAB+Me.SerialNumber.GIAS+CR
		  S=S+"ArticleNumber"+TAB+Me.ArticleNumber.GIAS+CR
		  S=S+"ModuleRevision"+TAB+Me.ModuleRevision.GIAS+CR
		  
		  if Me.MAC1.GIAI <> 0 then        // initialized to dec -1
		    S=S+"MAC Address 1"+TAB+Me.MAC1.GIAS+CR
		  end
		  if Me.MAC2.GIAI <> 0 then        // initialized to dec -1
		    S=S+"MAC Address 2"+TAB+Me.MAC2.GIAS+CR
		  end
		  if Me.MAC3.GIAI <>0 then        // initialized to dec -1
		    S=S+"MAC Address 3"+TAB+Me.MAC3.GIAS+CR
		  end
		  if Me.MAC4.GIAI <> 0 then        // initialized to dec -1
		    S=S+"MAC Address 4"+TAB+Me.MAC4.GIAS+CR
		  end
		  if Me.MAC5.GIAI <> 0 then        // initialized to dec -1
		    S=S+"MAC Address 5"+TAB+Me.MAC5.GIAS+CR
		  end
		  
		  Dim i as integer
		  for i=0 to SubStrings_toReport.GIAN-1 
		    if SubStrings_toReport.GIAS(i) <>"" then
		      S=S+"SubType"+TAB+Me.SubStrings_toReport.GIAS(i)+CR
		    end
		  next
		  
		  Dim BS as BasicClass = FirstSubStep
		  while BS<>nil 
		    if BS IsA Report_Element then
		      S=S+Report_Element(BS).GetReportHeader
		    end
		    BS=BS.NextStep
		  wend
		  
		  S=S+CR+"Testresult"+TAB+TestResult.GIAS+CR
		  
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetReportedErrors(RTS as string)
		  // resets all Errors within the defined report range
		  Dim LS as BasicClass
		  
		  Me.ResetError(ErrorCode_Pass)
		  
		  if RTS="" then
		    LS=FindStep(Me.Report_Teststep_Name.GIAS)
		  else
		    LS=FindStep(RTS)
		  end
		  if LS=nil then
		    LS=self
		    while LS.UpperStep<>nil
		      LS=LS.UpperStep
		    wend
		  end
		  
		  LS.ResetAllErrors(ErrorCode_NotDone)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveReport(Mode as integer) As boolean
		  // saves the result into the file
		  // mode = 0  save with checking of name and runs
		  // mode = 1 save the first time as -U
		  // mode = 2 temporary save as -U
		  // mode = 3 load exisiting -U and save it with updating test result
		  // mode = 4 load content of existing
		  // mode = 5 delete temporary file -U
		  
		  Dim f1, f2 As FolderItem
		  Dim t As TextOutputStream
		  Dim z as TextInputStream
		  Dim Result as boolean
		  Dim NamePart, ResultLetter as string
		  Dim NumTestruns as integer
		  Dim S as string
		  Dim i1,i2 as integer
		  
		  'AddDebugTextCR(" saving report with mode "+str(Mode))
		  
		  Select case Mode
		  case 0,3
		    // concat file name
		    Select case Me.TestResult.GIAI
		    case ErrorCode_Pass, ErrorCode_NotDone
		      ResultLetter="-P" //pass
		    case ErrorCode_Fail
		      ResultLetter="-F" //fail
		    else
		      ResultLetter="-S" //some tests skipped by user
		    end
		  case 1,2
		    ResultLetter="-U" //unfinished test
		  end
		  NamePart=Me.ModuleType.GIAS+"-"+Me.SerialNumber.GIAS+"-"+Me.TestType.GIAS
		  'AddDebugTextCR("NamePart = "+NamePart)
		  NumTestruns=0
		  //test if file already exists
		  Result=false
		  
		  Dim SubFolderOpend as boolean = false
		  if Me.SubFolder.GIAS<>"" then
		    f1= GetFolderItem(Me.SubFolder.GIAS) //try to open directly
		  end
		  if not((f1<>nil) and (f1.exists)) then
		    f1= GetWorkingFolderItem //file type defined in File Type Sets Editor
		  else
		    SubFolderOpend=true
		  end
		  if f1<>nil then
		    if not(SubFolderOpend) and (Me.SubFolder.GIAS<>"")  then // if subfolder not directly opend then try again
		      f1=f1.Child(Me.SubFolder.GIAS)
		    end
		    if f1<>nil then
		      if not f1.Exists Then
		        f1.CreateAsFolder
		      End
		      //handle automatic monthly folder
		      Select case Me.AutomaticFolder.GIAI
		      case 0
		        
		      case 1
		        Dim ActDate as Date = New Date
		        Dim MFolder as string
		        if ActDate.Month<10 then
		          MFolder=str(ActDate.Year)+"-0"+str(ActDate.Month)
		        else
		          MFolder=str(ActDate.Year)+"-"+str(ActDate.Month)
		        end
		        f2=f1.Child(MFolder)
		        if (f2<>nil) and f2.exists then
		          f1=f2
		        else
		          f2.CreateAsFolder
		          f1=f2
		        end
		      end
		      
		      if (f1<>nil) and f1.exists then
		        Select case Mode
		        case 0,3
		          // now we check if the run-number is already used with one of the possible ResultLetters
		          
		          // load old and replace the result by the end result
		          if Mode=3 then
		            S=NamePart+"-U.txt"
		            Me.FileName.SIAS(S)
		            f2=f1.Child(S)
		            if (f2<>nil) then
		              if f2.exists then
		                t = TextOutputStream.Create(f2)
		              else
		                t = TextOutputStream.Create(f2)
		              end
		            end
		          else
		            // mode=0 =>
		            S=NamePart+"-U.txt"
		            f2=f1.Child(S)
		            if (f2<>nil) and f2.exists then
		              z= TextInputStream.Open(f2)
		              if z<>nil then
		                S=z.ReadAll(Encodings.UTF8)
		                z.close
		                
		                S=ReportContent.GIAS
		                S=Update_Testresult(S)
		                'ReportContent.SIAS(S)
		                
		                Dim BS as BasicClass = FirstSubStep
		                while BS<>nil 
		                  if BS IsA Report_ElementTeststep then
		                    S=S+Report_ElementTeststep(BS).GetReportTeststep
		                    if Report_ElementTeststep(BS).Testresult.GIAI>TestResult.GIAI then
		                      TestResult.SIAI (Report_ElementTeststep(BS).Testresult.GIAI)
		                    end
		                  end
		                  BS=BS.NextStep
		                wend
		                
		                S=Update_Testresult(S)
		                
		                S=S+CR+"Appendix"+TAB+"------------------"+CR
		                
		                if Me.ReportTable.GIAS<>"" then
		                  S=S+CR+"Table data:"
		                  if Me.ReportTableHeadder.GIAS<>"" then
		                    S=S+Me.ReportTableHeadder.GIAS
		                  end
		                  S=S+Me.ReportTable.GIAS+CR
		                end
		                
		                Me.ReportContent.SIAS(S)
		                
		                // add the eeprom information to the end if it is definied
		                if Me.EEPROM.Link<>nil then
		                  S=S+CR+"EEPROM data:"+CR
		                  S=S+Me.EEPROM.GIAS
		                end
		                
		                Me.ReportContent.SIAS(S)
		                
		                BS = FirstSubStep
		                while BS<>nil 
		                  if BS IsA Report_Element then
		                    S=S+Report_Element(BS).GetReportAppendix
		                  end
		                  BS=BS.NextStep
		                wend
		                
		                Me.ReportContent.SIAS(S)
		                
		                Select case Me.TestResult.GIAI
		                case ErrorCode_Pass, ErrorCode_NotDone
		                  ResultLetter="-P" //pass
		                case ErrorCode_Fail
		                  ResultLetter="-F" //fail
		                else
		                  ResultLetter="-S" //some tests skipped by user
		                end
		                
		                S=NamePart+"-R"+Me.NumberofTestRuns.GIAS+ResultLetter+".txt"
		                Me.FileName.SIAS(S)
		                f2=f1.Child(S)
		                
		                'AddDebugTextCR(" prepare file "+S)
		                
		                if (f2<>nil) then
		                  'AddDebugTextCR(" open file "+S)
		                  t = TextOutputStream.Create(f2)
		                end
		              end
		            end
		          end
		          
		        case 1
		          S=NamePart+"-U.txt"
		          Me.FileName.SIAS(S)
		          f2=f1.Child(S)
		          if (f2<>nil)  then
		            t = TextOutputStream.Create(f2)
		          end
		        case 2
		          S=NamePart+"-U.txt"
		          Me.FileName.SIAS(S)
		          f2=f1.Child(S)
		          if (f2<>nil)  then
		            if f2.Exists then
		              t = TextOutputStream.append(f2)
		            else
		              t = TextOutputStream.Create(f2)
		            end
		          end
		        end
		        
		        if Mode=5 then
		          // now delete the temprory -U file if existing
		          S=NamePart+"-U.txt"
		          Me.FileName.SIAS(S)
		          f2=f1.Child(S)
		          if (f2<>nil) and f2.Exists then
		            f2.Delete
		          end
		        else
		          If (t <> Nil) Then
		            //save with specified encoding of input stream
		            'AddDebugTextCR(" save report file to "+S)
		            t.Write ConvertEncoding(Me.ReportContent.GIAS, encodings.Utf8)
		            t.Close
		            Result= true
		          End
		          // add test report to list
		          MainWindow.AddTestreporttoList(S)
		        end
		      end
		    else
		      'AddDebugTextCR(" report file not found ")
		    end
		  else
		    //no report folder found
		    'AddDebugTextCR(" work folder not found ")
		  End
		  
		  'Me.NumberofTestRuns.SIAI(NumTestruns)
		  return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveReport_old(Mode as integer) As boolean
		  // saves the result into the file
		  // mode = 0  save with checking of name and runs, load old and replace the result by the end result
		  // mode = 1 save the first time as -U
		  // mode = 2 intermediate save as -U
		  // mode = 3 load exisiting -U and save it with updating test result
		  
		  Dim f1, f2 As FolderItem
		  Dim t As TextOutputStream
		  Dim z as TextInputStream
		  Dim Result as boolean
		  Dim NamePart, ResultLetter as string
		  Dim NumTestruns as integer
		  Dim S as string
		  Dim NameAlreadyUsed as boolean
		  Dim i1,i2 as integer
		  
		  'AddDebugTextCR(" saving report with mode "+str(Mode))
		  
		  Select case Mode
		  case 0,3
		    // concat file name
		    Select case Me.TestResult.GIAI
		    case ErrorCode_Pass, ErrorCode_NotDone
		      ResultLetter="-P" //pass
		    case ErrorCode_Fail
		      ResultLetter="-F" //fail
		    else
		      ResultLetter="-S" //some tests skipped by user
		    end
		  case 1,2
		    ResultLetter="-U" //unfinished test
		  end
		  NamePart=Me.ModuleType.GIAS+"-"+Me.SerialNumber.GIAS+"-"+Me.TestType.GIAS
		  'AddDebugTextCR("NamePart = "+NamePart)
		  NumTestruns=0
		  //test if file already exists
		  Result=false
		  
		  f1= GetWorkingFolderItem //file type defined in File Type Sets Editor
		  if CheckFolder(f1) then
		    f1=f1.Child(Me.SubFolder.GIAS)
		    if f1<>nil then
		      if f1.exists then
		        Select case Mode
		        case 0,3
		          // now we check if the run-number is already used with one of the possible ResultLetters
		          NameAlreadyUsed=true
		          while NameAlreadyUsed
		            NumTestruns=NumTestruns+1
		            NameAlreadyUsed=false
		            // test for Pass
		            S=NamePart+"-R"+str(NumTestruns)+"-P.txt"
		            f2=f1.Child(S)
		            if f2.exists then
		              NameAlreadyUsed=true
		            end
		            // test for Fail
		            S=NamePart+"-R"+str(NumTestruns)+"-F.txt"
		            f2=f1.Child(S)
		            if f2.exists then
		              NameAlreadyUsed=true
		            end
		            // test for Skipped
		            S=NamePart+"-R"+str(NumTestruns)+"-S.txt"
		            f2=f1.Child(S)
		            if f2.exists then
		              NameAlreadyUsed=true
		            end
		          wend
		          //
		          if Mode=0 then
		            // mode=0 => load old and replace the result by the end result, add table and EEPROM data
		            'AddDebugTextCR(" Sav report  at end")
		            //load existing -U file
		            S=NamePart+"-U.txt"
		            f2=f1.Child(S)
		            if f2.exists then
		              'AddDebugTextCR(" Changing End Result")
		              z= TextInputStream.Open(f2)
		              S=z.ReadAll(Encodings.UTF8)
		              z.close
		              // replace Testresult by final one
		              i1= S.Instr(1,"Testresult")
		              i2=S.Instr(i1,CR)
		              if (i1>0) and (i2>0) then
		                S=S.Mid(1,i1-1)+"Testresult"+TAB+Me.TestResult.GIAS+CR+S.Mid(i2+1)
		              end
		              // save back to Content
		              Me.ReportContent.SIAS(S)
		            else
		              'AddDebugTextCR(" file -U not found")
		              S=Me.ReportContent.GIAS
		            end
		            //add table data
		            if Me.ReportTable.GIAS<>"" then
		              S=S+CR+"Table data:"
		              if Me.ReportTableHeadder.GIAS<>"" then
		                S=S+Me.ReportTableHeadder.GIAS
		              end
		              S=S+Me.ReportTable.GIAS+CR
		            end
		            
		            Me.ReportContent.SIAS(S)
		            'AddDebugTextCR(" Table added")
		            
		            // add the eeprom information to the end if it is definied
		            if Me.EEPROM.GIAS<>"" then
		              S=S+CR+"EEPROM data:"+CR
		              S=S+Me.EEPROM.GIAS
		            end
		            
		            Me.ReportContent.SIAS(S)
		            
		            'AddDebugTextCR(" EEPROM added")
		            
		            S=NamePart+"-R"+str(NumTestruns)+ResultLetter+".txt"
		            Me.FileName.SIAS(S)
		            f2=f1.Child(S)
		            t = TextOutputStream.Create(f2)
		            
		          end
		          
		        case 1 // create new file for temporary save
		          S=NamePart+"-U.txt"
		          Me.FileName.SIAS(S)
		          f2=f1.Child(S)
		          if f1.Exists then
		            t = TextOutputStream.Create(f2)
		          end
		        case 2 // append to existing file with -U
		          S=NamePart+"-U.txt"
		          Me.FileName.SIAS(S)
		          f2=f1.Child(S)
		          if f2.Exists then
		            t = TextOutputStream.append(f2)
		          end
		        end
		        
		        If t <> Nil Then
		          //save with specified encoding of input stream
		          t.Write ConvertEncoding(Me.ReportContent.GIAS, encodings.Utf8)
		          t.Close
		          Result= true
		        End
		        // add test report to list
		        Redim MainWindow.TestReportTable(MainWindow.TestReportTable.Ubound+1)
		        MainWindow.TestReportTable(MainWindow.TestReportTable.Ubound-1)=S
		      end
		    else
		      AddDebugTextCR(" report file not found ")
		    end
		  else
		    //no report folder found
		    AddDebugTextCR(" work folder not found ")
		  End
		  
		  Me.NumberofTestRuns.SIAI(NumTestruns)
		  
		  return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  
		  Select case Me.Mode.GIAI
		  case 0 // off
		  case 1 // single
		    Me.ReportContent.SIAS("")
		  case 2 // multiple
		    Me.ReportContent.SIAS("")
		  case 3 // permanent
		    
		  case 4 // collect
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  'AddDebugText(Me.GetAllReportLines)
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TestForReport(ThisTestType As String="", NumFiles as integer) As boolean
		  // looks if the module has already been tested "pass" and return true if a file exists.
		  
		  Dim f1, f2 As FolderItem
		  Dim RV as boolean=false
		  Dim NamePart as string
		  Dim NumTestruns as integer
		  Dim AllFoldersChecked as boolean
		  Dim NextFolderOk as boolean
		  Dim FolderCount as integer
		  Dim MFolder as string
		  Dim ActDate as Date = New Date
		  Dim FirstMonth as integer=ActDate.Month
		  Dim FirstYear as integer =ActDate.Year
		  Dim ThisMonth as integer=FirstMonth
		  Dim ThisYear as integer =FirstYear
		  Dim i as integer
		  Dim SN, NR as string
		  
		  if ThisTestType="" then
		    NamePart=Me.ModuleType.GIAS+"-"+Me.SerialNumber.GIAS+"-"+Me.TestType.GIAS(Me.TestType.GIAA)
		  else
		    NamePart=Me.ModuleType.GIAS+"-"+Me.SerialNumber.GIAS+"-"+ThisTestType
		  end
		  
		  NumTestruns=1
		  //test if file already exists
		  f1= GetWorkingFolderItem //file type defined in File Type Sets Editor
		  if CheckFolder(f1) then
		    f1=f1.Child(Me.SubFolder.GIAS)
		    if f1<>nil then
		      if f1.exists then
		        // now we check if the run-number is already used with one of the possible ResultLetters
		        // test as long until this name is
		        AllFoldersChecked=false
		        FolderCount=-1
		        ThisMonth=FirstMonth
		        ThisYear=FirstYear
		        while not(AllFoldersChecked)
		          //handle automatic monthly folder
		          NextFolderOk=false
		          while not(NextFolderOk) and not(AllFoldersChecked)
		            if FolderCount=-1 then
		              FolderCount=0
		              NextFolderOk=true
		              f2=f1
		            else
		              ThisMonth=FirstMonth-FolderCount
		              while ThisMonth<1
		                ThisMonth=ThisMonth+12
		                ThisYear=ThisYear-1
		              wend
		              if ThisMonth<10 then
		                MFolder=str(ThisYear)+"-0"+str(ThisMonth)
		              else
		                MFolder=str(ThisYear)+"-"+str(ThisMonth)
		              end
		              f2=f1.Child(MFolder)
		              if (f2<>nil) and f2.exists then
		                NextFolderOk=true
		              end
		              
		              if (FolderCount>24) or (((ThisYear-2012)*12+ThisMonth)<12) then
		                AllFoldersChecked=true
		              else
		                FolderCount=FolderCount+1
		              end
		            end
		          wend
		          
		          if NextFolderOk then
		            // load all files with .xml ending into the drop down menu
		            if (f2<>nil) and f2.exists then
		              For i=1 to f2.Count
		                SN=f2.Item(i).DisplayName
		                //
		                if SN.Instr(1,NamePart)>0 then
		                  
		                  if SN.Instr(1,NamePart+"-U")>0 then
		                    // this is a temporary folder only
		                  else
		                    
		                    AllFoldersChecked=true
		                    // found a file check for run number now
		                    Dim k1,k2 as integer
		                    Dim trp as boolean
		                    NR =SN.Mid(NamePart.len+3,SN.len)
		                    trp=NR.Instr(1,"P")>0
		                    //AddDebugTextCR("TestForReport: trp = "+str(trp)+" for NR = "+NR+" and SN = "+SN)
		                    k2=NR.Instr(1,".txt")-3
		                    if k2>0 then
		                      NR=NR.Mid(1,k2)
		                      k1=val(NR)
		                      if k1>=NumTestruns then
		                        NumTestruns=k1+1
		                        RV=trp
		                      end
		                    end
		                    //  if the first match is there, need to exit immediately, not check for remaining files
		                    if RV then
		                      exit for i
		                    end
		                  end
		                end
		              next
		            end
		          end
		          
		        wend
		      end
		    end
		  else
		    //no report folder found
		    i=i
		  End
		  
		  
		  
		  Me.NumberofTestRuns.SIAI(NumTestruns)
		  
		  return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Update_Testresult(S as string) As string
		  Dim i1, i2 as integer
		  
		  i1= S.Instr(1,"Testresult")
		  i2=S.Instr(i1+10,CR)
		  if (i1>0) and (i2>i1) then
		    S=S.Mid(1,i1-1)+"Testresult"+TAB+TestResult.GIAS+CR+CR+S.Mid(i2+1)
		  end
		  
		  return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  Case is = "make"
		    if SaveReport(3) then
		      if SaveReport(0) then
		        if SaveReport(5) then
		        end
		      end
		    end
		  end
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = TestReport_StepClass
		
		Is used for collecting report and error information from each test step that has implemented the ReportIF interface
	#tag EndNote


	#tag Property, Flags = &h0
		AddSystemState As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ArticleNumber As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected AutomaticFolder As Enum_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Barcode As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentTestreports As TestReportMatrix
	#tag EndProperty

	#tag Property, Flags = &h0
		EEPROM As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FileName As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FPGAVersion As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		MAC1 As Integer_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		MAC2 As Integer_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		MAC3 As Integer_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		MAC4 As Integer_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		MAC5 As Integer_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ModuleRevision As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ModuleType As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberofTestRuns As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReportContent As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReportTable As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReportTableHeadder As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Report_Teststep_Name As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SerialNumber As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SubFolder As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SubStrings_toReport As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestDate As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Tester_Name As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Testprogramm_Name As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Testprogramm_Version As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Teststation_Name As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Teststation_Version As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestType As String_AttributeClass = nil
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
			Name="DebugOn"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="MaxRetries"
			Visible=false
			Group="Behavior"
			InitialValue="5"
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
			Name="NextTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
			Name="RetryWait"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWaitTime"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
		#tag ViewProperty
			Name="Untitled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
