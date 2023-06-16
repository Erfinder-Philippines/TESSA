#tag Class
Protected Class ViewportCanvas
Inherits Canvas
	#tag Event
		Sub Open()
		  Me.viewport=New CDViewPortManagerMBS
		  
		  viewport.setViewPortHeight 1
		  viewport.setViewPortTop 0
		  viewport.setViewPortWidth 1
		  viewport.setViewPortLeft 0
		  
		  'viewport.setZoomInWidthLimit 0.001
		  'viewport.setZoomInHeightLimit 0.01
		  'viewport.setZoomOutWidthLimit 0.2
		  'viewport.setZoomOutHeightLimit 1.0
		  
		  // for the selection box
		  rectanglePicture = New Picture(32,32,32)
		  rectanglePicture.Graphics.ForeColor = &c2589FF
		  rectanglePicture.Graphics.FillRect 0,0,32,32
		  rectanglePicture.mask.Graphics.ForeColor = &cCCCCCC
		  rectanglePicture.mask.Graphics.FillRect 0,0,32,32
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub checkZoomMode()
		  'If ZoomMode = 0 Then
		  'AllowZoom = False
		  'AllowMove = True
		  'Else
		  'AllowZoom = True
		  'AllowMove = False
		  'End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CleanUp()
		  // Finalize redraw
		  Me.rectangleWidth = 0
		  Me.Invalidate
		  Me.NeedClear = False
		  Me.Overlay = Nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EventMouseDown(X as Integer, Y as Integer)
		  isMouseDown = True
		  
		  If allowMove And (Not (Keyboard.AsyncAltKey Or ZoomMode <> 0)) And (Not (Keyboard.AsyncShiftKey Or ZoomMode <> 0)) Then
		    Me.MouseCursor=System.Cursors.HandClosed
		    StartX=X
		    StartY=Y
		    viewport.startDrag
		    
		  else
		    // zoom
		    
		    StartX=X
		    StartY=Y
		    StartX2=X
		    StartY2=Y
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EventMouseDrag(X as Integer, Y as Integer)
		  showTrackingCursor = False
		  If (Not (Keyboard.AsyncShiftKey Or ZoomMode <> 0)) And (Not (Keyboard.AsyncAltKey Or ZoomMode <> 0)) And allowMove Then
		    If viewport.dragTo(CDBaseChartMBS.kDirectionHorizontalVertical, StartX - X, Y - StartY) Then
		      redraw
		    end if
		  else
		    StartX2=X
		    StartY2=Y
		    
		    dim l,t as integer
		    dim w,h as integer
		    
		    l=min(StartX,StartX2)
		    t=min(StartY,StartY2)
		    w=StartX2-StartX
		    h=StartY2-StartY
		    If w<0 Then w=-w
		    if h<0 then h=-h
		    
		    // trigger refresh
		    RectangleTop = t
		    rectangleLeft = l
		    rectangleWidth = w
		    rectangleHeight = h
		    me.Invalidate
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EventMouseMove(X as Integer, Y as Integer)
		  myCanvasMouseX = X
		  myCanvasMouseY = Y
		  
		  If (AllowZoom = True) And (Keyboard.AsyncOptionKey = True Or ZoomMode = 1 ) Then
		    
		    // Zoom In
		    MouseCursor = System.Cursors.MagnifyLarger
		    CleanUp  // Finalize redraw
		    
		  ElseIf (AllowZoom = True) And (Keyboard.AsyncShiftKey = True Or ZoomMode = 2) Then
		    
		    // Zoom Out
		    MouseCursor = System.Cursors.MagnifySmaller
		    CleanUp  // Finalize redraw
		    
		  Else
		    
		    Dim HotSpotID As Integer
		    
		    // Check if over a hotspot; Nil check prevents spurious NilObjectExceptions
		    If (ImageMapHandler <> Nil) Then HotSpotID = ImageMapHandler.getHotSpot(X, Y)
		    
		    If (HotSpotID > 0) Then
		      'cntSymbolLineZoom(window).Timer1.Mode=0
		      RaiseEvent SetKeyboardTimer(0)
		      MouseCursor = System.Cursors.StandardPointer
		      
		      
		    ElseIf (AllowMove = True) Then
		      
		      MouseCursor = System.Cursors.HandOpen
		      CleanUp  // Finalize redraw
		      'cntSymbolLineZoom(window).Timer1.Mode=2
		      RaiseEvent SetKeyboardTimer(2)
		      
		    Else
		      
		      MouseCursor = System.Cursors.StandardPointer
		      CleanUp  // Finalize redraw
		      'cntSymbolLineZoom(window).Timer1.Mode=2
		      RaiseEvent SetKeyboardTimer(2)
		      
		    End If
		    
		  End If
		  
		  HandleTrackLineLegend(X, Y)
		  
		  exception
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EventMouseUp(X as Integer, Y as Integer)
		  Me.rectangleWidth = 0
		  isMouseDown = false
		  showTrackingCursor = True
		  
		  If allowMove And (Not (Keyboard.AsyncAltKey Or ZoomMode = 1)) And (Not (Keyboard.AsyncShiftKey Or ZoomMode = 2)) Then //cntSymbolLineZoom(window).ToolMove.Value then
		    me.MouseCursor=System.Cursors.HandOpen
		  Elseif allowZoom And (Keyboard.AsyncAltKey Or ZoomMode = 1) Then //cntSymbolLineZoom(window).ToolZoomIn.Value then
		    
		    // zoom on point?
		    
		    if abs(X-StartX)<3 and abs(Y-StartY)<3 then
		      
		      // zoom in on point
		      if viewport.canZoomIn(CDBaseChartMBS.kDirectionHorizontalVertical) then
		        if viewport.zoomAt(CDBaseChartMBS.kDirectionHorizontalVertical, x, y, me.zoomInRatio) then
		          currZoom = currZoom / 2
		          redraw
		        end if
		      Else
		        redraw
		        beep
		      end if
		      
		    else
		      
		      // zoom in on a rectangle
		      if viewport.canZoomIn(CDBaseChartMBS.kDirectionHorizontalVertical) then
		        if viewport.zoomTo(CDBaseChartMBS.kDirectionHorizontalVertical, x, y, StartX, StartY) then
		          redraw
		        end if
		      else
		        redraw
		        Beep
		      end if
		    end if
		    
		  Elseif allowZoom And (Keyboard.AsyncShiftKey Or ZoomMode = 2) Then //cntSymbolLineZoom(window).ToolZoomOut.Value then
		    
		    // zoom out on point
		    if viewport.canZoomOut(CDBaseChartMBS.kDirectionHorizontalVertical) then
		      if viewport.zoomAt(CDBaseChartMBS.kDirectionHorizontalVertical, x, y, zoomOutRatio) then
		        currZoom = currZoom * 2
		        redraw
		      end if
		    else
		      redraw
		      beep
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleTrackLineLegend(X as Integer, Y as Integer)
		  If Not showTrackingCursor Then
		    Return
		  End If
		  
		  if mHMIGraphClass <> Nil and c <> Nil Then
		    mHMIGraphClass.TrackLineLegend(c, X, Y)
		    lastpicture = c.makeChartPicture
		    Self.Invalidate(False)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub redraw()
		  If mHMIGraphClass = Nil Then
		    Return
		  End If
		  
		  Dim chartBgColor, plotAreaColor, gridLineColor, labelColor As Integer
		  If darkModeEnabled Then
		    labelColor = &hffffff
		    chartBgColor = &h2D3137
		    plotAreaColor = &h242B31
		    gridLineColor = &h43494D
		  Else
		    labelColor = &h000000
		    chartBgColor = &hF5F6F7
		    plotAreaColor = &hFFFFFF
		    gridLineColor = &hE6E6E6
		  End If
		  
		  viewport.validateViewPort
		  
		  // Init a new Chart for this Canvas
		  c  = New CDXYChartMBS(Me.Width,Me.Height,chartBgColor,CDBaseChartMBS.kTransparent,1)
		  
		  Call c.setPlotArea(45, 55, c.getWidth - 80, c.getHeight - 100, plotAreaColor, -1, CDBaseChartMBS.kTransparent, gridLineColor, gridLineColor)
		  
		  Call c.addTitle(mHMIGraphClass.Title.GIAS, "bold", 18, labelColor)
		  'Call c.addLegend(50, 25, False, "bold", 10).setBackground(CDBaseChartMBS.kTransparent)
		  'Call c.getLegend.setFontColor(labelColor)
		  Call c.xAxis.setLabelStyle("bold", 8,labelColor)
		  Call c.yAxis.setLabelStyle("bold", 8,labelColor)
		  
		  c.xAxis.setColors(CDBaseChartMBS.kTransparent)
		  c.yAxis.setColors(CDBaseChartMBS.kTransparent)
		  If darkModeEnabled Then
		    c.xAxis.setColors(&hffffff,&hffffff)
		    c.yAxis.setColors(&hffffff,&hffffff)
		    c.yAxis2.setColors(&hffffff,&hffffff)
		  End If
		  
		  Call c.setClipping
		  
		  // Set y-axis tick density to 30 pixels. ChartDirector auto-scaling will use this
		  // as the guideline when putting ticks on the y-axis.
		  c.yAxis.setTickDensity(30)
		  c.yAxis2.setTickDensity(30)
		  
		  // scroll
		  Dim axisLowerLimit As Double
		  Dim axisUpperLimit As Double
		  
		  Dim graphMax_X As Double = mHMIGraphClass.XAxis.EndD.Values(0)
		  Dim graphMin_X As Double = mHMIGraphClass.XAxis.StartD.Values(0)
		  Dim graphMax_Y As Double = mHMIGraphClass.YAxis.EndD.Values(0)
		  Dim graphMin_Y As Double = mHMIGraphClass.YAxis.StartD.Values(0)
		  
		  Dim deltaX As Double = graphMax_X - graphMin_X
		  Dim deltaY As Double = graphMax_Y - graphMin_Y
		  
		  axisUpperLimit = graphMax_X - deltaX  * viewport.getViewPortLeft
		  axisLowerLimit = graphMax_X - deltaX * (viewport.getViewPortLeft + viewport.getViewPortWidth)
		  
		  c.xAxis.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.xAxis.setRounding(False, False)
		  
		  axisUpperLimit = graphMax_Y - deltaY  * viewport.getViewPortTop
		  axisLowerLimit = graphMax_Y - deltaY * (viewport.getViewPortTop + viewport.getViewPortHeight)
		  
		  c.yAxis.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.yAxis.setRounding(False, False)
		  c.yAxis2.setLinearScale(axisLowerLimit,axisUpperLimit)
		  c.yAxis2.setRounding(False, False)
		  
		  // Axis steps and title
		  c.xAxis.setLabelStep(mHMIGraphClass.XAxis.StepD.GIAD)
		  Call c.xAxis.setTitle(mHMIGraphClass.XAxis.Title.GIAS).setAlignment(CDXYChartMBS.kBottomCenter)
		  c.yAxis.setLabelStep(mHMIGraphClass.YAxis.StepD.GIAD)
		  Call c.yAxis.setTitle(mHMIGraphClass.YAxis.Title.GIAS).setAlignment(CDXYChartMBS.kLeft)
		  
		  // Populate the Graph
		  UpdateValues
		  
		  lastpicture = c.makeChartPicture
		  
		  viewport.setChartMetrics c.getChartMetrics
		  
		  // Process ImageMap data to support data point rollovers, etc.
		  Dim ImageMapString As String
		  
		  ImageMapString = c.getHTMLImageMap("myurl" )
		  ImageMapHandler = New CDImageMapHandlerMBS(ImageMapString)
		  
		  // trigger refresh
		  Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub trackLineLegend(mouseX as integer, mousey as Integer, isBarGraph as Boolean)
		  
		  #Pragma isBarGraph
		  
		  If c = Nil Then Return
		  
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
		  
		  Dim tracklineColor As Integer
		  If darkModeEnabled Then
		    tracklineColor = &hFFFFFF
		  Else
		    tracklineColor = &h000000
		  End If
		  
		  // Draw the track box
		  d.rect(boxLeft, boxTop, boxRight, boxBottom, tracklineColor, CDBaseChartMBS.kTransparent)
		  
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
		Sub UpdateMouseCursor()
		  'System.DebugLog "Running timer"
		  checkZoomMode
		  
		  // call from a timer in your window to keep the mouse cursor change with pressing alt and shift keys.
		  
		  // zoom allowed?
		  If Not AllowZoom Then Return
		  if isMouseDown then Return
		  
		  Dim x As Integer = myCanvasMouseX
		  Dim y As Integer = myCanvasMouseY
		  
		  // check if mouse is inside
		  if X<0 then Return
		  if Y<0 then Return
		  if X>Me.Width then Return
		  if Y>Me.Height then Return
		  
		  // now update
		  
		  If Keyboard.AsyncOptionKey Or ZoomMode = 1 Then
		    
		    // Zoom In
		    MouseCursor = System.Cursors.MagnifyLarger
		    
		  Elseif Keyboard.AsyncShiftKey Or ZoomMode = 2 Then
		    
		    // Zoom Out
		    MouseCursor = System.Cursors.MagnifySmaller
		    
		  Else
		    
		    Dim HotSpotID As Integer
		    
		    // Check if over a hotspot; Nil check prevents spurious NilObjectExceptions
		    If (ImageMapHandler <> Nil) Then HotSpotID = ImageMapHandler.getHotSpot(X, Y)
		    
		    If (HotSpotID > 0) Then
		      
		      MouseCursor = System.Cursors.StandardPointer
		      
		      
		      
		    ElseIf (AllowMove = True) Then
		      
		      MouseCursor = System.Cursors.HandOpen
		      
		    Else
		      
		      MouseCursor = System.Cursors.StandardPointer
		      
		    End If
		    
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateValues()
		  // Draws all included XYCurves
		  if mHMIGraphClass <> Nil Then
		    Dim LS as BasicClass = mHMIGraphClass.FirstSubStep
		    
		    while LS <> nil
		      
		      if LS IsA XYCurve_StepClass then
		        
		        Dim xyCurve as XYCurve_StepClass = XYCurve_StepClass(LS)
		        Call xyCurve.SetLayerMBS(Self.c)
		        
		      end
		      
		      LS = LS.NextStep
		    wend
		    
		  End
		  
		  If mHMIGraphClass isa Mollier_HxDiagram_StepClass Then
		    Dim mollierGraph as Mollier_HxDiagram_StepClass = Mollier_HxDiagram_StepClass(mHMIGraphClass)
		    mollierGraph.SetMollierAxes(c)
		  End If
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event SetKeyboardTimer(value As Integer)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected c As CDXYChartMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		CleanGraphicsBeforeDrawing As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private currZoom As Double
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdarkModeEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdarkModeEnabled = value
			  Self.Invalidate(False)
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private ImageMapHandler As CDImageMapHandlerMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private isMouseDown As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		lastpicture As picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		mHMIGraphClass As Graph_StepClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MinMax_Xval As Pair
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MinMax_Yval As Pair
	#tag EndProperty

	#tag Property, Flags = &h0
		myCanvasMouseX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		myCanvasMouseY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NeedClear As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Overlay As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleLeft As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rectanglePicture As picture
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		rectangleWidth As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private showTrackingCursor As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartX As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartX2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartY As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected StartY2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		viewport As cdviewPortManagerMBS
	#tag EndProperty

	#tag Property, Flags = &h0
		ZoomMode As Integer = 0
	#tag EndProperty


	#tag Constant, Name = allowDrag, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = allowMove, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = allowZoom, Type = Boolean, Dynamic = False, Default = \"true", Scope = Private
	#tag EndConstant

	#tag Constant, Name = zoomInRatio, Type = Double, Dynamic = False, Default = \"2.0", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = zoomOutRatio, Type = Double, Dynamic = False, Default = \"0.5", Scope = Protected
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
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
			Name="LockLeft"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockTop"
			Visible=true
			Group="Position"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockRight"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LockBottom"
			Visible=true
			Group="Position"
			InitialValue="False"
			Type="Boolean"
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
			Name="AllowAutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			Name="Enabled"
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
			Name="Visible"
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
			Name="Transparent"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
			Name="Left"
			Visible=true
			Group="Position"
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
		#tag ViewProperty
			Name="rectangleHeight"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rectangleLeft"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rectangleTop"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rectangleWidth"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="CleanGraphicsBeforeDrawing"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Overlay"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="rectanglePicture"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="lastpicture"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="myCanvasMouseX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="myCanvasMouseY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="darkModeEnabled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ZoomMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
