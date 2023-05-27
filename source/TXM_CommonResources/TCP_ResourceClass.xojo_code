#tag Class
Protected Class TCP_ResourceClass
Inherits Resource_StepClass
Implements UserFunctions
	#tag Method, Flags = &h0
		Sub AddToComLog(S as string)
		  #Pragma DisableBackgroundTasks
		  // Calling the overridden superclass method.
		  ComLog.Add(S)
		  
		  if S.IndexOf(mPrompt)>-1 then
		    DataAvailable = true
		    
		  else
		    
		  end
		  #Pragma BackgroundTasks On
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  mReply=""
		  StartCommandPosition=ComLog.GIAS.Len
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  //close the socket
		  if Me.TCP_Stack<>nil then
		    Me.TCP_Stack.Close
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Connect(Retries as integer = 2, WaitTicks as integer = 100)
		  
		  
		  Me.TCP_Stack.ConnectIP(Me.IP_Address.GIAS,Me.IP_Port.GIAI,Me.EOL.GIAS,Retries,WaitTicks)
		  
		  Dim start as integer = Ticks
		  While (Ticks-start)<WaitTicks
		  wend
		  
		  if Me.TCP_Stack.IsConnected then
		    Me.connected.SIAB(true)
		    AddRemarkToComLogCR("Connection to "+IP_Address.GIAS+":"+IP_Port.GIAS)
		  else
		    AddRemarkToComLogCR("No connection to "+IP_Address.GIAS+":"+IP_Port.GIAS)
		    Me.connected.SIAB(false)
		  end
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText As string)
		  
		  Super.Constructor(ConfigText)
		  
		  TCP_Stack= new TCPClass(self)
		  
		  'ComLog.SIAS("Buffer 100000 20000")
		  
		  IP_Address=IAS("IP_Address","0.0.0.0",false)
		  IP_Port=IAI("IP_Port",0,false)
		  EOL=IAS("LF","13",false)
		  
		  Command = IAS("Command","",false)
		  Command.Format=1
		  Prompt=IAS("Prompt","",false)
		  
		  AddUserFunction("Send", Command.Name, "Send", 0,UF_RunMode_OP_Loop,true)
		  AddUserFunction("Connect", Connected.Name, "Connect", 0,UF_RunMode_OP_Loop,true)
		  AddUserFunction("Disconnect", Connected.Name, "Disconnect", 0,UF_RunMode_OP_Loop,true)
		  AddUserFunction("Reset", Connected.Name, "Reset", 0,UF_RunMode_OP_Loop,true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect()
		  Close
		  connected.SIAB(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReply() As string
		  
		  return ComLog.GetWholeCommand
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  
		  Dim TOT as integer = 0
		  
		  if Me.TimeOut.GIAI>0 then
		    TOT=Me.TimeOut.GIAI
		  else
		    if Me.UpperStep<>nil then
		      if Me.UpperStep IsA ResourceClass then
		        TOT= ResourceClass(Me.UpperStep).GetTimeouttime
		      else
		        TOT=9999
		      end
		    else
		      TOT=9999
		    end
		  end
		  
		  return TOT
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  
		  Dim NID as integer = -1
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA Network_ResourceClass then
		      if Network_ResourceClass(UpperStep).connected.GIAB then
		        NID=Network_ResourceClass(Me.UpperStep).NetworkCardID.GIAI
		      end
		    end
		  end
		  
		  if NID>-1 then
		    AddRemarkToComLogCR("Init TCP Stack for "+Name.GIAS)
		    Me.TCP_Stack.Init(NID)
		    // connect to ethernet
		    if Me.ImmediateConnection.GIAB then
		      Me.Connect
		      if Me.connected.GIAB then
		        return IP_Address.GIAS+" ok"
		      else
		        return IP_Address.GIAS+" not connected"
		      end
		    else
		      return IP_Address.GIAS+" not yet connected"
		    end
		  else
		    return IP_Address.GIAS+" no ethernet"
		  end
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  
		  Dim RV as integer = 0
		  
		  if DataAvailable then
		    Result=GetReply
		    Dim i as integer = Result.Instr(1,Prompt.GIAS)
		    if i>0 then
		      Reply.SIAS(Result)
		      RV=2
		    end
		  else
		    
		  end
		  
		  Return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  Disconnect
		  
		  Connect
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceAttribute() As AttributeClass
		  // Part of the UserFunctions interface.
		  
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case "Send"
		      Return Me.Command
		    Case "Connect"
		      Return Me.Connected
		    Case "Disconnect"
		      Return Me.Connected
		    Case "Reset"
		      Return Me.Connected
		    End
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Function ResourceConnected() As Boolean
		  
		  return Me.TCP_Stack.IsConnected
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // Part of the UserFunctions interface.
		  
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  
		  
		  if (Parameter="") or (Parameter="Send") then
		    Parameter = Command.GIAS
		  else
		    Command.SIAS(Parameter)
		  end
		  if vPrompt="" then
		    vPrompt = Prompt.GIAS
		  else
		    Prompt.SIAS(vPrompt)
		  end
		  
		  if (AttributeLink<>nil) then
		    Send(Parameter,vPrompt)
		    mPrompt=vPrompt
		    return true
		  else
		    If mCurrentUserFunction <> Nil Then
		      Select case mCurrentUserFunction.FunctionName
		      Case "Send"
		        if Me.ResourceConnected then
		          Me.Send(Parameter,vPrompt)
		          PollCounter=0
		          return true
		        else
		          return false
		        end
		      case "Connect"
		        Connect(2,100)
		      case "Reset"
		        Disconnect
		        Connect(2,100)
		      case "Disconnect"
		        Disconnect
		      End
		    End
		  end
		  
		  Return True
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Send(vCommandString as string, vPrompt as string = "")
		  Dim DoSend As Boolean = True
		  
		  if vCommandString="" then
		    DoSend=false
		    AddDebugTextCR("DoSend set false 1")
		  else
		    if (vCommandString="CR") or (vCommandString="NL") then
		      vCommandString=""
		    else
		      Select case vCommandString
		      case "Connect"
		        Connect(2,100)
		        DoSend=false
		        AddDebugTextCR("DoSend set false 2")
		      case "Reset"
		        Disconnect
		        Connect(2,100)
		        DoSend=false
		        AddDebugTextCR("DoSend set false 3")
		      case "Disconnect"
		        Disconnect
		        DoSend=false
		        AddDebugTextCR("DoSend set false 4")
		      End
		      
		    end
		    Command.SIAS(vCommandString)
		  end
		  
		  if vPrompt="" then
		    vPrompt = Prompt.GIAS
		  elseif vPrompt="noprompt" then
		    vPrompt=""
		  elseif vPrompt="preset" then
		    
		  else
		    Prompt.SIAS(vPrompt)
		  end
		  SetPrompts(vPrompt)
		  
		  ComLog.SIASAdd(TCP_Stack.ReadAll)
		  if AddCommandtoComLog then
		    ComLog.SIASAdd_CR(vCommandString)
		  end
		  ComLog.SetCommandStartPosition
		  mReply=""
		  DataAvailable=false
		  // send message now or do connect
		  //++AddDebugTextCR(Name.GIAS+" next sends "+vCommandString+"/"+vPrompt+"/"+str(DoSend))
		  if DoSend then
		    if not(ResourceConnected) then
		      Connect
		    end
		    mPrompt = vPrompt
		    //++AddDebugTextCR("send "+vCommandString+"/"+vPrompt)
		    TCP_Stack.send(vCommandString)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunctionFinished()
		  // Part of the UserFunctions interface.
		  //MainWindow.HTL.UpdateTree                                                               // ...this has no effect here....
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WaitBeforeStart() As Integer
		  // Part of the UserFunctions interface.
		  
		  return 0
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AddCommandtoComLog As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		Command As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EOL As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		IP_Address As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		IP_Port As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPrompt As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mReply As String
	#tag EndProperty

	#tag Property, Flags = &h0
		MyGUI As ContainerControl
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected PollCounter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Prompt As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartCommandPosition As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TCP_Stack As TCPClass
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
