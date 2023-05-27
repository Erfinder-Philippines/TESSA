#tag Class
Protected Class Arduino_ResourceClass
Inherits TCP_ResourceClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  
		  Super.Constructor(ConfigText)
		  
		  Me.IP_Port.SIAI(65000)
		  Me.IP_Address.SIAS("10.41.24.195")
		  Me.Prompt.SIAS("")
		  Me.EOL.SIAS("13")
		  Me.WithReply.SIAB(true)
		  
		  
		  Me.AnalogInput=Me.IAD("AnalogInput",0,false)
		  Me.DigitalOutput=Me.IAB("DigitalOutput",false,false)
		  Me.DigitalInput=Me.IAB("DigitalInput",false,false)
		  Me.PWM=Me.IAI("PWM",0,false)
		  Me.UserFunction=Me.IAS("UserFunction","",false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitialState()
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim S as string
		  Dim RV as integer = 0
		  
		  if NewDataAvailable then
		    S=GetReply
		    Select Case AttributeLink
		    case is=Me.AnalogInput
		      if S.Instr(1,"A"+Me.LastCall)>0 then
		        Result=S.Mid(S.Instr(1,",")+1)
		        Me.AnalogInput.SIAS(Result)
		        RV=2
		        S=""
		      else
		      end
		    case is=Me.DigitalOutput
		      if S.Instr(1,"D"+Me.LastCall)>0 then
		        Result=S.Mid(S.Instr(1,",")+1)
		        Me.DigitalInput.SIAI(val(Result))
		        RV=2
		        S=""
		      end
		    case is=Me.DigitalInput
		      Dim r as integer = S.Instr(1,"D"+Me.LastCall)
		      if r>0 then
		        Result=S.Mid(r+Me.LastCall.len+2,S.len)
		        r=Result.Instr(1,",")
		        if r>0 then
		          Result=Result.Mid(1,r-1)
		        end
		        Me.DigitalInput.SIAI(val(Result))
		        RV=2
		        S=""
		      end
		    case is=Me.PWM
		      if S.Instr(1,"A"+Me.LastCall)>0 then
		        Result=S.Mid(S.Instr(1,",")+1)
		        Me.AnalogInput.SIAS(Result)
		        RV=2
		        S=""
		      else
		      end
		    case is=Me.UserFunction
		      if S.Instr(1,"F"+Me.LastCall)>0 then
		        Result=S.Mid(S.Instr(1,",")+1)
		        Me.UserFunction.SIAS(Result)
		        RV=2
		        S=""
		      end
		    end
		    
		  else
		    
		  end
		  
		  Return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  Dim S as string
		  
		  if Me.ResourceConnected then
		    
		    Select Case AttributeLink
		    case is=Me.AnalogInput
		      S="A"+Parameter+",?"
		    case is=Me.DigitalOutput
		      S="D"+Parameter
		    case is=Me.DigitalInput
		      S="D"+Parameter+",?"
		    case is=Me.PWM
		      S="P"+Parameter+"?"
		    case is=Me.UserFunction
		      S="F"+Parameter+"?"
		    end
		    
		    if Parameter.Instr(1,",")>1 then
		      Me.LastCall=Parameter.Mid(1,Parameter.Instr(1,",")-1)
		    else
		      Me.LastCall=Parameter
		    end
		    
		    Me.Send(S)
		    PollCounter=0
		    return true
		  else
		    return false
		  end
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AnalogInput As double_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		DigitalInput As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DigitalOutput As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastCall As string
	#tag EndProperty

	#tag Property, Flags = &h0
		PWM As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		UserFunction As String_AttributeClass = nil
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
			Type="string"
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
