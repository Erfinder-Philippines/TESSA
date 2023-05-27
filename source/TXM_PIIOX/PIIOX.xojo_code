#tag Module
Protected Module PIIOX
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  BCF.AddNewElement("PIIOX_Resource", GetTypeInfo(PIIOX_ResourceClass), "PIIOX_Resource", 2)
		  BCF.AddNewElement("PIIOX_BasicModule", GetTypeInfo(PIIOX_BasicModuleClass), "PIIOX_BasicModule", 2)
		  BCF.AddNewElement("PIIOX_Module", GetTypeInfo(PIIOX_ModuleClass), "PIIOX_Module", 2)
		  BCF.AddNewElement("PIIOX_AIN14_Module", GetTypeInfo(PIIOX_AIN14_Module), "PIIOX_AIN14_Module", 2)
		  BCF.AddNewElement("PIIOX_AIN32_Module", GetTypeInfo(PIIOX_AIN32_Module), "PIIOX_AIN32_Module", 2)
		  BCF.AddNewElement("PIIOX_PIO_Module", GetTypeInfo(PIIOX_PIO_ModuleClass), "PIIOX_PIO_Module", 2)
		  BCF.AddNewElement("PIIOX_Bus", GetTypeInfo(PIIOX_Bus_ResourceClass), "PIIOX_Bus", 2)
		  BCF.AddNewElement("PIIOX_SPI_Command", GetTypeInfo( PIIOX_SPI_Command_StepClass), "PIIOX_SPI_Command", 2)
		  BCF.AddNewElement("PIIOX_I2C_Command", GetTypeInfo( PIIOX_I2C_Command_StepClass), "PIIOX_I2C_Command", 2)
		  BCF.AddNewElement("PIIOX_Command", GetTypeInfo( PIIOX_Command_StepClass), "PIIOX_Command", 2)
		  BCF.AddNewElement("PIIOX_A_Command", GetTypeInfo( PIIOX_A_Command_StepClass), "PIIOX_A_Command", 2)
		  BCF.AddNewElement("PIIOX_B_Command", GetTypeInfo( PIIOX_B_Command_StepClass), "PIIOX_B_Command", 2)
		  BCF.AddNewElement("PIIOX_X_Command", GetTypeInfo( PIIOX_X_Command_StepClass), "PIIOX_X_Command", 2)
		  BCF.AddNewElement("PIIOX_EEPROM_COM", GetTypeInfo( PIIOX_EEPROM_ComClass), "PIIOX_EEPROM_COM", 2)
		  BCF.AddNewElement("PIIOX_SPI_Resource", GetTypeInfo( PIIOX_SPI_ResourceCommand), "PIIOX_SPI_Resource", 2)
		  BCF.AddNewElement("PIIOX_A_Resource", GetTypeInfo( PIIOX_A_ResourceCommand), "PIIOX_A_Resource", 2)
		  BCF.AddNewElement("PIIOX_OSM_Module", GetTypeInfo( PIIOX_OSM_ModuleClass), "PIIOX_OSM_Module", 2)
		  BCF.AddNewElement("PIIOX_SAGB_Module", GetTypeInfo( PIIOX_SAGB_ModuleClass), "PIIOX_SAGB_Module", 2)
		  BCF.AddNewElement("PIIOX_SAGB_Channel", GetTypeInfo( PIIOX_SAGB_Channel), "PIIOX_SAGB_Channel", 2)
		  BCF.AddNewElement("SAGB_EEPROM_ComClass", GetTypeInfo( SAGB_EEPROM_ComClass), "SAGB_EEPROM_ComClass", 2)
		  BCF.AddNewElement("PIIOX_CTSP_Module", GetTypeInfo( PIIOX_CTSP_ModuleClass), "PIIOX_CTSP_Module", 2)
		  BCF.AddNewElement("PIIOX_CTSN_Module", GetTypeInfo( PIIOX_CTSN_ModuleClass), "PIIOX_CTSN_Module", 2)
		  BCF.AddNewElement("PIIOX_CTSBus", GetTypeInfo( PIIOX_CTSBus_ResourceClass), "PIIOX_CTSBus", 2)
		  
		  // the following definition are for compatibility reasons
		  BCF.AddNewElement("TAMS_Resource", GetTypeInfo(PIIOX_ResourceClass), "PIIOX_Resource", 2)
		  BCF.AddNewElement("TAMS_BasicModule", GetTypeInfo(PIIOX_BasicModuleClass), "PIIOX_BasicModule", 2)
		  BCF.AddNewElement("TAMS_Module", GetTypeInfo(PIIOX_ModuleClass), "PIIOX_Module", 2)
		  BCF.AddNewElement("TAMS_AIN14_Module", GetTypeInfo(PIIOX_AIN14_Module), "PIIOX_AIN14_Module", 2)
		  BCF.AddNewElement("TAMS_PIO_Module", GetTypeInfo(PIIOX_PIO_ModuleClass), "PIIOX_PIO_Module", 2)
		  BCF.AddNewElement("TAMS_Bus", GetTypeInfo(PIIOX_Bus_ResourceClass), "PIIOX_Bus", 2)
		  BCF.AddNewElement("TAMS_SPI_Command", GetTypeInfo( PIIOX_SPI_Command_StepClass), "PIIOX_SPI_Command", 2)
		  BCF.AddNewElement("TAMS_I2C_Command", GetTypeInfo( PIIOX_I2C_Command_StepClass), "PIIOX_I2C_Command", 2)
		  BCF.AddNewElement("TAMS_Command", GetTypeInfo( PIIOX_Command_StepClass), "PIIOX_Command", 2)
		  BCF.AddNewElement("TAMS_A_Command", GetTypeInfo( PIIOX_A_Command_StepClass), "PIIOX_A_Command", 2)
		  BCF.AddNewElement("TAMS_B_Command", GetTypeInfo( PIIOX_B_Command_StepClass), "PIIOX_B_Command", 2)
		  BCF.AddNewElement("TAMS_X_Command", GetTypeInfo( PIIOX_X_Command_StepClass), "PIIOX_X_Command", 2)
		  BCF.AddNewElement("TAMS_EEPROM_COM", GetTypeInfo( PIIOX_EEPROM_ComClass), "PIIOX_EEPROM_COM", 2)
		  BCF.AddNewElement("TAMS_SPI_Resource", GetTypeInfo( PIIOX_SPI_ResourceCommand), "PIIOX_SPI_Resource", 2)
		  BCF.AddNewElement("TAMS_A_Resource", GetTypeInfo( PIIOX_A_ResourceCommand), "PIIOX_A_Resource", 2)
		  BCF.AddNewElement("TAMS_OSM_Module", GetTypeInfo( PIIOX_OSM_ModuleClass), "PIIOX_OSM_Module", 2)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddToAComLog(data As String)
		  APower = data
		  AComLog = data
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AComLog As String
	#tag EndProperty

	#tag Property, Flags = &h0
		APower As String
	#tag EndProperty


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
		#tag ViewProperty
			Name="APower"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AComLog"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
