#tag Class
Protected Class SCPI_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Dim n as integer
		  
		  Super.Constructor(ConfigText)
		  
		  Me.Command=Me.IAS("Command","",false)
		  Me.Parameter=Me.IAS("Parameter","",false)
		  Me.ChannelList=Me.IAS("ChannelList","",false)
		  Me.NumberOfResults=Me.IAI("NumberOfResults",1,false)
		  redim Me.Result(6)
		  Me.Result(0)=Me.IAS("Result","",false)
		  for n=1 to 5
		    Me.Result(n)=Me.IAS("Result"+str(n),"",false)
		  next
		  
		  Me.ResultText=Me.IAS("ResultText","",false,AttributeGroups.System)
		  Me.EchoSuppression=Me.IAB("Echo",false,false)
		  Me.Prompt=Me.IAS("Prompt","",false)
		  Me.WithReply=Me.IAB("Response",true,false)
		  Me.RepetitionsOnZero=Me.IAI("RepetitionsOnZero",0,false)
		  Me.NumberOfRepetitions=Me.IAI("NumberOfRepetitions",0,false)
		  Me.Format=Me.IAS("Format","",false)
		  Me.Offset=Me.IAD("Offset",0,false)
		  Me.Gain=Me.IAD("Gain",1,false)
		  
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
		  Dim R as double
		  
		  RV=0
		  if Me.RelatedResource<>nil then
		    RV=RelatedResource.Poll(S,nil)
		    if RV>0 then
		      'S=Me.ResultText.GIAS+Me.GetResult
		      if RV=2 then
		        Me.SendState=0
		        S=TrimString(S,true,true,true,true)
		        S=Replace(S,chr(13),"")
		        R=Me.Offset.GIAD+Me.Gain.GIAD*val(S)
		        if Me.Format.GIAS<>"" then
		          S=Format(R,Me.Format.GIAS)
		        else
		          S=str(R)
		        end
		        Me.Result(0).SIAS(S)
		      else
		        Me.Result(0).SIAS(S)
		      end
		      
		      'if Me.RepetitionsOnZero.GIAI>0 then
		      'if abs(R)<10e-12 then
		      '// repeat measurement if result is zero
		      'if Me.NumberOfRepetitions.GIAI<=Me.RepetitionsOnZero.GIAI then
		      'Me.NumberOfRepetitions.SIAI(Me.NumberOfRepetitions.GIAI+1)
		      'RV=0
		      'Me.SendState=0
		      'S=""
		      'Me.ResultText.SIAS(S)
		      'Me.RunState=1
		      'Me.NextTime=GetActTime_msec+Me.WaitTime.GIAD
		      'end
		      'end
		      'else
		      '
		      'end
		    else
		      
		    end
		  else
		    Me.ErrorText=Me.ErrorText+"No related resource found"+chr(13)
		    RV=3
		  end
		  
		  return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_PollTimeout() As integer
		  
		  
		  if Me.TimeOutValue.GIAI=1 then
		  else
		    Me.Result(0).SIAS(Me.TimeOutValue.GIAS)
		    
		  end
		  
		  return 6
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  // adjust output Attributes to this step and send the command
		  Dim n as integer
		  Dim S as string
		  
		  if Me.RelatedResource<>nil then
		    
		    // set stimuli functions
		    Select case Me.SendState
		    case 0
		      for n=0 to Me.NumberOfResults.GIAI-1
		        Me.Result(n).SIAS("")
		      next
		      
		      if Me.EchoSuppression.GIAB then
		        Me.SendState=0
		      else
		        Me.SendState=1
		      end
		      S=Me.Command.GIAS
		      if Me.Parameter.GIAS<>"" then
		        S=S+" "+Me.Parameter.GIAS
		      end
		      if Me.ChannelList.GIAS<>"" then
		        S=S+" ,("+Me.ChannelList.GIAS+")"
		      end
		      Me.RelatedResource.send(S)
		    case 1
		      if Me.WithReply.GIAB then
		      else
		        Me.SendState=2
		      end
		    end
		    
		  else
		  end
		  
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  
		  
		  
		  Me.SendState=0
		  Dim n as integer
		  for n=0 to Me.NumberOfResults.GIAI-1
		    Me.Result(n).SIAS("")
		  next
		  Me.ResultText.SIAS("")
		  
		  if Me.WithReply.GIAB then
		    Me.RunMode=2
		  else
		    Me.RunMode=1
		  end
		  
		  Me.NumberOfRepetitions.SIAI(0)
		  
		  return Super.Step_Start
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ChannelList As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Command As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EchoSuppression As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Format As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Gain As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberOfRepetitions As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberOfResults As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Offset As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameter As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Prompt As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RepetitionsOnZero As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Result() As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		ResultText As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeOutValue As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		WithReply As Boolean_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = SCPI_Values, Type = Double, Dynamic = False, Default = \"1", Scope = Public
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
