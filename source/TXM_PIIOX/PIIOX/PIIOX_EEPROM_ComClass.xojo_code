#tag Class
Protected Class PIIOX_EEPROM_ComClass
Inherits StepClass
Implements EEPROM_Communication,ElementCall
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  
		  Resource=IAS("Resource","",false)
		  PIIOX_Bus=IAI("PIIOX_Bus",0,false)
		  PIIOX_Module=IAI("PIIOX_Module",0,false)
		  PIIOX_LocalAddress=IAI("PIIOX_LocalAddress",3,false)
		  Address=IAI("Address",0,false)
		  Data=IAI("Data",0,false)
		  Result=IAS("Result","",false)
		  ResultText=IAS("ResultText","",false)
		  
		  Result.NoSave = true
		  ResultText.NoSave = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Poll(FunctionName as string, Parameter as string) As integer
		  // Part of the ElementCall interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Run(FunctionName as string, Parameter as string) As boolean
		  // Part of the ElementCall interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Start(FunctionName as string) As boolean
		  // Part of the ElementCall interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConnection() As string
		  return "not defined"
		  
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
		  // communication modes are: ByteWise = 0, BlockWise = 1, FileWise = 2
		  
		  Select case Mode
		  case 0 // All
		    if WR then
		      BlockSize=8
		      return 1
		    else
		      BlockSize=32
		      return 1
		    end
		  case 1 // changed_cells   
		    return 0
		  case 2 // cell_not_FF
		    return 0
		  case 3 // cell_not_0
		    return 0
		  case 4 // From_To
		    BlockSize=32
		    return 1
		  else
		    return 0
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function poll(ByRef vData as integer) As integer
		  Dim RV as integer = 0
		  
		  if (RelatedResource <>nil) And (RelatedResource IsA PIIOX_ResourceClass) then
		    Dim S as string = ""
		    RV = PIIOX_ResourceClass(Me.RelatedResource).Poll(S,nil)
		    Me.ResultText.SIAS(PIIOX_ResourceClass(Me.RelatedResource).Reply.GIAS)
		    
		    if RV=2 then
		      if LastWrite then 
		        if  SendState>=2 then
		          RV=2
		          SendState=0
		        else
		          SendState=SendState+1
		          RV=1
		        end
		      else
		        Result.SIAS(S)
		        vData=ValHex(S)
		      end
		    end
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function poll(byRef vData as string) As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function poll(vEEPROM as EEPROM_Class, ByRef vAddress as Int64, vSize as integer) As integer
		  Dim RV as integer = 0
		  
		  if (RelatedResource <>nil) And (RelatedResource IsA PIIOX_ResourceClass) then
		    Dim S as string = ""
		    RV = PIIOX_ResourceClass(Me.RelatedResource).Poll(S,nil)
		    ResultText.SIAS(PIIOX_ResourceClass(RelatedResource).Reply.GIAS)
		    
		    if RV=2 then
		      if LastWrite then 
		        if  SendState>=2 then
		          RV=2
		          SendState=0
		        else
		          SendState=SendState+1
		          RV=1
		        end
		      else
		        Result.SIAS(S)
		        Dim i,p1 as integer 
		        p1 = S.Instr(1,"h03")
		        if p1>0 then
		          p1=p1+8
		          S=S.Mid(p1,vSize*4+1)
		          for i=0 to vSize
		            vEEPROM.SetFormatedContent( NthField(S,",",i+1), vAddress+i,1)
		            'vEEPROM.EP(vAddress+i).BY=ValHex( NthField(S,",",i+1))
		          next
		        end
		      end
		    end
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Resource() As AttributeClass
		  // Part of the UserFunctions interface.
		  
		  'If mCurrentUserFunction <> Nil Then
		  'Select case mCurrentUserFunction.FunctionName
		  'Case Make_Config
		  '
		  'End
		  'End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send(vAddress as Int64, vSize as Int64, vEEPROM as EEPROM_Class, vWrite as boolean) As boolean
		  Dim RV as boolean = false
		  Dim H,S,VA as string = ""
		  Dim Prmt as string
		  H="S"+PIIOX_Bus.GIAS+PIIOX_Module.GIAS+PIIOX_LocalAddress.GIAS
		  if vWrite then 
		    H=H+",0,"
		    Select case SendState
		    case 0
		      S=H+"h06"
		    case 1
		      S=StrHex(vAddress,4)
		      S=H+"h02,h"+S.Mid(1,2)+",h"+S.Mid(3,2)
		      Dim i as integer
		      for i=0 to vSize-1
		        S=S+",h"+StrHex(vEEPROM.EP(vAddress+i).BY,2,2)
		      next
		    case 2
		      S=H+"h05"
		    end
		    Prmt=">"
		  else
		    H=H+",?,"
		    S=StrHex(vAddress,4)
		    S=H+"h03,h"+S.Mid(1,2)+",h"+S.Mid(3,2) // "S123,?,h11,h22,h00
		    Dim i as integer
		    for i=0 to vSize-1
		      S=S+",h00" 
		    next
		    Prmt=">"
		  end
		  
		  LastWrite=vWrite
		  
		  if (RelatedResource<>nil) and (RelatedResource IsA PIIOX_ResourceClass) and (S<>"") then
		    PIIOX_ResourceClass(RelatedResource).send(S,Prmt)
		    RV=true
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send(vAddress as Int64, vData as integer, vWrite as boolean) As boolean
		  Dim RV as boolean = false
		  Dim H,S,VA as string = ""
		  Dim Prmt as string
		  H="S"+PIIOX_Bus.GIAS+PIIOX_Module.GIAS+PIIOX_LocalAddress.GIAS
		  if vWrite then 
		    H=H+",0,"
		    Select case SendState
		    case 0
		      S=H+"h06"
		    case 1
		      S=StrHex(vAddress,4)
		      S=H+"h02,h"+S.Mid(1,2)+",h"+S.Mid(3,2)+",h"+StrHex(vData,2,2)
		    case 2
		      S=H+"h05"
		    end
		    Prmt=">"
		  else
		    H=H+",?,"
		    S=StrHex(vAddress,4)
		    S=H+"h03,h"+S.Mid(1,2)+",h"+S.Mid(3,2)+",h00" // "S123,?,h11,h22,h00
		    Prmt=">"
		  end
		  
		  LastWrite=vWrite
		  
		  if (RelatedResource<>nil) and (RelatedResource IsA PIIOX_ResourceClass) and (S<>"") then
		    PIIOX_ResourceClass(RelatedResource).send(S,Prmt)
		    RV=true
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


	#tag Property, Flags = &h0
		Address As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Data As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastWrite As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		MemoryType As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PIIOX_Bus As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PIIOX_LocalAddress As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PIIOX_Module As Integer_AttributeClass = nil
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
			Name="LastWrite"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
