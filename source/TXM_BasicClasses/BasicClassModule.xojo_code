#tag Module
Protected Module BasicClassModule
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  BCF.AddNewElement("Concat", GetTypeInfo(Concat_StepClass), "Concat", 1)
		  BCF.AddNewElement("Ramp", GetTypeInfo(Ramp_StepClass), "Ramp", 1)
		  
		  BCF.AddNewElement("SampleStep", GetTypeInfo(Test_StepClass), "SampleStep", 1)
		  
		  BCF.AddNewElement("SelectValue", GetTypeInfo(SelectValue_StepClass), "SelectValue", 1)
		  BCF.AddNewElement("SetValue", GetTypeInfo(SetValue_StepClass), "SetValue", 1)
		  
		  BCF.AddNewElement("NthField", GetTypeInfo(NthField_StepClass), "NthField", 1)
		  
		  BCF.AddNewElement("External_TESSA_Modul", GetTypeInfo(External_TESSA_Module), "External_TESSA_Modul", 1)
		  
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
