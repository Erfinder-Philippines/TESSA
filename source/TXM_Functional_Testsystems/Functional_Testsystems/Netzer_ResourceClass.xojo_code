#tag Class
Protected Class Netzer_ResourceClass
Inherits TCP_ResourceClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  
		  Super.Constructor(ConfigText)
		  
		  
		  
		  Me.IP_Port.SIAI(65000)
		  Me.IP_Address.SIAS("10.41.24.195")
		  Me.Prompt.SIAS("")
		  Me.EOL.SIAS("13")
		  Me.WithReply.SIAB(true)
		  
		  Me.Mode=Me.IAE("Mode","0 None GPIO SPI",false)
		  
		  Me.Byte0=Me.IAI8("Byte0",0,false)
		  Me.Byte1=Me.IAI8("Byte1",0,false)
		  
		  AddUserFunction("Send/Receive", Byte0.Name, "Send/Receive", 0,UF_RunMode_OP_Loop, true)
		  AddUserFunction("Send/Receive", Byte1.Name, "Send/Receive", 0,UF_RunMode_OP_Loop, true)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  Dim TOT as integer
		  
		  TOT=0
		  if Me.TimeOut.GIAI>0 then
		    TOT=Me.TimeOut.GIAI
		  else
		    if Me.UpperStep<>nil then
		      if Me.UpperStep IsA ResourceClass then
		        TOT= ResourceClass(Me.UpperStep).GetTimeouttime
		      end
		    end
		  end
		  
		  return TOT
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitialState()
		  if Me.Run("",Me.Byte0) then
		    App.ManualOperation.StartOP(Me.Byte0,false)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  #Pragma Unused Result
		  #Pragma Unused AttributeLink
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim S as string
		  Dim RV,n as integer
		  
		  RV=0
		  if NewDataAvailable then
		    S=GetReply
		    
		    Select Case Me.Mode.GIAI
		    case 0 //none
		      
		    case 1 // GPIO
		      n=S.Instr(1,"x=")
		      if  (n>0) and (S.len>5)  then
		        Me.Byte1.SIAI(ValHex(S.Mid(n+2,2)))
		        Me.Byte0.SIAI(ValHex(S.Mid(N+4,2)))
		        RV=2
		      end
		    case 2 // SPI
		      if S.len>2 then
		        Me.Byte0.SIAI(asc(S.mid(1,1)))
		        Me.Byte1.SIAI(asc(S.mid(2,1)))
		        Me.ProcessAll
		        RV=2
		      end
		    end
		  else
		    
		  end
		  
		  Return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  #Pragma Unused Parameter
		  #Pragma Unused AttributeLink
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  Dim S as string
		  
		  if Me.Connected.GIAB then
		    Select Case Me.Mode.GIAI
		    case 0 //none
		      
		    case 1 // GPIO
		      S="x="+str(256*Me.Byte1.GIAI+Me.Byte0.GIAI)+chr(13)
		      Me.Send(S)
		      WaitSecs(0.1)
		      S="x=?"+chr(13)
		      Me.Send(S)
		      WaitSecs(0.1)
		    case 2 // SPI
		      S=S+chrB(Me.Byte0.GIAI)+chrB(Me.Byte1.GIAI)+chrB(92)+chrB(0) //+chrB(13)
		      Send(S)
		    end
		    
		    return true
		    PollCounter=0
		  else
		    return false
		  end
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Byte0 As UInt8_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Byte1 As UInt8_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
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
			Name="mPromptCombined"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
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
			Name="PollCounter"
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
