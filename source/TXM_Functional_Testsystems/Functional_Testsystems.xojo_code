#tag Module
Protected Module Functional_Testsystems
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  BCF.AddNewElement("Netzer_Resource", GetTypeInfo(Netzer_ResourceClass), "Netzer_Resource", 2)
		  BCF.AddNewElement("Arduino_Resource", GetTypeInfo(Arduino_ResourceClass), "Arduino_Resource", 2)
		  BCF.AddNewElement("Netzer", GetTypeInfo(Netzer_StepClass), "Netzer_GPIO", 2)
		  
		  BCF.AddNewElement("Agilent_34972A", GetTypeInfo(Agilent_34972A), "Agilent_34972A", 2)
		  BCF.AddNewElement("Agilent_34902A", GetTypeInfo(Agilent_34902A), "Agilent_34902A", 2)
		  BCF.AddNewElement("Agilent_34907A", GetTypeInfo(Agilent_34907A), "Agilent_34907A", 2)
		  BCF.AddNewElement("Agilent_34903A", GetTypeInfo(Agilent_34903A), "Agilent_34903A", 2)
		  
		  BCF.AddNewElement("SM400_AR_8", GetTypeInfo(SM400_AR_8), "SM400_AR_8", 2)
		  BCF.AddNewElement("PROLOGIX", GetTypeInfo(PROLOGIX_ResourceClass), "PROLOGIX", 2)
		  BCF.AddNewElement("SCPI", GetTypeInfo(SCPI_StepClass), "SCPI", 2)
		  
		  BCF.AddNewElement("Siglent_3045X", GetTypeInfo(Siglent_StepClass), "Siglent_3045X", 2)
		  BCF.AddNewElement("Siglent_3045X_Resource", GetTypeInfo(Siglent_ResourceClass), "Siglent_3045X_Resource", 2)
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
