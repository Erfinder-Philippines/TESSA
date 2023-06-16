#tag Module
Protected Module HLKModule
	#tag Method, Flags = &h0
		Sub AddElements(BCF as BasicClassFactory)
		  
		  BCF.AddNewElement("HxDiagramm", GetTypeInfo(HMI_HxDiagramm_StepClass), "HxDiagramm", 1)
		  BCF.AddNewElement("Volumenstrom", GetTypeInfo(Volumenstrom_StepClass), "Volumenstrom", 1)
		  BCF.AddNewElement("Enthalpy", GetTypeInfo(Enthalpy_StepClass), "Enthalpy", 1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Density(P as double, T as double, H as double) As Double
		  // mbar, °C, % => 
		  Dim vDensity as double
		  if (T>-273.15) and (P>10) and (P<2000) and (H>=0) and (H<=100) then
		    H = H/100
		    vDensity = (H*Ds(T)) + (100 * (P-H*Ps(T)) / (287*(T+273.15)))
		  else
		    vDensity = 0
		  end
		  return vDensity
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ds(T as Double) As Double
		  // °C => kg/m3
		  Dim vDs as double
		  if T<25 then
		    if T<0 then
		      vDs =  4.8418e-3 + ( 3.7713e-4*T) + ( 1.2317e-5*T^2) + ( 1.6866e-7*T^3)
		    else
		      vDs =  4.8428e-3 + ( 3.3957e-4*T) + ( 8.9754e-6*T^2) + ( 2.5746e-7*T^3)
		    end
		  else
		    if T<51 then
		      vDs =  2.4438e-3 + ( 6.563e-4*T) - ( 5.982e-6*T^2) + ( 5.0097e-7*T^3)
		    else
		      vDs =  -0.12307 + ( 7.3996e-3*T) - ( 1.294e-4*T^2) + ( 1.2747e-6*T^3)
		    end
		  end
		  
		  return vDs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Entaplie(P as double, T as double, H as double) As double
		  // mbar, °C, %
		  var x,f,vEntaplie as double
		  if  (T>-273.15) and (P>10) and (P<2000) and (H>=0) and (H<=100) then
		    x = Humid_X(P,T,H)
		    f = Humid_X(P,T,100)
		    if x<=f then
		      vEntaplie = 1.006*T + x*(1.86*T + 2501.6)
		    else
		      vEntaplie = 1.006*T + f*(1.86*T + 2501.6) + 4.19*T*(x-f)
		    end
		  else
		    vEntaplie=0
		  end
		  return vEntaplie
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Humid_X(P as double, T as double, H as double) As double
		  // mbar, °C, % => absolute Feuchte
		  Dim vHumid_X as double
		  
		  if  (T>-273.15) and (P>10) and (P<2000) and (H>=0) and (H<=100) then
		    H = H*Ps(T)/100
		    if abs(P-H)>0 then
		      vHumid_X = 0.622*H/(P-H)
		    else
		      vHumid_X = 0
		    end
		  else
		    vHumid_X=0
		  end
		  return vHumid_X
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ps(T as double) As double
		  // °C => mbar
		  Dim vPs as double
		  if T<-273.15 then T = -273.15
		  if T<25 then
		    if T<0 then
		      vPs = 6.1011 + (0.49578*T) + (1.6845e-2*T^2) + (2.3754e-4*T^3)
		    else
		      vPs = 6.101 + ( 0.45229*T) + ( 1.2291e-2*T^2) + ( 4.1218e-4*T^3)
		    end
		  else
		    if T<51 then
		      vPs =  0.81249+ ( 1.1115*T) - ( 1.7698e-2*T^2) + ( 8.8832e-4*T^3)
		    else
		      vPs =  -289.09 + ( 16.554*T) - ( 0.29739*T^2) + ( 2.6204e-3*T^3)
		    end
		  end
		  return vPs
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Ps_rv(Px as double) As double
		  // mbar => °C
		  Dim T1,T2,Tx,P1,P2 as double
		  Dim n as integer = 0
		  T1 = 20
		  T2 = 30
		  P1 = Ps(T1)
		  while (abs(T1-T2)>0.2) and (n<1000)
		    P2 = Ps(T2)
		    if abs(P2-P1)>10e-10 then Tx = T1 + (T2-T1)*(Px-P1)/(P2-P1)
		    T1 = T2
		    P1 = P2
		    T2 = Tx
		    n=n+1
		  wend
		  
		  return Tx
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RelativeHumidity(P as double, T as double, absoluteHumid as double) As Double
		  // mbar, °C, g/kg => %
		  Dim rh as Double
		  
		  absoluteHumid  = absoluteHumid  / 1000 // convert g/kg to g/m3
		  T = Ps(T)
		  
		  const k = 0.622
		  
		  rh = absoluteHumid / (k + absoluteHumid) * P / T
		  rh = rh * 100 // %
		  
		  Return rh
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tp(P as double, T as double, H as double) As double
		  // mbar, °C, % => °C
		  
		  Dim vTp, x, Px as double
		  
		  if  (T>-273.15) and (P>10) and (P<2000) and (H>=0) and (H<=100) then
		    x = Humid_X( P,T,H )
		    Px = x*P/(0.622+x)
		    vTp = Ps_rv( Px )
		  else
		    vTp=0
		  end
		  return vTp
		End Function
	#tag EndMethod


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
End Module
#tag EndModule
