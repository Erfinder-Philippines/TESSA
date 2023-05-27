#tag Module
Protected Module ProgrammSequence
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  
		  
		  '
		  BCF.AddNewElement("AXTDL", GetTypeInfo(TESSA_Prog_StepClass), "Testprogram", 1)
		  BCF.AddNewElement("TESSA", GetTypeInfo(TESSA_Prog_StepClass), "Testprogram", 1)
		  BCF.AddNewElement("Testprogram", GetTypeInfo(TESSA_Prog_StepClass), "Testprogram", 1)
		  BCF.AddNewElement("Testsequence", GetTypeInfo(TESSA_Prog_StepClass), "Testprogram", 1)
		  BCF.AddNewElement("Program", GetTypeInfo(TESSA_Program), "Testprogram", 2)
		  
		  BCF.AddNewElement("TestProcess", GetTypeInfo(TestProcess_StepClass), "TestProcess", 1)
		  BCF.AddNewElement("Teststep", GetTypeInfo(Test_StepClass), "Teststep", 1)
		  
		  BCF.AddNewElement("Wait", GetTypeInfo(Wait_StepClass), "Wait", 1)
		  BCF.AddNewElement("IfThen", GetTypeInfo(IfThen_StepClass), "IfThen", 1)
		  BCF.AddNewElement("If_TRUE", GetTypeInfo(If_TRUE_StepClass), "If_TRUE", 1)
		  BCF.AddNewElement("If_FALSE", GetTypeInfo(If_FALSE_StepClass), "If_FALSE", 1)
		  BCF.AddNewElement("SelectCase", GetTypeInfo(SelectCase_StepClass), "SelectCase", 1)
		  BCF.AddNewElement("Case", GetTypeInfo(Case_StepClass), "Case", 1)
		  BCF.AddNewElement("Repeat", GetTypeInfo(Repeat_StepClass), "Repeat", 1)
		  BCF.AddNewElement("Timer", GetTypeInfo(Timer_StepClass), "Timer", 1)
		  
		  BCF.AddNewElement("Loop", GetTypeInfo(Loop_StepClass), "Loop", 1)
		  BCF.AddNewElement("AveragingLoop", GetTypeInfo(AveragingLoop_StepClass), "AveragingLoop", 1)
		  
		  BCF.AddNewElement("Autostart", GetTypeInfo(Autostart), "Autostart", 2)
		  BCF.AddNewElement("Goto", GetTypeInfo(Goto_StepClass), "Goto", 1)
		  BCF.AddNewElement("Group", GetTypeInfo(Group_StepClass), "Group", 1)
		  BCF.AddNewElement("ProgramTimer", GetTypeInfo(ProgramTimer_StepClass), "ProgramTimer", 1)
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
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
			Name="Name"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
