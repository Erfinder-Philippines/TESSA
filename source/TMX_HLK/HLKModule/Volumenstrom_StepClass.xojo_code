#tag Class
Protected Class Volumenstrom_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Airflow = IAD("Airflow",0,false)
		  Reynolds = IAD("Reynolds",0,false)
		  DiffPressure = IAD("DiffPressure",950,false)
		  StatPressure = IAD("StatPressure",500,false)
		  Density = IAD("Density",1.2175,false)
		  Temperature = IAD("Temperature",20,false)
		  BaroPressure = IAD("BaroPressure",1028,false)
		  DuctDiameter = IAD("DuctDiameter",0.125,false)
		  OrificeDiameter = IAD("OrificeDiameter",0.09302477,false)
		  Viscosity = IAD("Viscosity",0,false)
		  C_Coeff = IAD("C_Coeff",0.985,false)
		  E_Coeff = IAD("E_Coeff",0,false)
		  Epsilon = IAD("Epsilon",1,false)
		  AdiabatenExponent = IAD("AdiabatenExponent",1.38,false)
		  
		  MeasDevice = IAE("MeasDevice","0 Eckblende Flanschblende D-D/2-Blende Kurze_Normdüse Lange_Normdüse Normventuridüse Venturirohr Staurohr",false)
		  MeasSelect = IAE("Measure","0 m3/h l/sec m/sec",false)
		  Airflow.ReadOnly = true
		  
		  AddUserFunction(Calculate, Airflow.Name, "Calculate", 0,UF_RunMode_Direct)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Dim NoError as boolean = true
		  Dim Dens as double = Density.GIAD
		  if Dens<0.1 then NoError=false
		  Dim Tk as double = Temperature.GIAD
		  Dim B as double
		  if  DuctDiameter.GIAD=0 then
		    NoError=false
		  else
		    B = OrificeDiameter.GIAD/DuctDiameter.GIAD
		  end
		  if B>=1 then NoError=false
		  Dim B4 as double = B^4
		  Dim Pbaro as double = BaroPressure.GIAD
		  Dim Pdiff as double = DiffPressure.GIAD
		  Dim Sig as double = 1
		  if Pdiff<0 then
		    Sig=-1
		    Pdiff=-Pdiff
		  end
		  Dim Pstat as double = StatPressure.GIAD
		  
		  // calculate dynamic viscosity
		  Dim Vd as double = ( 17.15 + Tk * 0.0466 )/1000000
		  if abs(Vd)<10e-8 then NoError=false
		  Dim Dia as double = DuctDiameter.GIAD
		  Dim Re as double = Reynolds.GIAD
		  Dim E as double = 1/sqrt(1-B4)
		  Dim x as double = AdiabatenExponent.GIAD
		  Dim B21, B25, Epsi,C ,W as double 
		  Dim n as integer
		  
		  if NoError then
		    Select case Me.MeasDevice.GIAI
		    case 0 // Eckblende
		      B21 = B^2.1
		      B25 = B^2.5
		      Epsi = 1 - ((0.41 + 0.35*B4)*Pdiff/(x*(Pstat+100*Pbaro)))
		      if Epsi<0 then Epsi = 0.1
		      for n = 1 to 5
		        if Re<1 then Re = 1
		        C = 0.5959 + 0.0312 * B21 - 0.1840 *B4*B4 + 0.0029 *B25 * (1000000/Re)^0.75
		        W = B*B * Epsi *C*E * sqrt( 2 * Pdiff / Dens )
		        Re = W * Dia * Dens / Vd
		      next
		    case 1 // Flanschblende
		      B21 = B^2.1
		      B25 = B^2.5
		      Dim B3 as double = B^3
		      Dim L1,L2 as double
		      if Dia>0.05862 then
		        L1 = 0.0254/Dia
		      else
		        L1 = 0.4333
		      end
		      L2 = 0.0254/Dia
		      
		      Epsi = 1 - ((0.41 + 0.35*B4)*Pdiff/(x*(Pstat+100*Pbaro)))
		      if Epsi<0 then Epsi = 0.1
		      for n=1 to 5
		        C = 0.5959 + 0.0312 * B21 - 0.1840 *B4*B4 + 0.0029 *B25 * ((1000000/Re)^0.75) + 0.09*L1*B4*(1-B4) - 0.0337*L2*B3
		        W = B*B * Epsi * C*E * sqrt( 2 * Pdiff / Dens )
		        Re = W * Dia * Dens / Vd
		      next
		    case 2 // D-D/2-Blende
		      B21 = B^2.1
		      B25 = B^2.5
		      Dim B3 as double = B^3
		      Dim L1,L2 as double
		      L1 = 1
		      L2 = 0.47
		      Epsi = 1 - ((0.41 + 0.35*B4)*Pdiff/(x*(Pstat+100*Pbaro)))
		      if Epsi<0 then Epsi = 0.1
		      for n=1 to 5
		        C = 0.5959 + 0.0312 * B21 - 0.1840 *B4*B4 + 0.0029 *B25 * ((1000000/Re)^0.75) + 0.09*L1*B4*(1-B4) - 0.0337*L2*B3
		        W = B*B * Epsi * C*E * sqrt( 2 * Pdiff / Dens )
		        Re = W * Dia * Dens / Vd
		      next
		    case 3 // Kurze_Normdüse 
		      Dim B47, B41 as double
		      B47=B^4.7
		      B41=B^4.1
		      Dim tau as double = 1-Pdiff/(Pstat+100*Pbaro+Pdiff/2)
		      Epsi = sqrt( x*(tau^(2/x)) * (1-B4) * (1-tau^((x-1)/x)) / ((x-1) * (1-B4*tau^(2/x)) * (1-tau)) )
		      if Epsi<0 then Epsi = 0.0000001
		      for n=1 to 5
		        if Re<1 then Re = 1
		        C = 0.99 - 0.2262 * B41 + (0.000215 - 0.0001125*B + 0.00249*B47) * (1000000/Re)
		        W = B*B * Epsi * C*E * sqrt( 2 * Pdiff / Dens )
		        Re = W * Dia * Dens / Vd
		      next
		    case 4 // Lange_Normdüse
		      Dim tau as double = 1-Pdiff/(Pstat+100*Pbaro+Pdiff/2)
		      Epsi = sqrt( x*(tau^(2/x)) * (1-B4) * (1-tau^((x-1)/x)) / ((x-1) * (1-B4*tau^(2/x)) * (1-tau)))
		      if Epsi<0 then Epsi = 0.0000001
		      for n=1 to 5
		        if Re<1 then Re = 1
		        C = 0.9965 - 0.00653 * sqrt(B) * sqrt(1000000/Re)
		        W = B*B * Epsi * C*E * sqrt( 2 * Pdiff / Dens )
		        Re = W * Dia * Dens / Vd
		      next
		    case 5 // Normventuridüse 
		      Dim B47 as double = B^4.7
		      Dim tau as double = 1-Pdiff/(Pstat+100*Pbaro+Pdiff/2)
		      Epsi = sqrt( x*(tau^(2/x)) * (1-B4) * (1-tau^((x-1)/x)) / ((x-1) * (1-B4*tau^(2/x)) * (1-tau)))
		      if Epsi<0 then Epsi = 0.0000001
		      C = 0.9858 - 0.198 * B47
		      Re = W * Dia * Dens / Vd
		    case 6 // Venturirohr 
		      Dim tau as double = 1-Pdiff/(Pstat+100*Pbaro+Pdiff/2)
		      Epsi = sqrt( x*(tau^2/x)) * (1-B4) * (1-((tau^(x-1))/x))/ ((x-1) * (1-B4*(tau^2/x) * (1-tau)))
		      if Epsi<0 then Epsi = 0.1
		      C = C_Coeff.GIAD
		      W = B*B * Epsi * C*E * sqrt( 2 * Pdiff / Dens )
		      Re = W * Dia * Dens / Vd
		    case 7 // Staurohr
		      C = 1
		      Epsi = 1
		      E = 1
		      W = sqrt( 2 * Pdiff / Dens )
		      Re = W * Dia * Dens / Vd
		    else
		      
		    end
		    
		    
		    
		    
		    Select case MeasSelect.GIAI
		    case 0 // m3/h
		      W=W * ((DuctDiameter.GIAD/2)^2)*PI*3600
		    case 1 // L/sec
		      W=W * ((DuctDiameter.GIAD/2)^2)*PI*1000
		    case 2 // m/sec
		      
		    end
		    Airflow.SIAD(W)
		    
		    Reynolds.SIAD(Re)
		    C_Coeff.SIAD(C)
		    E_Coeff.SIAD(E)
		    Viscosity.SIAD(Vd)
		    Epsilon.SIAD(Epsi)
		    
		    Return true
		  else
		    
		    Return false
		  end
		  
		  
		  
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
		AdiabatenExponent As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Airflow As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		BaroPressure As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		C_Coeff As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Density As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DiffPressure As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DuctDiameter As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Epsilon As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		E_Coeff As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MeasDevice As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MeasSelect As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		OrificeDiameter As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Reynolds As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StatPressure As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Temperature As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Viscosity As Double_AttributeClass = nil
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
