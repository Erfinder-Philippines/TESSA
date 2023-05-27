#tag Class
Protected Class BasicIterator
Implements BasicIteratorInterface
	#tag Method, Flags = &h1
		Protected Sub addChildrenForTraversal(container As BasicClass)
		  if container <> Nil Then
		    container = container.FirstSubStep
		    While container <> Nil And container.NextStep <> Nil
		      container = container.NextStep
		    Wend
		    
		    While container <> Nil
		      mItemsStack.Append(container)
		      container = container.PreviousStep
		    Wend
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(BS As BasicClass)
		  // Part of the BasicIteratorInterface interface.
		  mItemsStack.Append(BS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasNext() As Boolean
		  // Part of the BasicIteratorInterface interface.
		  Return (mItemsStack.Ubound >= 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextItem() As BasicClass
		  // Part of the BasicIteratorInterface interface.
		  Dim BS As BasicClass = mItemsStack.Pop
		  addChildrenForTraversal(BS)
		  Return BS
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mItemsStack() As BasicClass
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
