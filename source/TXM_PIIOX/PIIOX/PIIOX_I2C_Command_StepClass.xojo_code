#tag Class
Protected Class PIIOX_I2C_Command_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  
		  SetCommand
		  
		  MainWindow.RedrawAttributeList
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as String) -- From StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  ResourceAttribute = IAR("ResourceAttribute","")
		  BusNr = IAI("BusNr",0)
		  ModuleNr = IAI("ModuleNr",0)
		  LocalAddress = IAI("LocalAddress",0)
		  CommandType = IAS("CommandType","S0")
		  ReplyType = IAE("ReplayType","1 ? 0 1")
		  CommandData = IAS("CommandData","")
		  Command = IAS("Command","")
		  Reply = IAS("Reply","")
		  
		  Me.WaitTime.SIAI(1000)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalInit()
		  // set the time out value according the connected resource
		  if Me.ResourceAttribute.Link <> nil And Me.ResourceAttribute.Link.MyStep IsA ResourceClass then
		    Me.WaitTime.SIAI(ResourceClass(Me.ResourceAttribute.Link.MyStep).GetTimeOutTime)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCommand()
		  
		  if CommandData.IsArray then
		    if not(Reply.IsArray) and not(Reply.GIAN=CommandData.GIAN) then
		      Reply.IsArray=true
		      Reply.SIAN(CommandData.GIAN)
		    end
		    Command.SIAS(CommandType.GIAS+BusNr.GIAS+ModuleNr.GIAS+LocalAddress.GIAS+","+ReplyType.GIAS+","+CommandData.GIAS(CommandCounter))
		  else
		    Command.SIAS(CommandType.GIAS+BusNr.GIAS+ModuleNr.GIAS+LocalAddress.GIAS+","+ReplyType.GIAS+","+CommandData.GIAS)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  InternalInit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Super.Step_Init_AfterLoad
		  InternalInit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  // Polls for new tcpip messages, gives back true when there are new messages
		  Dim RV as integer = 0
		  Dim S as string =""
		  
		  if (ResourceAttribute.Link<>nil) And (ResourceAttribute.Link.MyStep IsA PIIOX_ResourceClass) then
		    RV = PIIOX_ResourceClass(Me.ResourceAttribute.Link.MyStep).Poll(S,Me.ResourceAttribute.Link)
		    if RV = 2 then
		      if (CommandData.IsArray) and (CommandCounter<=CommandData.GIAN) then
		        Reply.SIAS(S,CommandCounter)
		        CommandCounter=CommandCounter+1
		        RV=1
		      else
		        Reply.SIAS(S)
		        CommandCounter=0
		      end
		    end
		  end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  // copy value into the Link
		  
		  
		  Dim RV as boolean = false
		  SetCommand
		  if (ResourceAttribute.Link<>nil) And (ResourceAttribute.Link.MyStep IsA PIIOX_ResourceClass) then
		    RV=PIIOX_ResourceClass(Me.ResourceAttribute.Link.MyStep).Run(Command.GIAS,Me.ResourceAttribute.Link)
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  CommandCounter=0
		  return true
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BusNr As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Command As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CommandCounter As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CommandData As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CommandType As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LocalAddress As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ModuleNr As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Reply As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReplyType As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ResourceAttribute As Resource_AttributeClass = nil
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
			Name="CommandCounter"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
