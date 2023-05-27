#tag Class
Protected Class CallMethod
	#tag Method, Flags = &h0
		Sub Constructor(deleg As Object, id As Variant, param() As Variant)
		  self.callback = deleg
		  self.id = id
		  self.args = param
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		args() As Variant
	#tag EndProperty

	#tag Property, Flags = &h0
		callback As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		id As Variant
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
