#tag Class
Protected Class StreamReceiver_ResourceClass
Inherits SerialPort_ResourceClass
Implements UserFunctions
	#tag Method, Flags = &h0
		Sub AddToComLog(S as string)
		  // this routine is being called by the sub class TCPClass in order to bring the incoming result
		  ComLog.SIASAdd(S)
		  mReply=ComLog.GIAS.Mid(StartCommandPosition+1,ComLog.GIAS.Len)
		  DataAvailable=true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckResult() As string
		  
		  Dim S as string = ""
		  if Me.COM_Port<>nil then
		    Me.COM_Port.Poll
		    
		    if NewDataAvailable then //me.COM_Port.DataAvailableFlag then
		      
		      S = GetReplyAndReset//Me.COM_Port.GetResult
		      ConcString = ConcString+S
		      
		      if Me.Debug.GIAB then
		        if S.len>0 then
		          AddDebugText("Received: "+S)
		        end
		      end
		      if Me.SendCharbyChar.GIAB then
		        if (S = Me.CommandString.GIAS.Mid(Me.LastCharSent,1))_ // and not (S="H")) _
		          or ConcString.instr("HALF-WORD")<>0_ //in case of ctrl-H the return value is HALF-WORD
		          or ConcString.instr("(hex, 0-FF)")<>0_  //in case of ctrl-V
		          or ConcString.instr("(hex, 84-FFFF)")<>0_  //in case of ctrl-E
		          or ConcString.instr("=")<>0 then
		          Me.LastCharSent=Me.LastCharSent+1
		          
		          AddDebugText(" After Halfword Cmdlen: "+str(CommandString.GIAS.Len)+" last chr: "+ str(Me.LastCharSent))
		          
		          if Me.LastCharSent>CommandString.GIAS.LenB+1 then
		            AddDebugText(str(Me.LastCharSent)+S+" end")
		          elseif Me.LastCharSent=CommandString.GIAS.LenB+1 then
		            Me.COM_Port.Write(me.ending)
		            me.COM_Port.Flush//
		            AddDebugText("Last send Nr: "+str(Me.LastCharSent))
		            Me.LastCharSent=Me.LastCharSent+1
		          else
		            Me.COM_Port.Write(CommandString.GIAS.Mid(Me.LastCharSent,1))
		            me.COM_Port.Flush//
		            AddDebugText("Send char "+CommandString.GIAS.Mid(Me.LastCharSent,1))
		          end
		        end
		      end
		    end
		  else
		    S = "no ComPort defined"
		  end
		  
		  Return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clear()
		  if Me.COM_Port<>nil then
		    Me.COM_Port.Poll
		  end
		  mReply=""
		  ReplyString.SIAS("")
		  DataAvailable=false
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  if Me.Com_Port<>nil then
		    Me.Com_Port.Close
		    Me.Connected.SIAB(false)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Connect()
		  
		  if Me.COM_Port.SerialPort<>nil then
		    Me.Connected.SIAB(Me.COM_Port.Open)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  EndOfLine = IAS("EndOfLine","CR",false)
		  Separator = IAS("Separator",",",false)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDebugInfo() As string
		  if Me.COM_Port<>nil then
		    return Me.COM_Port.GetDebugInfo
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReply() As string
		  DataAvailable=false
		  return mReply
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReplyAndReset() As string
		  Dim S as string = mReply
		  StartCommandPosition = ComLog.GIAS.Len
		  DataAvailable=false
		  mReply=""
		  return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  // Part of the UserFunctions interface.
		  return Me.TimeOut.GIAI
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  // connect to serial device
		  Dim RP as string =""
		  
		  AddRemarkToComLogCR("Init "+Name.GIAS)
		  
		  //if Me.COM_Port<>nil then
		  Dim i as integer
		  Me.COM_Port.SerialPort=nil
		  for i=0 to System.SerialPortCount-1
		    if Me.COM_PortNr.GIAS=System.SerialPort(i).Name then
		      AddRemarkToComLogCR("Chosen Port "+str(i)+": "+System.SerialPort(i).Name)
		      Me.COM_Port.SerialPort=System.SerialPort(i)
		      me.COM_Port_Index.SIAI(i)
		      Me.COM_Port.LineChangeNotification( Serial.LineDTR )
		    else
		      AddRemarkToComLogCR("Port "+str(i)+": "+System.SerialPort(i).Name)
		    end
		  next
		  
		  Me.SetPortSettings
		  
		  if ImmediateConnection.GIAB then
		    if Me.COM_Port.SerialPort<>nil then
		      Me.Connected.SIAB(Me.COM_Port.Open)
		    end
		  end
		  
		  
		  if Me.COM_Port.SerialPort=nil then
		    AddRemarkToComLogCR("No Comport configured! ")
		    RP="no connect"
		  else
		    AddRemarkToComLogCR("Port configured as follows:")
		    AddRemarkToComLogCR("Name: "+Me.COM_Port.SerialPort.Name)
		    AddRemarkToComLogCR("Baudrate: "+str(Me.COM_Port.Baud))
		    AddRemarkToComLogCR("StopBits: "+str(Me.COM_Port.Stop))
		    AddRemarkToComLogCR("Parity: "+str(Me.COM_Port.Parity))
		    AddRemarkToComLogCR("State: "+Me.Connected.GIAS)
		    AddRemarkToComLogCR("Error: "+str(Me.COM_Port.LastErrorCode))
		    RP="connected"
		  end
		  //end
		  
		  return RP
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewDataAvailable() As Boolean
		  
		  return DataAvailable
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  #Pragma Unused Result
		  #Pragma Unused AttributeLink
		  // Part of the UserFunctions interface.
		  Dim RV as integer = 0
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case "Disconnect"
		      RV=2
		    case "Connect"
		      RV=2
		      
		    case "Send"
		      RV=CheckResult_New
		      if RV=2 then
		        
		      end
		    case "Read"
		      if Me.CheckResult<>"" then
		        if Me.Prompt.GIAS<>"" then
		          if mReply.Instr(1,Me.Prompt.GIAS)>0 then
		            RV=2
		          end
		        end
		      end
		    end
		  end
		  Return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetReply()
		  
		  StartCommandPosition = ComLog.GIAS.Len
		  mReply=""
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceAttribute() As AttributeClass
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case "Disconnect","Connect"
		      Return Connected
		    Case "Send","Read"
		      Return CommandString
		    End
		  End
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceConnected() As Boolean
		  return Me.connected.GIAB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  #Pragma Unused Parameter
		  #Pragma Unused AttributeLink
		  // Part of the UserFunctions interface.
		  
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case "Disconnect"
		      Close
		    case "Connect"
		      Connect
		    case "Send"
		      LastCharSent=1 // start sending at first character
		      SendState=0     // set SendSate to sending first, 1= receiving
		      Send(CommandString.GIAS, vPrompt )
		    case "Read"
		      
		    End
		  End
		  Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send()
		  if Me.COM_Port<>nil then
		    if Me.Debug.GIAB then
		      AddDebugTextCR(Me.CommandString.GIAS)
		      AddDebugTextCR("Send: "+Me.CommandString.GIAS)
		    end
		    if not(Me.Connected.GIAB) then
		      Me.Connect
		    end
		    if Me.Connected.GIAB then
		      StartCommandPosition = ComLog.GIAS.Len
		      if Me.SendCharbyChar.GIAB then
		        Me.LastCharSent=1
		        Me.COM_Port.Write(Me.CommandString.GIAS.Mid(Me.LastCharSent,1))
		      else
		        Me.COM_Port.Write(Me.CommandString.GIAS)
		      end
		      SendTimeout = GetActTime_msec+GetTimeoutTime
		    else
		      AddDebugTextCR("No connection for sending: "+Me.CommandString.GIAS)
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send(Command as string, vPrompt as string = "")
		  
		  if Me.COM_Port<>nil then
		    if Me.Debug.GIAB then
		      AddDebugTextCR("Send: "+Command)
		    end
		    // check the size of the ComLog first
		    if ComLog.GIAS.Len>100000 then
		      Dim i as integer = ComLog.GIAS.InStr(50000,CR)
		      if i=0 then i=50000
		      ComLog.SIAS(ComLog.GIAS.Mid(i,ComLog.GIAS.Len))
		    end
		    
		    if vPrompt<>"" then
		      Prompt.SIAS(vPrompt)
		    end
		    
		    Select case EOL.GIAI
		    case 0
		      //Me.CommandString.SIAS(Command)
		      me.ending = ""
		    case 1
		      //Me.CommandString.SIAS(Command+chr(10))
		      me.ending = NL
		    case 2
		      //Me.CommandString.SIAS(Command+CR)
		      me.ending = CR
		    case 3
		      //Me.CommandString.SIAS(Command+chr(10)+CR)
		      me.ending = NL+CR
		    end
		    
		    if not(Me.Connected.GIAB) then
		      Me.Connect
		    end
		    
		    Clear
		    
		    if Me.Connected.GIAB then
		      StartCommandPosition = ComLog.GIAS.Len
		      if Me.SendCharbyChar.GIAB then
		        Me.LastCharSent=1
		        Me.COM_Port.Write(Command.Mid(Me.LastCharSent,1))
		        me.COM_Port.Flush
		        AddDebugText("Start sending "+Command.Mid(Me.LastCharSent,1))
		      else
		        Me.COM_Port.Write(Command+Me.ending)
		        me.COM_Port.Flush
		      end
		      SendTimeout = GetActTime_msec+GetTimeoutTime
		    else
		      AddDebugTextCR("No connection for sending: "+Command)
		    end
		  else
		    AddDebugTextCR("No COM Port defined for sending: "+Command)
		  end
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		EndOfLine As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Separator As String_AttributeClass
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
			Name="ConcString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="ending"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastCharSent"
			Visible=false
			Group="Behavior"
			InitialValue="nil"
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
			InitialValue="0"
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
			Name="mReply"
			Visible=false
			Group="Behavior"
			InitialValue="nil"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="SendTimeout"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
