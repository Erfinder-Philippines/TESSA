#tag Class
Protected Class Restfull_Command_StepClass
Inherits ResourceCall_StepClass
	#tag Method, Flags = &h0
		Sub AddValue(ValueName as string)
		  Dim vAttr As AttributeClass = nil
		  
		  Dim d As new CreateAttributeWindow(nil,0,"")
		  if ValueName<>"" then
		    d.NameTextField.Text=ValueName
		  end
		  
		  d.ShowModalWithin(MainWindow)
		  vAttr = d.createdAttribute
		  If (vAttr <> Nil)  Then
		    ValueName= vAttr.Name
		    vAttr.MyStep = self
		    AddAttributetoList(vAttr)
		    MainWindow.RedrawAttributeList
		    NumValues=NumValues+1
		  End
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AdjustNumValues()
		  
		  Dim vAttr as AttributeClass
		  StaticAttrIndex = UBound(AttributeList())
		  NumValues=0
		  
		  vAttr = AttributeList(StaticAttrIndex)
		  while vAttr<>NumOutputAttributes
		    StaticAttrIndex=StaticAttrIndex-1
		    vAttr = AttributeList(StaticAttrIndex)
		    NumValues=NumValues+1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor(ConfigText)
		  
		  Path=IAS("Path","/rpc/DiffPreasSensor.Read",false)
		  Command=IAS("Command","{""slave"":2,""operation"":3}",false)
		  Reply=IAS("Reply","",false)
		  NumOutputAttributes = IAI("NumOutputAttributes",0,false)
		  
		  AddUserFunction("Add Value", Command.Name, "Add Value", 0,UF_RunMode_Direct)
		  AddUserFunction("Add Value", Reply.Name, "Add Value", 0,UF_RunMode_Direct)
		  AddUserFunction("Make Command", Reply.Name, "Make Command", 0,UF_RunMode_Direct)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateCommand()
		  AdjustNumValues()
		  Dim i as integer
		  Dim ComS as string ="{"
		  Dim vAttr as AttributeClass
		  
		  for i=1 to NumOutputAttributes.GIAI
		    vAttr = AttributeList(StaticAttrIndex+i)
		    if vAttr<>nil then
		      ComS=ComS+chr(34)+vAttr.Name+chr(34)+":"+vAttr.GIAS+","
		    end
		  next
		  ComS=ComS.Mid(1,ComS.len)+"}"
		  
		  Command.SIAS(ComS)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractName(vTerm as string) As string
		  Dim p1,p2 as integer
		  
		  p1=vTerm.Instr(1,chr(34))
		  p2=vTerm.Instr(p1+1,chr(34))
		  
		  if p2>p1 then
		    return vTerm.Mid(p1+1,p2-p1-1)
		  else
		    return ""
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractValue(vTerm as string) As string
		  Dim p1 as integer
		  
		  p1=vTerm.Instr(1,":")
		  
		  if p1>0 then
		    return vTerm.Mid(p1+1)
		  else
		    return ""
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDebugInfo() As string
		  if Me.RelatedResource<>nil then
		    Return RelatedResource.GetDebugInfo
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseReply()
		  AdjustNumValues()
		  Dim i,n as integer
		  Dim ComS() as string = Reply.GIAS.split(",")
		  Dim vAttr as AttributeClass
		  
		  for i=StaticAttrIndex+NumOutputAttributes.GIAI+1 to UBound(AttributeList())
		    vAttr = AttributeList(i)
		    if vAttr<>nil then
		      for n=0 to UBound(ComS())
		        if vAttr.Name=ExtractName(ComS(n)) then
		          vAttr.SIAS(ExtractValue(Coms(n)))
		        end
		      next
		    end
		  next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  // Polls for new restful messages, gives back 2 when there are new messages
		  Dim RV as integer
		  
		  RV=1
		  if RestfullResource<>nil then
		    if RestfullResource.NewDataAvailable() then
		      Dim S as string = RestfullResource.GetReply
		      Reply.SIAS(S)
		      ParseReply
		      RV=2
		    else
		      RV=1
		    end
		  else
		    ErrorText=ErrorText+"No related resource found"+chr(13)
		    RV=3
		  end
		  
		  return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_PollTimeout() As integer
		  
		  return 6
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  // adjust output Attributes to this step and send the command
		  
		  if (RestfullResource<>nil)  then
		    // set stimuli functions
		    RestfullResource.send(Command.GIAS,Path.GIAS)
		    return true
		  else
		    return false
		  end
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  
		  SendState=0
		  Reply.SIAS("")
		  Dim RC as ResourceClass = GetResource
		  if (RC<>nil) and (RC isA Restfull_Resource) then
		    RestfullResource = Restfull_Resource(RC)
		  else
		    RestfullResource = nil
		  end
		  CreateCommand
		  return Super.Step_Start
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  Select case FuncName
		  Case is = "Add Value"
		    AddValue("Value_"+str(NumValues+1))
		  case is ="Make Command"
		    CreateCommand
		  end
		  
		  MainWindow.HTL.UpdateTree
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Command As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumOutputAttributes As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumValues As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Path As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Reply As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RestfullResource As Restfull_Resource = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StaticAttrIndex As Integer
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
		#tag ViewProperty
			Name="NumValues"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StaticAttrIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
