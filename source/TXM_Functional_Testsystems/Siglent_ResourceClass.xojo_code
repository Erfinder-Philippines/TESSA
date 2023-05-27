#tag Class
Protected Class Siglent_ResourceClass
Inherits TCP_ResourceClass
	#tag Method, Flags = &h0
		Sub AddToComLog(S as string)
		  // Calling the overridden superclass method.
		  // Note that this may need modifications if there are multiple  choices.
		  // Possible calls:
		  // AddToComLog(S as string) -- From TCP_ResourceClass
		  // AddToComLog(S as string) -- From Resource_StepClass
		  Super.AddToComLog(S)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  
		  Super.Constructor(ConfigText)
		  
		  Me.IP_Address.SIAS("192.168.1.201")
		  Me.IP_Port.SIAS("5024")
		  Me.Prompt.SIAS(">>")
		  Me.EOL.SIAS("13")
		  Me.WithReply.SIAB(true)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  #Pragma Unused Result
		  
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim S, strcmd,strconcat as string
		  Dim RV as integer
		  Dim commands() As String
		  if AttributeLink=Nil  then
		    commands = Split(Command.GIAS,chr(13))
		    if commands.Ubound =-1 then
		    else
		      strcmd = Commands(0)
		    End
		  Else
		    commands = Split(AttributeLink.GIAS,chr(13))
		    strcmd = Commands(Me.SendState)
		  End
		  RV=0
		  
		  If Me.NewDataAvailable Then
		    Result = GetReply
		    'strconcat=strconcat+S
		    'If strconcat.InStr(strcmd)<>0 And strconcat.InStr(AgilentPrompt)<>0 Then
		    Me.SendState=Me.SendState+1
		    strconcat=""
		    RV=1
		    'End
		  End
		  If commands.Ubound+1<=Me.SendState Then //last command executed
		    RV=2
		    Me.SendState=0
		    
		  End
		  
		  Return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass) As boolean
		  #Pragma Unused Parameter
		  
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  
		  Dim S As String
		  Dim commands() As String
		  
		  '//initialize
		  'if Me.Error<>0 then
		  'Me.SendState=0
		  'me.Error=0
		  'end
		  
		  if AttributeLink<> Nil then
		    S = AttributeLink.GIAS
		    commands = Split(S,Chr(13))
		    
		    If commands.Ubound+1 > Me.SendState Then
		      // add a trailing whitespace
		      Dim command As String = Parameter 'commands(Me.SendState) + " "
		      Me.Send(command)
		    End
		  End
		  Return True
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Error As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		ResultLine As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="mUpdateCanvasMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AddCommandtoComLog"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BasicTypeName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataAvailable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoSYNC"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Error"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
			Name="Expanded"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
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
			Name="LastPrmptCheck"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
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
			Name="Local_Link_Errors"
			Visible=false
			Group="Behavior"
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
			Name="Name_Error"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Included_Elements"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Links"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SAMStepID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendState"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartCommandPosition"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sub_Link_Errors"
			Visible=false
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
			Name="TimeOutValue"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
