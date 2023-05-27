#tag Module
Protected Module HMI_Module
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  
		  
		  
		  BCF.AddNewElement("HMI_Value", GetTypeInfo(HMI_Value_StepClass), "HMI_Value", 1)
		  BCF.AddNewElement("HMI_TextEdit", GetTypeInfo(HMI_TextEdit_StepClass), "HMI_TextEdit", 1)
		  BCF.AddNewElement("HMI_TextArea", GetTypeInfo(HMI_TextArea_StepClass), "HMI_TextArea", 1)
		  BCF.AddNewElement("HMI_Popup", GetTypeInfo(HMI_Popup_StepClass), "HMI_Popup", 1)
		  BCF.AddNewElement("Histogram", GetTypeInfo(HMI_Histogram_StepClass), "Histogram", 1)
		  BCF.AddNewElement("HMI_Button", GetTypeInfo(HMI_Button_StepClass), "HMI_Button", 1)
		  BCF.AddNewElement("HMI_Picture", GetTypeInfo(HMI_Picture_StepClass), "HMI_Picture", 1)
		  
		  BCF.AddNewElement("HMI_GraphDataPlot", GetTypeInfo(HMI_GraphDataPlot_StepClass), "HMI_GraphDataPlot", 1)
		  BCF.AddNewElement("HMI_TraceDataPlot", GetTypeInfo(HMI_TraceDataPlot_StepClass), "HMI_TraceDataPlot", 1)
		  BCF.AddNewElement("Graph", GetTypeInfo(Graph_StepClass), "Graph", 1)
		  BCF.AddNewElement("XYCurve", GetTypeInfo(XYCurve_StepClass), "Graph_XYCurve", 1)
		  BCF.AddNewElement("Graph_XYCurve", GetTypeInfo(XYCurve_StepClass), "Graph_XYCurve", 1)
		  BCF.AddNewElement("XYGraph", GetTypeInfo(XYCurve_StepClass), "Graph_XYCurve", 1)
		  BCF.AddNewElement("SwingIn", GetTypeInfo(SwingIn_StepClass), "SwingIn", 1)
		  
		  BCF.AddNewElement("Print_Teststep", GetTypeInfo(Print_Test_StepClass), "Print_Teststep", 1)
		  
		  
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
