#tag Class
Protected Class GraphClass
	#tag Method, Flags = &h0
		Sub AutoScale()
		  // does perform an autoscale for all values
		  Dim LXY as XYCurve_StepClass
		  Dim LS as BasicClass
		  Dim n  as integer
		  
		  if mHMIGraphClass <> nil then
		    LS = mHMIGraphClass.FirstSubStep
		    while LS<>nil
		      if LS IsA XYCurve_StepClass then
		        LXY = XYCurve_StepClass(LS)
		        if n > 1 then n = 1
		        LXY.FindMinMax(n, mHMIGraphClass)
		      end
		      LS = LS.NextStep
		      n = n+1
		    wend
		    
		    
		    if Me.XAxis.DoAutoScale(mHMIGraphClass.Xmin, mHMIGraphClass.Xmax) then
		    end
		    
		    if Me.YAxis.DoAutoScale(mHMIGraphClass.Ymin, mHMIGraphClass.Ymax) then
		    end
		    
		  else
		    n=1
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Clip_Coordinates(ByRef x1 as integer, ByRef y1 as integer, ByRef x2 as integer, ByRef y2 as integer, xmin as integer, ymin as integer, xmax as integer, ymax as integer) As Boolean
		  Dim Clipped as boolean
		  
		  Clipped=false
		  
		  if y2<ymin then
		    x2=Find_X_on_Line(ymin,x1,y1,x2,y2)
		    y2=ymin
		    Clipped=true
		  else
		    if y2>ymax then
		      x2=Find_X_on_Line(ymax,x1,y1,x2,y2)
		      y2=ymax
		      Clipped=true
		    end
		  end
		  if y1<ymin then
		    x1=Find_X_on_Line(ymin,x1,y1,x2,y2)
		    y1=ymin
		    Clipped=true
		  else
		    if y1>ymax then
		      x1=Find_X_on_Line(ymax,x1,y1,x2,y2)
		      y1=ymax
		      Clipped=true
		    else
		    end
		  end
		  
		  if x2<xmin then
		    y2=Find_X_on_Line(xmin,y1,x1,y2,x2)
		    x2=xmin
		    Clipped=true
		  else
		    if x2>xmax then
		      y2=Find_X_on_Line(xmax,y1,x1,y2,x2)
		      x2=xmax
		      Clipped=true
		    end
		  end
		  if x1<xmin then
		    y1=Find_X_on_Line(xmin,y1,x1,y2,x2)
		    x1=xmin
		    Clipped=true
		  else
		    if x1>xmax then
		      y1=Find_X_on_Line(xmax,y1,x1,y2,x2)
		      x1=xmax
		      Clipped=true
		    end
		  end
		  
		  return Clipped
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(GS as Graph_StepClass, XA as ScaleClass, YA as ScaleClass)
		  mHMIGraphClass = GS
		  
		  Me.XAxis = new ScaleClass
		  Me.YAxis = new ScaleClass
		  
		  Me.XAxis.Title = XA.Title
		  Me.XAxis.StartD = XA.StartD
		  Me.XAxis.EndD = XA.EndD
		  Me.XAxis.StepD = XA.StepD
		  Me.XAxis.AutoScale = XA.AutoScale
		  
		  Me.YAxis.Title = YA.Title
		  Me.YAxis.StartD = YA.StartD
		  Me.YAxis.EndD = YA.EndD
		  Me.YAxis.StepD = YA.StepD
		  Me.YAxis.AutoScale = YA.AutoScale
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw()
		  if Me.GR <> nil then
		    Me.AutoScale
		    Me.DrawScales
		    Me.DrawValues
		    Me.NoRedraw = true
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawChart()
		  // Create a XYChart and its size
		  XYChart = new CDXYChartMBS(GR.Width, GR.height, &hF5F6F7,CDBaseChartMBS.kTransparent,0)
		  // Add a title to the chart using 18 pts Times New Roman Bold Italic font
		  call XYChart.addTitle(Self.Title, "bold", 18)
		  
		  call XYChart.setPlotArea(45, 55, XYChart.getWidth - 80, XYChart.getHeight - 100, &hFFFFFF, -1, CDBaseChartMBS.kTransparent, &hE6E6E6, &hE6E6E6)
		  
		  // Add a legend box at (50, 25) using horizontal layout. Use 10pts Arial Bold as font. Set the
		  // background and border color to Transparent.
		  XYChart.addLegend(50, 25, false, "bold", 10).setBackground(CDBaseChartMBS.kTransparent)
		  
		  // Set axis label style to 8pts Arial Bold
		  call XYChart.xAxis.setLabelStyle("bold", 8)
		  call XYChart.yAxis.setLabelStyle("bold", 8)
		  
		  // Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the y-axis.
		  XYChart.yAxis.setTickDensity(30)
		  XYChart.yAxis2.setTickDensity(30)
		  
		  // Set the axis stem to transparent
		  XYChart.xAxis.setColors(CDBaseChartMBS.kTransparent)
		  XYChart.yAxis.setColors(CDBaseChartMBS.kTransparent)
		  
		  Dim graphMax_X As Double = XAxis.EndD.Values(0)
		  Dim graphMin_X As Double = XAxis.StartD.Values(0)
		  Dim graphMax_Y As Double = YAxis.EndD.Values(0)
		  Dim graphMin_Y As Double = YAxis.StartD.Values(0)
		  
		  XYChart.xAxis.setLinearScale(graphMin_X,graphMax_X)
		  XYChart.xAxis.setRounding(False, False)
		  
		  XYChart.yAxis.setLinearScale(graphMin_Y,graphMax_Y)
		  XYChart.yAxis.setRounding(False, False)
		  
		  XYChart.yAxis2.setLinearScale(graphMin_Y,graphMax_Y)
		  XYChart.yAxis2.setRounding(False, False)
		  
		  // Axis steps and title
		  XYChart.xAxis.setLabelStep(XAxis.StepD.GIAD)
		  Call XYChart.xAxis.setTitle(XAxis.Title.GIAS).setAlignment(CDXYChartMBS.kBottomCenter)
		  XYChart.yAxis.setLabelStep(YAxis.StepD.GIAD)
		  Call XYChart.yAxis.setTitle(YAxis.Title.GIAS).setAlignment(CDXYChartMBS.kLeft)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawFillRect(xi1 as integer, yi1 as integer, wi1 as integer, hi1 as integer, vFillColor as Color)
		  // draws a rectangle with the given coordinates according scaling!
		  If Me.GR <> Nil Then
		    Me.GR.ForeColor = vFillColor
		    Me.GR.FillRect(xi1, yi1, wi1, hi1)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawLine(X1 as double, Y1 as double, X2 as double, Y2 as double, vRectColor as Color)
		  // draws a rectangle with the given coordinates according scaling!
		  If GR <> Nil Then
		    Dim xi1, yi1, xi2, yi2 as integer
		    Me.GR.ForeColor = vRectColor
		    
		    if x1 = -999 then
		      xi1 = Me.x0
		    else
		      xi1 = Me.XAxis.Transfer(x1)
		    end
		    if x2 = 999 then
		      xi2 = Me.x0 + Me.w0
		    else
		      xi2 = Me.XAxis.Transfer(x2)
		    end
		    yi1 = Me.YAxis.Transfer(y1)
		    yi2 = Me.YAxis.Transfer(y2)
		    
		    if Me.Clip_Coordinates(xi1, yi1, xi2, yi2, Me.x0, Me.y0 - Me.h0 ,Me.x0 + Me.w0, Me.y0) then
		    end
		    Me.GR.DrawLine(xi1, yi1, xi2, yi2)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawLine(X1 as double, Y1 as double, X2 as double, Y2 as double, vRectColor as Color, vPenWidth as integer)
		  // draws a rectangle with the given coordinates according scaling!
		  If GR <> Nil Then
		    Me.GR.PenWidth = vPenWidth
		    Me.DrawLine(X1, Y1, X2, Y2, vRectColor)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawRect(X1 as double, Y1 as double, X2 as double, Y2 as double, vRectColor as Color)
		  // draws a rectangle with the given coordinates according scaling!
		  If GR <> Nil Then
		    Me.GR.ForeColor = vRectColor
		    
		    Dim xi1, yi1, xi2, yi2 as integer
		    xi1 = Me.XAxis.Transfer(x1)
		    xi2 = Me.XAxis.Transfer(x2)
		    yi1 = Me.YAxis.Transfer(y1)
		    yi2 = Me.YAxis.Transfer(y2)
		    
		    Me.GR.DrawRect(xi1, yi1, xi2-xi1, yi2-yi1)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawRect(X1 as double, Y1 as double, X2 as double, Y2 as double, vRectColor as Color, vPenWidth as integer)
		  // draws a rectangle with the given coordinates according scaling!
		  If GR <> Nil Then
		    Me.GR.PenWidth = vPenWidth
		    Me.DrawRect(X1, Y1, X2, Y2, vRectColor)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawScales()
		  // Redraws x and y scale
		  
		  Dim Rx,Ry as double
		  Dim x1,y1,n as integer
		  Dim vFormat as string
		  
		  
		  Me.GR.forecolor=Me.BG_Color
		  Me.GR.fillrect 0,0,Me.W,Me.H
		  
		  Me.x0=Me.G_Left
		  Me.y0=Me.H-Me.G_lo
		  Me.w0=Me.W-Me.G_Left-Me.G_right
		  Me.h0=Me.H-Me.G_lo-Me.G_up
		  
		  Me.XAxis.CalcTransferFunction(Me.x0,Me.w0)
		  Me.YAxis.CalcTransferFunction(Me.y0,-Me.h0)
		  
		  Me.GR.ForeColor=Me.FG_Color
		  Me.GR.TextSize=10
		  
		  if Me.XAxis.StepD.GIAD>1 then
		    vFormat="-####"
		  else
		    if Me.XAxis.StepD.GIAD>0.1 then
		      vFormat="-###.0"
		    else
		      if Me.XAxis.StepD.GIAD>0.01 then
		        vFormat="-##.00"
		      else
		        vFormat="-#.000"
		      end
		    end
		  end
		  
		  y1=Me.y0-Me.h0
		  Rx=XAxis.StartD.GIAD
		  n=0
		  while (Rx<=(1.000001*Me.XAxis.EndD.GIAD)) and (n<100)
		    x=Me.XAxis.Transfer(Rx)
		    me.GR.DrawingColor = &cD8D8D8
		    Me.GR.DrawLine(x,Me.y0,x,y1)
		    me.GR.DrawingColor = FG_Color
		    Me.GR.DrawString(Format(Rx,vFormat),x-10,Me.y0+15)
		    Rx=Rx+Me.XAxis.StepD.GIAD
		    n=n+1
		  wend
		  
		  if Me.YAxis.StepD.GIAD>1 then
		    vFormat="-####"
		  else
		    if Me.YAxis.StepD.GIAD>0.1 then
		      vFormat="-###.0"
		    else
		      if Me.YAxis.StepD.GIAD>0.01 then
		        vFormat="-##.00"
		      else
		        vFormat="-#.000"
		      end
		    end
		  end
		  
		  x1=Me.x0+Me.w0
		  n=0
		  Ry=Me.YAxis.StartD.GIAD
		  GR.PenWidth=1
		  while (Ry<(1.0000001*Me.YAxis.EndD.GIAD)) and (n<100)
		    y=Me.YAxis.Transfer(Ry)
		    me.GR.DrawingColor = &cD8D8D8
		    Me.GR.DrawLine(Me.x0,y,x1,y)
		    me.GR.DrawingColor = FG_Color
		    Me.GR.DrawString(Format(Ry,vFormat),Me.x0-30,y+5)
		    Ry=Ry+Me.YAxis.StepD.GIAD
		    n=n+1
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawString(vText as string, x as integer, y as integer, vColor as color, vSize as integer)
		  If GR <> Nil Then
		    Me.GR.ForeColor = vColor
		    Me.GR.TextSize = vSize
		    Me.GR.DrawString(vText, x, y)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawValues()
		  // draws all included XYCurves
		  if mHMIGraphClass<>nil then
		    Dim LS as BasicClass = mHMIGraphClass.FirstSubStep
		    
		    Self.DrawChart
		    while LS <> nil
		      if LS IsA XYCurve_StepClass then
		        XYCurve_StepClass(LS).DrawCurve(self)
		        
		        Dim xyCurve as XYCurve_StepClass = XYCurve_StepClass(LS)
		        Call xyCurve.SetLayerMBS(Self.XYChart)
		        
		      end
		      LS = LS.NextStep
		    wend
		    
		    GR.ClearRectangle 0,0,GR.Width,GR.Height
		    GR.DrawPicture GetChart.makeChartPicture, 0, 0
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Find_X_on_Line(y3 as integer, x1 as integer, y1 as integer, x2 as integer, y2 as integer) As integer
		  if (y2-y1)=0 then
		    return 0
		  else
		    return x1+(y3-y1)*(x2-x1)/(y2-y1)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetChart() As CDXYChartMBS
		  return XYChart
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init(vTitle as string, vX as integer, vY as integer, vW as integer, vH as integer, vBG as color, vFG as color)
		  #Pragma Unused vX
		  #Pragma Unused vY
		  
		  Me.Title = vTitle
		  Me.X = 0
		  Me.Y = 0
		  Me.W = vW
		  Me.H = vH
		  
		  Me.BG_Color = vBG
		  Me.FG_Color = vFG
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGraphics(g As Graphics)
		  GR = g
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetScale(Axis as integer, T as string, X1 as double, X2 as double, Xs as double)
		  Select case Axis
		  case 0
		    if Me.XAxis <> nil then
		      Me.XAxis.SetScale(T, X1, X2, Xs)
		    end
		  case 1
		    if Me.YAxis <> nil then
		      Me.YAxis.SetScale(T, X1, X2, Xs)
		    end
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  if Me.GR <> nil then
		    if Me.NoRedraw then
		      Me.UpdateValues
		    else
		      Me.Draw
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateValues()
		  // draws all included XYCurves
		  if mHMIGraphClass <> Nil Then
		    Dim LS as BasicClass = mHMIGraphClass.FirstSubStep
		    
		    DrawChart
		    while LS <> nil
		      
		      if LS IsA XYCurve_StepClass then
		        XYCurve_StepClass(LS).DrawCurve(self)
		        
		        Dim xyCurve as XYCurve_StepClass = XYCurve_StepClass(LS)
		        Call xyCurve.SetLayerMBS(Self.XYChart)
		        
		      end
		      
		      LS = LS.NextStep
		    wend
		    
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Zoom(Mode as integer, vX as integer, vY as integer)
		  Select case Mode
		  case 0
		    Me.ZoomX1=vX
		    Me.ZoomY1=vY
		  case 1
		    Me.ZoomX2=vX
		    Me.ZoomY2=vY
		    if (abs(Me.ZoomX2-Me.ZoomX1)>0) and (Me.W>0) then
		      Me.XAxis.Zoom(Mode,(Me.ZoomX1-Me.X)/Me.W,(Me.ZoomX2-Me.X)/Me.W)
		      Me.YAxis.Zoom(Mode,(Me.H-Me.ZoomY2+Me.Y)/Me.H,(Me.H-Me.ZoomY1+Me.Y)/Me.H)
		      'Me.Draw
		    end
		  case 2
		    Me.XAxis.Zoom(Mode,0,0)
		    Me.YAxis.Zoom(Mode,0,0)
		    'Me.Draw
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BG_Color As color = &cF8F8F8
	#tag EndProperty

	#tag Property, Flags = &h0
		Canvas As HMI_Canvas = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FG_Color As color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		GR As Graphics = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		H As Integer = 100
	#tag EndProperty

	#tag Property, Flags = &h0
		h0 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHMIGraphClass As Graph_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NoRedraw As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		Title As string
	#tag EndProperty

	#tag Property, Flags = &h0
		W As Integer = 100
	#tag EndProperty

	#tag Property, Flags = &h0
		w0 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		X As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		x0 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		XAxis As ScaleClass
	#tag EndProperty

	#tag Property, Flags = &h0
		XYChart As CDXYChartMBS = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		XYPointLabel() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Y As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		y0 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		YAxis As ScaleClass
	#tag EndProperty

	#tag Property, Flags = &h0
		ZoomX1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ZoomX2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ZoomY1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ZoomY2 As Integer
	#tag EndProperty


	#tag Constant, Name = G_Left, Type = Double, Dynamic = False, Default = \"40", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"40"
	#tag EndConstant

	#tag Constant, Name = G_lo, Type = Double, Dynamic = False, Default = \"20", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"20"
	#tag EndConstant

	#tag Constant, Name = G_Right, Type = Double, Dynamic = False, Default = \"15", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"15"
	#tag EndConstant

	#tag Constant, Name = G_up, Type = Double, Dynamic = False, Default = \"10", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"10"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="BG_Color"
			Visible=false
			Group="Behavior"
			InitialValue="&cF8F8F8"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FG_Color"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="H"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="h0"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NoRedraw"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
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
			Name="Title"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="W"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="w0"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="X"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="x0"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Y"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="y0"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZoomX1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZoomX2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZoomY1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZoomY2"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
