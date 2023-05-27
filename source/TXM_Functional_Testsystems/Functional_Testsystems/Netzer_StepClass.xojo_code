#tag Class
Protected Class Netzer_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor(ConfigText)
		  
		  Me.GetGPIO=Me.IAS("GetGPIO","",false)
		  Me.SetGPIO=Me.IAS("SetGPIO","0000",false)
		  Me.Result=Me.IAS("Result","",false)
		  
		  
		  Me.ResultText=Me.IAS("ResultText","",false,AttributeGroups.System)
		  
		  Me.TimeOutValue=Me.IAE("TimeoutValue","0 LastValue -999",false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDebugInfo() As string
		  if Me.RelatedResource<>nil then
		    Return RelatedResource.GetDebugInfo
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  // Polls for new tcpip messages, gives back true when there are new messages
		  Dim RV as integer
		  Dim S as string
		  Dim n as integer
		  
		  RV=0
		  if Me.RelatedResource<>nil then
		    if Me.RelatedResource.NewDataAvailable then
		      
		      S=Me.ResultText.GIAS+Me.GetResult
		      // wait until the command string has been received as echo
		      //Me.CheckReply(RV,1,S,1,"x=",1)
		      n=S.Instr(1,"x=")
		      if  (n>0) and (S.len>5)  then
		        S=S.Mid(n+2,4)
		        Me.GetGPIO.SIAS(S)
		        S=""
		        RV=2
		      end
		      Me.ResultText.SIAS(S)
		    end
		  else
		    Me.ErrorText=Me.ErrorText+"No related resource found"+chr(13)
		  end
		  
		  return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_PollTimeout() As integer
		  
		  
		  if Me.TimeOutValue.GIAI=1 then
		  else
		    Me.Result.SIAS(Me.TimeOutValue.GIAS)
		  end
		  
		  return 6
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  // adjust output Attributes to this step and send the command
		  if Me.RelatedResource<>nil then
		    // set stimuli functions
		    Dim S as string = "x="+Me.SetGPIO.GIAS
		    Me.RelatedResource.send(S)
		  end
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  
		  
		  
		  Me.SendState=0
		  Me.Result.SIAS("")
		  Me.ResultText.SIAS("")
		  
		  return Super.Step_Start
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StrBin(I as integer, size as integer) As string
		  Dim S as string = ""
		  for n as Integer = size downto 1
		    if ( i mod (2^n)) >0 then
		      S=S+"1"
		      i=i-(2^n)
		    else
		      S=S+"0"
		    end
		  next
		  
		  return S
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		GetGPIO As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Result As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ResultText As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SetGPIO As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeOutValue As Enum_AttributeClass = nil
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
