#tag Class
Protected Class Enthalpy_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub Calculate()
		  
		  var X,Y,Z as double
		  
		  X = Tp(BaroPressure.GIAD, Temperature.GIAD, Humidity.GIAD)
		  DuePoint.SIAD(X) // °C
		  Y=Entaplie(BaroPressure.GIAD, Temperature.GIAD, Humidity.GIAD)
		  Enthalpy.SIAD(Y) // kJ/kg
		  Z=Humid_X(BaroPressure.GIAD, Temperature.GIAD, Humidity.GIAD)
		  AbsoluteHumidity.SIAD(1000*Z) // g/kg
		  X = Density(BaroPressure.GIAD, Temperature.GIAD, Humidity.GIAD)
		  AirDensity.SIAD(X) // g/m3
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Temperature = IAD("Temperature",20,False,AttributeGroups.Parameters,40)
		  BaroPressure = IAD("BaroPressure",1028,False,AttributeGroups.Parameters,53)
		  Humidity = IAD("Humidity",40,False)
		  AirDensity = IAD("AirDensity",30,False)
		  DuePoint = IAD("DuePoint",30,false)
		  Enthalpy = IAD("Enthalpy",30,false)
		  AbsoluteHumidity = IAD("AbsoluteHumidity",30,False)
		  AirFlow = IAD("AirFlow",0,false)
		  AirMassFlow = IAD("AirMassFlow",0,False)
		  AirFlowPower = IAD("AirFlowPower",0,False)
		  
		  
		  AddUserFunction(Calculate, Enthalpy.Name, "Calculate", 0,UF_RunMode_Direct)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Calculate()
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  Case is = "Calculate"
		    Calculate()
		  End
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AbsoluteHumidity As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AirDensity As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AirFlow As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AirFlowPower As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AirMassFlow As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		BaroPressure As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DuePoint As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Enthalpy As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Humidity As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Temperature As Double_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = Calculate, Type = String, Dynamic = False, Default = \"Calculate", Scope = Protected
	#tag EndConstant


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
	#tag EndViewBehavior
End Class
#tag EndClass
