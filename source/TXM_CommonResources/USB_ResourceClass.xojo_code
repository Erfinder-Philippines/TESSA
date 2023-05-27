#tag Class
Protected Class USB_ResourceClass
Inherits Resource_StepClass
Implements UserFunctions
	#tag Method, Flags = &h0
		Sub AddChannel(i as integer)
		  i = (Ubound(AttributeList()) - StartUserAttribute)/3+1
		  AddAttribute("Input_"+str(i), "", "", AT_Double, 0, 0, AttributeGroups.Parameters,true)
		  AddAttribute("Gain"+str(i), "1", "", AT_Double, 0, 0, AttributeGroups.Parameters,true)
		  AddAttribute("Offset_"+str(i), "", "", AT_Double, 0, 0, AttributeGroups.Parameters,true)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddToComLog(S as string)
		  #Pragma  BackgroundTasks Off
		  'this routine is being called by the sub class SerialClass in order to bring the incoming result
		  ComLog.Add(S)
		  ComLog.SetCommandStartPosition()
		  if DataStream.GIAB then
		    RString = ComLog.GetMemBlock
		    if LastPosition>ComLog.GetCommandStartPosition then
		      LastPosition=1
		    else
		      ThisPosition = RString.Instr(LastPosition,EOL_S)
		      if ThisPosition>2 then
		        if (LastPosition>1) then
		          RString=Rstring.Mid(LastPosition,ThisPosition-LastPosition)
		          Dim i as integer = (Ubound(AttributeList()) - StartUserAttribute)/3-1
		          Dim j as integer = RString.CountFields(Separator.GIAS)
		          if j=(i+2) then
		            DataAvailable=true
		            Reply.SIAS(RString)
		            Dim k, GroupLoc as integer
		            Dim dValue, dGain, dOffset as double
		            
		            for k=0 to i
		              GroupLoc = 3*k+StartUserAttribute
		              dGain=AttributeList(GroupLoc+2).GIAD
		              dOffset=AttributeList(GroupLoc+3).GIAD
		              dValue = val(NthField(RString,Separator.GIAS,k+1))
		              AttributeList(GroupLoc+1).SIAD((dValue+dOffset)*dGain)
		            next
		          end
		        end
		        LastPosition=ThisPosition+EOL_S.Len
		      end
		    end
		  end
		  #Pragma BackgroundTasks On
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  if Me.Com_Port<>nil then
		    Me.Com_Port.Close
		    me.COM_Port_Index.SIAI(-1)
		    Me.Connected.SIAB(false)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Connect()
		  dim s as String
		  if COM_Port<>nil then
		    try
		      COM_Port.Connect()
		      Connected.SIAB(true)
		    catch error as IOException
		      Connected.SIAB(false)
		    end
		  else
		    ConnectManual()
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectManual()
		  
		  // connect to serial device
		  Dim i as integer
		  COM_Port.Device=nil
		  for i=0 to SerialDevice.LastIndex
		    if COM_PortNr.GIAS = SerialDevice.At(i).Name then
		      AddDebugTextCR("Chosen Port "+str(i)+": "+SerialDevice.At(i).Name)
		      COM_Port.Device=SerialDevice.At(i)
		      COM_Port_Index.SIAI(i)
		      'COM_Port.LineChangeNotification( Serial.LineDTR )
		      SetPortSettings
		    else
		      AddDebugTextCR("Port "+str(i)+": "+System.SerialPort(i).Name)
		    end
		  next
		  
		  Connect
		  
		  if Me.debug.GIAB then
		    if COM_Port.Device=nil then
		      AddDebugTextCR("No Comport configured! ")
		    else
		      AddRemarkToComLogCR("Port configured as follows:")
		      AddRemarkToComLogCR("Name: "+COM_Port.Device.Name)
		      AddRemarkToComLogCR("Baudrate: "+str(COM_Port.Baud))
		      AddRemarkToComLogCR("Bits: "+str(COM_Port.Bits))
		      AddRemarkToComLogCR("StopBits: "+str(COM_Port.StopBit))
		      AddRemarkToComLogCR("Parity: "+str(COM_Port.Parity))
		      AddRemarkToComLogCR("State: "+Connected.GIAS)
		      AddRemarkToComLogCR("Error: "+str(COM_Port.NoError))
		    end
		  end
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  COM_Port=new TESSA_SerialClass(self)
		  
		  COM_PortNr = IAS("COM_Port","",false)
		  COM_Port_Index = IAI("COM_Port_index",-1,false)
		  CommandString = IAS("CommandString","",false)
		  Baudrate = IAE("BaudRate","0 300 600 1200 1800 2400 3600 4800 7200 9600 14400 19200 28800 38400 57600 115200 1250000 230400",false)
		  Parity = IAE("Parity","0 None Odd Even",false)
		  StopBits = IAE("StopBits","0 SB1 SB1.5 SB2 ",false)
		  Bits = IAE("Bits","0 B5 B6 B7 B8 ",false)
		  XonXoff = IAB("XonXoff",false,false)
		  EOL = IAE("EOL","2 None NL CR NL+CR",false)
		  Separator = IAS("Separator",",",false)
		  DataStream = IAB("DataStream",false,false)
		  
		  StartUserAttribute = Ubound(AttributeList())
		  EOL_S=chr(13)+chr(10)
		  
		  TimeOut.SIAI(1000)
		  
		  AddUserFunction("Connect", Connected.Name, "Connect", 0,UF_RunMode_Direct)
		  AddUserFunction("Disconnect", Connected.Name, "Disconnect", 0,UF_RunMode_Direct)
		  AddUserFunction("Send", CommandString.Name, "Send", 0,UF_RunMode_Direct)
		  AddUserFunction("Read", CommandString.Name, "Read", 0,UF_RunMode_Direct)
		  AddUserFunction("Read", Reply.Name, "Read", 0,UF_RunMode_Direct)
		  
		  AddUserFunction("AddValue", DataStream.Name, "Add Value", 0,UF_RunMode_Direct)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect()
		  
		  if Send1("Disconnect") then
		  end
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
		Function GetResult() As string
		  
		  if Me.COM_Port<>nil then
		    return ComLog.GIAS
		    
		  else
		    return "no ComPort defined"
		  end
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  // Part of the UserFunctions interface.
		  return Me.TimeOut.GIAI
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWholeReply() As string
		  return  ComLog.GetWholeCommand
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  // connect to serial device
		  Dim RP as string =""
		  
		  AddRemarkToComLogCR("Init "+Name.GIAS)
		  
		  //if Me.COM_Port<>nil then
		  Dim i as integer
		  COM_Port.Device=nil
		  for i=0 to SerialDevice.LastIndex
		    if COM_PortNr.GIAS = SerialDevice.At(i).Name then
		      AddRemarkToComLogCR("Chosen Port "+str(i)+": "+SerialDevice.At(i).Name)
		      COM_Port.Device=SerialDevice.At(i)
		      COM_Port_Index.SIAI(i)
		      SetPortSettings
		      'COM_Port.LineChangeNotification( Serial.LineDTR )
		    else
		      AddRemarkToComLogCR("Port "+str(i)+": "+SerialDevice.At(i).Name)
		    end
		  next
		  
		  if ImmediateConnection.GIAB then
		    if COM_Port.Device<>nil then
		      Com_Port.connect()
		      Connected.SIAB(true)
		    end
		  end
		  
		  
		  if COM_Port.Device=nil then
		    AddRemarkToComLogCR("No Comport configured! ")
		    RP="no connect"
		  else
		    AddRemarkToComLogCR("Port configured as follows:")
		    AddRemarkToComLogCR("Name: "+COM_Port.Device.Name)
		    AddRemarkToComLogCR("Baudrate: "+str(COM_Port.Baud))
		    AddRemarkToComLogCR("Bits: "+str(COM_Port.Bits))
		    AddRemarkToComLogCR("StopBits: "+str(COM_Port.StopBit))
		    AddRemarkToComLogCR("Parity: "+str(COM_Port.Parity))
		    AddRemarkToComLogCR("State: "+Connected.GIAS)
		    AddRemarkToComLogCR("Error: "+str(COM_Port.NoError))
		    RP="connected"
		  end
		  //end
		  
		  return RP
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewDataAvailable() As Boolean
		  
		  
		  'if Me.COM_Port<>nil then
		  '//return (Me.COM_Port.DataAvailableFlag)
		  'if DataReady=2 then
		  'return true
		  'else
		  'return false
		  'end
		  'else
		  'Return false
		  'end
		  
		  return (Com_Port<>nil) and (DataReady=2)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
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
		      me.COM_Port.Poll
		      return DataReady
		    case "Read"
		      
		    end
		  end
		  Return RV
		  
		  if 1=2 then
		    // this would be a possible implementation:
		    
		    if NewDataAvailable then
		      Result=GetReply
		      
		    else
		      
		    end
		    
		    Return RV
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll_Step() As integer
		  Dim RV as Integer=0
		  If COM_Port<>Nil Then
		    COM_Port.Poll
		    
		    RV = DataReady
		  end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetCommunication()
		  
		  DataReady = 0
		  ComLog.SetCommandStartPosition
		  ComLog.SetCommandStepStartPosition
		  
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
		  return connected.GIAB
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
		      ConnectManual
		    case "Send"
		      Reply.SIAS("")
		      Send(CommandString.GIAS)
		    case "Read"
		      
		    End
		  End
		  Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send(vCommandString as string, vPrompt as string = "") As boolean
		  #Pragma DisableBackgroundTasks
		  Dim S,a as String
		  Dim RV as boolean = false
		  
		  if not(COM_Port.ClearToSend) then
		    COM_Port.Close
		    a = Init_Resource
		    Connect
		    WaitTicks(200)
		    AddDebugTextCR("reconnect COM port")
		  end
		  
		  // clear the input buffer from all remaining characters
		  COM_Port.Poll
		  ComLog.SIASAdd(COM_Port.ReadAll)
		  ComLog.SetCommandStepStartPosition
		  
		  if vCommandString.InStr("Disconnect")<>0 then
		    me.close
		    RV=true
		  else
		    DataReady = 0
		    
		    Dim dummyS as string = ""
		    for n as integer =0 to vCommandString.len
		      dummyS=dummyS+"/"+str(asc(vCommandString.Mid(n,1)))
		    next
		    'AddDebugTextCR("send1 "+ReplaceAllCRNL(vCommandString)+"%%"+dummyS+"%%"+ReplaceAllCRNL(mPrompt)+"%%"+ReplaceAllCRNL(mPromptFinished)+"%%")
		    'ConcString = vCommandString  //test debug
		    'mCheckPrompt = (mPrompt<>"NoCheck") or (mPrompt="")
		    'mCheckFinishPrompt = (mPromptFinished<>"NoCheck") or (mPromptFinished="")
		    'mWaitForBootloader = mPrompt.Instr(1,StayInBootloader)>0
		    
		    if vCommandString="NoSend" then
		      
		    else
		      // start sending it character by character
		      COM_Port.Write(vCommandString)
		      COM_Port.Flush
		    end
		    RV=true
		  end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send1(vCommandString as string, vPrompt as string = "",vNextCharSent as integer =-1,vfinishedPrompt as string ="") As boolean
		  #Pragma DisableBackgroundTasks
		  Dim S,a as String
		  Dim RV as boolean = false
		  
		  'if not(COM_Port.ClearToSend) then
		  'COM_Port.Close
		  'a = Init_Resource
		  'Connect
		  'WaitTicks(200)
		  'AddDebugTextCR("reconnect COM port")
		  'end
		  
		  // clear the input buffer from all remaining characters
		  COM_Port.Poll
		  ComLog.SIASAdd(COM_Port.ReadAll)
		  ComLog.SetCommandStepStartPosition
		  
		  if vCommandString.InStr("Disconnect")<>0 then
		    me.close
		    RV=true
		  else
		    DataReady = 0
		    
		    if vCommandString="NoSend" then
		      
		    else
		      // start sending it character by character
		      COM_Port.Write(vCommandString)
		      COM_Port.Flush
		    end
		    RV=true
		  end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPortSettings()
		  Me.COM_Port.SetPortSettings(BaudRate.GIAI, Parity.GIAI, StopBits.GIAI, Bits.GIAI, XonXoff.GIAB)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  case is = "Add value"
		    AddChannel(0)
		    
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunctionFinished()
		  // Part of the UserFunctions interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WaitBeforeStart() As Integer
		  // Part of the UserFunctions interface.
		  
		  //return Me.TimeOut.GIAI  // msec
		  return 0
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BaudRate As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Bits As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CommandString As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		COM_Port As TESSA_SerialClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		COM_PortNr As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		COM_Port_Index As Integer_AttributeClass = nil
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDataAvailable
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDataAvailable = value
			End Set
		#tag EndSetter
		DataAvailable As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDataReady
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDataReady = value
			End Set
		#tag EndSetter
		DataReady As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DataStream As Boolean_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		ending As string
	#tag EndProperty

	#tag Property, Flags = &h0
		EOL As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EOL_S As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorOccured As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		LastPosition As Int64 = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCheckFinishPrompt As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDataAvailable As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDataReady As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MultiValue As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Parity As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RString As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Separator As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartUserAttribute As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StopBits As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ThisPosition As Int64 = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		XonXoff As Boolean_AttributeClass = nil
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
			Name="DataAvailable"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataReady"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="ErrorOccured"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			InitialValue="-2147483648"
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
		#tag ViewProperty
			Name="EOL_S"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastPosition"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Int64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RString"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartUserAttribute"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThisPosition"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Int64"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
