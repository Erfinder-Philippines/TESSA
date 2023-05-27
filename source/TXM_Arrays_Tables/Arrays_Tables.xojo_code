#tag Module
Protected Module Arrays_Tables
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  
		  BCF.AddNewElement("Table", GetTypeInfo(Table_StepClass), "Table", 1)
		  BCF.AddNewElement("TableDimension", GetTypeInfo(TableDimension_StepClass), "TableDimension", 1)
		  BCF.AddNewElement("Verify_DimensionTable", GetTypeInfo(Verify_DimensionTable_StepClass), "Verify_DimensionTable", 1)
		  BCF.AddNewElement("StripChart", GetTypeInfo(StripChart_StepClass), "StripChart", 1)
		  BCF.AddNewElement("TablePicker", GetTypeInfo(TablePicker_StepClass), "TablePicker", 1)
		  BCF.AddNewElement("ArrayPicker", GetTypeInfo(ArrayPicker_StepClass), "ArrayPicker", 1)
		  BCF.AddNewElement("ArrayAppend", GetTypeInfo(ArrayAppend_StepClass), "ArrayAppend", 1)
		  BCF.AddNewElement("TableDimension", GetTypeInfo(TableDimension_StepClass), "TableDimension", 1)
		  BCF.AddNewElement("TableTab", GetTypeInfo(TableTabClass), "TableTab", 1)
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
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
