#tag Module
Protected Module MathModule
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  
		  
		  BCF.AddNewElement("MathOp", GetTypeInfo(MathOp_StepClass), "MathOp", 1)
		  BCF.AddNewElement("Formula", GetTypeInfo(Formula_StepClass), "Formula", 1)
		  BCF.AddNewElement("PID-Controller", GetTypeInfo(PID_Controller_StepClass), "PID-Controller", 1)
		  BCF.AddNewElement("Multistage-PID-Controller", GetTypeInfo(Multistage_PID_Controller_StepClass), "Multistage-PID-Controller", 1)
		  
		  BCF.AddNewElement("Statistic", GetTypeInfo(Statistic_StepClass), "Statistic", 1)
		  BCF.AddNewElement("RTD", GetTypeInfo(RTD_StepClass), "RTD", 1)
		  BCF.AddNewElement("NTC_Calc", GetTypeInfo(NTC_Calc_StepClass), "NTC_Calc", 1)
		  BCF.AddNewElement("Phasor", GetTypeInfo(Phasor_StepClass), "Phasor", 1)
		  BCF.AddNewElement("VectorGen", GetTypeInfo(VectorGen_StepClass), "VectorGen", 1)
		  BCF.AddNewElement("Polygon", GetTypeInfo(Polygon_StepClass), "Polygon", 1)
		  BCF.AddNewElement("CRC_Calc", GetTypeInfo(CRC_Calc_StepClass), "CRC_Calc", 1)
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
