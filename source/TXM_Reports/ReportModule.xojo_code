#tag Module
Protected Module ReportModule
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  BCF.AddNewElement("ReportFilter", GetTypeInfo(ReportFilterClass), "ReportFilter", 1)
		  BCF.AddNewElement("ReportFilterItem", GetTypeInfo(ReportFilterItemClass), "ReportFilterItem", 1)
		  BCF.AddNewElement("HMI_ReportFilter", GetTypeInfo(HMI_ReportFilter_StepClass), "HMI_ReportFilter", 1)
		  BCF.AddNewElement("Report", GetTypeInfo(TestReport_StepClass), "Report", 1)
		  BCF.AddNewElement("Report_Element", GetTypeInfo(Report_Element), "Report_Element", 1)
		  BCF.AddNewElement("Report_ElementTeststep", GetTypeInfo(Report_ElementTeststep), "Report_ElementTeststep", 1)
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
