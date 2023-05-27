#tag Class
Protected Class TestTCP_Class
Inherits TCPSocket
	#tag Event
		Sub DataAvailable()
		  if UpdateTextArea<>nil then
		    Dim S as string = ReadAll(Encodings.UTF8)
		    UpdateTextArea.AppendText(S)
		    PIIOXResponse = S
		  end
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(err As RuntimeException)
		  System.Log(System.LogLevelError, "Error: " + err.ErrorNumber.ToString + " " + err.Message)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(TA as TextArea)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From TCPSocket
		  // Constructor() -- From SocketCore
		  Super.Constructor
		  
		  UpdateTextArea=TA
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		PIIOXResponse As String
	#tag EndProperty

	#tag Property, Flags = &h0
		UpdateTextArea As TextArea
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
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
			Name="PIIOXResponse"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
