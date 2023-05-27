#tag Class
Protected Class Ramp_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.StartValue=Me.IAD("Start", 0,false)
		  Me.EndValue=Me.IAD("End", 10,false)
		  Me.StartTime=Me.IAD("StartTime",0,false)
		  Me.EndTime=Me.IAD("EndTime",0,false)
		  
		  Me.RampValue=Me.IAD("RampValue", 0,false)
		  Me.RampCounter=Me.IAI("RampCounter",0,false)
		  Me.Duration=Me.IAD("Duration", 10,false)
		  Me.RampTime=Me.IAD("RampTime", 0,false)
		  Me.RampMode=Me.IAE("RampMode", "0 Wait Repeat Stepout",false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  Dim AT as double
		  
		  AT=GetActTime_sec
		  
		  FirstTime= false
		  Me.StartTime.SIAD(AT)
		  Me.EndTime.SIAD(AT+Me.Duration.GIAD)
		  Me.RampValue.SIAD(Me.StartValue.GIAD)
		  Super.Init_Teststep_Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  
		  Super.Step_Init
		  
		  Me.StartTime.SIAD(GetActTime_sec)
		  Me.RampValue.SIAD(Me.StartValue.GIAD)
		  Me.EndTime.SIAD(Me.StartTime.GIAD+Me.Duration.GIAD)
		  Me.FirstTime=true
		  
		  Select case Me.RampMode.GIAI
		  case 0
		    
		  case 1
		    
		  case 2
		    
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Repeat() As boolean
		  // increments the loop counter and gives back false if end is reached
		  Dim AT as Double
		  AT=GetActTime_sec
		  
		  
		  Select case Me.RampMode.GIAI
		  case 0 // the execution will wait until the end of the ramp is reached
		    if AT<Me.EndTime.GIAD then
		      Me.InternalRampValue=Me.StartValue.GIAD+((AT-Me.StartTime.GIAD)*(Me.EndValue.GIAD-Me.StartValue.GIAD)/Me.Duration.GIAD)
		      Me.InternalRampCounter=Me.InternalRampCounter+1
		      return true
		    else
		      Me.InternalRampValue=Me.EndValue.GIAD
		      Me.InternalRampCounter=Me.InternalRampCounter+1
		      return false
		    end
		  case 1  // execution will proceed and calculate each run a new RampValue
		    return false
		  case 2 // execution will proceed and calculate each run a new RampValue at the end a Stepout is performed
		    return false
		  end
		  
		  Me.RampValue.SIAD(Me.InternalRampValue)
		  Me.RampCounter.SIAI(Me.InternalRampCounter)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  
		  
		  Select case Me.RampMode.GIAI
		  case 0 // the execution will wait until the end of the ramp is reached
		    Dim AT as double
		    AT=GetActTime_sec
		    if AT<Me.EndTime.GIAD then
		      Me.RampTime.SIAD(AT-Me.StartTime.GIAD)
		      Me.RampValue.SIAD(Me.StartValue.GIAD+(Me.RampTime.GIAD*(Me.EndValue.GIAD-Me.StartValue.GIAD)/Me.Duration.GIAD))
		      Me.RampCounter.SIAI(Me.RampCounter.GIAI+1)
		    else
		      Me.RampValue.SIAD(Me.EndValue.GIAD)
		    end
		    return true
		  case 1  // execution will proceed and calculate each run a new RampValue
		    Dim AT as double
		    AT=GetActTime_sec
		    if AT<Me.EndTime.GIAD then
		      Me.RampTime.SIAD(AT-Me.StartTime.GIAD)
		      Me.RampValue.SIAD(Me.StartValue.GIAD+(Me.RampTime.GIAD*(Me.EndValue.GIAD-Me.StartValue.GIAD)/Me.Duration.GIAD))
		      Me.RampCounter.SIAI(Me.RampCounter.GIAI+1)
		    else
		      Me.RampValue.SIAD(Me.EndValue.GIAD)
		    end
		    return true
		  case 2 // execution will proceed and calculate each run a new RampValue at the end a Stepout is performed
		    Dim AT as double
		    AT=GetActTime_sec
		    if AT<Me.EndTime.GIAD then
		      Me.RampTime.SIAD(AT-Me.StartTime.GIAD)
		      Me.RampValue.SIAD(Me.StartValue.GIAD+(Me.RampTime.GIAD*(Me.EndValue.GIAD-Me.StartValue.GIAD)/Me.Duration.GIAD))
		      Me.RampCounter.SIAI(Me.RampCounter.GIAI+1)
		    else
		      Me.RampValue.SIAD(Me.EndValue.GIAD)
		      // set execution flag of next upper teststep to true
		      Me.SetExecutionFlag
		    end
		    return true
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As Boolean
		  // reset the counter and set all Attributes
		  Dim AT as double
		  
		  AT=GetActTime_sec
		  
		  if FirstTime then
		    FirstTime= false
		    Me.StartTime.SIAD(AT)
		    Me.EndTime.SIAD(AT+Me.Duration.GIAD)
		  end
		  
		  Select case Me.RampMode.GIAI
		  case 0
		    Me.RampCounter.SIAI(1)
		    Me.StartTime.SIAD(AT)
		    Me.RampValue.SIAD(Me.StartValue.GIAD)
		  case 1
		    
		  case 2
		    
		  end
		  
		  return Super.Step_Start
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Duration As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EndTime As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EndValue As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FirstTime As boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalRampCounter As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		InternalRampValue As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		RampCounter As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RampMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RampTime As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RampValue As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartTime As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartValue As Double_AttributeClass = nil
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
			Name="FirstTime"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="boolean"
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
			Name="InternalRampCounter"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InternalRampValue"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
