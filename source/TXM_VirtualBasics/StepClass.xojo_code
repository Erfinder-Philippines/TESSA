#tag Class
Protected Class StepClass
Inherits BasicClass
	#tag Method, Flags = &h0
		Function CheckRunState(TestState as integer) As Boolean
		  return (TestState=RunState)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  Super.Constructor(ConfigText)
		  
		  Me.WaitTime=Me.IAD("Wait",0,false)
		  Me.Description=Me.IAS("Description","",false)
		  Me.LastTime=Me.IAD("LastTime",0,false, AttributeGroups.System)
		  Me.LastTime.ReadOnly = True
		  Me.DoSubSteps=Me.IAB("DoSubSteps",true,false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataAvailable() As boolean
		  // virtual method to see if there is data waiting
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContextMenuItems() As MenuItem()
		  Dim items(-1) As MenuItem = Super.GetContextMenuItems
		  
		  Dim onceItem As new MenuItem(OnceMenuItem, OnceMenuItem)
		  Dim startFromItem As new MenuItem(StartFromMenuItem, StartFromMenuItem)
		  
		  Dim tessaState As Integer = App.GetTESSAState
		  If tessaState = Thread.NotRunning Then
		    AddHandler onceItem.Action, AddressOf OnMenuItemTriggered
		  End
		  If tessaState = Thread.NotRunning Or tessaState = Thread.Suspended Then
		    AddHandler startFromItem.Action, AddressOf OnMenuItemTriggered
		  End
		  
		  items.Append(onceItem)
		  items.Append(startFromItem)
		  items.Append(new MenuItem(MenuItem.TextSeparator))
		  
		  Dim watchItem As new MenuItem(WatchMenuItem, WatchMenuItem)
		  Dim followItem As new MenuItem(FollowMenuItem, FollowMenuItem)
		  
		  items.Append(watchItem)
		  items.Append(followItem)
		  items.Append(new MenuItem(MenuItem.TextSeparator))
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFirst_StepClass_Substep() As StepClass
		  Dim BS as BasicClass
		  
		  BS=FirstSubStep
		  while (BS<>nil) and not(BS IsA StepClass)
		    BS=BS.NextStep
		  wend
		  
		  if BS=nil then
		    return nil
		  else
		    if BS IsA StepClass then
		      return StepClass(BS)
		    else
		      return nil
		    end
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResult() As string
		  // virtual method as interface to resource steps
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRetries() As Integer
		  Return Me.Retries
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRunState() As integer
		  return Me.RunState
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // Send init to all included elements
		  Dim LS as BasicClass = FirstSubStep
		  
		  if self IsA Test_StepClass then
		    Retries=Test_StepClass(self).Retries_Counter
		  else
		    Retries=0
		  end
		  
		  while LS<>nil
		    if LS IsA StepClass then
		      StepClass(LS).Init_Teststep_Start
		    end
		    LS = LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadBasicAttributeDesc()
		  ParseAttributesDescription("%WORKINGFOLDER%" + PathSeparator + "BasicDescription", "StepClass_desc.xml")
		  Super.LoadBasicAttributeDesc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OnMenuItemTriggered(item As MenuItem) As Boolean
		  Dim result As Boolean = Super.OnMenuItemTriggered(item)
		  If item <> Nil Then
		    Select Case item.Tag.StringValue
		    Case OnceMenuItem
		      App.ActiveRunOnceStep = Self
		    Case StartFromMenuItem
		      App.ActiveStartFromStep = Self
		    End
		  End
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParentResized(x As Integer, y As Integer, width As Integer, height As Integer)
		  Dim BS As BasicClass = Me.FirstSubStep
		  While BS <> Nil
		    If BS IsA StepClass And not(BS IsA Test_StepClass) Then
		      StepClass(BS).ParentResized(x, y, width, height)
		    End
		    BS = BS.NextStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ProcessStep(ActTime as double) As StepClass
		  // this is the core state machine for any stepClass in the program flow
		  // process the step further, gives back the next active step
		  
		  Dim NS as StepClass = self
		  Dim NoDebugWait as boolean = true
		  
		  if App.GlobalDebug then
		    NoDebugWait = App.Debug_CheckWait(self)
		  end
		  if RetryWait and (ActTime>NextTime) then RetryWait=false
		  
		  if NoDebugWait and Not(RetryWait) then
		    Select Case RunState
		    case 0 // device is reset and ready for start ----------------------------------------------
		      if Step_Start() then
		        if RunState = 0 then
		          RunState = 1
		        end
		        NextTime = ActTime + WaitTime.GIAD
		      end
		      
		    case 1    // device is active and doing its action -------------------------------------------
		      if Step_Run() then
		        // if (true=action accomplished) then give control to subordinate steps or to next step
		        Select case RunMode
		        case 0,1
		          // step does not have to wait it is going to next stage directly
		          RunState=3
		        case 2
		          // step will now be waiting/polling for answer
		          RunState=2
		        case 3
		          // step will now be waiting/polling for possible error message
		          RunState=2
		        else
		          // action is not accomplished and stage will be repeated
		          RunState=0
		        end
		      else
		        if ActTime>NextTime then // timeout when sending!
		          AddWarningTextCR("Element "+Name.GIAS+" experienced a send timeout with "+str(Retries)+" retries")
		          Retries=0
		          RunState=Step_PollTimeout
		        end
		      end
		    case 2 // device is waiting/polling for external input if function Step_Poll is true next stage is issued -------------
		      // check the timeout first!
		      if NextTime<ActTime then
		        // step is waiting for an answer but a timeout happend
		        // timeout has occured => reset and try again
		        Retries=Retries+1
		        if Retries<=MaxRetries then  // <=== Here it is set how many times the device shall try before indicating a timeout default value is 5
		          NextTime=ActTime+RetryWaitTime
		          RetryWait=true
		          AddWarningTextCR("Element "+Name.GIAS+" got a timeout and retries the "+str(Retries)+"th time ("+str(ActTime)+")")
		          RunState=0
		        else
		          AddWarningTextCR("Element "+Name.GIAS+" experienced a timeout error with "+str(Retries)+" retries ("+str(ActTime)+")")
		          Retries=0
		          RunState=Step_PollTimeout
		        end
		      else // no timeout has occured so far, so proceed
		        //step is waiting for possible error message theat did not occur => proceed to next stage
		        select case Step_Poll()
		        case 0 // not ready yet
		          RunState=2
		        case 1 // has received data of multiple commands, ready to send next command
		          RunState=1
		        case 2  // has received all data ready to proceed
		          RunState=3
		        case 3  // an error has occured  check for a retry
		          Retries=Retries+1
		          if Retries<=MaxRetries then  // <=== Here it is set how many times the device shall try before indicating a timeout default value is 5
		            AddWarningTextCR("Element "+Name.GIAS+" got an error and retries the "+str(Retries)+"th time ("+str(ActTime)+")")
		            RunState=0
		            NextTime=ActTime+RetryWaitTime
		            RetryWait=true
		          else
		            AddWarningTextCR("Element "+Name.GIAS+" experienced an error with "+str(Retries)+" retries ("+str(ActTime)+")")
		            Retries=0
		            RunState=8
		          end
		        end
		      end
		      
		    case 3// check if device is ready for next step -------------------------------------------
		      Select case RunMode
		      case 1 // device is ready for next step but waiting for time to finish if RunMode is 1
		        if NextTime<ActTime then
		          if DoSubSteps.GIAB then
		            RunState=4
		          else
		            RunState=6
		          end
		        end
		      case 2
		        // device is ready for next stage : call subordinate steps or proceed to end
		        if DoSubSteps.GIAB then
		          RunState=4
		        else
		          RunState=6
		        end
		      case 3 // if no error occured, device is ready for next stage
		      end
		    case 4 // Proceed subordinate steps -----------------------------------------------------
		      LastTime.SIAD(GetActTime_sec)
		      if FirstSubStep=nil then
		        RunState=6
		      else
		        RunState=5
		        NS = GetFirst_StepClass_Substep
		      end
		    case 5 // wait for subordinate steps => control comes back from sub steps ------------------
		      Me.LastTime.SIAD(GetActTime_sec)
		      if Step_Repeat() then
		        RunState=1
		      else
		        RunState=6
		      end
		      RunLoopNumber=RunLoopNumber+1
		    Case 6 // device is going to next step now --------------------------------------------------
		      Me.LastTime.SIAD(GetActTime_sec)
		      if Step_End() then
		        Step_Exit
		        if RunState = 6 then
		          RunState = 0
		          If Self isA Test_StepClass Then
		            //pause TestSequence if use Ste By Step Mode (checkbox on Hierarchy Tab)
		            If App.SequenceRunMode = RunSequenceModeEnum.StepByStep Then
		              If not(Test_StepClass(Me).UserWait.GIAI > 0 or Test_StepClass(Me).UserHalt.GIAI > 0 Or Test_StepClass(Me).GotoNext) And App.ActiveRunOnceStep = Nil And App.ActiveStartFromStep = Nil Then
		                App.Mainloop("toggle")
		              End
		            End
		          ElseIf Self IsA StepClass And App.SequenceRunMode = RunSequenceModeEnum.ElementByElement And App.ActiveRunOnceStep = Nil And App.ActiveStartFromStep = Nil Then
		            App.Mainloop("toggle")
		          End
		          if retries>0 then AddWarningTextCR("Element "+Name.GIAS+" experienced "+str(Retries)+" retries")
		          NS = Step_GetNextStep()
		        End
		      End
		    case 7 // device is waiting for outside kick to go on ------------------------------------------
		      
		    case 8 // an error has occured step out without proceeding End again -----------------------
		      LastTime.SIAD(GetActTime_sec)
		      RunState = 0
		      NS = Step_GetNextStep()
		    case 9 // the user has pushed a button to proceed without any further actions ------------------
		      LastTime.SIAD(GetActTime_sec)
		      RunState = 0
		      NS = Step_GetNextStep()
		    end
		  end
		  return NS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  Me.RunState=0
		  
		  // Let's also inform our Canvas so that it can reset its UI
		  if mUpdateCanvasHMI <> nil then
		    mUpdateCanvasHMI.ResetUI
		  end if
		  
		  Dim FS as BasicClass = Me.FirstSubStep
		  
		  while FS<>nil
		    if FS IsA StepClass then
		      StepClass(FS).Reset
		    end
		    FS=FS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetConnect()
		  Me.RunState=0
		  
		  Dim FS as BasicClass = FirstSubStep
		  
		  if Me.RelatedResource<>nil then
		    Me.RelatedResource.Reset
		  end
		  
		  while FS<>nil
		    if FS IsA StepClass then
		      StepClass(FS).Reset
		    end
		    FS=FS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetErrors()
		  Me.RunState=0
		  
		  if Me.GIAS("ExecuteTest")<>"" then
		    if Me.GIAB("ExecuteTest") then
		      Me.SIAS("ErrorMessage","")
		    end
		  end
		  
		  Dim FS as BasicClass = FirstSubStep
		  while FS<>nil
		    if FS IsA StepClass then
		      StepClass(FS).ResetErrors
		    end
		    FS=FS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetIncludedErrors()
		  if Me.GIAB("ExecuteTest") then
		    Me.SIAS("ErrorMessage","")
		    
		    if Me.Name.GIAS="BI_Step_1" then
		      Me.SIAS("ErrorMessage","")
		    end
		  end
		  
		  Dim LS as BasicClass = FirstSubStep
		  while LS<>nil
		    if LS IsA StepClass then
		      StepClass(LS).ResetIncludedErrors
		    end
		    LS=LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetWaitTime(vNewWaitTime as double)
		  if vNewWaitTime>0 then
		    WaitTime.SIAD(vNewWaitTime)
		  end
		  NextTime = GetActSumDiffTime_msec + WaitTime.GIAD
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExecutionFlag()
		  Dim LS as BasicClass = Self
		  Dim Searching as boolean = true
		  
		  while (LS.UpperStep<>nil) and Searching
		    LS=LS.UpperStep
		    if LS IsA Test_StepClass then
		      Test_StepClass(LS).ExecuteFlag.SIAB(true)
		      Searching=false
		    end
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRetries(NewRetries as integer)
		  Retries=NewRetries
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRunState(NewState as integer)
		  RunState=NewState
		  if RunState>9 then 
		    RunState=0
		  else
		    if RunState<0 then RunState=0
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_End() As boolean
		  // Virtual method
		  // gives back true if step can proceed
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Exit()
		  // method to be overriden but called by child classes
		  
		  Dim LS as BasicClass =Me.FirstSubStep
		  while LS<>nil
		    if LS IsA StepClass then
		      StepClass(LS).Step_Exit
		    end
		    LS=LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_GetNextStep() As StepClass
		  Dim NS as BasicClass = Nil
		  'If Not Me.UpperStep IsA TestProcess_StepClass Then
		  If Me.NextStep = Nil Then
		    If Me.UpperStep <> Nil And Me.RunMode > 0 Then
		      NS = Me.UpperStep
		      If NS IsA TESSA_Prog_StepClass Then
		        NS = Nil
		      End
		    End
		  Else
		    NS = Me.NextStep
		  End
		  'End
		  If NS IsA StepClass Then
		    Return StepClass(NS)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  // method to be overriden but has to be called by all child classes
		  if Self IsA StepClass then
		    RunState = 0
		    SendState = 0
		    RunLoopNumber = 0
		  end
		  
		  ResetIncludedErrors()
		  
		  'AddDebugTextCR("Init "+Name.GIAS)
		  
		  Dim LS as BasicClass = FirstSubStep
		  while LS <> nil
		    if LS IsA StepClass then
		      StepClass(LS).Step_Init
		    end
		    LS = LS.NextStep
		  wend
		  
		  if RunMode = 2 And WaitTime.GIAI = 0 then
		    MsgBox("Please check Element "+Name.GIAS+" as it will be awaiting a reply with 0 timout!")
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  // method to be overriden but has to be called by all child classes
		  Dim LS as BasicClass = FirstSubStep
		  while LS <> nil
		    if LS IsA StepClass then
		      StepClass(LS).Step_Init_AfterLoad
		    end
		    LS = LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  //Virtual method that has to be overriden if in use
		  Return 2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_PollTimeout() As integer
		  // virtual method to definie what happens if there is a multiple timeout
		  // return 0 = stop programm
		  // return 6 = go on with programm (=default)
		  
		  return 6
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Repeat() As Boolean
		  // virtual method if used for looping
		  // don't call when overriden
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  // Virtual method
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  // This method should be called by child class
		  Me.RunLoopNumber=0
		  
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		DebugOn As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		DebugText As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Description As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoSubSteps As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastTime As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxRetries As Integer = 5
	#tag EndProperty

	#tag Property, Flags = &h0
		NextTime As double
	#tag EndProperty

	#tag Property, Flags = &h0
		RelatedResource As Resource_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			// counter for the number of Retries on a send/poll process
		#tag EndNote
		Private Retries As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		RetryWait As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		RetryWaitTime As Integer = 100
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			// indicates the number of loops that are performed on the substeps, handled in repeat
		#tag EndNote
		Protected RunLoopNumber As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		RunMode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected RunState As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Untitled As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		WaitTime As Double_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = FollowMenuItem, Type = String, Dynamic = False, Default = \"Follow Execution", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OnceMenuItem, Type = String, Dynamic = False, Default = \"Run Once", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StartFromMenuItem, Type = String, Dynamic = False, Default = \"Start from Current Element", Scope = Public
	#tag EndConstant

	#tag Constant, Name = WatchMenuItem, Type = String, Dynamic = False, Default = \"Watch Element Permanently", Scope = Public
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
