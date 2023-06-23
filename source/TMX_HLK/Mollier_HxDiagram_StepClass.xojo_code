#tag Class
Protected Class Mollier_HxDiagram_StepClass
Inherits Graph_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.XAxis.StartD.SIAD(0)
		  Me.XAxis.EndD.SIAD(20)
		  Me.XAxis.StepD.SIAD(1)
		  Me.XAxis.Title.SIAS("Absolute Humidity (g/kg)")
		  Me.XAxis.AutoScale.SIAB(False)
		  
		  Me.YAxis.StartD.SIAD(-20)
		  Me.YAxis.EndD.SIAD(50)
		  Me.YAxis.StepD.SIAD(1)
		  Me.YAxis.Title.SIAS("Temperature (°C)")
		  Me.YAxis.AutoScale.SIAB(False)
		  
		  Self.Title.SIAS("Mollier hx Diagramm")
		  
		  BaroPressure = IAD("BaroPressure",1028,False)
		  'ScaleAbsoluteHumidityMin = IAD("Scale_AbsoluteHumidity_Min",0,False)
		  'ScaleAbsoluteHumidityMax = IAD("Scale_AbsoluteHumidity_Max",20,False)
		  'ScaleTemperatureMin = IAD("Scale_Temperature_Min",-20,False)
		  'ScaleTemperatureMax = IAD("Scale_Temperature_Max",50,False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return New HMI_MollierHxDiagram_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawEnthalpy(c as CDXYChartMBS)
		  Const rh = 100
		  Dim inc As Integer = 2
		  
		  Dim tempMin As Double = Self.YAxis.StartD.GIAD
		  Dim tempMax As Double = Self.YAxis.EndD.GIAD
		  Dim x_axisMin As Double = Self.XAxis.StartD.GIAD
		  'Dim x_axisMax As Double = ScaleAbsoluteHumidityMax.GIAD
		  Dim P as Double = BaroPressure.GIAD
		  
		  For t As Integer = tempMin + inc To tempMax Step inc
		    Dim xData() As Double
		    Dim yData() As Double
		    
		    Dim enthalpy As Double = Entaplie(P, t, rh)
		    
		    Dim x As Double = Humid_X(P, t, rh) * 1000
		    xData.Add(x)
		    yData.Add(t)
		    
		    xData.Add(x_axisMin)
		    // Assume temperature scale == enthalpy scale
		    yData.Add(enthalpy)
		    
		    // Add a line layer to the chart
		    Dim layer As CDLineLayerMBS
		    layer = c.addSplineLayer
		    layer.setXData(xData)
		    // Set the line width to 1 pixel
		    layer.setLineWidth(1)
		    
		    // Add the three data sets to the line layer, using circles, diamands and X
		    // shapes as symbols
		    Dim dataset As CDDataSetMBS
		    dataset = layer.addDataSet(yData, &hcccccc, "Enthalpy: " + Str(enthalpy) + " kJ/kg" )
		    // dataset.setDataSymbol(c.kCircleSymbol, 3)
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawPoints(c as CDXYChartMBS)
		  Self.PointsLayer.RemoveAll
		  
		  Dim xValues() as Double
		  Dim yValues() as Double
		  
		  Dim LS as BasicClass = Self.FirstSubStep
		  while LS <> nil
		    
		    if LS IsA XYCurve_StepClass then
		      
		      Dim xyCurve as XYCurve_StepClass = XYCurve_StepClass(LS)
		      
		      Dim layer as CDLayerMBS = xyCurve.SetLayerMBS(c)
		      Self.PointsLayer.Add(layer)
		      
		    end
		    
		    LS = LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawRelativeHumidity(c as CDXYChartMBS)
		  Dim tempMin As Double = Self.YAxis.StartD.GIAD
		  Dim tempMax As Double = Self.YAxis.EndD.GIAD
		  Dim x_axisMin As Double = Self.XAxis.StartD.GIAD
		  'Dim x_axisMax As Double = ScaleAbsoluteHumidityMax.GIAD
		  Dim P as Double = BaroPressure.GIAD
		  
		  For rh As Integer = 10 To 100 Step 10
		    Dim xData() As Double
		    Dim yData() As Double
		    
		    For t As Integer = tempMin To tempMax Step 5
		      xData.Add(Humid_X(P, t, rh) * 1000)
		      yData.Add(t)
		    Next
		    
		    // Add a line layer to the chart
		    Dim layer As CDLineLayerMBS
		    layer = c.addSplineLayer
		    layer.setXData(xData)
		    // Set the line width to 1 pixel
		    layer.setLineWidth(1)
		    
		    Dim dataset As CDDataSetMBS
		    dataset = layer.addDataSet(yData, &c3366ff, "Relative Humidity: " + Str(rh) + "%")
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGraphChart() As CDXYChartMBS
		  Return Chart
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetLabelString(X as Double, Y as Double, labelTxtColor as String) As String
		  Dim enthalpyStep as New HLKModule.Enthalpy_StepClass("")
		  
		  Dim P as Double = Self.BaroPressure.GIAD
		  Dim temperature as Double = Round2Dec(Y)
		  
		  // Calculate the rest
		  Dim relativeHum as Double = Round2Dec(HLKModule.RelativeHumidity(P, temperature, X))
		  
		  enthalpyStep.Humidity.SIAD(relativeHum)
		  enthalpyStep.Temperature.SIAD(Y) // do not use rounded temperature
		  enthalpyStep.BaroPressure.SIAD(P)
		  enthalpyStep.Calculate
		  
		  Dim absHum as Double = Round2Dec(X)
		  Dim enthalpy As Double = Round2Dec(enthalpyStep.Enthalpy.GIAD)
		  Dim density As Double = Round2Dec(enthalpyStep.AirDensity.GIAD)
		  
		  Dim label as String
		  label = "<*font,bgColor=" + labelTxtColor + "*>" + _
		  "Absolute Humidity: " +Str(absHum)+ " g/kg<*br*>"  + _
		  "Temperature: " + Str(temperature) +" °C<*br*>" + _
		  "Relative Humidity: " + Str(relativeHum) +" %<*br*>" + _
		  "Enthalpy: " + Str(enthalpy) + " kJ/kg<*br*>" + _
		  "Density: " + Str(density) +" kg/m³<*br*>" + _
		  "<*font*>"
		  
		  Return label
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // this routne is being called from an upper Test_StepClass when it proceeds it's start procedure
		  mUIUpdater.UpdateCanvas(0)
		  Super.Init_Teststep_Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode as Integer)
		  // Overridden Method
		  
		  If g = Nil Then
		    Return
		  End If
		  
		  RedrawChart(g.Width, g.Height)
		  g.DrawPicture(chartPic, 0,0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode as Integer, vX as Integer, vY as Integer)
		  // Overridden Method
		  
		  If g = Nil Then
		    Return
		  End If
		  
		  RedrawChart(g.Width, g.Height)
		  g.DrawPicture(chartPic, 0,0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RedrawChart(width as Double, height as Double)
		  Dim c As New CDXYChartMBS(width, height)
		  Self.Chart = c
		  
		  call c.addTitle(Self.Title.GIAS, "bold", 18)
		  Call c.setPlotArea(60, 30, width - 120, height - 100).setGridColor(&hcccccc, &hcccccc)
		  Call c.setClipping
		  
		  c.xAxis.setWidth(2)
		  c.yAxis.setWidth(2)
		  
		  // Absolute Humidity
		  c.xAxis.setLinearScale(Self.XAxis.StartD.GIAD, Self.XAxis.EndD.GIAD)
		  c.xAxis.setRounding(False, False)
		  c.xAxis.setLabelStep(Self.XAxis.StepD.GIAD)
		  Call c.xAxis.setTitle(Self.XAxis.Title.GIAS).setAlignment(CDXYChartMBS.kBottomCenter)
		  
		  // Temperature
		  c.yAxis.setLinearScale(Self.YAxis.StartD.GIAD, Self.YAxis.EndD.GIAD)
		  c.yAxis.setRounding(False, False)
		  c.xAxis.setLabelStep(Self.YAxis.StepD.GIAD)
		  Call c.yAxis.setTitle(Self.YAxis.Title.GIAS).setAlignment(CDXYChartMBS.kLeft)
		  
		  // Points
		  DrawPoints(c)
		  
		  // Relative Humidity curves
		  DrawRelativeHumidity(c)
		  
		  // Enthalpy lines
		  DrawEnthalpy(c)
		  
		  // Output the chart
		  chartPic = c.makeChartPicture
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMollierAxes(c As CDXYChartMBS)
		  // This method applies the enthalpy lines, and relative humidity curves
		  If c = Nil Then
		    Return
		  End If
		  
		  DrawEnthalpy(c)
		  DrawRelativeHumidity(c)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  
		  // find ReportTab
		  Dim RT as ReportTabClass = TabManager.GetReportTabClass
		  if RT<>nil then
		    'Dim TC as ContainerControl = RT.TabContainer
		    'if (TC<>nil) and (TC IsA ReportTabCOntainer) then
		    'Dim RTC as ReportTabContainer = ReportTabContainer(TC)
		    '// link the filter selection
		    'FilterSelection.ConnectLink(RTC.FilterSelection)
		    'end
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Me.Step_Init
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  // find ReportTab
		  Dim RT as ReportTabClass = TabManager.GetReportTabClass
		  if RT<>nil then
		    'Dim TC as TabContainer = RT.TabContainer
		    'if (TC<>nil) and (TC IsA ReportTabCOntainer) then
		    'Dim RTC as ReportTabContainer = ReportTabCOntainer(TC)
		    '// set filter selection
		    'RTC.FilterSelection.SIAI(FilterSelection.GIAI)
		    '
		    '// perform a search
		    'RTC.Search_Testreports
		    '
		    '// copy results into result window
		    'Value.SIAS(RTC.OverViewReport.Text)
		    '
		    'end
		  End
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TrackLineLegend(c as CDXYChartMBS, X as Integer, Y as Integer)
		  // Overridden Method
		  
		  If c Is Nil Then
		    Return
		  End If
		  
		  // Clear the current dynamic layer and get the DrawArea object to draw on it.
		  Dim d As CDDrawAreaMBS = c.initDynamicLayer
		  
		  // The plot area object
		  Dim plotArea As CDPlotAreaMBS = c.getPlotArea
		  
		  // check if we are outside the plotArea
		  If X<plotArea.getLeftX   Then Return
		  If Y<plotArea.getTopY    Then Return
		  If X>plotArea.getRightX  Then Return
		  If Y>plotArea.getBottomY Then Return
		  
		  Dim pointFound As Boolean = False
		  Dim t As CDTTFTextMBS
		  
		  // POSSIBLE OPTIMIZATION:
		  // Separate array reference for relevant layers
		  'Dim layer As CDLayerMBS = Self.PointsLayer 'c.getLayerByZ(i)
		  
		  For each layer as CDLayerMBS in Self.PointsLayer
		    If layer = Nil Then
		      Continue
		    End If
		    
		    // Get the data x-value that is nearest to the mouse, and find its pixel coordinate.
		    Dim xValue As Double = layer.getNearestXValue(X)
		    Dim xCoor As Integer = c.getXCoor(xValue)
		    
		    // The data array index of the x-value
		    Dim xIndex As Integer = layer.getXIndexOf(xValue)
		    
		    // Iterate through all the data sets in the layer
		    
		    Dim dataSet As CDDataSetMBS = layer.getDataSetByZ(0)
		    Dim dataSetName As String = dataSet.getDataName
		    
		    // Get the color, name and position of the data label
		    Dim colorvalue As Integer = dataSet.getDataColor
		    Dim yCoor As Integer = c.getYCoor(dataSet.getPosition(xIndex), dataSet.getUseYAxis)
		    // Draw a track dot with a label next to it for visible data points in the plot area
		    If ((yCoor >= plotArea.getTopY) And (yCoor <= plotArea.getBottomY) And (colorvalue <> CDBaseChartMBS.kTransparent) And dataSetName.Len>0) Then
		      
		      pointFound = True
		      
		      d.hline(plotArea.getLeftX, plotArea.getRightX,yCoor, d.dashLineColor(&h000000, &h0101))
		      
		      Dim label As String
		      Dim h As String = Hex(000000)
		      While h.Len<6
		        h = "0" + h
		      Wend
		      
		      Dim yValue as Double = dataSet.getValue(xIndex)
		      label = GetLabelString(xValue, yValue, h)
		      
		      t = d.Text(label, "", 10)
		      
		      // Draw a vertical track line at the x-position
		      d.vline(plotArea.getTopY, plotArea.getBottomY, xCoor, d.dashLineColor(&h000000, &h0101))
		      d.circle(xCoor, yCoor, 6, 6, colorvalue, colorvalue)
		      
		      // Draw the label on the right side of the dot if the mouse is on the left side the
		      // chart, and vice versa. This ensures the label will not go outside the c image.
		      If (xCoor <= (plotArea.getLeftX + plotArea.getRightX) / 2) Then
		        t.draw(xCoor + 10, yCoor, &hffffff, CDBaseChartMBS.kLeft)
		      Else
		        t.draw(xCoor - 10, yCoor, &hffffff, CDBaseChartMBS.kRight)
		        
		        t.destroy
		      End If
		    End If
		  Next
		  
		  if pointFound then
		    Dim p as Picture = c.makeChartPicture
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BaroPressure As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Chart As CDXYChartMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private chartPic As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PointsLayer() As CDLayerMBS
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Xmax"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Xmin"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ymax"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Ymin"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
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
