#tag Class
Protected Class TESSA_Shell
Inherits Shell
	#tag Event
		Sub Completed()
		  if (ComLogAttribute<>nil) then
		    Dim S as string = ReadAll
		    ComLogAttribute.SIASAdd(S)
		    NewDataAvailable=true
		    CommandCompleted=true
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  if ComLogAttribute<>nil then
		    Dim S as string = ReadAll
		    ComLogAttribute.SIASAdd(S)
		    NewDataAvailable=true
		  end
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub constructor(vAttr as String_AttributeClass)
		  ComLogAttribute = vAttr
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNewData() As boolean
		  NewDataAvailable=false
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub write(s As String)
		  CommandCompleted=false
		  super.Write(S)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WriteLine(s As String)
		  CommandCompleted=false
		  super.WriteLine(S)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ComLogAttribute As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CommandCompleted As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		NewDataAvailable As Boolean = false
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ExecuteMode"
			Visible=true
			Group=""
			InitialValue=""
			Type="ExecuteModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Synchronous"
				"1 - Asynchronous"
				"2 - Interactive"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="ExitCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Result"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="PID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsRunning"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Arguments"
			Visible=true
			Group=""
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backend"
			Visible=true
			Group=""
			InitialValue=""
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Canonical"
			Visible=true
			Group=""
			InitialValue=""
			Type="Boolean"
			EditorType="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
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
			Name="TimeOut"
			Visible=true
			Group=""
			InitialValue=""
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CommandCompleted"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NewDataAvailable"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
