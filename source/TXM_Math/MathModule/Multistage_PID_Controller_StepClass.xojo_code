#tag Class
Protected Class Multistage_PID_Controller_StepClass
Inherits PID_Controller_StepClass
	#tag Method, Flags = &h0
		Sub AddStage(i as integer)
		  if NumStages.GIAI=0 then ActiveStage.SIAI(1)
		  NumStages.SIAI(NumStages.GIAI+1)
		  if i=0 then
		    i = (Ubound(AttributeList()) - StartUserAttribute)/2 + 1
		    AddAttribute("UpperLimit_"+str(i), "", "", AT_String, 0, 0, AttributeGroups.Parameters,true)
		    AddAttribute("Output_"+str(i), "", "", AT_String, 0, 0, AttributeGroups.Parameters,true)
		    i=1
		  else
		    Dim k as integer = (Ubound(AttributeList()) - StartUserAttribute)/2 + 1
		    while i>k
		      AddAttribute("UpperLimit_"+str(k), "", "", AT_String, 0, 0, AttributeGroups.Parameters,true)
		      AddAttribute("Output_"+str(k), "", "", AT_String, 0, 0, AttributeGroups.Parameters,true)
		      k=k+1
		    wend
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  ActiveStage = IAI("ActiveStage",0,false)
		  NumStages = IAI("NumStages",0,false)
		  
		  StartUserAttribute = Ubound(AttributeList())
		  
		  AddStage(0)
		  
		  AddUserFunction("AddStage", NumStages, "AddStage", 0,UF_RunMode_Direct)
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
		    
		    Integral.SIAD( Integral.GIAD + New_Integral_Step)
		    //Differentialberechnung:
		    if dt>0 then
		      Differential.SIAD((DiffSig.GIAD-Last_DiffSig.GIAD)/dt)
		    else
		      Differential.SIAD(0) 
		    end
		    //Reglerausgangsberechnung:
		    Y.SIAD( KP_Factor.GIAD*( DiffSig.GIAD + (Integral.GIAD*I_Factor.GIAD) + (Differential.GIAD*D_Factor.GIAD)))
		    Y.SIAD( Y.GIAD*Y_Gain.GIAD + Y_Offset.GIAD)
		    
		    //Ausgangs-Bereichs-Berenzung, bei einer Über/Unterschreitung wird automatisch die nächst höhere bzw. untere Stage aktiv:
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
		  
		  //Stage Verwaltung, immer nur ein Stage ist aktiv
		  
		  
		  
		  
		  
		  Return true
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  if (Attr<>nil) and (FuncName<>"") then
		    
		    Select case FuncName
		    case is = "AddStage"
		      AddStage(0)
		    end
		    
		    
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ActiveStage As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NumStages As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartUserAttribute As Integer = 0
	#tag EndProperty


	#tag ViewBehavior
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
	#tag EndViewBehavior
End Class
#tag EndClass
