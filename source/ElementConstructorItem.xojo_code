#tag Class
Protected Class ElementConstructorItem
	#tag Method, Flags = &h0
		Sub Constructor(ConstructorInfo As Introspection.ConstructorInfo, vStepName As String, vRunMode As Integer)
		  mConstructorInfo = ConstructorInfo
		  mStepName = vStepName
		  mRunMode = vRunMode
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConstructorInfo() As Introspection.ConstructorInfo
		  Return mConstructorInfo
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRunMode() As Integer
		  Return mRunMode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStepName() As String
		  Return mStepName
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mConstructorInfo As Introspection.ConstructorInfo = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRunMode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStepName As String
	#tag EndProperty


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
End Class
#tag EndClass
