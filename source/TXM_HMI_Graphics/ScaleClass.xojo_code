#tag Class
Protected Class ScaleClass
	#tag Method, Flags = &h0
		Sub CalcTransferFunction(P0 as integer, Size as integer)
		  Dim d as double
		  d=Me.EndD.GIAD-Me.StartD.GIAD
		  if d=0 then
		  else
		    Me.A=Size/d
		    Me.B=P0-Size*Me.StartD.GIAD/d
		  end
		  
		  Me.Min=Me.StartD.GIAD
		  Me.Max=Me.EndD.GIAD
		  //Me.Ax=w/(Me.XEnd-Me.XStart)
		  //Me.Bx=x0-w*Me.XStart/(Me.XEnd-Me.XStart)
		  
		  //Me.YAxis.Ay=-h/(Me.YEnd-Me.YStart)
		  //Me.YAxis.By=y0+(h*Me.YStart/(Me.YEnd-Me.YStart))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoAutoScale(vMin as double, vMax as double) As boolean
		  Dim ScaleChanged as boolean
		  
		  ScaleChanged=false
		  
		  if Me.AutoScale<>nil then
		    if Me.AutoScale.GIAB then
		      
		      Dim D, DR as double
		      Dim f as integer
		      Dim Scale_Step, Scale_Max, Scale_Min as double
		      
		      Me.MaxValue=vMax
		      Me.MinValue=vMin
		      
		      D=Me.MaxValue-Me.MinValue
		      
		      if D>0 then
		        f=0
		        DR=D
		        //transform the basic scale into a scale between 10 and 100 => determin basic scale (...0.01, 0.1,1,10,100...)
		        if DR>100 then
		          while DR>100
		            DR=DR/10
		            f=f+1
		          wend
		        else
		          while DR<10
		            DR=DR*10
		            f=f-1
		          wend
		        end
		        
		        //determin step with the found basic scale (20,50,100)
		        if DR>50 then
		          Scale_Step=10
		        else
		          if DR>20 then
		            Scale_Step=5
		          else
		            if DR>10 then
		              Scale_Step=2
		            end
		          end
		        end
		        
		        //transform the scale step into the basic scale
		        while f>0
		          Scale_Step=Scale_Step*10
		          f=f-1
		        wend
		        
		        while f<0
		          Scale_Step=Scale_Step/10
		          f=f+1
		        wend
		        
		        // determin the maximal scale in multiples of the found scale steps
		        Scale_Max=0
		        if Me.MaxValue>0 then
		          while (Scale_Max-Scale_Step)<Me.MaxValue
		            Scale_Max=Scale_Max+Scale_Step
		          wend
		        else
		          if Me.MaxValue<0 then
		            while (Scale_Max-Scale_Step)>Me.MaxValue
		              Scale_Max=Scale_Max-Scale_Step
		            wend
		          else
		            Scale_Max=0
		          end
		        end
		        
		        // do the same with the minimum scale step
		        Scale_Min=0
		        if Me.MinValue<0 then
		          while Scale_Min>Me.MinValue
		            Scale_Min=Scale_Min-Scale_Step
		          wend
		        else
		          if Me.MinValue>0 then
		            while (Scale_Min+Scale_Step)<Me.MinValue
		              Scale_Min=Scale_Min+Scale_Step
		            wend
		          else
		            Scale_Min=0
		          end
		        end
		        
		        if Me.StartD.GIAD<>Scale_Min then
		          Me.StartD.SIAD(Scale_Min)
		          ScaleChanged=true
		        end
		        if Me.EndD.GIAD<>Scale_Max then
		          Me.EndD.SIAD(Scale_Max)
		          ScaleChanged=true
		        end
		        if Me.StepD.GIAD<>Scale_Step then
		          Me.StepD.SIAD(Scale_Step)
		          ScaleChanged=true
		        end
		        if Me.StepD.GIAD=0 then
		          Me.StepD.SIAD((Scale_Max-Scale_Min)/5)
		        end
		        if Me.StepD.GIAD=0 then
		          Me.StepD.SIAD(1)
		        end
		        
		      end
		      
		    end
		  end
		  
		  return ScaleChanged
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetScale(T as string, X1 as double, X2 as double, Xs as double)
		  
		  
		  Me.Title.SIAS(T)
		  Me.StartD.SIAD(X1)
		  Me.EndD.SIAD(X2)
		  Me.StepD.SIAD(Xs)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transfer(input as double) As integer
		  return (Input*Me.A+Me.B)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Transfer2(Input as double, ByRef Output as integer) As Boolean
		  Output=(Input*Me.A+Me.B)
		  return ((Input>=Me.Min) and (Input<=Me.Max))
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Zoom(Mode as integer, Z1 as Double, Z2 as Double)
		  Select case Mode
		  case 0
		    
		  case 1
		    if not(Me.ZoomOn) then
		      Dim StartN, EndN, StepN as Double
		      Me.StartZ=Me.StartD.GIAD
		      Me.EndZ=Me.EndD.GIAD
		      Me.StepZ=Me.StepD.GIAD
		      if Z1>0.1 then
		        StartN=Me.StartZ+Z1*(Me.EndZ-Me.StartZ)
		      else
		        StartN=Me.StartZ
		      end
		      if Z2<0.9 then
		        EndN=Me.StartZ+Z2*(Me.EndZ-Me.StartZ)
		      else
		        EndN=Me.EndZ
		      end
		      StepN=Me.StepZ
		      
		      Me.StartD.SIAD(StartN)
		      Me.EndD.SIAD(EndN)
		      Me.StepD.SIAD(StepN)
		      'System.DebugLog "Z1 : " + str(Z1) + " Z2 : " + str(Z2)
		      'System.DebugLog "start: " + str(StartN) + " end: " + str(EndN) + " step: " + Str(StepN)
		      Me.Min=StartN
		      Me.Max=EndN
		      Me.ZoomOn=true
		    end
		  case 2
		    if Me.ZoomOn then
		      Me.StartD.SIAD(Me.StartZ)
		      Me.EndD.SIAD(Me.EndZ)
		      Me.StepD.SIAD(Me.StepZ)
		      Me.Min=Me.StartZ
		      Me.Max=Me.EndZ
		      
		      Me.ZoomOn=false
		    end
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		A As double = 1
	#tag EndProperty

	#tag Property, Flags = &h0
		AutoScale As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		B As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		EndD As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EndZ As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Max As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Min As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		MInValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		StartD As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartZ As double
	#tag EndProperty

	#tag Property, Flags = &h0
		StepD As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StepZ As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ZoomOn As Boolean = false
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="A"
			Visible=false
			Group="Behavior"
			InitialValue="1"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="B"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EndZ"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="Max"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Min"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MInValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
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
			Name="StartZ"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StepZ"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
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
			Name="ZoomOn"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
