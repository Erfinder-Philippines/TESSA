#tag Class
Protected Class Loop_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  
		  StartValue = IAD("Start", 1,false)
		  EndValue = IAD("End", 1,false)
		  StepValue = IAD("Step", 1,false)
		  
		  LoopValue = IAD("LoopValue", 0,false)
		  LoopCounter = IAI("LoopCounter",0,false)
		  
		  At_End_do = IAE("At_End_do", "0 nothing repeat step_out",false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IncreaseLoop() As boolean
		  // gives back false when loop is finished
		  Dim RV as boolean = true
		  
		  InternalLoopValue=InternalLoopValue+StepValue.GIAD
		  if StepValue.GIAD>0 then
		    // the loop makes positives steps
		    if InternalLoopValue>EndValue.GIAD then
		      InternalLoopValue=EndValue.GIAD
		      RV= false
		    else
		      InternalLoopCounter=InternalLoopCounter+1
		    end
		  else
		    // the loop makes negative steps
		    if InternalLoopValue<EndValue.GIAD then
		      InternalLoopValue=EndValue.GIAD
		      RV= false
		    else
		      InternalLoopCounter=InternalLoopCounter+1
		    end
		  end
		  LoopValue.SIAD(InternalLoopValue)
		  LoopCounter.SIAI(InternalLoopCounter)
		  
		  return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  
		  if FirstSubStep=nil then
		    ResetLoop
		  end
		  
		  Super.Init_Teststep_Start
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetLoop()
		  InternalLoopValue=StartValue.GIAD
		  InternalLoopCounter=0
		  LoopCounter.SIAI(InternalLoopCounter)
		  LoopValue.SIAD(InternalLoopValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Repeat() As boolean
		  // increments the loop counter and gives back false if end is reached
		  Dim RV as boolean = false
		  
		  if FirstSubStep=nil then
		  else
		    if IncreaseLoop then
		      RV=true
		    else
		      Select case At_End_do.GIAI
		      case 0 // do nothing
		      case 1 // repeat
		        ResetLoop
		      case 2 // step out
		        SetExecutionFlag
		      end
		    end
		  end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  // reset the counter and set all Attributes
		  
		  if FirstSubStep=nil then
		    if IncreaseLoop then
		    else
		      Select case At_End_do.GIAI
		      case 0
		      case 1
		      case 2
		        SetExecutionFlag
		      end
		    end
		  else
		    ResetLoop
		  end
		  return Super.Step_Start
		  
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		At_End_do As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EndValue As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalLoopCounter As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalLoopValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		LoopCounter As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LoopValue As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartValue As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StepValue As Double_AttributeClass = nil
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
			Name="InternalLoopCounter"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalLoopValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
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
