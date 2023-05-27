#tag Module
Protected Module SYNCModule
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  
		  BCF.AddNewElement("SYNC", GetTypeInfo(SYNCModule.SYNCClass), "SYNC", 1)
		  BCF.AddNewElement("SYNC_Disk_Location", GetTypeInfo(SYNC_Disk_Location), "SYNC_Disk_Location", 1)
		  BCF.AddNewElement("SYNC_FTP_Location", GetTypeInfo(SYNC_FTP_Location), "SYNC_FTP_Location", 1)
		  BCF.AddNewElement("SYNC_Folder", GetTypeInfo(SYNC_Folder), "SYNC_Folder", 1)
		  BCF.AddNewElement("Start_SYNC", GetTypeInfo(Start_SYNC_StepClass), "Start_SYNC", 1)
		  
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
