#tag Class
Protected Class HMICom_StepClass
Inherits ReportStepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // this element is a basic element to design communication elements that show the communication in a HMI text area
		  
		  Super.Constructor(ConfigText)
		  
		  
		  Me.ResourceAttribute = Me.IAR("ResourceAttribute","",false)
		  Me.Result=Me.IAS("Result","",false)
		  
		  
		  'AddUserFunction("GenerateCode", SwitchConfiguration.Name, "Generate Code", 0,UF_RunMode_Direct)
		  
		  Me.Result.NoSave = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return new HMICom_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // this routine is called when ever the upper test step is starting or repeating it's function
		  // this routine is not called by the teststep itself
		  mUIUpdater.UpdateCanvas(0)
		  Super.Init_Teststep_Start
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  Super.Paint(g, mode)
		  // title and measure
		  DrawString(g, Name.GIAS+" Communication", 10, 18)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  
		  Super.Step_Init
		  'clean Result Attribute
		  'if (Me.Resource_Attribute.Link<>nil) And (Me.Resource_Attribute.Link.MyStep IsA ResourceClass) then
		  'AFS677_ResourceClass(Me.Resource_Attribute.Link.MyStep).Reply=""
		  'end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  // Polls for new tcpip messages, gives back true when there are new messages
		  Dim RV as integer = 0
		  Dim S as string =""
		  
		  'if Me.Resource_Attribute.Link<>nil And Me.Resource_Attribute.Link.MyStep IsA AFS677_ResourceClass then
		  'RV = AFS677_ResourceClass(Me.Resource_Attribute.Link.MyStep).Poll(S,Me.Resource_Attribute.Link)
		  'Me.Result.SIAS(AFS677_ResourceClass(Me.Resource_Attribute.Link.MyStep).ResultText.GIAS)
		  'me.UpdateCanvas
		  '' Report
		  'if Me.Result.GIAS.InStr("ERROR") <> 0 then
		  'Me.SetErrorMessage(ErrorCode_Fail,"Invalid Input",Me.Description.GIAS,"","")
		  'elseif Me.Result.GIAS.InStr("Switch Configuration Done") <> 0 then
		  'Me.SetErrorMessage(ErrorCode_Pass,"Switch Configuration Done",Me.Description.GIAS,"","")
		  'end
		  'end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  
		  Dim RV as boolean = false
		  
		  if Me.ResourceAttribute.Link<>nil And Me.ResourceAttribute.Link.MyStep IsA ResourceClass then
		    RV=ResourceClass(Me.ResourceAttribute.Link.MyStep).Run("",Me.ResourceAttribute.Link)
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  ResourceClass(Me.ResourceAttribute.Link.MyStep).SendState=0
		  Me.SendState=0
		  Me.Result.SIAS("")
		  
		  return Super.Step_Start
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextChange(NewText As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvas()
		  // Part of the HMICanvasInterface interface.
		  if Visible.GIAB then
		    mUIUpdater.UpdateCanvas(0)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  case is = "Generate Code"
		    
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		From_Config As Enum_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		PTP As Enum_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		ResetAll As Enum_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		ResourceAttribute As Resource_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Result As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		SwitchConfiguration As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		SwitchNr As Enum_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		To_Config As Enum_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		VlanNr As Enum_AttributeClass
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
