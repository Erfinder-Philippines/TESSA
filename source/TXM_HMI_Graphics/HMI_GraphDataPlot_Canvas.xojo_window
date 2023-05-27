#tag Window
Begin ContainerControl HMI_GraphDataPlot_Canvas Implements HMICanvasInterface
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   False
   HasBackgroundColor=   False
   Height          =   302
   InitialParent   =   ""
   Left            =   32
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   32
   Transparent     =   True
   Visible         =   True
   Width           =   489
   Begin Figure DUT
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EnableMouseEvents=   True
      EraseBackground =   "True"
      Height          =   237
      Index           =   -2147483648
      InitialParent   =   ""
      IsRetina        =   False
      Left            =   34
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      ScalingFactor   =   0.0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   32
      Transparent     =   True
      Visible         =   True
      Width           =   421
   End
   Begin Label sCoordinates
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   34
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Coordinates"
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   272
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   409
   End
   Begin ResizeContainer Resizer
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      HasBackgroundColor=   False
      Height          =   302
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   489
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  InitializeGraph
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  dim x(),y() as Double
		  Dim i as integer
		  Dim minindex as integer
		  x=array(0.0, 1.0)
		  y=Array(0.0, 0.0)
		  
		  if mHMIStep <> nil then
		    mHMIStep.Paint(g, 1)
		    GetFirstSubStep(mHMIStep)
		    GetNumberOfTraces(mHMIStep)
		    i =0
		    while mSelectedTrace <> nil
		      
		      x=mSelectedTrace.GetXValues
		      y=mSelectedTrace.GetYValues
		      
		      
		      if mGraph.TraceCount >NrOfTraces-1 then // after plot is done, update the x and y values
		        
		        mGraph.Trace(i).DisplayName = mSelectedTrace.Title.GIAS
		        mGraph.Trace(i).LineStyle = mSelectedTrace.LineStyle.GIAI
		        mGraph.Trace(i).LineWidth = mSelectedTrace.PenWidth.GIAI
		        mGraph.Trace(i).MarkerStyle = mSelectedTrace.DataPointMarker.GIAI
		        mGraph.Trace(i).MarkerSize = mSelectedTrace.PointWidth.GIAI
		        
		        mGraph.Legend.Location = HMI_GraphDataPlot_StepClass(mHMIStep).Legend.GIAI
		        mGraph.Legend.TextColor = mSelectedTrace.TextColor.GIAC
		        mGraph.Legend.TextSize = mSelectedTrace.TextSize.GIAI
		        mGraph.ShowLegend = true
		        
		        mGraph.XLabel = HMI_GraphDataPlot_StepClass(mHMIStep).XLabel.GIAS
		        mGraph.YLabel = HMI_GraphDataPlot_StepClass(mHMIStep).YLabel.GIAS
		        mGraph.XScaleType = HMI_GraphDataPlot_StepClass(mHMIStep).XLog.GIAI
		        mGraph.YScaleType = HMI_GraphDataPlot_StepClass(mHMIStep).YLog.GIAI
		        mGraph.Title = mHMIStep.Title.GIAS
		        mGraph.TextColor = mHMIStep.TextColor.GIAC
		        mGraph.TitleSize = mHMIStep.TextSize.GIAI
		        
		        if x.ubound=-1 or y.ubound=-1 then ' something's wrong
		          x=array(0.0, 1.0)
		          y=Array(0.0, 0.0)
		          mGraph.Trace(i).x()=x
		          mGraph.Trace(i).y()=y
		          mGraph.AutoFit
		        elseif x.Ubound <> y.Ubound then ' not the same array length
		          
		          if x.ubound=0 and x(0)=-1 then // plot y against consecutive nr
		            // make x values
		            redim x(-1)
		            for k as integer = 0 to y.ubound
		              x.append(k)
		            next
		            ///
		            // remove last point
		            if mSelectedTrace.DiscardLastPoint.GIAB then
		              dim u as integer = y.Ubound-1
		              redim x(u)
		              redim y(u)
		              mGraph.Trace(i).x()=x
		              mGraph.Trace(i).y()=y
		              mGraph.AutoFit
		              //everythings ok
		            else
		              ///
		              mGraph.Trace(i).x()=x
		              mGraph.Trace(i).y()=y
		              mGraph.AutoFit
		            end
		          else // if indeces differ take the minimum
		            minindex = min(x.Ubound,y.Ubound)
		            redim x(minindex)
		            redim y(minindex)
		            if mSelectedTrace.DiscardLastPoint.GIAB then
		              dim u as integer = y.Ubound-1
		              redim x(u)
		              redim y(u)
		              mGraph.Trace(i).x()=x
		              mGraph.Trace(i).y()=y
		              mGraph.AutoFit
		              //everythings ok
		            else
		              ///
		              mGraph.Trace(i).x()=x
		              mGraph.Trace(i).y()=y
		              mGraph.AutoFit
		            end
		          end
		        else
		          // remove last point
		          if mSelectedTrace.DiscardLastPoint.GIAB then
		            
		            dim u as integer = y.Ubound-1
		            if u =-1 then
		              u=0
		            end
		            redim x(u)
		            redim y(u)
		            mGraph.Trace(i).x()=x
		            mGraph.Trace(i).y()=y
		            mGraph.AutoFit
		            
		            //everythings ok
		          else
		            mGraph.Trace(i).x()=x
		            mGraph.Trace(i).y()=y
		            mGraph.AutoFit
		          end
		        end
		        
		      else
		        x=array(0.0, 1.0)
		        y=Array(0.0, 0.0)
		        mTrace=mGraph.Plot(x,y) // adds a trace each time it is executed therefore execute only as much as NrOfTraces
		      end
		      GetNextStep(mSelectedTrace)//changes mSelectedTrace to next Trace Object
		      i=i+1
		      
		    wend
		    
		    DUT.draw
		    if HMI_GraphDataPlot_StepClass(mHMIStep).SaveAtEnd.GIAB then
		      SaveGraphic
		    end
		  end
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CanvasRect() As REALbasic.Rect
		  // Part of the HMICanvasInterface interface.
		  Return Me.Bounds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetFirstSubStep(BS As BasicClass)
		  Dim ChildStepClass As BasicClass  = BS.FirstSubStep
		  
		  While ChildStepClass <> nil
		    If ChildStepClass.FirstSubStep <> Nil Then
		      GetFirstSubStep(ChildStepClass)
		    End
		    If  ChildStepClass IsA HMI_TraceDataPlot_StepClass Then
		      if mSelectedTrace = Nil Then
		        mSelectedTrace = HMI_TraceDataPlot_StepClass(ChildStepClass)
		      End
		    End
		    ChildStepClass = ChildStepClass.NextStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetNextStep(BS as BasicClass)
		  Dim NextStepClass As BasicClass  = BS.NextStep
		  
		  if NextStepClass <> nil then
		    'If NextStepClass.FirstSubStep <> Nil Then
		    'GetNextStep(NextStepClass)
		    'End
		    If  NextStepClass IsA HMI_TraceDataPlot_StepClass Then
		      'if mSelectedStepClass = Nil Then
		      'mSelectedStepClass = NextStepClass
		      'end
		      mSelectedTrace = HMI_TraceDataPlot_StepClass(NextStepClass)
		    End
		    'NextStepClass = NextStepClass.NextStep
		  else
		    mSelectedTrace = nil
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetNumberOfTraces(BS As BasicClass)
		  Dim ChildClass as BasicClass= BS.FirstSubStep
		  
		  NrOfTraces = 0
		  
		  While ChildClass <> Nil
		    if ChildClass isA HMI_TraceDataPlot_StepClass then
		      NrOfTraces = NrOfTraces +1
		      ChildClass = ChildClass.NextStep
		    else
		      ChildClass =ChildClass.NextStep
		    end
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitializeGraph()
		  me.DUT.Initialize
		  mGraph = DUT.Graph(0)
		  
		  Dim t as trace
		  mTrace = t
		  
		  mSelectedTrace = nil
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetUI()
		  // Part of the HMICanvasInterface interface.
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveGraphic()
		  dim f as FolderItem
		  dim p as new picture(DUT.Width,DUT.Height,32)
		  dim g as Graphics = p.Graphics
		  Dim Loc as string = HMI_GraphDataPlot_StepClass(mHMIStep).FolderLocation.GIAS
		  
		  if HMI_GraphDataPlot_StepClass(mHMIStep).SaveAtEnd.GIAB then
		    if Loc <>"" then
		      f= GetFolderItem( Loc)
		    else
		      f=GetWorkingFolderItem
		    end
		    if f <> nil and f.Directory then
		      'save
		      DUT.draw(g)
		      f = new FolderItem(f.NativePath+mHMIStep.Name.GIAS+".png")
		      if f <> nil then
		        p.Save(f,picture.SaveAsPNG)
		      end
		    end
		  end
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCoordinates(X as integer, Offset as integer, Y as integer, W as integer, H as integer)
		  // Part of the HMICanvasInterface interface.
		  // the new position is relative to the first (0,0) position
		  If mHMIStep <> Nil Then
		    
		    
		    If mHMIStep isA HMI_GraphDataPlot_StepClass Then
		      Left = X
		      Top = Y
		      Width = W+Offset +300
		      Height = H+150
		    End
		    if TargetWin32 Then
		      Me.Refresh
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditMode(type As Boolean)
		  Resizer.SetEditMode(type)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHMIClass(HMIClass As HMI_StepClass)
		  // Part of the HMICanvasInterface interface.
		  mHMIStep = HMIClass
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, SetValue as string)
		  // virtual method, has to be overridden if implemented in the class
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetRunMode(Enabled As Boolean)
		  mRunMode = Enabled
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisible(value As Boolean)
		  // Part of the HMICanvasInterface interface.
		  Me.Visible = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvas(mode As Integer)
		  // Part of the HMICanvasInterface interface.
		  #Pragma Unused mode
		  Me.Refresh(false)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Clicks() As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGraph As Graph = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		mHMIStep As HMI_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastX As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastY As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mRunMode As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedTrace As HMI_TraceDataPlot_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTrace As Trace = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		NrOfTraces As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events DUT
	#tag Event
		Sub MouseDownFigure(x as integer, y as integer)
		  
		  Dim S as String
		  Dim xval, yval as double
		  xval = mGraph.Pixel2ValueX(x)
		  yval = mGraph.Pixel2ValueY(y)
		  S = "Mouse Cursor("+Format(xval, "-0.000") + "/" + Format(yval, "-0.000")+")"
		  app.MouseCursor = System.Cursors.StandardPointer
		  sCoordinates.text = S
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseOverTrace(gr as graph, t as trace, x as integer, y as integer, xVal as double, yVal as double, DPoint as integer) As boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  dim s as string = "Graph(" + str(me.IndexOfGraph(gr)) + "):Trace(" + str(gr.IndexOfTrace(t)) + "), " + Format(xVal, "-0.000") + "/" + Format(yVal, "-0.000")
		  if DPoint >= 0 then
		    s = s + ", Data Point: " + Format(t.x(DPoint), "-0.000") + "/" + Format(t.y(DPoint), "-0.000")
		    app.MouseCursor = System.Cursors.FingerPointer
		  else
		    app.MouseCursor = System.Cursors.StandardPointer
		  end if
		  sCoordinates.Text = s
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function MouseOverGraph(gr as graph, x as integer, y as integer) As boolean
		  #Pragma Unused gr
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  app.MouseCursor = System.Cursors.StandardPointer
		  
		  return true
		End Function
	#tag EndEvent
	#tag Event
		Function MouseWheel(X as integer, Y as Integer, deltaX as integer, deltaY as integer) As Boolean
		  Dim xGraph,yGraph, gapx, gapy, xlimup, ylimup ,xlimdown, ylimdown as double
		  
		  //actual place in graph with mouspointer
		  xGraph = floor(mGraph.Pixel2ValueX(X)*10)/10 'round to one digit
		  yGraph = floor(mGraph.Pixel2ValueY(Y)*10)/10 'round to one digit
		  
		  'zoomfactor
		  gapx = (mGraph.MaxX-mGraph.MinX)/10
		  gapy = (mGraph.MaxY-mGraph.MinY)/10
		  
		  gapx = floor(gapx*10)/10'round to one digit
		  gapy = floor(gapy*10)/10'round to one digit
		  
		  if (xGraph + gapx) > mGraph.MaxX then
		    xlimup = mGraph.MaxX
		  else
		    if deltaY < 0 then 'zoom in
		      xlimup = mGraph.MaxX-gapx
		    end
		  end
		  
		  if (yGraph + gapy) > mGraph.MaxY then
		    ylimup = mGraph.MaxY
		  else
		    if deltaY < 0 then 'zoom in
		      ylimup = mGraph.MaxY-gapy
		    end
		  end
		  
		  if (xGraph - gapx) < mGraph.MinX then
		    xlimdown =mGraph.MinX
		  else
		    if deltaY < 0 then 'zoom in
		      xlimdown = mGraph.MinX+gapx
		    end
		  end
		  
		  if (yGraph - gapy) < mGraph.MinY then
		    ylimdown = mGraph.MinY
		  else
		    if deltaY < 0 then 'zoom in
		      ylimdown = mGraph.MinY+gapy
		    end
		  end
		  
		  
		  if deltay < 0 then
		    mGraph.SetLimits(xlimdown, xlimup, ylimdown, ylimup)
		  else
		    mGraph.AutoFit
		  end
		  
		  DUT.Draw
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDownGraph(gr as graph, x as integer, y as integer, xVal as double, yVal as double) As Boolean
		  #Pragma Unused gr
		  #Pragma Unused x
		  #Pragma Unused y
		  Dim xmin,xmax,ymin,ymax as double
		  
		  // right click: save as png
		  if IsContextualClick then
		    dim p as new picture(DUT.Width,dut.Height,32)
		    dim g as Graphics = p.Graphics
		    
		    DUT.draw(g)
		    Dim f as FolderItem = GetSaveFolderItem(".png",mHMIStep.Name.GIAS+".png")
		    if f <> nil then
		      p.Save(f,picture.SaveAsPNG)
		    end
		    //normal click twice: zoom
		  else
		    
		    clicks.Append(xVal)
		    clicks.Append(yVal)
		    
		    
		    if Clicks.ubound >=3 then
		      if clicks(0) < clicks(2) then
		        xmin = clicks(0)
		        xmax = clicks(2)
		      else
		        xmin = clicks(2)
		        xmax = clicks(0)
		      end
		      if clicks(1) < clicks(3) then
		        ymin = clicks(1)
		        ymax = clicks(3)
		      else
		        ymin = clicks(3)
		        ymax = clicks(1)
		      end
		      
		      mGraph.MinX = Floor(xmin)
		      mGraph.MaxX = Ceil(xmax)
		      mGraph.MinY = Floor(ymin)
		      mGraph.MaxY = Ceil(ymax)
		      'eTickX.Text=str(Ceil((mGraph.MaxX-mGraph.MinX)/10))
		      'eTickY.Text=str(Ceil((mGraph.MaxY-mGraph.MinY)/10))
		      
		      clicks.Remove(3)
		      clicks.Remove(2)
		      clicks.Remove(1)
		      clicks.Remove(0)
		      '
		      'SetXTickMarks
		      'SetYTickMarks
		      'RefreshEverything
		      DUT.Draw
		    end
		  end
		End Function
	#tag EndEvent
	#tag Event
		Function MouseDownTrace(gr as graph, t as trace, x as integer, y as integer, xVal as double, yVal as double, DPoint as integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  #Pragma Unused DPoint
		  
		  
		  
		  mGraph = gr
		  mTrace = t
		  
		  // Select the clicked Trace
		  me.DeselectAll
		  t.Selected = true
		  me.Draw(nil)
		  dim s as string = "Trace(" + str(gr.IndexOfTrace(t)) + "), " + Format(xVal, "-0.000") + "/" + Format(yVal, "-0.000")
		  sCoordinates.Text = s
		  return true // keeps BoxClick and GraphClick from firing
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events Resizer
	#tag Event
		Sub Resize(X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  if mHMIStep <> Nil Then
		    mHMIStep.Resize_HMI_Element(X, Y, Width, Height)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
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
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
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
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
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
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
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
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="NrOfTraces"
		Visible=false
		Group="Behavior"
		InitialValue=""
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
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
