#tag Class
Protected Class HMI_Button_StepClass
Inherits HMI_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  TestStepName=Me.IAS("TestStepName")
		  Goto_OnOff = Me.IAB("Goto_OnOff",true)
		  GoSub = Me.IAB("GoSub")
		  FillColor = IAC("FillColor","RGB 180 180 180",false)
		  FillColor_Pressed = IAC("FillColor_Pressed","RGB 100 100 100",false)
		  BorderColor = IAC("BorderColor","RGB 100 100 100",false)
		  TextColor.SIAS("RGB 255 255 255")
		  TextSize.SIAI(18)
		  mMinimalWidth = 80
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  #If app.PIIOXCompilation
		    return nil
		  #else
		    Return new HMI_Button_Canvas
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // this routne is being called from an upper Test_StepClass when it proceeds it's start procedure
		  Step_Init
		  Super.Init_Teststep_Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  // title and measure
		  'if HMI_Canvas<>nil then
		  'HMI_Button_Canvas(HMI_Canvas).HMI_Button.Caption.Text=Title.GAIS
		  'end
		  Super.Paint(g, mode)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGoto()
		  if Goto_OnOff.GIAB then
		    Dim BS as BasicClass
		    BS=UpperStep
		    while (BS<>nil) and not(BS IsA Test_StepClass)
		      BS=BS.UpperStep
		    wend
		    
		    if (BS<>nil) and (BS IsA Test_StepClass) then
		      if TeststepName.Link<>nil then
		        if TeststepName.Link.MyStep<>nil then
		          if TeststepName.Link.MyStep IsA Test_StepClass then
		            GotoStep = Test_StepClass(TeststepName.Link.MyStep)
		            Test_StepClass(BS).SetGotoStep( GotoStep, GoSub.GIAB)
		            if GoSub.GIAB then
		              GotoStep.SetGotoStep(Test_StepClass(BS),false)
		            end
		          end
		        end
		      end
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  
		  if mUIUpdater<>nil then mUIUpdater.UpdateCanvas(2)
		  
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BorderColor As Color_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FillColor As Color_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FillColor_Pressed As Color_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		GoSub As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			il
		#tag EndNote
		GotoStep As Test_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Goto_OnOff As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestStepName As String_AttributeClass = nil
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
