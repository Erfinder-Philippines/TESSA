#tag Class
Protected Class Graph_StepClass
Inherits HMI_StepClass
	#tag Method, Flags = &h0
		Sub AutoScale()
		  // does perform an autoscale for all values
		  Dim n as integer
		  Dim LXY as XYCurve_StepClass = XYCurve_StepClass(FirstSubStep)
		  while LXY <> nil
		    if LXY = FirstSubStep then
		      n = 0
		    else
		      n = 1
		    end
		    LXY.FindMinMax(n,self)
		    LXY = XYCurve_StepClass(LXY.NextStep)
		  wend
		  
		  if Me.XAxis.DoAutoScale(Me.Xmin,Me.Xmax) then
		  end
		  if Me.YAxis.DoAutoScale(Me.Ymin,Me.Ymax) then
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.ForegroundColor = Me.IAC("ForegroundColor", "&cF8F8F8", false, AttributeGroups.Appearance)
		  
		  XAxis=new ScaleClass
		  YAxis=new ScaleClass
		  
		  Me.XAxis.StartD=Me.IAD("XStart",0,False)
		  Me.XAxis.EndD=Me.IAD("XEnd",10,False)
		  Me.XAxis.StepD=Me.IAD("XStep",1,False)
		  Me.XAxis.Title=Me.IAS("XTitle","X-Achse",False, AttributeGroups.Appearance)
		  Me.XAxis.AutoScale=Me.IAB("XAutoScale",False,False, AttributeGroups.Appearance)
		  
		  Me.YAxis.StartD=Me.IAD("YStart",0,False)
		  Me.YAxis.EndD=Me.IAD("YEnd",10,False)
		  Me.YAxis.StepD=Me.IAD("YStep",1,False)
		  Me.YAxis.Title=Me.IAS("YTitle","Y-Achse",False, AttributeGroups.Appearance)
		  Me.YAxis.AutoScale=Me.IAB("YAutoScale",False,False, AttributeGroups.Appearance)
		  
		  Coordinates.SetCoordinateValues(20, 0, 20, 300, 200)
		  Coordinates.EnableOffset = False
		  mMinimalHeight = 150
		  mMinimalWidth = 200
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return new HMI_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGraphChart() As CDXYChartMBS
		  If mHMIGraph <> Nil Then
		    Return mHMIGraph.GetChart
		  End If
		  
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getXPoints() As Integer()
		  return mHMIGraph.canvasXPoints
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getXYLabel(i as Integer) As String
		  if mHMIGraph.XYPointLabel.LastRowIndex <> -1 then
		    return mHMIGraph.XYPointLabel(i)
		  Else
		    return ""
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getYPoints() As Integer()
		  return mHMIGraph.canvasYPoints
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // Send init to all included elements
		  Super.Init_Teststep_Start
		  
		  Dim LS as BasicClass = FirstSubStep
		  while LS<>nil
		    if LS isA XYCurve_StepClass then
		      XYCurve_StepClass(LS).Step_Init
		    end
		    LS = LS.NextStep
		  wend
		  UpdateHMI
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode as Integer)
		  // Calling the overridden superclass method.
		  Super.Paint(g, mode)
		  // redraw on HMI graph
		  if App.HMI_Active And mUIUpdater <> Nil And Coordinates.GIAS <> "" then
		    if mHMIGraph = nil then
		      mHMIGraph = new GraphClass(self, Me.XAxis,Me.YAxis)
		    end
		    if mHMIGraph <> Nil And g <> Nil Then
		      mHMIGraph.SetGraphics(g)
		      mHMIGraph.Init(Me.Title.GIAS, 0, 0, g.Width, g.Height, ForegroundColor.GIAC, TextColor.GIAC)
		      if Me.XAxis <> nil then
		        mHMIGraph.SetScale(0, Me.XAxis.Title.GIAS, Me.XAxis.StartD.GIAD, Me.XAxis.EndD.GIAD, Me.XAxis.StepD.GIAD)
		      end
		      if Me.YAxis<>nil then
		        mHMIGraph.SetScale(1, Me.YAxis.Title.GIAS, Me.YAxis.StartD.GIAD, Me.YAxis.EndD.GIAD, Me.YAxis.StepD.GIAD)
		      end
		      mHMIGraph.Draw
		      mHMIGraph.Update
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode as Integer, vX as Integer, vY as Integer)
		  // Calling the overridden superclass method.
		  Super.Paint(g, mode)
		  // redraw on HMI graph
		  if App.HMI_Active And mUIUpdater <> Nil And Coordinates.GIAS <> "" then
		    if mHMIGraph = nil then
		      mHMIGraph = new GraphClass(self, Me.XAxis,Me.YAxis)
		    end
		    if mHMIGraph <> Nil And g <> Nil Then
		      mHMIGraph.SetGraphics(g)
		      mHMIGraph.Init(Me.Title.GIAS, 0, 0, g.Width, g.Height, ForegroundColor.GIAC, TextColor.GIAC)
		      mHMIGraph.Zoom(mode, vX, vy)
		      if Me.XAxis <> nil then
		        mHMIGraph.SetScale(0, Me.XAxis.Title.GIAS, Me.XAxis.StartD.GIAD, Me.XAxis.EndD.GIAD, Me.XAxis.StepD.GIAD)
		      end
		      if Me.YAxis<>nil then
		        mHMIGraph.SetScale(1, Me.YAxis.Title.GIAS, Me.YAxis.StartD.GIAD, Me.YAxis.EndD.GIAD, Me.YAxis.StepD.GIAD)
		      end
		      'mHMIGraph.Draw
		      mHMIGraph.Update
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveHMI()
		  If App.HMI_Active Then
		    mHMIGraph = Nil
		    Super.RemoveHMI
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_HMI_Init()
		  if App.HMI_Active And Coordinates.GIAS <> "" then
		    if mHMIGraph = nil then
		      mHMIGraph = new GraphClass(self, Me.XAxis,Me.YAxis)
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  
		  if Visible.GIAB then mUIUpdater.UpdateCanvas(1)
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub trackLineLegend(mouseX as integer, mousey as Integer)
		  If mHMIGraph = Nil Then Return
		  
		  dim c as CDXYChartMBS = mHMIGraph.GetChart
		  
		  // Clear the current dynamic layer and get the DrawArea object to draw on it.
		  dim d as CDDrawAreaMBS = c.initDynamicLayer
		  
		  // The plot area object
		  dim plotArea AS CDPlotAreaMBS = c.getPlotArea
		  
		  
		  // check if we are outside the plotArea
		  if mousex<plotArea.getLeftX   then Return
		  if mousey<plotArea.getTopY    then Return
		  if mousex>plotArea.getRightX  then Return
		  if mousey>plotArea.getBottomY then Return
		  // Get the data x-value that is nearest to the mouse, and find its pixel coordinate.
		  dim xValue as double = c.getNearestXValue(mouseX)
		  dim xCoor as integer = c.getXCoor(xValue)
		  
		  dim boxLeft as integer = c.getXCoor(xValue - 0.5)
		  dim boxRight as integer = c.getXCoor(xValue + 0.5)
		  
		  // If the box is very thin, it is an XY Point, else it is a Bargraph
		  If (boxRight - boxLeft) >= 5 then 
		    trackLineLegend(mouseX,mousey, True)
		    Return
		  End If
		  
		  // Draw a vertical track line at the x-position
		  d.vline(plotArea.getTopY, plotArea.getBottomY, xCoor, d.dashLineColor(&h000000, &h0101))
		  
		  dim t as CDTTFTextMBS
		  // Iterate through all layers to draw the data labels
		  dim u as integer = c.getLayerCount-1
		  for i as integer = 0 to u
		    dim layer as CDLayerMBS = c.getLayerByZ(i)
		    
		    // The data array index of the x-value
		    dim xIndex as integer = layer.getXIndexOf(xValue)
		    
		    // Iterate through all the data sets in the layer
		    dim uu as integer = layer.getDataSetCount-1
		    for j as integer = 0 to uu
		      
		      dim dataSet as CDDataSetMBS = layer.getDataSetByZ(j)
		      dim dataSetName as string = dataSet.getDataName
		      
		      // Get the color, name and position of the data label
		      dim colorvalue as integer = dataSet.getDataColor
		      dim yCoor as integer = c.getYCoor(dataSet.getPosition(xIndex), dataSet.getUseYAxis)
		      
		      // Draw a track dot with a label next to it for visible data points in the plot area
		      if ((yCoor >= plotArea.getTopY) and (yCoor <= plotArea.getBottomY) and (colorvalue <> CDBaseChartMBS.kTransparent) and dataSetName.len>0) then
		        
		        d.hline(plotArea.getLeftX, plotArea.getRightX,yCoor, d.dashLineColor(&h000000, &h0101))
		        d.circle(xCoor, yCoor, 4, 4, colorvalue, colorvalue)
		        
		        dim label as string
		        dim h as string = hex(colorvalue)
		        while h.len<6
		          h = "0" + h
		        wend
		        label = "<*font,bgColor=" + h + "*> " + c.formatValue(xValue, "{value|P4}, ") + _
		        c.formatValue(dataSet.getValue(xIndex), "{value|P4}") + " <*font*>"
		        t = d.text(label, "arialbd.ttf", 8)
		        
		        // Draw the label on the right side of the dot if the mouse is on the left side the
		        // chart, and vice versa. This ensures the label will not go outside the chart image.
		        if (xCoor <= (plotArea.getLeftX + plotArea.getRightX) / 2) then
		          t.draw(xCoor + 5, yCoor, &hffffff, CDBaseChartMBS.kLeft)
		        else
		          t.draw(xCoor - 5, yCoor, &hffffff, CDBaseChartMBS.kRight)
		          
		          t.destroy
		        end if
		      end if
		    next
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub trackLineLegend(mouseX as integer, mousey as Integer, isBarGraph as Boolean)
		  #Pragma isBarGraph
		  
		  If mHMIGraph = Nil Then Return
		  
		  dim c as CDXYChartMBS = mHMIGraph.GetChart
		  
		  // Clear the current dynamic layer and get the DrawArea object to draw on it.
		  dim d as CDDrawAreaMBS = c.initDynamicLayer
		  
		  // The plot area object
		  dim plotArea as CDPlotAreaMBS = c.getPlotArea
		  
		  
		  // check if we are outside the plotArea
		  if mousex<plotArea.getLeftX   then Return
		  if mousey<plotArea.getTopY    then Return
		  if mousex>plotArea.getRightX  then Return
		  if mousey>plotArea.getBottomY then Return
		  
		  // Get the data x-value that is nearest to the mouse
		  dim xValue as double = c.getNearestXValue(mouseX)
		  
		  // Compute the position of the box. This example assumes a label based x-axis, in which the
		  // labeling spacing is one x-axis unit. So the left and right sides of the box is 0.5 unit from
		  // the central x-value.
		  dim boxLeft as integer = c.getXCoor(xValue - 0.5)
		  dim boxRight as integer = c.getXCoor(xValue + 0.5)
		  dim boxTop as integer = plotArea.getTopY
		  dim boxBottom as integer = plotArea.getBottomY
		  
		  // Draw the track box
		  d.rect(boxLeft, boxTop, boxRight, boxBottom, &h000000, CDBaseChartMBS.kTransparent)
		  
		  // Container to hold the legend entries
		  dim legendEntries() as string
		  
		  // Iterate through all layers to build the legend array
		  dim u as integer = c.getLayerCount-1
		  for i as integer = 0 to u
		    dim layer as CDLayerMBS = c.getLayerByZ(i)
		    
		    // The data array index of the x-value
		    dim xIndex as integer = layer.getXIndexOf(xValue)
		    
		    // Iterate through all the data sets in the layer
		    dim uu as integer = layer.getDataSetCount-1
		    for j as integer = 0 to uu
		      dim dataSet as CDDataSetMBS = layer.getDataSetByZ(j)
		      
		      // Build the legend entry, consist of the legend icon, the name and the data value.
		      dim dataValue as double = dataSet.getValue(xIndex)
		      if ((dataValue <> CDBaseChartMBS.kNoValue) and (dataSet.getDataColor <> CDBaseChartMBS.kTransparent)) then
		        dim legendEntry as string
		        legendEntry = dataSet.getLegendIcon + " " + dataSet.getDataName + ": " + c.formatValue(dataValue, "{value|P4}")
		        legendEntries.Append legendEntry
		      end if
		    next
		  next
		  
		  // Create the legend by joining the legend entries
		  if UBound(legendEntries) >= 0 then
		    dim legend as string
		    legend = "<*block,bgColor=FFFFCC,edgeColor=000000,margin=5*><*font,underline=1*>" + c.xAxis.getFormattedLabel(xValue) + "<*/font*>"
		    for i as integer = UBound(legendEntries) downto 0
		      legend = legend + "<*br*>" + legendEntries(i)
		    next
		    legend = legend + "<*/*>"
		    
		    // Display the legend at the bottom-right side of the mouse cursor, and make sure the legend
		    // will not go outside the chart image.
		    dim t as CDTTFTextMBS = d.text(legend, "arialbd.ttf", 8)
		    t.draw(min(mouseX + 12, c.getWidth - t.getWidth), min(mouseY + 18, c.getHeight - t.getHeight), &h000000, CDBaseChartMBS.kTopLeft)
		    t.destroy
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateHMI()
		  If App.HMI_Active then
		    mUIUpdater.UpdateCanvas(1)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Zoom(Mode as integer, vX as integer, vY as integer)
		  If mHMIGraph <> Nil Then
		    mHMIGraph.Zoom(Mode, vX, vY)
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ForegroundColor As Color_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mHMIGraph As GraphClass
	#tag EndProperty

	#tag Property, Flags = &h0
		XAxis As ScaleClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Xmax As double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Xmin As double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		YAxis As ScaleClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Ymax As double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Ymin As double = 0
	#tag EndProperty


	#tag Constant, Name = G_Left, Type = Double, Dynamic = False, Default = \"40", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"40"
	#tag EndConstant

	#tag Constant, Name = G_lo, Type = Double, Dynamic = False, Default = \"20", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"20"
	#tag EndConstant

	#tag Constant, Name = G_Right, Type = Double, Dynamic = False, Default = \"20", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"20"
	#tag EndConstant

	#tag Constant, Name = G_up, Type = Double, Dynamic = False, Default = \"10", Scope = Public
		#Tag Instance, Platform = Any, Language = Default, Definition  = \"10"
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
	#tag EndViewBehavior
End Class
#tag EndClass
