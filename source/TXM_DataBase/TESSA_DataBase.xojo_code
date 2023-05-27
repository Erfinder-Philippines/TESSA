#tag Module
Protected Module TESSA_DataBase
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  BCF.AddNewElement("DataBaseTable", GetTypeInfo(DataBaseTable_Resource), "DataBaseTable", 1)
		  BCF.AddNewElement("DataBaseField", GetTypeInfo(DataBaseField_Resource), "DataBaseField", 1)
		  BCF.AddNewElement("Article_Resource", GetTypeInfo(Article_Resource), "Article_Resource", 1)
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
