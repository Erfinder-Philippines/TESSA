#tag Class
Protected Class PIIOX_B_Command_StepClass
Inherits PIIOX_Command_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as String) -- From StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  
		  Me.WaitTime.SIAI(1000)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalInit()
		  // set the time out value according the connected resource
		  if Me.ResourceAttribute.Link <> nil And Me.ResourceAttribute.Link.MyStep IsA ResourceClass then
		    Me.WaitTime.SIAI(ResourceClass(Me.ResourceAttribute.Link.MyStep).GetTimeOutTime)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessReply()
		  // method to process the reply
		  
		  if Reply.GIAS<>"" then
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCommand()
		  
		  ReplyType.SIAI(0)
		  CommandType.SIAS("B")
		  
		  Super.SetCommand
		End Sub
	#tag EndMethod


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
