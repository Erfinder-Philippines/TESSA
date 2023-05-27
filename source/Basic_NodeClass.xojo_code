#tag Class
Protected Class Basic_NodeClass
	#tag Method, Flags = &h0
		Sub AddChild(Child As Basic_NodeClass)
		  Dim cnt As Integer
		  
		  If Child <> Nil Then
		    // node has the next possible depth
		    If Child.Indent = Indent+1 Then
		      Child.Parent = Self
		      Children.Append(Child)
		    Else
		      // depth > Indent+1
		      cnt = UBound(Children)
		      If cnt >= 0 Then
		        Children(cnt).AddChild(Child)
		      End
		    End
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttrCount() As Integer
		  If BasicStep <> Nil Then
		    Return (BasicStep.AttributesUbound + 1)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindChild(BS As BasicClass) As Basic_NodeClass
		  //-------------------------------------
		  // Looks up for the child with the given ID
		  //-------------------------------------
		  Dim idx As Integer
		  Dim node As Basic_NodeClass
		  
		  If BS <> NIL And BS = BasicStep Then
		    Return Self
		  End
		  For idx = 0 To UBound(Children)
		    node = Children(idx).FindChild(BS)
		    If node <> Nil Then
		      Return node
		    End
		  Next
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasChildren() As Boolean
		  Return UBound(Children) >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveChild(BS As BasicClass)
		  //-------------------------------------
		  // Removes the child with the given obj from
		  // the parent children's list
		  //-------------------------------------
		  Dim idx As Integer
		  
		  If BasicStep <> Nil And BasicStep = BS Then
		    If Parent <> Nil Then
		      For idx = 0 To UBound(Parent.Children)
		        If Parent.Children(idx) = Self Then
		          Parent.Children.Remove(idx)
		          Exit
		        End
		      Next
		    End
		  Else
		    For idx = 0 To UBound(Children)
		      Children(idx).RemoveChild(BS)
		    Next
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetData(Nam As String, Vari As Variant, Pic As Picture, Ind As Integer, IsFolded As Boolean, Row As Integer)
		  Dim BS As BasicClass = Vari
		  
		  Name = Nam
		  BasicStep = BS
		  Image = Pic
		  Indent = Ind
		  Folded = IsFolded
		  RowNr = Row
		  Expanded = True
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AttributesShown As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		BasicStep As BasicClass = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Children(-1) As Basic_NodeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Expanded As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Folded As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Image As Picture = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Indent As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String = """"""
	#tag EndProperty

	#tag Property, Flags = &h0
		Parent As Basic_NodeClass = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RowNr As Integer = -1
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Expanded"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Folded"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Image"
			Visible=false
			Group="Behavior"
			InitialValue="Nil"
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Indent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="RowNr"
			Visible=false
			Group="Behavior"
			InitialValue="-1"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AttributesShown"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
