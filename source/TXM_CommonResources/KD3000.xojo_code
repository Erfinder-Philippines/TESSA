#tag Class
Protected Class KD3000
Inherits TCP_ResourceClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  
		  Super.Constructor(ConfigText)
		  
		  Voltage = IAD("Voltage",0,false)
		  Current = IAD("Current",0,false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  
		  return 8000
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  
		  Dim S as string = super.Init_Resource
		  
		  return "KD3000 "+S
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  #Pragma Unused AttributeLink
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim S as string =""
		  Dim RV as integer = 0
		  
		  if Me.NewDataAvailable then
		    S=GetReply
		    // check if Promt has allredy been sent
		    if Me.Prompt.GIAS<>"" then
		      LastCall = Command.GIAS
		      Dim i,k as integer
		      i = S.InStr(Prompt.GIAS)
		      k= S.InStr(LastCall)+LastCall.len+2
		      if i>0 then
		        S=S.Mid(k,i-k)
		        S=TrimString(S,true,true,true,true)
		        Result=S
		        Reply.SIAS(S)
		        RV=2
		      else
		        RV=3
		        Result=S
		      end
		    else
		      Result=S
		      RV=2
		    end
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll1(byRef Result as string, AttributeLink as AttributeClass) As integer
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
		      'RV=CheckResult_New
		      if RV=2 then
		        
		      end
		    case "Read"
		      'if Me.CheckResult<>"" then
		      if Me.Prompt.GIAS<>"" then
		        if mReply.Instr(1,Me.Prompt.GIAS)>0 then
		          RV=2
		        end
		      end
		    end
		  end
		  'end
		  Return RV
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
		      'LastCharSent=1 // start sending at first character
		      SendState=0     // set SendSate to sending first, 1= receiving
		      'Send(CommandString.GIAS, vPrompt )
		    case "Read"
		      
		    End
		  End
		  Return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run1(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  // should be implemented by the final class
		  Dim RV as Boolean
		  
		  'RV=false
		  'if (UpperStep<>nil) and  (UpperStep IsA ResourceClass) then
		  'if AttributeLink=nil then
		  'else
		  '
		  'Select Case AttributeLink
		  'case is=Me.Byte1
		  'if Me.Byte1_IsOutput.GIAB then
		  'Parameter="SOUR:DIG:DATA:BYTE "+str(Me.Byte1.GIAI)+" ,(@"+str(Me.Slot.GIAI+1)+")"
		  'else
		  'Parameter="MEAS:DIG:BYTE? (@"+str(Me.Slot.GIAI+1)+")"
		  'end
		  'case is=Me.Byte2
		  'if Me.Byte2_IsOutput.GIAB then
		  'Parameter="SOUR:DIG:DATA:BYTE "+str(Me.Byte2.GIAI)+" ,(@"+str(Me.Slot.GIAI+2)+")"
		  'else
		  'Parameter="MEAS:DIG:BYTE? (@"+str(Me.Slot.GIAI+2)+")"
		  'end
		  'case is=Me.AO_CH1
		  'Parameter="SOURCE:VOLT "+Me.AO_CH1.GIAS+",(@"+str(Me.Slot.GIAI+4)+")"
		  'case is=Me.AO_CH2
		  'Parameter="SOURCE:VOLT "+Me.AO_CH2.GIAS+",(@"+str(Me.Slot.GIAI+5)+")"
		  'end
		  'RV= ResourceClass(Me.UpperStep).Run(Parameter, AttributeLink)
		  'end
		  
		  
		  Return RV
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Current As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastCall As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Voltage As Double_AttributeClass = nil
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
			Name="LastCall"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
