#tag Class
Protected Class Test_StepClass
Inherits HMI_StepClass
Implements ReportIF
	#tag Method, Flags = &h0
		Sub Add_TeststepReportList(byref ix as integer)
		  #Pragma Unused ix
		  
		  if Me.ExecuteTest.GIAB then
		    if Me.TestReportList<>nil then
		      //Me.TestReportList.Refresh_Teststep_ReportList(ix)
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  if ChangedAttribute<>nil then
		    Super.AttributeChanged(ChangedAttribute)
		    If App.HMI_Active And ChangedAttribute Is TestResult Then
		      ThreadSafeMethodCall (AddressOf HMI_Window.UpdateTestStepList, "UpdateTestStepList", 0, ChangedAttribute)
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckError(ByRef S as string, ByRef ErrState as integer)
		  // Teil des Interfaces von ReportIF
		  Dim LE as integer = TestResult.GIAI
		  if ExecuteTest.GIAB then
		    if AddToTestReport.GIAB then
		      if ExecuteSkip.GIAB then
		        LE = ErrorCode_Skipped
		      else
		        if LE = ErrorCode_Fail then
		          S = S + ErrorMessage.GIAS
		        end
		      end
		    end
		    if ErrState < LE then
		      ErrState = LE
		    end
		  end
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckErrorOn() As boolean
		  return Me.ExecuteTest.GIAB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CollectErrorMessages(ByRef RM as string, ByRef EM as string, ByRef ErrState as integer, NoSuppressFirst as boolean)
		  // this routine will collect all errorMessage for reporting purposes (also when no error occured)
		  // also all included objects will be checked
		  // object will only be checked for messages if they have implemented the ReportIF interface
		  // with NoSuppress there is the possibility to supress the first element as this one (e.g. TestStep) might not have been tested yet
		  // thus not returning usable values
		  Dim LE as integer = 0
		  
		  if NoSuppressFirst then
		    if (Self IsA ReportIF) and AddToTestReport.GIAB then
		      ReportIF(self).GetErrorMessage(RM, EM, LE)
		      'AddDebugTextCR("RM: "+RM+"   EM: "+EM+"  Err: "+str(ErrState))
		    end
		  end
		  
		  Dim LS as BasicClass = Me.FirstSubStep
		  while LS <> nil
		    if self IsA ReportIF then
		      if ReportIF(self).CheckErrorOn then
		        LS.CollectErrorMessages(RM, EM, LE, true)
		      end
		    else
		      LS.CollectErrorMessages(RM, EM, LE, true)
		    end
		    LS = LS.NextStep
		  wend
		  
		  if LE <> ErrorCode_Off And LE>ErrState then
		    ErrState=LE
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Picture = IAP("Picture","",false, AttributeGroups.Appearance)
		  Picture_Mode = IAE("Picture_Mode","2 Plain FixScale ScaleToScreen FillScreen FillScreenProportional",false, AttributeGroups.Appearance)
		  Picture_Scale = IAD("Picture_Scale",1,false, AttributeGroups.Appearance)
		  Picture_X = IAI("Picture_X",100,false, AttributeGroups.Appearance)
		  Picture_Y = IAI("Picture_Y",100,false, AttributeGroups.Appearance)
		  
		  InitOnRepeat=IAB("InitOnRepeat",false,false)
		  ExecuteFlag = IAB("ExecuteFlag",false, false, AttributeGroups.System)
		  ExecuteRepeat = IAB("ExecuteRepeat",false,false)
		  ExecuteSkip = IAB("ExecuteSkip",false,false)
		  HMI_Page = IAE("HMI_Page","3 Invisible Listed Transparent Solid",false)
		  
		  UserHalt=IAE("UserHalt","0 off on stop_loop",false)
		  UserWait=IAE("UserWait","0 off on stop_loop",false)
		  
		  ExecuteTest = IAB("ExecuteTest",false,false)
		  AddToTestReport = IAB("AddToTestReport",true,false)
		  Report = IAS("Report","",false)
		  
		  TestResult = IAE("TestResult",ErrorCodeEnum,false, AttributeGroups.System)
		  ErrorMessage = IAS("ErrorMessage","",false)
		  Action_on_Error = IAE("Action_on_Error","0 Global_Setting Halt_on_Fail Show_on_Fail Halt+End_on_Fail Direct_End_on_Fail Continue_on_Fail",false)
		  Retries_on_Error = IAI("Retries_on_Error",0,false)
		  
		  ErrorButtons = IAS("ErrorButtons","111", false, AttributeGroups.Appearance)
		  Button_Next=IAS("Button_Next","",false, AttributeGroups.Appearance)
		  Button_Repeat=IAS("Button_Repeat","",false, AttributeGroups.Appearance)
		  Button_EndTest=IAS("Button_EndTest","",false, AttributeGroups.Appearance)
		  
		  TestReportList=new TestReportCollection
		  BackgroundColor.SIAS("&cECECEC")
		  BackgroundColor.ResetDefault
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetActionOnError() As integer
		  Dim ti as integer =Action_on_Error.GIAI
		  if ti=0 then
		    Dim TP As TESSA_Prog_StepClass = GetTESSAProgram
		    if TP<>nil then
		      ti=TP.TestResult_Halt.GIAI
		    end
		  end
		  return ti
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetErrorGotoStep() As Test_StepClass
		  Dim BS as BasicClass = nil
		  if Action_on_Error.GIAI=0 then
		    Dim TP As TESSA_Prog_StepClass = GetTESSAProgram
		    if TP<>nil then
		      if TP.End_Teststep.Link<>NIL THEN
		        BS=TP.End_Teststep.Link.MyStep
		      else
		        BS=FindElement(TP.End_Teststep.GIAS,true)
		      end
		    end
		  else
		    if Button_EndTest.Link<>nil then
		      BS=Button_EndTest.Link.MyStep
		      
		    else
		      BS=FindElement(Button_EndTest.GIAS,true)
		    end
		  end
		  
		  if (BS<>nil) and (BS IsA Test_StepClass) then
		    return Test_StepClass(BS)
		  else
		    return nil
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorMessage(ByRef RM as string, ByRef EM as string, ByRef ErrState as integer)
		  #Pragma Unused RM
		  #Pragma Unused EM
		  
		  // Teil des Interfaces von ReportIF
		  if Me.ExecuteTest.GIAB then
		    if not(DoSubSteps.GIAB) then
		      TestResult.SIAI(ErrorCode_Off)
		      ErrState = ErrorCode_Off
		    ElseIf ExecuteSkip.GIAB then
		      TestResult.SIAI(ErrorCode_Skipped)
		    end
		    If ErrState < TestResult.GIAI then
		      ErrState = TestResult.GIAI
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStepButtonState(Button As StepButtonEnum) As Integer
		  Dim ButtonSetup As String = ErrorButtons.GIAS
		  if ButtonSetup <> "" Then
		    Select case Button
		    Case StepButtonEnum.ButtonRepeat
		      Return CType(val(ButtonSetup.Mid(1,1)), Integer)
		    Case StepButtonEnum.ButtonEndTest
		      Return CType(val(ButtonSetup.Mid(2,1)), Integer)
		    Case StepButtonEnum.ButtonNext
		      Return CType(val(ButtonSetup.Mid(3,1)), Integer)
		    End
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitAfterLoad()
		  Super.InitAfterLoad
		  
		  Call RemoveAttribute("Title")
		  Call RemoveAttribute("TextColor")
		  Call RemoveAttribute("TextSize")
		  Call RemoveAttribute("Coordinates")
		  Call RemoveAttribute("Anchors")
		  ReplaceAttribute("Next","Button_Next")
		  ReplaceAttribute("Repeat","Button_Repeat")
		  ReplaceAttribute("Reset","Button_EndTest")
		  Call RemoveAttribute("Back")
		  
		  Title = Nil
		  TextColor = Nil
		  TextSize = Nil
		  Coordinates = Nil
		  
		  if ErrorButtons.GIAS.Len>3 then
		    ErrorButtons.SIAS(ErrorButtons.GIAS.Mid(1,1)+ErrorButtons.GIAS.Mid(3,2))
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitHandlers()
		  AddHandler Picture_Canvas.Resized, AddressOf ParentResizedHandler
		  AddHandler Picture_Canvas.Resizing, AddressOf ParentResizedHandler
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // this routine is called when ever the upper test step is starting or repeating it's function
		  // this routine is not called by the teststep itself
		  Super.Init_Teststep_Start
		  
		  if Me.UserWait.GIAI>0  then
		    Me.ExecuteFlag.SIAB(false)
		  end
		  
		  Me.TestResult.SIAI(ErrorCode_NotDone)
		  if App.HMI_Active then
		    ThreadSafeMethodCall (AddressOf HMI_Window.HMI_ResetError, "HMI_ResetError", 0, self)
		    UpdatePicture
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalInit()
		  // set the testreport if there is one
		  'Me.TestReport=Me.GetReport
		  
		  if (Me.UserWait.GIAI>0) or (Me.UserHalt.GIAI>0) or Me.ExecuteRepeat.GIAB then
		    if Me.InitOnRepeat.GIAB then
		      Me.ExecuteFlag.SIAB(false)
		    end
		  end
		  
		  if Me.ExecuteSkip.GIAB then
		    Me.ExecuteFlag.SIAB(true)
		    Me.TestResult.SIAI(ErrorCode_Skipped)
		  else
		    Me.TestResult.SIAI(ErrorCode_NotDone)
		  end
		  AttributeChanged(TestResult)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  #Pragma Unused mode
		  if mPictureBuffer <> Nil Then
		    Dim img As Picture = ScalePicture(mPictureBuffer, g.Width, g.Height, Me.Picture_Mode.GIAI, Me.Picture_Scale.GIAD)
		    Dim newImg As Picture
		    If Picture_Canvas <> Nil Then
		      newImg =  New Picture (Picture_Canvas.Width, Picture_Canvas.Height, 32)
		    Else
		      newImg = New Picture (mPictureBuffer.Width, mPictureBuffer.Height, 32)
		    End
		    g.ForeColor = BackgroundColor.GIAC
		    g.FillRect(0,0,newImg.Width, newImg.Height)
		    
		    Dim xLeft,yTop As Integer = 0
		    if Me.Picture_Mode.GIAI < 2 then
		      xLeft = Me.Picture_X.GIAI
		      yTop = Me.Picture_Y.GIAI
		    else
		      xLeft = (g.Width - img.Width) / 2
		      yTop = (g.Height - img.Height) / 2
		    end
		    
		    g.DrawPicture(img, xLeft, yTop)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ParentResizedHandler(canvas As HMI_Canvas)
		  If canvas <> Nil Then
		    ParentResized(canvas.Left, canvas.Top, canvas.Width, canvas.Height)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReleaseStop(ResetAttibute as boolean, ResetSuspend as boolean, ResetError as Boolean)
		  if ResetSuspend then
		    if (App.EventLoop.State=Thread.Suspended)  then
		      App.EventLoop.Resume
		      'AddDebugTextCR("Resume in ReleaseStop")
		    end
		  end
		  
		  if ResetAttibute then
		    Me.ExecuteFlag.SIAB(true)
		  end
		  
		  if ResetError then
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveHMI()
		  Super.RemoveHMI
		  If Picture_Canvas <> Nil Then
		    
		    RemoveHandler Picture_Canvas.Resized, AddressOf ParentResizedHandler
		    RemoveHandler Picture_Canvas.Resizing, AddressOf ParentResizedHandler
		    
		    Picture_Canvas.Close
		  End
		  Picture_Canvas = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetAllErrors(ResetState as integer)
		  // this routine will reset all errorMessage for reporting purposes
		  // also all included objects will be reset
		  
		  if Me.ExecuteSkip.GIAB then
		    if Self IsA ReportIF then
		      Me.ResetError(ErrorCode_Skipped)
		    end
		    Dim LS as BasicClass = Me.FirstSubStep
		    while LS <> nil
		      LS.ResetAllErrors(ErrorCode_Skipped)
		      LS = LS.NextStep
		    wend
		  else
		    if Self IsA ReportIF then
		      Me.ResetError(ResetState)
		    end
		    Dim LS as BasicClass = Me.FirstSubStep
		    while LS <> nil
		      LS.ResetAllErrors(ResetState)
		      LS = LS.NextStep
		    wend
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetError(ResetState as integer)
		  // part of ReportIF
		  if Me.ExecuteTest.GIAB then
		    if Me.ExecuteSkip.GIAB then
		      Me.TestResult.SIAI(ErrorCode_Skipped)
		    else
		      Me.TestResult.SIAI(ResetState)
		    end
		  else
		    Me.TestResult.SIAI(ErrorCode_Off)
		  end
		  Me.ErrorMessage.SIAS("")
		  AttributeChanged(TestResult)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveReport()
		  if Me.Report.GIAS<>"" then
		    Dim FS as BasicClass
		    // save the report
		    'AddDebugText("Save report "+Me.Name.GIAS)
		    FS=Me.FindStep(Me.Report.GIAS)
		    if FS<>nil then
		      if FS IsA TestReport_StepClass then
		        if TestReport_StepClass(FS).FunctionCall_Run("CollectTemporary", Me.Name.GIAS) then
		          'AddDebugTextCR("  ==> Saved report :-) ")
		        end
		      end
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGotoStep(GotoStep as Test_StepClass, Gosub as boolean)
		  // this routine will set and prepare for a step to another test step
		  
		  if GotoStep<>nil then
		    GotoTestStep = GotoStep
		    if GoSub then
		      GoSubFlag = 2
		    else
		      GoSubFlag = 1
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRunMode(Enabled As Boolean)
		  If Picture_Canvas <> Nil Then
		    Picture_Canvas.SetRunMode(Enabled)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_End() As Boolean
		  Dim RV as Boolean = true
		  
		  if UserHalt.GIAI>0 then
		    // check if Execute flag is set. If it is, then go to next state and reset the flag, otherwise do nothing
		    if ExecuteFlag.GIAB then
		      RV=true
		      ExecuteFlag.SIAB(false)
		    else
		      RV=false
		    end
		    if ((App.EventLoop.State=Thread.Running) or (App.EventLoop.State=Thread.Waiting)) and (ExecuteFlag.GIAI=2) then
		      // this code currently never executes because ExecuteFlag can't become 2.
		      App.EventLoop.Suspend
		      'AddDebugTextCR("Eventloop suspend at end")
		    end
		  else
		    RV=true
		  end
		  
		  if ExecuteTest.GIAB and DoSubSteps.GIAB then
		    if ExecuteSkip.GIAB  then
		      TestResult.SIAI(ErrorCode_Skipped)
		      ErrorMessage.SIAS("Test step "+Name.GIAS+" was skipped")
		      If App.HMI_Active Then
		        ThreadSafeMethodCall (AddressOf HMI_Window.HMI_ShowTestResultMessage, "HMI_ShowTestResultMessage", 0, nil)
		      End
		      SaveReport
		    else
		      Dim S as string =""
		      Dim Em, RM as string =""
		      Dim ErrState as integer = ErrorCode_Pass
		      TestResult.SIAI(ErrState)
		      //Me.CheckForErrors(S,ErrState)
		      CollectErrorMessages(RM,EM,ErrState,false)
		      TestResult.SIAI(ErrState)
		      //beep if activated
		      ErrorBeep 
		      if  (ErrState = ErrorCode_Fail) then
		        // check for retries first 
		        if Retries_Counter=-1 then
		          SaveReport
		          RV=true
		        elseif Retries_on_Error.GIAI>Retries_Counter then
		          // do a retry
		          AddWarningTextCR("Teststep "+Name.GIAS+" performs a retry on error with "+str(Retries_Counter)+" retries")
		          Retries_Counter=Retries_Counter+1
		          SetRetries(Retries_Counter)
		          Step_Init
		          RV=false
		        else
		          if Retries_on_Error.GIAI>0 then
		            AddWarningTextCR("Teststep "+Name.GIAS+" experienced an error with "+str(Retries_Counter)+" retries")
		          end
		          RV=false
		          //handle error display
		          Dim ti as integer = GetActionOnError
		          'AddDebugTextCR("An error at teststep "+Name.GIAS+" occured. ReactionNr is "+str(ti))
		          if ti>0 then
		            ErrorMessage.SIAS(EM)
		            if AddToTestReport.GIAB then SaveReport
		            // show error window
		            If App.HMI_Active and (ti>0) Then
		              Select case ti
		              case 0 // no action
		              case 1 // Halt_on_Fail  
		                RunState=7
		                Retries_Counter=-1
		                ThreadSafeMethodCall (AddressOf HMI_Window.HMI_Set_View, "HMI_Set_View",0, 1)
		                ThreadSafeMethodCall (AddressOf HMI_Window.Adjust_Buttons, "Adjust_Buttons", 100, self)
		              case 2 // Show_on_Fail 
		                RunState=7
		                Retries_Counter=-1
		                ThreadSafeMethodCall (AddressOf HMI_Window.HMI_Set_View, "HMI_Set_View",0, 1)
		                ThreadSafeMethodCall (AddressOf HMI_Window.Adjust_Buttons, "Adjust_Buttons", 100, self)
		                ThreadSafeMethodCall (AddressOf HMI_Window.HMI_ShowTestResultMessage, "HMI_ShowTestResultMessage", 100, nil)
		              case 3 // Halt+End_on_Fail
		                RunState=7
		                Retries_Counter=-1
		                SaveReport
		                ThreadSafeMethodCall (AddressOf HMI_Window.HMI_Set_View, "HMI_Set_View",0, 1)
		                ThreadSafeMethodCall (AddressOf HMI_Window.Adjust_Buttons, "Adjust_Buttons", 100, self)
		                ThreadSafeMethodCall (AddressOf HMI_Window.HMI_ShowTestResultMessage, "HMI_ShowTestResultMessage", 100, nil)
		              case 4 // Direct_End_on_Fail
		                SaveReport
		                ExecuteFlag.SIAB(true)
		                RV=true
		                SetGotoStep(GetErrorGotoStep,false)
		                // halt if halt on error is activated
		                // the test has to be displayed or an error occured proceed accordingly
		              case 5 // Continue_on_Fail
		                RV=true
		                ExecuteFlag.SIAB(true)
		              end
		            else
		              RV=true
		            end
		          end
		        end
		      else
		        // everything ok proceed to next step
		        If App.HMI_Active Then
		          ThreadSafeMethodCall (AddressOf HMI_Window.HMI_ShowTestResultMessage, "HMI_ShowTestResultMessage", 100, nil)
		        End
		        SaveReport
		        Step_Exit
		      end
		    end
		  elseif self.ExecuteFlag.GIAB or RV=true then
		    TestResult.SIAI(ErrorCode_Pass)
		    SaveReport
		    Step_Exit
		    If App.HMI_Active Then
		      ThreadSafeMethodCall (AddressOf HMI_Window.HMI_ShowTestResultMessage, "HMI_ShowTestResultMessage", 0, nil)
		    End
		  end
		  AttributeChanged(TestResult)
		  
		  Select case GoSubFlag
		  case 0
		  case 1
		    ExecuteSkip.SIAB(false)
		    GoSubFlag = 0
		  case 2
		    GoSubFlag = 1
		  end
		  
		  if App.HMI_Active then
		    ThreadSafeMethodCall (AddressOf HMI_Window.Adjust_Buttons, "Adjust_Buttons", 0, nil)
		  end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Exit()
		  // before leaving, reset all needed flags
		  
		  Super.Step_Exit
		  Retries_Counter = 0
		  ExecuteFlag.SIAB(false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_GetNextStep() As StepClass
		  if GotoTestStep=nil then
		    return Super.Step_GetNextStep
		  else
		    Dim TS as Test_StepClass = GotoTestStep
		    if GoSubFlag>0 then
		      ExecuteSkip.SIAB(true)
		    end
		    GotoTestStep = nil
		    return TS
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_HMI_UpdateAll(mode As Integer, IsFirst as boolean = true)
		  Dim BS as BasicClass = FirstSubStep
		  While BS<>nil
		    If BS IsA HMI_StepClass Then
		      HMI_StepClass(BS).Step_HMI_Update(mode)
		      HMI_StepClass(BS).Step_HMI_UpdateAll(mode,false)
		    End
		    BS=BS.NextStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  InternalInit
		  'SetRetries(Retries_Counter)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Super.Step_Init_AfterLoad
		  InternalInit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Repeat() As boolean
		  // if the function returns true the step is repeated, if false it proceeds to the next step
		  Dim RV as Boolean = false
		  
		  // first check if repeat loop has to be continued
		  if ExecuteRepeat.GIAB then
		    if ExecuteFlag.GIAB then
		      RV=false
		    else
		      RV=true
		    end
		  end
		  
		  // now deal with inner elements
		  if InitOnRepeat.GIAB then
		    // do not intit test step itself but only included elements
		    Super.Init_Teststep_Start
		    TestResult.SIAI(ErrorCode_InProgress)
		    AttributeChanged(TestResult)
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  Dim RV as Boolean
		  
		  If App.HMI_Active Then
		    ThreadSafeMethodCall (AddressOf HMI_Window.HMI_Set_View, "HMI_Set_View", 0, 0)
		  End
		  
		  if ExecuteSkip.GIAB then
		    // skip this test step
		    TestResult.SIAI(ErrorCode_Skipped)
		    AttributeChanged(TestResult)
		    'Me.DoSubSteps.SIAB(false)
		    RunState=6
		    RV=true
		  else
		    RV=false
		    if InitFlag then
		      InitFlag=false
		      Init_Teststep_Start
		    end
		    
		    // test if startup routine can proceed
		    if UserWait.GIAI>0  then
		      // check if Execute flage is set. If it is go to next state and reset the flag otherwise do nothing
		      if ExecuteFlag.GIAB then
		        RV=true
		        ExecuteFlag.SIAB(false)
		      else
		        if UserWait.GIAI=2  then
		          // stop the process loop
		          App.EventLoop.Suspend
		          'AddDebugTextCR("Eventloop suspend at start")
		        end
		      end
		    else
		      //if no test needed then set flag to proceed
		      RV=true
		    end
		  end
		  
		  if RV then
		    // if flag for proceeding is set => do initialize test step
		    TestResult.SIAI(ErrorCode_InProgress)
		    AttributeChanged(TestResult)
		    InitFlag=true
		    // check if there has to be
		    if ExecuteRepeat.GIAB or (UserHalt.GIAI>0) then
		      ExecuteFlag.SIAB(false)
		    end
		  end
		  
		  'Me.TestReportList.SetLine(0,Me.Name.GIAS,"Description","Criteria","Measurement",Me.ErrorMessage.GIAS,Me.TestResult.GIAI)
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopAll()
		  // To be called when aborting the processing, e.g. when quitting the app or closing the Test window.
		  
		  if mUICaller <> nil then
		    mUICaller.ClearAllCallings
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdatePicture(reload As Boolean = false)
		  if reload Then
		    mPictureBuffer = Picture.GIAP
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Action_on_Error As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AddToTestReport As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Button_EndTest As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Button_Next As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Button_Repeat As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ComeFromTestStep As Test_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorButtons As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorMessage As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			this attribute is used for stopping and releasing the programm flow
		#tag EndNote
		ExecuteFlag As Boolean_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		ExecuteRepeat As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ExecuteSkip As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ExecuteTest As Boolean_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			this flag is being used for indicating that the next event will be the return from a Goto call with GoSub = true.
			the test step will then go to its end directly, then reset this flag
		#tag EndNote
		Private GoSubFlag As integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		GotoNext As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private GotoTestStep As Test_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		HMI_Page As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		InitFlag As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		InitOnRepeat As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPictureBuffer As Picture = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Picture As Picture_Attribute = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Picture_Canvas As HMI_Canvas = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Picture_Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Picture_Scale As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Picture_X As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Picture_Y As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Report As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Retries_Counter As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Retries_on_Error As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestReport As TestReport_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestResult As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestResult_Halt As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Testspec_Reference As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TeststepReportNr As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		UserHalt As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		UserHalt_onRepeat As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		UserWait As Enum_AttributeClass = nil
	#tag EndProperty


	#tag Enum, Name = StepButtonEnum, Type = Integer, Flags = &h0
		ButtonRepeat
		  ButtonEndTest
		ButtonNext
	#tag EndEnum


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
			Name="GotoNext"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="InitFlag"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
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
			Name="Retries_Counter"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			Name="TeststepReportNr"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
