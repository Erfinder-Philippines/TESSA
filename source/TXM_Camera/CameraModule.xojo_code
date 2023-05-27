#tag Module
Protected Module CameraModule
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  
		  BCF.AddNewElement("Cam_Resource", GetTypeInfo(Cam_ResourceClass), "Cam_Resource", 1)
		  BCF.AddNewElement("CamCapture", GetTypeInfo(CamCapture_StepClass), "CamCapture", 1)
		  BCF.AddNewElement("PictureDetail", GetTypeInfo(PictureDetail_StepClass), "PictureDetail", 1)
		  
		  BCF.AddNewElement("CamTab", GetTypeInfo(CamTabClass), "CamTab", 1)
		  
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
