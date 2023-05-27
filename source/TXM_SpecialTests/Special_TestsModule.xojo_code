#tag Module
Protected Module Special_TestsModule
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  
		  
		  BCF.AddNewElement("CheckValue", GetTypeInfo(CheckValue_StepClass), "CheckValue", 1)
		  BCF.AddNewElement("ExternalProgramm", GetTypeInfo(ExternalProgram_StepClass), "External_Application", 1)
		  BCF.AddNewElement("External_Application", GetTypeInfo(ExternalProgram_StepClass), "External_Application", 1)
		  
		  
		  
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
