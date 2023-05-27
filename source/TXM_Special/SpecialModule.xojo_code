#tag Module
Protected Module SpecialModule
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  BCF.AddNewElement("Script", GetTypeInfo(Script_StepClass), "Script", 1)
		  BCF.AddNewElement("Alias", GetTypeInfo(Alias_StepClass), "Alias", 1)
		  BCF.AddNewElement("FTP_Transfer", GetTypeInfo(FTP_Transfer_StepClass), "FTP_Transfer", 2)
		  BCF.AddNewElement("Note", GetTypeInfo(Note_StepClass), "Note", 1)
		  BCF.AddNewElement("Trigger", GetTypeInfo(Trigger_StepClass), "Trigger", 1)
		  BCF.AddNewElement("TextFile", GetTypeInfo(TextFile_StepClass), "TextFile", 1)
		  BCF.AddNewElement("ScreenCapture", GetTypeInfo(ScreenCapture_StepClass), "ScreenCapture", 1)
		  
		  
		  
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
