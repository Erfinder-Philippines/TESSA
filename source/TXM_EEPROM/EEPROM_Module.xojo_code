#tag Module
Protected Module EEPROM_Module
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  
		  BCF.AddNewElement("HMI_EEPROM", GetTypeInfo(HMI_EEPROM_StepClass), "HMI_EEPROM", 2)
		  BCF.AddNewElement("EEPROMTab", GetTypeInfo(EEPROMTabClass), "EEPROMTab", 1)
		  BCF.AddNewElement("EEPROM", GetTypeInfo(EEPROM_Content_StepClass), "EEPROM_Content", 1)
		  BCF.AddNewElement("EEPROM_Content", GetTypeInfo(EEPROM_Content_StepClass), "EEPROM_Content", 1)
		  
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
