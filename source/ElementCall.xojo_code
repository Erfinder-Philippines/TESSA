#tag Interface
Protected Interface ElementCall
	#tag Method, Flags = &h0
		Function FunctionCall_Poll(FunctionName as string, Parameter as string) As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Run(FunctionName as string, Parameter as string) As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Start(FunctionName as string) As boolean
		  
		End Function
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
End Interface
#tag EndInterface
