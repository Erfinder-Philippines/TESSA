#tag Class
Protected Class PID_Controller_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Input_Setting = IAD("Input_Setting",0,false)
		  Input_Reference = IAD("Input_Reference",0,false)
		  Output = IAD("Output",0,false)
		  Y = IAD("Y",0,false)
		  Output_Inverse = IAD("Output_Inverse",0,false)
		  KP_Factor  = IAD("KP_Factor",0,false)
		  I_Factor =IAD("I_Factor",0,false)
		  Integral =IAD("Integral",0,false)
		  D_Factor = IAD("D_Factor",0,false)
		  Y_Gain  = IAD("Y_Gain",0,false)
		  Y_Offset= IAD("Y_Offset",0,false)
		  Upper_Limit = IAD("Upper_Limit",10,false)
		  Lower_Limit = IAD("Lower_Limit",0,false)
		  Hysteresis = IAD("Hysteresis",1,false)
		  Inhibit = IAB("Inhibit",false,false)
		  Upper_Limit_Overflow = IAB("Upper_Limit_Overflow",false,false)
		  Lower_Limit_Overflow = IAB("Lower_Limit_Overflow",false,false)
		  MaxStep = IAD("MaxStep",1,false)
		  MaxSlope = IAD("MaxSlope",1,false)
		  
		  Last_CalcTime = IAD("Last_CalcTime",0,false)
		  CalcTime = IAD("CalcTime",0,false)
		  DiffSig = IAD("DiffSig",1,false)
		  Differential = IAD("Differential",1,false)
		  Last_DiffSig = IAD("Last_DiffSig",1,false)
		  Last_Output = IAD("Last_Output",0,false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  DIM dt as double
		  Dim Fn as Double
		  
		  //calculate before :
		  Upper_Hysterese_Limit = Upper_Limit.GIAD + Hysteresis.GIAD*(Upper_Limit.GIAD-Lower_Limit.GIAD) 
		  Lower_Hysterese_Limit = Lower_Limit.GIAD - Hysteresis.GIAD*(Upper_Limit.GIAD-Lower_Limit.GIAD)
		  CalcTime.SIAD(GetActTime_sec)
		  dt= CalcTime.GIAD-Last_CalcTime.GIAD
		  if (dt=0) then Fn=0 else Fn= 1/dt
		  'Integral.SIAD(0)
		  
		  //calculte during controlling:
		  if Inhibit.GIAB then 
		    //Eintrittszustand setzen:
		    Last_DiffSig.SIAD(DiffSig.GIAD)
		    Last_CalcTime.SIAD(CalcTime.GIAD)
		    Last_Output.SIAD(Output.GIAD)
		    
		    CalcTime.SIAD(GetActTime_sec)
		    
		    dt = CalcTime.GIAD - Last_CalcTime.GIAD
		    DiffSig.SIAD( Input_Setting.GIAD - Input_Reference.GIAD)
		    Dim New_Integral_Step as double = (dt*(DiffSig.GIAD+Last_DiffSig.GIAD)/2)
		    //Integralberechnung stoppen, wenn letztes Signal (Y) grösser als die Hysterese-Grenze war:
		    if (Y.GIAD>Upper_Hysterese_Limit) then
		      if  New_Integral_Step>0 then New_Integral_Step = 0 //wenn der Regelwert über dem Hystereselimit liegt, else // werden keine Werte mehr hinzugezählt
		    elseif (Y.GIAD<Lower_Hysterese_Limit) then 
		      if New_Integral_Step<0 then New_Integral_Step = 0
		    end
		    New_Integral_Step =  Integral.GIAD + New_Integral_Step
		    Integral.SIAD(New_Integral_Step)
		    
		    //Differentialberechnung:
		    if dt>0 then
		      Differential.SIAD((DiffSig.GIAD-Last_DiffSig.GIAD)/dt)
		    else
		      Differential.SIAD(0) 
		    end
		    //Reglerausgangsberechnung:
		    Y.SIAD( KP_Factor.GIAD*( DiffSig.GIAD + (Integral.GIAD*I_Factor.GIAD) + (Differential.GIAD*D_Factor.GIAD)))
		    Y.SIAD( Y.GIAD*Y_Gain.GIAD + Y_Offset.GIAD)
		    //Ausgangs-Bereichs-Berenzung:
		    Upper_Limit_Overflow.SIAB(false)
		    Lower_Limit_Overflow.SIAB(false)
		    if (Y.GIAD>Upper_Limit.GIAD) then
		      Output.SIAD(Upper_Limit.GIAD)
		      Upper_Limit_Overflow.SIAB(true)
		    elseif (Y.GIAD<Lower_Limit.GIAD) then
		      Output.SIAD(Lower_Limit.GIAD)
		      Lower_Limit_Overflow.SIAB(true)
		    else
		      Output.SIAD(Y.GIAD)
		    end
		    //Ausgangs-Schrittweiten-Berenzung:
		    Dim dStep as double =  Output.GIAD - Last_Output.GIAD
		    if (dStep>MaxStep.GIAD) then
		      Output.SIAD(Last_Output.GIAD+MaxStep.GIAD)
		    elseif (dStep<-MaxStep.GIAD) then
		      Output.SIAD(Last_Output.GIAD-MaxStep.GIAD)
		    elseif (dStep/dt)>MaxSlope.GIAD then
		      Output.SIAD(Last_Output.GIAD+MaxSlope.GIAD*dt)
		    elseif (dStep/dt)<-MaxSlope.GIAD then
		      Output.SIAD(Last_Output.GIAD-MaxSlope.GIAD*dt)
		    end
		  end
		  
		  
		  Return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CalcTime As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Differential As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DiffSig As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		D_Factor As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Hysteresis As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Inhibit As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input_Reference As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input_Setting As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Integral As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		I_Factor As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		KP_Factor As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Last_CalcTime As Double_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Last_DiffSig As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Last_Output As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Lower_Hysterese_Limit As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Lower_Limit As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Lower_Limit_Overflow As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxSlope As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxStep As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Output As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Output_Inverse As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Upper_Hysterese_Limit As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Upper_Limit As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Upper_Limit_Overflow As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Y As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Y_Gain As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Y_Offset As Double_AttributeClass = nil
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
		#tag ViewProperty
			Name="Lower_Hysterese_Limit"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Upper_Hysterese_Limit"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
