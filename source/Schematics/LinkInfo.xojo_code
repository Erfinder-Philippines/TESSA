#tag Class
Protected Class LinkInfo
	#tag Method, Flags = &h0
		Sub Constructor(toEc as ElementContainer, fromEc as ElementContainer, toAttrY as Integer, fromAttrY as Integer, thick as Integer, pTestStep as String)
		  //For links inside the teststep
		  toElement = toEc
		  fromElement = fromEc
		  t_attribute_Y = toAttrY
		  f_attribute_Y = fromAttrY
		  
		  circleWidth = fromElement.ElementAttributes.RowHeight
		  thickness = thick
		  parentTestStep = pTestStep
		  setLocality
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setLocality()
		  //Link is inside TESTSTEP only; No outside teststeps involved
		  If fromElement <> Nil and toElement <> Nil then
		    If fromElement.parentTeststep = toElement.parentTeststep Then
		      isLocal = True
		    Else
		      isLocal = False
		    End If
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		circleWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		endX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		endY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		fromElement As ElementContainer
	#tag EndProperty

	#tag Property, Flags = &h0
		f_attribute_Y As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		isLocal As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		linkIsDrawn As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		linkNotInView As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		parentTestStep As String
	#tag EndProperty

	#tag Property, Flags = &h0
		startX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		startY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		thickness As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		toElement As ElementContainer
	#tag EndProperty

	#tag Property, Flags = &h0
		t_attribute_Y As Integer
	#tag EndProperty


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
			Name="f_attribute_Y"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="t_attribute_Y"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="circleWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="thickness"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="startX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="endX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="startY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="endY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="linkNotInView"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="parentTestStep"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="isLocal"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="linkIsDrawn"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
