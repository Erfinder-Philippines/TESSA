#tag Class
Protected Class GraphicsAnimation
	#tag Method, Flags = &h0
		Sub changePos()
		  // change the XPos (x-position)
		  XPos = XPos + XSpeed
		  If XSpeed > 0 Then
		    If XPos = startXPos Then
		      XSpeed = XSpeed * -1
		    ElseIf XPos = boundary Then
		      XSpeed = XSpeed * -1
		    End If
		  Elseif XSpeed < 0 Then
		    If XPos = boundary Then
		      XSpeed = XSpeed * -1
		    ElseIf XPos = startXPos Then
		      XSpeed = XSpeed * -1
		    End If
		  End If
		  
		  // change the YPos (y-position)
		  YPos = YPos + YSpeed
		  If YSpeed > 0 Then
		    If YPos = startYPos Then
		      YSpeed = YSpeed * -1
		    ElseIf YPos = boundary Then
		      YSpeed = YSpeed * -1
		    End If
		  Elseif YSpeed < 0 Then
		    If YPos = boundary Then
		      YSpeed = YSpeed * -1
		    ElseIf YPos = startyPos Then
		      YSpeed = YSpeed * -1
		    End If
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(pic as Picture, pic2 as Picture, x as Double, y as Double, x_Speed as Double, y_Speed as Double, bound as Double)
		  img = pic
		  img_darkMode = pic2
		  XPos = x
		  YPos = y
		  XSpeed = x_Speed
		  YSpeed = y_Speed
		  boundary = bound
		  startXPos = XPos
		  startYPos = YPos
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub resumeAnimation()
		  XSpeed = tempXSpeed
		  YSpeed = tempYSpeed
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub stopAnimation()
		  tempXSpeed = XSpeed
		  tempYSpeed = YSpeed
		  XSpeed = 0
		  YSpeed = 0
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		boundary As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		img As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		img_darkMode As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		startXPos As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		startYPos As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		tempXSpeed As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		tempYSpeed As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		XPos As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		XSpeed As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		YPos As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		YSpeed As Double = 0
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
			Name="boundary"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="img"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="startXPos"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="startYPos"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tempXSpeed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="tempYSpeed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="XPos"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="XSpeed"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="YPos"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="YSpeed"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="img_darkMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
