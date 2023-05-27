#tag Class
Protected Class CommandLineHandler
	#tag Method, Flags = &h0
		Function AllParameters() As String()
		  Dim parametrs(-1) As String
		  For Each parametr As String In mArguments
		    If parametr.Left(2) = "--" Then
		      parametr = parametr.Mid(3)
		    End
		    If parametr.Left(1) = "-" Then
		      parametr = parametr.Mid(2)
		    End
		    if parametr.InStr("=") > 0 Then
		      parametr = parametr.Left(parametr.InStr("=") - 1)
		    End
		    parametrs.Append(parametr)
		  Next
		  Return parametrs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Arguments() As String()
		  Dim arguments(-1) As String
		  For Each argument As String In mArguments
		    If argument.Left(1) <> "-" Then
		      arguments.Append(argument)
		    End
		  Next
		  Return arguments
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor(commandLine As String)
		  mArguments = App.ArgumentsMBS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Contains(option As String) As Boolean
		  Return options.IndexOf(option) >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Instance() As CommandLineHandler
		  If mInstance = Nil Then
		    mInstance = new CommandLineHandler(System.CommandLine)
		  End
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsLong(option As String) As Boolean
		  For Each item As String In mArguments
		    if item.InStr(option + "=") > 0 Then
		      Return True
		    End
		  Next
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Options() As String()
		  Dim options(-1) As String
		  For Each option As String In mArguments
		    If option.Left(1) = "-" Then
		      If option.Left(2) = "--" Then
		        option = option.Mid(3)
		      End
		      If option.Left(1) = "-" Then
		        option = option.Mid(2)
		      End
		      if option.InStr("=") > 0 Then
		        option = option.Left(option.InStr("=") - 1)
		      End
		      options.Append(option)
		    End
		  Next
		  Return options
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(option As String) As String
		  Dim result As String = ""
		  For Each item As String In mArguments
		    Dim str As String = option + "="
		    if item.InStr(str) > 0 Then
		      result = item.Mid(item.InStr(str) + str.Len)
		    End
		  Next
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mArguments() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mInstance As CommandLineHandler = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOptions() As String
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
