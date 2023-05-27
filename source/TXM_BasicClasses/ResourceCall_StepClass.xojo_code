#tag Class
Protected Class ResourceCall_StepClass
Inherits StepClass
Implements UserFunctions
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as String) -- From StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  ResourceAttribute = Me.IAR("ResourceAttribute","",false)
		  Value = IAS("Value","",false)
		  Immediate_Execution = IAB("Immediate_Execution",true,false)
		  
		  Me.WaitTime.SIAI(1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResource() As ResourceClass
		  if ResourceAttribute.Link<>nil then
		    if (ResourceAttribute.Link.MyStep<>nil) and (ResourceAttribute.Link.MyStep IsA ResourceClass) then
		      return ResourceClass(ResourceAttribute.Link.MyStep)
		    else
		      return nil
		    end
		  else
		    return nil
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  // Part of the UserFunctions interface.
		  Dim LA as AttributeClass = ResourceAttribute.GetLinkAsAttributeClass
		  if (LA<>nil) and (LA.MyStep IsA ResourceFunctionClass) then
		    return ResourceFunctionClass(LA.MyStep).GetTimeouttime
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalInit()
		  // set the time out value according the connected resource
		  Dim LA as AttributeClass = ResourceAttribute.GetLinkAsAttributeClass
		  if (LA<>nil) and (LA.MyStep IsA ResourceFunctionClass) then
		    Me.WaitTime.SIAI(ResourceClass(LA.MyStep).GetTimeOutTime)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // Part of the UserFunctions interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceAttribute() As AttributeClass
		  // Part of the UserFunctions interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // Part of the UserFunctions interface.
		  
		  
		End Function
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
		  if Me.Immediate_Execution.GIAB then
		    Dim LA as AttributeClass = ResourceAttribute.GetLinkAsAttributeClass
		    if (LA<>nil) and (LA.MyStep IsA ResourceFunctionClass) then
		      RV = ResourceFunctionClass(LA.MyStep).Poll(S,LA)
		      if RV = 2 then
		        Value.SIAS(ResourceFunctionClass(LA.MyStep).Value.GIAS)
		      end
		    end
		  end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  // copy value into the Link
		  ResourceAttribute.SIAS(Value.GIAS)
		  
		  Dim RV as boolean = false
		  if Me.Immediate_Execution.GIAB then
		    Dim LA as AttributeClass = ResourceAttribute.GetLinkAsAttributeClass
		    if (LA<>nil) and (LA.MyStep IsA ResourceFunctionClass) then
		      RV=ResourceClass(LA.MyStep).Run("",LA)
		    end
		  else
		    RV = true
		  end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunctionFinished()
		  // Part of the UserFunctions interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WaitBeforeStart() As Integer
		  // Part of the UserFunctions interface.
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Immediate_Execution As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ResourceAttribute As Resource_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As String_AttributeClass = nil
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
