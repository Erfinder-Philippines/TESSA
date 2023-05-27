#tag Class
Protected Class NTC_Calc_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  R_NTC = IAD("R_NTC",10000,false)
		  U_NTC = IAD("U_NTC",5,false)
		  I_NTC  = IAD("I_NTC",0.001,false)
		  Temperature=IAD("Temperature",0,false)
		  
		  R25_NTC = IAD("R25_NTC",10000,false)
		  T25 = IAD("T25",25,false)
		  B = IAD("B",3900,false)
		  U1 = IAD("U1",10,false)
		  Uref = IAD("Uref",5,false)
		  R1 = IAD("R1",10000,false)
		  Mode = IAE("Mode","0 Resistance Fix_Current Upper_Bridge Lower_Bridge Upper_SymBridge Lower_SymBridge",false)
		  
		  'Me.Reverse = Me.IAB("Reverse",false,false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Dim r,t,untc as double = 0
		  Select case Mode.GIAI
		  case 0 // direct resitor input
		    r=R_NTC.GIAD
		  case 1 // measuring voltage with constant current
		    if abs(I_NTC.GIAD)>0.0000000001 then
		      r=U_NTC.GIAD/I_NTC.GIAD
		    end
		  case 2 // measuring NTC in  a bridge upper position
		    r=U_NTC.GIAD*R1.GIAD/(U1.GIAD-U_NTC.GIAD)
		  case 3 // measuring NTC in a bridge lower position
		    r=R1.GIAD*(U1.GIAD-U_NTC.GIAD)/U_NTC.GIAD
		  case 4 // measuring NTC in  a symetrical bridge upper position
		    r=(U_NTC.GIAD+URef.GIAD)*R1.GIAD/(U1.GIAD-(U_NTC.GIAD+Uref.GIAD))
		  case 5 // measuring NTC in  a symetrical bridge lower position
		    r=R1.GIAD*(U1.GIAD-(U_NTC.GIAD+Uref.GIAD))/(U_NTC.GIAD+Uref.GIAD)
		  end
		  r=abs(r)
		  R_NTC.SIAD(r)
		  if r>0 then
		    t=1/(log(r/R25_NTC.GIAD)/B.GIAD+1/(T25.GIAD+273.15))-273.15
		    Temperature.SIAD(t)
		  end
		  
		  
		  Return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		B As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		I_NTC As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		R1 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		R25_NTC As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		R_NTC As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		T25 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Temperature As Double_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		U1 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Uref As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		U_NTC As Double_AttributeClass = nil
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
