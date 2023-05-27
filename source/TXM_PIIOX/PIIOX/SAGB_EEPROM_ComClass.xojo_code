#tag Class
Protected Class SAGB_EEPROM_ComClass
Inherits StepClass
Implements EEPROM_Communication
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Resource=IAS("Resource","",false)
		  Address=IAI("Address",0,false)
		  Data=IAS("Data","",false)
		  MemoryType=IAE("MemoryType","0 RAM CarrierBoard PS771")
		  ComType=IAE("ComType","0 Dollar boot_Ctrl Debug_Ctrl")
		  Result=IAS("Result","",false)
		  ResultText=IAS("ResultText","",false)
		  
		  
		  Result.NoSave = true
		  ResultText.NoSave = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtractResultValue()
		  Dim S,A as string
		  Dim startstr, startstr1,startstr2, startstr3, endstr as integer
		  Dim found as Boolean=false
		  S = ResultText.GIAS
		  
		  startstr =S.InStr(":")+1
		  endstr = S.InStr(">")
		  A=S.mid(startstr,endstr-startstr)
		  A=A.ReplaceAll(CR,"")
		  A=A.ReplaceAll(NL,"")
		  A=A.ReplaceAll(">","")
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConnection() As string
		  
		  if (RelatedResource <>nil) And (RelatedResource IsA PIIOX_ResourceClass) then
		    if PIIOX_ResourceClass(RelatedResource).connected.GIAB then
		      return "connected to "+PIIOX_ResourceClass(RelatedResource).Name.GIAS
		    else
		      return "Related resource valid, but not connected"
		    end
		  else
		    return "Related resource not valid"
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetRelatedResource()
		  if Resource.GetLinkAsAttributeClass<>nil then
		    Dim BS as BasicClass = Resource.GetLinkAsAttributeClass.MyStep
		    if (BS<>nil) and (BS IsA PIIOX_ResourceClass) then
		      RelatedResource = PIIOX_ResourceClass(BS)
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReturnComProcedure(Mode as integer, WR as boolean, ByRef BlockSize as integer) As integer
		  // returns the best communication mode according the chosen EEPROM send mode
		  // communication modes are: ByteWise = 0, BlockWise = 1, FileWise = 2, WR stands for Write(=true)/Read
		  
		  Select case Mode
		  case 0 // All
		    if WR then
		      return 0
		    else
		      BlockSize=128
		      return 1
		    end
		  case 1 // changed_cells   
		    return 0
		  case 2 // cell_not_FF
		    return 0
		  case 3 // cell_not_0
		    return 0
		  case 4 // From_To
		    return 0
		  else
		    return 0
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstrReverse(source as string, StartPosition as integer, find as string) As integer
		  #Pragma Unused StartPosition
		  Dim i as integer = source.Len
		  Dim k as integer = 0
		  while (i>0)
		    if source.Mid(i,find.len)=find then
		      k=i
		      i=-1
		    else
		      i=i-1
		    end
		  wend
		  
		  return k
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function poll(ByRef vData as integer) As integer
		  Dim RV as integer
		  
		  if (RelatedResource <>nil) And (RelatedResource IsA PIIOX_ResourceClass) then
		    
		    'RV = PIIOX_ResourceClass(RelatedResource).Poll_Step
		    
		    if RV=2 then
		      resend=0
		      'Dim RS as string = PIIOX_ResourceClass(RelatedResource).GetWholeReply
		      'ResultText.SIAS(RS)
		      
		      'AddDebugTextCR("received SAM600:"+RS)
		      PIIOX_ResourceClass(RelatedResource).Reset
		      SendState=0
		    Else
		      if RV = 1 then
		        'AddDebugTextCR("received step")
		        resend=0
		        SendState=SendState+1
		      end
		      If RV = 20 Then // polling takes too long
		        resend=resend+1
		        RV=1
		      end
		    end
		  End
		  return RV
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function poll(byRef vData as string) As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function poll(vEEPROM as EEPROM_Class, ByRef vAddress as Int64, vSize as integer) As integer
		  Dim RV as integer
		  
		  if (RelatedResource <>nil) And (RelatedResource IsA PIIOX_ResourceClass) then
		    
		    'RV = PIIOX_ResourceClass(RelatedResource).Poll_Step
		    
		    if RV=2 then
		      resend=0
		      Dim RS as string
		      ' = PIIOX_ResourceClass(RelatedResource).GetWholeReply
		      ResultText.SIAS(RS)
		      Dim i, i1,i2 as integer
		      Select case ComType.GIAI
		      case 0 // Dollar
		        for i=1 to vSize
		          Dim S as string
		          S=NthField(RS,"=",i+1)
		          S=NthField(S,":",2)
		          S=S.mid(1,2)
		          vEEPROM.SetFormatedContent(S,vAddress+i-1,1)
		        next
		      case 1 // Ctr- ")
		        Dim Lines() as string = Split(RS,CR)
		        for i=0 to Ubound(Lines())
		          i1 = Lines(i).Instr(1,":")
		          i2 = Lines(i).Instr(i1+1,CR)
		          if (i1>0) and (i2>i1) then
		            vEEPROM.EP(vAddress).BY=ValHex(Lines(i).Mid(i1+1,i2-i1-1))
		            vAddress=vAddress+1
		          else
		          end
		        next
		      case 2 // Debug")
		      end
		      'AddDebugTextCR("received SAM600:"+RS)
		      PIIOX_ResourceClass(RelatedResource).Reset
		      SendState=0
		    else
		      if RV = 1 then
		        'AddDebugTextCR("received step")
		        resend=0
		        SendState=SendState+1
		      end
		      if RV = 20 then // polling takes too long
		        resend=resend+1
		        RV=1
		      end
		    end
		  end
		  return RV
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resource() As AttributeClass
		  // Part of the UserFunctions interface.
		  
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case Make_Config
		      
		    End
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReturnEffort() As integer
		  return 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send(vAddress as Int64, vSize as Int64, vEEPROM as EEPROM_Class, vWrite as boolean) As boolean
		  Dim RV as boolean = false
		  
		  if SendState=0 then
		    if vWrite then 
		      // no block write implemented in SAM600 ********************************************************
		    else 
		      // read *****************************************************************
		      'AddDebugTextCR("read SAM600 "+Swhole)
		    end
		  end
		  
		  if (RelatedResource <>nil) And (RelatedResource IsA PIIOX_ResourceClass) then
		    'Dim j as integer = PIIOX_ResourceClass(RelatedResource).LastCharSent
		    'if (j<=Ubound(CmdArray())) and (CmdArray(j)<>"") then
		    'if resend<5 then
		    ''AddDebugTextCR("do next command ("+str(j)+")"+CmdArray(j)+"() "+PromptArray(j)+"()")
		    ''PIIOX_ResourceClass(RelatedResource).StayInBootMode.SIAB (false)
		    'if j=0 then
		    'PIIOX_ResourceClass(RelatedResource).ResetCommunication
		    'PIIOX_ResourceClass(RelatedResource).ComLog.SetCommandStartPosition
		    'end
		    'Dim vPromptFinished as string = CR+NL+">"
		    'if ComType.GIAI=1 then vPromptFinished="boot>"
		    'RV=PIIOX_ResourceClass(RelatedResource).send1(CmdArray(j),PromptArray(j),j+1,vPromptFinished)
		    'else
		    'RV=PIIOX_ResourceClass(RelatedResource).send1(CR,CR+NL+">")
		    'end
		    'end
		  end
		  return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send(vAddress as Int64, vData as integer, vWrite as boolean) As boolean
		  Dim RV as boolean = false
		  
		  if SendState=0 then
		    
		    if vWrite then 
		      // write ********************************************************
		    else 
		      // read *****************************************************************
		    End
		    'AddDebugTextCR("read SAM600 "+Swhole)
		  end
		  
		  if (RelatedResource <>nil) And (RelatedResource IsA PIIOX_ResourceClass) then
		    Dim j as integer
		    ' = PIIOX_ResourceClass(RelatedResource).LastCharSent
		    if (j<=Ubound(CmdArray())) and (CmdArray(j)<>"") then
		      if resend<5 then
		        'AddDebugTextCR("do next command ("+str(j)+")"+CmdArray(j)+"() "+PromptArray(j)+"()")
		        'PIIOX_ResourceClass(RelatedResource).StayInBootMode.SIAB (false)
		        if j=0 then PIIOX_ResourceClass(RelatedResource).ComLog.SetCommandStartPosition
		        Dim vPromptFinished as string = CR+NL+">"
		        if ComType.GIAI=1 then vPromptFinished="boot>"
		        'RV=PIIOX_ResourceClass(RelatedResource).send1(CmdArray(j),PromptArray(j),j+1,vPromptFinished)
		      else
		        'RV=PIIOX_ResourceClass(RelatedResource).send1(CR,CR+NL+">")
		      end
		    end
		  end
		  return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send(vData as String, vWrite as boolean) As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEEPROMSize(NewSize as Int64)
		  ResetWaitTime(NewSize*1000)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  
		  resend=0
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  
		  
		  return 2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_PollTimeout() As integer
		  
		  
		  
		  return 6
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  return true
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As Boolean
		  // reset the run state
		  
		  
		  SendState=0
		  Result.SIAS("")
		  ResultText.SIAS("")
		  
		  return true
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextChange(NewText As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  case is = "send"
		    
		  end
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = General
		This method connects the SAM600 devices to the HMI_EEPROM element
		It is derived from the general StepClass and implements the EEPROM_Communication interface
		
		
	#tag EndNote


	#tag Property, Flags = &h0
		Address As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AddressFormat As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CmdArray() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ComType As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Data As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MemoryType As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PromptArray() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		resend As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Resource As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Result As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ResultText As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		vLastAddress As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		vLastData As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		vLastEEPROM As EEPROM_Class
	#tag EndProperty

	#tag Property, Flags = &h0
		vLastWrite As boolean
	#tag EndProperty


	#tag Constant, Name = Make_Config, Type = String, Dynamic = False, Default = \"Make_Config", Scope = Public
	#tag EndConstant


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
			Name="DebugOn"
			Visible=false
			Group="Behavior"
			InitialValue="false"
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
			Name="Local_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxRetries"
			Visible=false
			Group="Behavior"
			InitialValue="5"
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
			Name="NextTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
			Name="resend"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWait"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWaitTime"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Untitled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="vLastAddress"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="vLastData"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="vLastWrite"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
