#tag Class
Protected Class StripChart_StepClass
Inherits Graph_StepClass
	#tag Method, Flags = &h0
		Sub AddChannel(ChannelName as string)
		  Dim vAttr As AttributeClass = nil
		  
		  Dim d As new CreateAttributeWindow(nil,0,"")
		  if ChannelName<>"" then
		    d.NameTextField.Text=ChannelName
		  end
		  
		  d.ShowModalWithin(MainWindow)
		  vAttr = d.createdAttribute
		  If (vAttr <> Nil)  Then
		    MultipleValuesAttributeClass(vAttr).IsArray = true
		    ChannelName= vAttr.Name
		    vAttr.MyStep = self
		    MultipleValuesAttributeClass(vAttr).NoSave = true
		    AddAttributetoList(vAttr)
		    MainWindow.RedrawAttributeList
		  End
		  
		  if vAttr<>nil then
		    Dim BS as BasicClass = FindElement(ChannelName)
		    if BS=nil then
		      Dim vCurve as XYCurve_StepClass = New XYCurve_StepClass("")
		      vCurve = XYCurve_StepClass(SNMS(vCurve,"Graph_XYCurve",1,""))
		      vCurve.Name.SIAS(ChannelName)
		      AddSubElement(vCurve)
		      vCurve.XAttribute.Link = TimeLine
		      vCurve.YAttribute.Link = vAttr
		    end
		  end
		  
		  'AdjustChannels
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AdjustChannels()
		  
		  Dim vAttr as AttributeClass
		  Dim AttrIndex as integer = UBound(AttributeList())
		  NumChannels=0
		  
		  vAttr = AttributeList(AttrIndex)
		  while vAttr<>TimeLine 
		    MultipleValuesAttributeClass(vAttr).IsArray = true
		    MultipleValuesAttributeClass(vAttr).SIAA(0)
		    MultipleValuesAttributeClass(vAttr).NoSave = true
		    AttrIndex=AttrIndex-1
		    vAttr = AttributeList(AttrIndex)
		    NumChannels=NumChannels+1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Mode = IAE("RunMode","0 Unlimited Limited_Number Limited_Time Limited_Number_Ring Limited_Time_Ring",false)
		  Limit = IAD("Limit",100,false)
		  TimeLine = IAT("TimeLine","2018.06.01/00:00:00 00:00:01.000 0",false)
		  
		  AddUserFunction("Add Channel",TimeLine)
		  
		  'AddChannel("Channel_1")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // Send init to all included elements
		  Super.Init_Teststep_Start
		  StartTime = GetActTime_sec
		  AdjustChannels
		  
		  MultipleValuesAttributeClass(TimeLine).SIAA(0)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  AdjustChannels
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  
		  Dim vAttr as AttributeClass
		  Dim AttrIndex as integer = UBound(AttributeList())
		  
		  vAttr = AttributeList(AttrIndex)
		  while vAttr<>TimeLine 
		    if (vAttr isA MultipleValuesAttributeClass) then
		      Dim S as string = vAttr.GIAS(-1,true)
		      vAttr.SOAS(S)
		      MultipleValuesAttributeClass(vAttr).AddValue("0")
		    end
		    AttrIndex=AttrIndex-1
		    vAttr = AttributeList(AttrIndex)
		  wend
		  
		  MultipleValuesAttributeClass(TimeLine).AddValue(str(GetActTime_sec-StartTime))
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  Select Case FuncName
		  Case Is = "Add Channel"
		    AddChannel("Channel_"+str(NumChannels+1))
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Limit As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumChannels As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		StartTime As double
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeLine As DateTime_AttributeClass = nil
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
			Name="NumChannels"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="StartTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
			Name="Xmax"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Xmin"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ymax"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ymin"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
