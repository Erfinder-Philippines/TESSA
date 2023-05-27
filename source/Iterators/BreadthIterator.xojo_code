#tag Class
Protected Class BreadthIterator
Implements BasicIteratorInterface
	#tag Method, Flags = &h1
		Protected Sub addChildrenForTraversal(container As BasicClass)
		  if container <> Nil Then
		    container = container.FirstSubStep
		    if mFromLeftToRight Then
		      While container <> Nil
		        mItemsQueque.Append(container)
		        container = container.NextStep
		      Wend
		    Else
		      While container <> Nil And container.NextStep <> Nil
		        container = container.NextStep
		      Wend
		      
		      While container <> Nil
		        mItemsQueque.Append(container)
		        container = container.PreviousStep
		      Wend
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(BS As BasicClass)
		  // Part of the BasicIteratorInterface interface.
		  mFromLeftToRight = True
		  mItemsQueque.Append(BS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(BS As BasicClass, fromLeftToRight As Boolean)
		  // Part of the BasicIteratorInterface interface.
		  mFromLeftToRight = fromLeftToRight
		  mItemsQueque.Append(BS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasNext() As Boolean
		  // Part of the BasicIteratorInterface interface.
		  Return (mItemsQueque.Ubound >= 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextItem() As BasicClass
		  // Part of the BasicIteratorInterface interface.
		  Dim BS As BasicClass = mItemsQueque(0)
		  mItemsQueque.Remove(0)
		  addChildrenForTraversal(BS)
		  Return BS
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mFromLeftToRight As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mItemsQueque() As BasicClass
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
