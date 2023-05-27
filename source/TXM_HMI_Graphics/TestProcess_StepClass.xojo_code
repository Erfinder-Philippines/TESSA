#tag Class
Protected Class TestProcess_StepClass
Inherits Test_StepClass
	#tag Method, Flags = &h0
		Function ProcessStep(ActTime as double) As StepClass
		  mActTime = ActTime
		  If CheckRunState(4) Then
		    SetRunState(6)
		    Return Self
		  End
		  Return Super.ProcessStep(ActTime)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_End() As Boolean
		  ReDim mActiveClasses(-1)
		  mUICaller.ClearAllCallings
		  Return Super.Step_End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  If Me.DoSubSteps.GIAB Then
		    Dim basics(-1) As StepClass
		    Dim activeStep As StepClass = Nil
		    For Each BS As StepClass In mActiveClasses
		      If BS <> Nil Then
		        activeStep = BS.ProcessStep(mActTime)
		        UpdateSubStepUIInfo(activeStep)
		        If activeStep <> Nil And activeStep.GetUniqueID <> GetUniqueID Then
		          basics.Append(activeStep)
		        End
		      End
		    Next
		    ReDim mActiveClasses(-1)
		    mActiveClasses = basics
		  End
		  Return mActiveClasses.Ubound < 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As Boolean
		  mActTime = 0
		  ReDim mActiveClasses(-1)
		  mUICaller.ClearAllCallings
		  If Me.DoSubSteps.GIAB Then
		    Dim BS As BasicClass = FirstSubStep
		    While BS <> Nil
		      If BS IsA StepClass Then
		        mActiveClasses.Append(StepClass(BS))
		      End
		      BS = BS.NextStep
		    Wend
		  End
		  Return Super.Step_Start
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateSubStepUIInfo(BS As BasicClass)
		  If BS <> Nil Then
		    ThreadSafeMethodCall (AddressOf HMI_Window.UpdateCurrentStepInfo, "UpdateCurrentStepInfo", 0,  BS, mActTime)
		    ThreadSafeMethodCall (AddressOf MainWindow.UpdateMainWindow, "UpdateMainWindow", 100)
		    If BS IsA Test_StepClass Then
		      If App.HMI_Active Then
		        ThreadSafeMethodCall (AddressOf HMI_Window.Change_HMI_Page, "Change_HMI_Page", 0, Test_StepClass(BS))
		      End
		      ThreadSafeMethodCall (AddressOf MainWindow.Adjust_Buttons, "Adjust_Buttons", 0, Test_StepClass(BS))
		    ElseIf BS IsA HMI_StepClass Then
		      HMI_StepClass(BS).Step_HMI_UpdateAll(2)
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mActiveClasses(-1) As StepClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mActTime As Double = 0
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
