#tag Class
Protected Class AttrCoordinate
	#tag Method, Flags = &h0
		Sub AddtoValue(V as double)
		  Value = Value + V
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor()
		  Blocked = false
		  BlockValue=""
		  Value=0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetValue() As string
		  if Blocked then
		    if Value=0 then
		      return BlockValue
		    else
		      return str(Value)+"+"+BlockValue
		    end
		  else
		    return str(Value)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(sv as string)
		  if sv.InStr(1,"<")>0 then // no changes
		    Blocked = true
		    BlockValue=sv.mid(sv.InStr(1,"<"))
		    Value=Val(sv)
		  else
		    Blocked = false
		    BlockValue=""
		    Value=Val(sv)
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Blocked As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private BlockValue As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Value As double
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
