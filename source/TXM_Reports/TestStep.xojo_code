#tag Class
Protected Class TestStep
	#tag Method, Flags = &h0
		Sub CalcMean()
		  Dim n as integer
		  Dim su as double = 0
		  Me.NumOk=0
		  Me.NumFail=0
		  Me.NumBypass=0
		  Me.NumCorrectValues=0
		  Me.MinValue=Me.Values(1)
		  Me.MaxValue=Me.Values(1)
		  
		  //calc mean value
		  for n=1 to Me.NumberofValues-1
		    if not(Me.TestType=ttPassFail) and (Me.Results(n)<3) then
		      su=su+Me.Values(n)
		      //calc maximum
		      if Me.MaxValue<Me.Values(n) then
		        Me.MaxValue=Me.Values(n)
		      end
		      //calc minimum
		      if Me.MinValue>Me.Values(n) then
		        if abs(Me.Values(n))>0 then
		          Me.MinValue=Me.Values(n)
		        end
		      end
		      //calc number of fails
		      Select case Me.Results(n)
		      case 0
		        Me.NumOk=Me.NumOk+1
		      case 1
		        Me.NumFail=Me.NumFail+1
		      case 2
		        Me.NumSkipped=Me.NumSkipped+1
		      end
		    else
		      Me.NumBypass=Me.NumBypass+1
		    end
		  next
		  
		  Me.NumCorrectValues=Me.NumOk+Me.NumFail+Me.NumSkipped
		  
		  if Me.TestType=ttPassFail then
		    Me.MeanValue=0
		  else
		    if Me.NumCorrectValues>0 then
		      Me.MeanValue=su/Me.NumCorrectValues
		    else
		      Me.MeanValue=-999
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckSize(vTR as integer) As boolean
		  if vTR>-1 then
		    if (vTR+1)>Me.NumberofValues then
		      ReDim Me.Values(vTR+1)
		      ReDim Me.Results(vTR+1)
		      Me.NumberofValues=vTR+1
		      Me.Values(vTR)=0
		      Me.Results(vTR)=99
		    end
		    return true
		  else
		    return  false
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  
		  Me.Name=ConfigText
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set_ICT_Criteria(TR as integer, vName as string, desc as string, crit as string, meas as string, Res as string)
		  Dim m as double = val(Meas)
		  Dim n as integer = 0
		  
		  if (m<>0) and (1=2) then
		    while (m>1000) and (n<10)
		      m=m/1000
		      n=n+1
		    wend
		    While (m<1) and (n<20)
		      m=m*1000
		      n=n+1
		    wend
		    Meas=Format(m,"#'###'###.###")
		  end
		  
		  if TR=0 then // this is the definition file of that teststep
		    // set criterie if there is none, first look for a fixed definition, then make one around the Meas value
		    if crit="" then
		      if m<>0 then
		        crit=str(m*0.2)+"/"+str(m*5)
		      end
		    end
		    Me.Name=vName
		    Me.Description=desc
		    Me.Criteria=crit
		    
		    if crit.Instr(1,"P/F V")>0 then
		      TestType=ttPassFail_withValue
		    else
		      if crit.Instr(1,"P/F")>0 then
		        TestType=ttPassFail
		      else
		        if crit.Instr(1,"/")>0 then
		          TestType=ttValue
		        else
		          TestType=ttValue
		        end
		      end
		    end
		  else
		    TR=TR
		  end
		  
		  if Me.CheckSize(TR) then
		  end
		  
		  Me.Values(TR)=m
		  
		  Select case Res
		  case is="Pass"
		    Me.Results(TR)=0
		  case is="Fail"
		    Me.Results(TR)=1
		  case is="Skipped"
		    Me.Results(TR)=2
		  case is="NoDone"
		    Me.Results(TR)=3
		  else
		    Me.Results(TR)=99
		  end
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Criteria As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Description As String = "nil"
	#tag EndProperty

	#tag Property, Flags = &h0
		Format As string
	#tag EndProperty

	#tag Property, Flags = &h0
		HighLimit As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		LowLimit As double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxValue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		MeanValue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		Measure As string
	#tag EndProperty

	#tag Property, Flags = &h0
		MinValue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberofValues As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		NumBypass As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		NumCorrectValues As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		NumFail As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		NumOk As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		NumSkipped As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Results(-1) As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		TestType As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Values(-1) As Double
	#tag EndProperty


	#tag Constant, Name = ttPassFail, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ttPassFail_withValue, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ttValue, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Criteria"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue="nil"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HighLimit"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
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
			Name="LowLimit"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MeanValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Measure"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
			Name="NumberofValues"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumBypass"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumCorrectValues"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumFail"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumOk"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NumSkipped"
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
			Name="TestType"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
