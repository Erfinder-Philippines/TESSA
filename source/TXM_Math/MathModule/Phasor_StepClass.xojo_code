#tag Class
Protected Class Phasor_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub Calc(numel as integer)
		  
		  dim i as integer
		  Dim res_sine, res_cos as double
		  Dim Xc, Xs as double
		  dim cres as Complex
		  dim a, b as double
		  
		  for i=0 to numel-1
		    res_cos = res_cos +me.signal.GIAD(i) * ( cos(2*pi*TargetFreq.GIAD/SamplingFreq.GIAD*i) )
		    res_sine =  res_sine + me.signal.GIAD(i) * ( sin(2*pi*TargetFreq.GIAD/SamplingFreq.GIAD*i) ) '
		  next
		  
		  Xc = 2/numel*res_cos
		  Xs = 2/numel*res_sine
		  cres = Xc+Xs*Im(1)
		  'ttest
		  a=cres.Abs
		  b=cres.Arg
		  
		  ' Phase error calculation
		  Select case me.PhaseNr.GIAI
		    
		  case is =1
		    me.PhaseErr.SIAD( (pi/2-cres.Arg)*180/pi*60) 'Phase error in minutes for the first phase
		  case is =2
		    me.PhaseErr.SIAD((2*pi/3+pi/2-cres.Arg)*180/pi*60) 'Phase error in minutes for the second phase
		  case is =3
		    me.PhaseErr.SIAD((4*pi/3+pi/2-cres.Arg)*180/pi*60) 'Phase error in minutes for the third phase
		  else
		    me.PhaseErr.SIAD((4*pi/3+pi/2-cres.Arg)*180/pi*60) ' third phase if
		  end
		  
		  'Amplitude error calculation in percent
		  
		  me.AmplitudeErr.SIAD( ( (me.TestAmplitude.GIAD*100*Sqrt(2)*1000)*me.AmplitudeCorr.GIAD - cres.Abs) / ((me.TestAmplitude.GIAD*100*Sqrt(2)*1000*me.AmplitudeCorr.GIAD) * 100) )
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.Mode=Me.IAE("Mode","2 ActiveValue-1 ActiveValue AllValues",false)
		  Me.Signal=Me.IAD("Signal",0,false)
		  Me.TargetFreq=Me.IAD("TargetFrequency",50,false)
		  Me.SamplingFreq=Me.IAD("SampleFrequency",4000,false)
		  Me.TestAmplitude = Me.IAD("TestAmplitude",1,false)
		  Me.AmplitudeCorr = Me.IAD("AmplitudeCorr_U",1,false)
		  Me.PhaseNr = Me.IAI("PhaseNr",1,false)
		  Me.AmplitudeErr = Me.IAD("AmplitudeError",0,false)
		  Me.PhaseErr = Me.IAD("PhaseError",0,false)
		  
		  AddUserFunction("Calculate", PhaseErr.Name, "Calculate", 0,UF_RunMode_Direct)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Dim FA1 as AttributeClass
		  Dim n, numel as integer
		  
		  FA1 = me.Signal.GIA
		  
		  
		  if FA1 IsA MultipleValuesAttributeClass And MultipleValuesAttributeClass(FA1).IsArray then
		    numel = FA1.GIAN
		    
		    Select case Me.Mode.GIAI
		    case 0
		      n=FA1.GIAI 'Activevalue -1
		      Calc(n)
		    case 1
		      n=FA1.GIAA+1 'ActiveValue
		      Calc(n)
		    case 2
		      n=FA1.GIAN ' Allvalues
		      Calc(n)
		    else
		      n=0
		    end
		  else
		    
		  end
		  
		  
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  Case is = "Calculate"
		    Dim B as boolean = Step_Run
		  End
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AmplitudeCorr As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AmplitudeErr As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PhaseErr As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PhaseNr As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SamplingFreq As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Signal As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TargetFreq As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestAmplitude As Double_AttributeClass = nil
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
