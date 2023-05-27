#tag Class
Protected Class SelectionBox
	#tag Method, Flags = &h0
		Function getCenterX() As double
		  return endX + width/2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getCenterY() As double
		  return endY + height/2
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		endX As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		endY As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return startY - endY
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mheight = value
			End Set
		#tag EndSetter
		height As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mheight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mwidth As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		startX As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		startY As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return startX - endX
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mwidth = value
			End Set
		#tag EndSetter
		width As Double
	#tag EndComputedProperty


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
		#tag ViewProperty
			Name="startX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="startY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="endX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="endY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="height"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="width"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
