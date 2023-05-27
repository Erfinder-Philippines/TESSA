#tag Class
Protected Class Alias_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub ConnectAlias()
		  Dim LS as BasicClass = nil
		  
		  if AliasName.Link<>nil then
		    LS = AliasName.Link.MyStep
		    'AddDebugTextCR("Take direct link "+AliasName.Link.Name)
		  else
		    LS = FindStep(AliasName.GIAS)
		    'AddDebugTextCR("Search for link "+AliasName.GIAS)
		  end
		  
		  if (LS<>nil) and (LS IsA StepClass) then
		    Alias = StepClass(LS)
		    'AddDebugTextCR("Found Alias "+Alias.Name.GIAS)
		  else
		    Alias=nil
		  end
		  
		  if Alias<>nil then
		    'AddDebugTextCR("Found Alias "+Alias.Name.GIAS)
		    WaitTime.SIAS(Alias.WaitTime.GIAS)
		    'AddDebugTextCR("Set wait time of alias to "+Alias.WaitTime.GIAS)
		    RunMode = Alias.RunMode
		    'AddDebugTextCR("Set RunMode of alias to "+str(Alias.RunMode))
		  else
		    AddWarningTextCR("Found no Alias for "+AliasName.GIAS)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.AliasName=Me.IAS("Alias","",false)
		  
		  Me.FunctionName=Me.IAS("FunctionName","",false)
		  Me.Parameter=Me.IAS("Parameter","",false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_End() As Boolean
		  
		  
		  if Alias=nil then
		    return Super.Step_End
		  else
		    if Me.FunctionName.GIAS="" then
		      return Me.Alias.Step_End
		    else
		      return true
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  Dim LS as BasicClass = nil
		  
		  ConnectAlias
		  
		  if Alias<>nil then
		    if FunctionName.GIAS = "" then
		      Alias.Step_Init
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Super.Step_Init_AfterLoad
		  
		  ConnectAlias
		  
		  if Alias<>nil then
		    if FunctionName.GIAS = "" then
		      Alias.Step_Init_AfterLoad
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  Dim RV as integer=2
		  
		  ConnectAlias
		  
		  if Alias=nil then
		    RV=Super.Step_Poll
		  else
		    Alias.RunState=RunState
		    Alias.SendState=SendState
		    if FunctionName.GIAS="" then
		      RV=Alias.Step_Poll
		    else
		      if Alias IsA ElementCall then
		        RV=ElementCall(Alias).FunctionCall_Poll(FunctionName.GIAS, Parameter.GIAS)
		      end
		    end
		    SendState=Alias.SendState
		    RunState=Alias.RunState
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_PollTimeout() As integer
		  if Alias=nil then
		    return Super.Step_PollTimeout
		  else
		    return Alias.Step_PollTimeout
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Repeat() As boolean
		  ConnectAlias
		  
		  if Alias=nil then
		    return Super.Step_Repeat
		  else
		    if FunctionName.GIAS="" then
		      return Alias.Step_Repeat
		    else
		      return true
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Dim RV as boolean=true
		  
		  ConnectAlias
		  
		  if Alias=nil then
		  else
		    Alias.RunState=RunState
		    Alias.SendState=SendState
		    if FunctionName.GIAS="" then
		      RV=Alias.Step_Run
		    else
		      if Alias IsA ElementCall then
		        RV=ElementCall(Alias).FunctionCall_Run(FunctionName.GIAS, Parameter.GIAS)
		      end
		    end
		    SendState=Alias.SendState
		    RunState=Alias.RunState
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  Dim RV as boolean=true
		  
		  ConnectAlias
		  
		  if Alias=nil then
		  else
		    Alias.RunState=RunState
		    Alias.SendState=SendState
		    if FunctionName.GIAS="" then
		      RV=Alias.Step_Start
		    else
		      if Alias IsA ElementCall then
		        RV=ElementCall(Alias).FunctionCall_Start(FunctionName.GIAS)
		      end
		    end
		    SendState=Alias.SendState
		    RunState=Alias.RunState
		  end
		  
		  return RV
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Alias As StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AliasName As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FunctionName As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameter As String_AttributeClass = nil
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
