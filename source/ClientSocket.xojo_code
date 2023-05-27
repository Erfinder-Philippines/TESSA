#tag Class
Protected Class ClientSocket
Inherits TCPSocket
	#tag Event
		Sub Connected()
		  
		  Self.Write("From the server socket, I connected to you")
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  
		  'AddDebugText("Socket " + str(mNum) + " got: " + Self.ReadAll)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(err As RuntimeException)
		  'AddDebugText("Socket " + str(mNum) + ": (Error) = " + str(Self.LastErrorCode))
		End Sub
	#tag EndEvent

	#tag Event
		Sub SendComplete(userAborted as Boolean)
		  #Pragma Unused userAborted
		  
		  'AddDebugText("Socket " + str(mNum) + " send complete")
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Constructor(num As Integer)
		  
		  mNum = num
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mNum As Integer
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
	#tag EndViewBehavior
End Class
#tag EndClass
