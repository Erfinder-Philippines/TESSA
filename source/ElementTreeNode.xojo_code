#tag Class
Protected Class ElementTreeNode
	#tag Method, Flags = &h0
		Function MatchesFilter(filter as string) As Boolean
		  If self.name.InStr(filter) > 0 Then
		    return true
		  End If
		  
		  for each child as ElementTreeNOde in self.Children
		    if child.MatchesFilter (filter) then
		      return true
		    end if
		  next
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		children() As ElementTreeNode
	#tag EndProperty

	#tag Property, Flags = &h0
		element As ElementType
	#tag EndProperty

	#tag Property, Flags = &h0
		image As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		name As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="name"
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
			Name="image"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
