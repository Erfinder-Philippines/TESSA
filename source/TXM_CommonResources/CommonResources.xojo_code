#tag Module
Protected Module CommonResources
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  
		  BCF.AddNewElement("TCP_Resource", GetTypeInfo(TCP_ResourceClass), "TCP_Resource", 2)
		  BCF.AddNewElement("TESSA_RemoteClient", GetTypeInfo(TESSA_RemoteClient), "TESSA_RemoteClient", 2)
		  BCF.AddNewElement("NetworkCard", GetTypeInfo(Network_ResourceClass), "Network", 2)
		  BCF.AddNewElement("Network", GetTypeInfo(Network_ResourceClass), "Network", 2)
		  BCF.AddNewElement("SerialPort_Resource", GetTypeInfo(SerialPort_ResourceClass), "SerialPort_Resource", 2)
		  BCF.AddNewElement("SerialPort", GetTypeInfo(SerialPort_ResourceClass), "SerialPort_Resource", 2)
		  BCF.AddNewElement("USB_Resource", GetTypeInfo(USB_ResourceClass), "USB_Resource", 2)
		  BCF.AddNewElement("ExternalApplication_Resource", GetTypeInfo(ExternalApplication_Resource), "ExternalApplication_Resource", 1)
		  BCF.AddNewElement("TESSA_Config", GetTypeInfo(TESSA_Config), "TESSA_Config", 0)
		  
		  BCF.AddNewElement("Restfull_Resource", GetTypeInfo(Restfull_Resource), "Restfull_Resource", 1)
		  BCF.AddNewElement("Restfull_Command", GetTypeInfo(Restfull_Command_StepClass), "Restfull_Command", 2)
		  
		  BCF.AddNewElement("DO_BitMask", GetTypeInfo(DO_BitMask), "DO_BitMask", 2)
		  BCF.AddNewElement("DO_Impulse_BitMask", GetTypeInfo(DO_Impulse_BitMask), "DO_Impulse_BitMask", 2)
		  BCF.AddNewElement("DI_BitMask", GetTypeInfo(DI_BitMask), "DI_BitMask", 2)
		  
		  BCF.AddNewElement("AI_Channel", GetTypeInfo(AI_Channel), "AI_Channel", 2)
		  BCF.AddNewElement("AO_Channel", GetTypeInfo(AO_Channel), "AO_Channel", 2)
		  
		  BCF.AddNewElement("ResourceCall", GetTypeInfo(ResourceCall_StepClass), "ResourceCall", 2)
		  BCF.AddNewElement("ResourceCallMeas", GetTypeInfo(ResourceCallMeas_StepClass), "ResourceCallMeas", 2)
		  BCF.AddNewElement("ResourceScript", GetTypeInfo(ResourceScript), "ResourceScript", 2)
		  
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
