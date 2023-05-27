#tag Class
Protected Class LoopThread
Inherits Thread
	#tag Event
		Sub Run()
		  Dim ActTime, NextDisplayTime As Double
		  Dim LastStep As StepClass = Nil
		  
		  StartActTimer
		  ActTime = GetActTime_msec - SumDiffTime
		  NextDisplayTime = ActTime
		  
		  While True
		    ActTime=GetActSumDiffTime_msec
		    
		    Select Case App.GetTESSAState
		    Case Running // programm running
		      If mStartStep <> Nil Then
		        ActiveMeasStep = mStartStep
		        mStartStep = Nil
		      End
		      
		      If ActiveMeasStep <> Nil Then
		        LastStep = ActiveMeasStep
		        
		        // process step and get eventually a new active step
		        Dim canUpdateUI As Boolean = False
		        If App.HMI_Active Then
		          if NextDisplayTime < ActTime Then
		            Call mUICaller.PushMethod (AddressOf HMI_Window.UpdateCurrentStepInfo, "UpdateCurrentStepInfo", LastStep, ActTime)
		            NextDisplayTime = NextDisplayTime + 50
		            canUpdateUI = True
		          End
		        End
		        If App.GlobalDebug Then
		          If LastStep.DebugOn Then
		            Call mUICaller.PushMethod (AddressOf DebugWindow.UpdateDebugWindow, "UpdateDebugWindow", LastStep, ActTime)
		          End
		        End
		        ActiveMeasStep = LastStep.ProcessStep(ActTime)
		        
		        //handle change of active step
		        //This is a regular run
		        If ActiveMeasStep <> Nil Then // there is an active meas step to be handled
		          // this is a one time run
		          // check if all subclasses have finished
		          If App.ActiveRunOnceStep <> Nil And App.ActiveRunOnceStep.FindElementByUniqueID(ActiveMeasStep.GetUniqueID) = Nil Then
		            If App.ActiveRunOnceStep IsA Test_StepClass Then
		              If App.HMI_Active Then
		                Call mUICaller.PushMethod (AddressOf HMI_Window.Change_HMI_Page, "Change_HMI_Page", Test_StepClass(App.ActiveRunOnceStep))
		              End
		              Sleep(10)
		            End
		            App.MainLoop("stop")
		          End
		          
		          If ActiveMeasStep <> LastStep Then //there has been a change in the active meas step
		            If ActiveMeasStep  IsA Test_StepClass Then // check if meas step is a test step
		              If App.HMI_Active Then
		                Call mUICaller.PushMethod (AddressOf HMI_Window.Change_HMI_Page, "Change_HMI_Page", Test_StepClass(ActiveMeasStep))
		              End
		              Call mUICaller.PushMethod (AddressOf MainWindow.Adjust_Buttons, "Adjust_Buttons", Test_StepClass(ActiveMeasStep))
		            ElseIf App.HMI_Active And ActiveMeasStep IsA HMI_StepClass then
		              HMI_StepClass(ActiveMeasStep).Step_HMI_UpdateAll(2)
		            End
		            
		            // update the main window anyway
		            Call mUICaller.PushMethod (AddressOf MainWindow.UpdateMainWindow, "UpdateMainWindow")
		          Else // there has not been a change in the active meas step, so just check/set buttons
		            If ActiveMeasStep IsA Test_StepClass Then
		              If ActiveMeasStep.CheckRunState(7) And canUpdateUI Then
		                Call mUICaller.PushMethod (AddressOf MainWindow.UpdateMainWindow, "UpdateMainWindow")
		              End
		            End
		            If ActiveMeasStep.CheckRunState(6) And canUpdateUI Then
		              Call mUICaller.PushMethod (AddressOf MainWindow.UpdateMainWindow, "UpdateMainWindow")
		            End
		          End
		        Else
		          If LastStep IsA Test_StepClass Then
		            If App.HMI_Active Then
		              HMI_StepClass(LastStep).Step_HMI_UpdateAll(2)
		              Call mUICaller.PushMethod (AddressOf HMI_Window.Change_HMI_Page, "Change_HMI_Page", Test_StepClass(LastStep))
		            End
		            Sleep(100)
		          End
		          App.MainLoop("stop")
		        End
		      End
		    Case Suspended // programm suspended
		    Case NotRunning // programm not running
		      Exit While
		    End
		  Wend
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  mUICaller = new Caller
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetActiveMeasStep() As StepClass
		  return ActiveMeasStep
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Kill()
		  DiffTime = 0
		  SumDiffTime = 0
		  mUICaller.ClearAllCallings
		  Super.Kill
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resume()
		  DiffTime = GetActTime_msec - DiffTime
		  if DiffTime > 0 Then
		    SumDiffTime = SumDiffTime + DiffTime
		  End
		  if SumDiffTime < 0 Then
		    SumDiffTime = 0
		  End
		  Super.Resume
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run()
		  DiffTime = 0
		  SumDiffTime = 0
		  Super.Run
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetStartStep(startStep As StepClass)
		  mStartStep = startStep
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Suspend()
		  Super.Suspend
		  DiffTime = GetActTime_msec
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ActiveMeasStep As StepClass = Nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected DiffTime As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStartStep As StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUICaller As Caller = nil
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
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
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
			#tag EndEnumValues
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
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
	#tag EndViewBehavior
End Class
#tag EndClass
