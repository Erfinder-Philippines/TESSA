#tag Class
 Attributes ( UseScripting = true ) Protected Class TESSA_ScriptClass
Inherits XOJOScript
	#tag CompatibilityFlags = ( TargetConsole and ( Target64Bit ) ) or ( TargetWeb and ( Target64Bit ) ) or ( TargetDesktop and ( Target32Bit or Target64Bit ) ) or ( TargetIOS and ( Target32Bit or Target64Bit ) )
	#tag Event
		Function CompilerError(location As XojoScriptLocation, error As XojoScript.Errors, errorInfo As Dictionary) As Boolean
		  Me.ErrorText = Me.ErrorText + chr(13) + "a compiler error (" + str(error) + ") in line " + str(location) + " occured: " + str(errorInfo)
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Print(msg As String)
		  Me.PrintOutput = Msg
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub RuntimeError(error As RuntimeException)
		  Me.ErrorText = Me.ErrorText + chr(13) + "an runtime (" + str(Error) + ") error occured: "
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		ErrorText As string
	#tag EndProperty

	#tag Property, Flags = &h0
		PrintOutput As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="State"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="States"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="PrintOutput"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Source"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="String"
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
