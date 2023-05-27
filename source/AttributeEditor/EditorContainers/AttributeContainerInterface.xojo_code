#tag Interface
Protected Interface AttributeContainerInterface
	#tag Method, Flags = &h0
		Function currentValue() As Variant
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitContainer(Attr as AttributeClass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEnable() As Boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveValue()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setCurrentValue(data As Variant)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEnable(value As Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UndoValue()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateValue()
		  
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
End Interface
#tag EndInterface
