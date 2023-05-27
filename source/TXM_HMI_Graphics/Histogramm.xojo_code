#tag Class
Protected Class Histogramm
Inherits Canvas
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  Dim n as integer
		  Dim x0,y0,w0,h0,d0,x1 as integer
		  
		  
		  x0=25
		  y0=20
		  w0=Me.width-35
		  h0=Me.height - 60
		  d0=w0/UBound(Me.Histo_Int())
		  
		  //Me.Graphics.DrawLine(0,0,Me.width,0)
		  g.DrawString(Me.Title,x0,y0-5 )
		  g.DrawString(Me.SubTitle,x0+w0-Me.SubTitle.len*7,y0-5  )
		  
		  g.DrawRect(x0,y0,w0,h0 )
		  
		  //Me.Graphics.TextColor=&cFFFFFF
		  
		  g.forecolor=&c0000FF
		  g.TextSize=10
		  Me.YScaleMax=0
		  for n=0 to UBound(Me.Histo_Int())-1
		    x1=x0-10+(n+1)*d0
		    g.DrawString(format(Histo_Limits(n),"##.##"),x1,y0+h0+12 )
		    g.DrawString(format(100*(Histo_Limits(n)-MeanValue)/MeanValue,"-##.#"),x1,y0+h0+30 )
		    if Me.Histo_Int(n)>Me.YScaleMax then
		      Me.YScaleMax=Me.Histo_Int(n)
		    end
		  next
		  
		  Dim r, t as Double
		  Dim y1 as integer
		  
		  Me.YScaleMax=100*Me.YScaleMax/Me.NumberofValues
		  //set the scale automatically
		  if Me.YScaleMax>50 then
		    r=10
		  else
		    if Me.YScaleMax>20 then
		      r=5
		    else
		      if Me.YScaleMax>10 then
		        r=2
		      else
		        r=1
		      end
		    end
		  end
		  
		  g.forecolor=&cFF0000
		  
		  g.PenHeight=1
		  Dim xx as integer
		  Dim yy as integer
		  Dim hh as integer
		  for n=0 to UBound(Me.Histo_Int())-1
		    xx=x0+n*d0
		    yy=y0+h0
		    // be aware no negative heights on Windows!
		    hh=h0*Me.Histo_Int(n)/(Me.NumberofValues)
		    g.FillRect(xx,yy-hh,d0,hh)
		  next
		  
		  if ShowValue<>0 then
		    g.forecolor=&c0000FF
		    x1=x0+d0+(ShowValue-Histo_Limits(0))*d0/ScaleStep
		    g.DrawString(format(ShowValue,"##.##"),x1,y0+35 )
		    g.DrawLine(x1,y0+50,x1,y0+h0-1)
		  end
		  
		  t=0
		  While t<Me.YScaleMax
		    y1=y0+h0-h0*t/Me.YScaleMax
		    g.DrawString(format(t,"##")+"%",x0-20,y1 )
		    g.DrawLine(x0-5,y1,x0,y1)
		    t=t+r
		  wend
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Calc()
		  
		  Dim d, Lim as double
		  Dim SMin, SMax, SStep as double = 0
		  Dim n,i as integer
		  
		  
		  DeterminAutoScale(Me.MinValue, Me.MaxValue, SStep , SMin, SMax, Me.NumSteps)
		  
		  Me.ScaleStep=SStep
		  
		  Histo_Limits(0)=SMin+Me.ScaleStep
		  Histo_Int(0)=0
		  for i=1 to Ubound(Histo_Int())-1
		    Histo_Int(i)=0
		    Histo_Limits(i)=Histo_Limits(i-1)+Me.ScaleStep
		  next
		  
		  for n=1 to Ubound(Me.Values())-1
		    i=0
		    d=Me.Values(n)
		    Lim=Histo_Limits(i)
		    while (i<(Ubound(Histo_Limits())-1)) and (d>Lim)
		      i=i+1
		      Lim=Histo_Limits(i)
		    wend
		    Histo_Int(i)=Histo_Int(i)+1
		  next
		  
		  for i=0 to Me.NumSteps
		    Histo_Percentage(i)=100*Histo_Int(i)/(Me.NumberofValues-1)
		  next
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CalcMean()
		  Dim su as double = 0
		  Me.MinValue=Me.Values(1)
		  Me.MaxValue=Me.Values(1)
		  
		  //calc mean value
		  for n as Integer = 1 to Me.NumberofValues-1
		    su=su+Me.Values(n)
		    //calc maximum
		    if Me.MaxValue<Me.Values(n) then
		      Me.MaxValue=Me.Values(n)
		    end
		    //calc minimum
		    if Me.MinValue>Me.Values(n) then
		      Me.MinValue=Me.Values(n)
		    end
		  next
		  
		  Me.MeanValue=su/(Me.NumberofValues-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHistogramm(vValues() as double, vNumSteps as integer, vTitle as string, vSubTitle as string, vShowValue as double)
		  Dim n as integer
		  
		  Me.NumberofValues=Ubound(vValues())
		  Redim Me.Values(Ubound(vValues()))
		  Me.Title=vTitle
		  Me.SubTitle=vSubTitle
		  Me.ShowValue=vShowValue
		  
		  if vNumSteps=0 then
		    vNumSteps=Me.NumSteps
		  end
		  
		  if Me.NumSteps<>vNumSteps then
		    Redim Me.Histo_Int(vNumSteps+1)
		    Redim Me.Histo_Limits(vNumSteps+1)
		    Redim Me.Histo_Percentage(vNumSteps+1)
		  end
		  
		  Me.NumSteps=vNumSteps
		  
		  for n=0 to Me.NumberofValues
		    Me.Values(n)=vValues(n)
		  next
		  
		  Me.CalcMean
		  
		  Me.Calc
		  
		  Me.Refresh
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHistogramm(TRM as TestReportMatrix, TestReport as integer, Teststep as integer)
		  if TRM <> nil then
		    if (Teststep>=0) and (Teststep<UBound(TRM.TS())) then
		      if (TestReport>=0) and (TestReport<UBound(TRM.TRH())) and (TestReport<UBound(TRM.TS(Teststep).Values()))  then
		        
		        Dim n,i as integer = 0
		        Dim vNumSteps as integer = 5
		        Redim Me.Values(UBound(TRM.TRH()))
		        
		        //transfer the "good" values, means only pass and fail results
		        for n=0 to Ubound(TRM.TS(Teststep).Values())-1
		          if TRM.TS(Teststep).Results(n)<2 then
		            Me.Values(i)=TRM.TS(Teststep).Values(n)
		            i=i+1
		          end
		        next
		        
		        Me.NumberofValues=i
		        Redim Me.Values(i)
		        Me.Title=str(TRM.TRH(TestReport).SerialNumber)
		        Me.SubTitle=TRM.TS(Teststep).Name
		        Me.ShowValue=TRM.TS(Teststep).Values(TestReport)
		        
		        vNumSteps = Me.NumberofValues/20
		        if vNumSteps=0 then
		          vNumSteps=5
		        else
		          if vNumSteps>10 then
		            vNumSteps=10
		          end
		        end
		        
		        if Me.NumSteps<>vNumSteps then
		          Redim Me.Histo_Int(vNumSteps+1)
		          Redim Me.Histo_Limits(vNumSteps+1)
		          Redim Me.Histo_Percentage(vNumSteps+1)
		        end
		        
		        Me.NumSteps=vNumSteps
		        
		        Me.CalcMean
		        
		        Dim MinV as double = val(NthField(TRM.TS(Teststep).Criteria,"/",1))
		        Dim MaxV as double = val(NthField(TRM.TS(Teststep).Criteria,"/",2))
		        if (MaxV>MinV) then
		          MinV=MinV-(MaxV-MinV)/2
		          MaxV=MaxV+(MaxV-MinV)/2
		          Me.MinValue=MinV
		          Me.MaxValue=MaxV
		        end
		        
		        Me.Calc
		        
		        Me.Refresh
		      end
		    end
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		HighLimit As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Histo_Int(10) As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Histo_Limits(10) As double
	#tag EndProperty

	#tag Property, Flags = &h0
		Histo_Percentage(10) As double
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
		MinValue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberofValues As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		NumSteps As Integer = 10
	#tag EndProperty

	#tag Property, Flags = &h0
		ScaleStep As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowValue As double
	#tag EndProperty

	#tag Property, Flags = &h0
		SubTitle As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As string = "Title"
	#tag EndProperty

	#tag Property, Flags = &h0
		Values(-1) As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		YScaleMax As double = 0
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tooltip"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowFocus"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowTabs"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Boolean"
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
			Name="NumSteps"
			Visible=false
			Group="Behavior"
			InitialValue="10"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScaleStep"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SubTitle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="TabIndex"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabPanelIndex"
			Visible=false
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Title"
			Visible=false
			Group="Behavior"
			InitialValue="Title"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="YScaleMax"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
