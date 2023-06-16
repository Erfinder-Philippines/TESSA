#tag Class
Protected Class XYCurve_StepClass
Inherits HMI_StepClass
	#tag Method, Flags = &h0
		Function Clip_Coordinates(ByRef x1 as integer, ByRef y1 as integer, ByRef x2 as integer, ByRef y2 as integer, xmin as integer, ymin as integer, xmax as integer, ymax as integer) As Boolean
		  Dim Clipped as boolean = false
		  
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
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  LineColor=IAC("LineColor","red",False, AttributeGroups.Appearance)
		  PenWidth=IAD("PenWidth",1,False, AttributeGroups.Appearance)
		  
		  XAttribute=IAD("XValues",0,false)
		  YAttribute=IAD("YValues",0,false)
		  
		  GraphType=IAE("GraphType","0 Line Points Line&Points Bargraph UpperLimit LowerLimit",False, AttributeGroups.Appearance)
		  PointType=IAE("PointType","0 Rectangle circle triangle cross ",False, AttributeGroups.Appearance)
		  
		  ValueMode = IAE("ValueMode", "0 ActiveValue-1 ActiveValue AllValues NoValues", False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawCurve(GRC as GraphClass)
		  if GRC <> nil then
		    Dim MAT as AttributeClass = GTA("XValues")
		    if MAT IsA MultipleValuesAttributeClass then XAttribute = MultipleValuesAttributeClass(MAT)
		    MAT=GTA("YValues")
		    if MAT IsA MultipleValuesAttributeClass then YAttribute = MultipleValuesAttributeClass(MAT)
		    'TODO: why should we use it?
		    Me.LastPoint = 1
		    if Update(GRC) then
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPoint(GRC as GraphClass, x2 as integer, y2 as integer)
		  Dim L1,L2 as integer = PenWidth.GIAI
		  Select case PointType.GIAI
		  case 0 //rectangle
		    L2=L2*2+1
		    GRC.GR.DrawRect(x2-L1,y2-2,L2,L2)
		  case 1 // circle
		    L2=L2*2+1
		    GRC.GR.DrawOval(x2-L1,y2-2,L2,L2)
		  case 2 // triangle
		    L2=L2*2-1
		    GRC.GR.DrawLine(x2-L2,y2+L2,x2,y2-L2)
		    GRC.GR.DrawLine(x2,y2-L2,x2+L2,y2+L2)
		    GRC.GR.DrawLine(x2-L2,y2+L2,x2+L2,y2+L2)
		  case 3 // cross
		    L2=L2+1
		    GRC.GR.DrawLine(x2-L2,y2-L2,x2+L2,y2+L2)
		    GRC.GR.DrawLine(x2+L2,y2-L2,x2-L2,y2+L2)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FindMinMax(ResetMode as integer, GRSC as Graph_StepClass)
		  Dim x_min, x_max, y_min, y_max, x, y as Double
		  Dim i,iStart, iEnd as integer
		  
		  if (Me.XAttribute=nil) or (Me.YAttribute=nil) then
		  else
		    select case ResetMode
		    case 0 // start from the very beginning
		      iStart=0
		      iEnd=Me.YAttribute.GIAA-2
		      x_min=Me.XAttribute.GIAD(0)
		      x_max=x_min
		      y_min=Me.YAttribute.GIAD(0)
		      y_max=y_min
		    case 1 // append where is allready is
		      if GRSC<>nil then
		        x_min=GRSC.Xmin
		        x_max=GRSC.Xmax
		        y_min=GRSC.Ymin
		        y_max=GRSC.Ymax
		      else
		      end
		      iStart=0
		      iEnd=Me.YAttribute.GIAA-2
		    case 2 // do only from last to new active value
		      if GRSC<>nil then
		        x_min=GRSC.Xmin
		        x_max=GRSC.Xmax
		        y_min=GRSC.Ymin
		        y_max=GRSC.Ymax
		      else
		      end
		      iStart=0
		      iEnd=Me.YAttribute.GIAA-2
		    end
		    
		    for i=iStart to iEnd
		      x=Me.XAttribute.GIAD(i)
		      x_min=Min(x_min,x)
		      x_max=Max(x_max,x)
		      
		      y=Me.YAttribute.GIAD(i)
		      y_min=Min(y_min,y)
		      y_max=Max(y_max,y)
		    next
		    
		    if GRSC<>nil then
		      GRSC.Xmin=x_min
		      GRSC.Xmax=x_max
		      GRSC.Ymin=y_min
		      GRSC.Ymax=y_max
		    end
		    
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Find_X_on_Line(y3 as integer, x1 as integer, y1 as integer, x2 as integer, y2 as integer) As integer
		  if (y2-y1)=0 then
		    return 0
		  else
		    return x1+(y3-y1)*(x2-x1)/(y2-y1)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // Send init to all included elements
		  Super.Init_Teststep_Start
		  Me.LastPoint=-2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetLayerMBS(c as CDXYChartMBS) As CDLayerMBS
		  If c = Nil Then
		    Return Nil
		  End If
		  
		  Dim valueLimitIndex as Double = 0
		  Select case ValueMode.GIAI
		  case 0 // ActiveValue-1   
		    valueLimitIndex=(YAttribute.GIAA-1)
		  case 1 // ActiveValue
		    valueLimitIndex=(YAttribute.GIAA)
		  case 2 // AllValues
		    valueLimitIndex=(YAttribute.GIAN-1)
		  Case 3 // NoValues
		    Return Nil
		  end
		  
		  Dim xValues() as Double
		  Dim count as Integer = XAttribute.GOAN
		  For i as integer = 0 to count - 1
		    
		    If i > valueLimitIndex Then
		      Exit
		    End If
		    
		    Dim val as Double = XAttribute.GIAD(i)
		    xValues.Add(val)
		  Next
		  
		  Dim yValues() as Double
		  count = YAttribute.GOAN
		  For i as integer = 0 to count - 1
		    
		    If i > valueLimitIndex Then
		      Exit
		    End If
		    
		    Dim val as Double = YAttribute.GIAD(i)
		    yValues.Add(val)
		  Next
		  
		  Dim dataset As CDDataSetMBS
		  Dim layer As CDLayerMBS
		  
		  Select Case Self.GraphType.GIAI
		  Case 0 // Line
		    
		    // Add a line layer to the chart
		    layer = c.addLineLayer
		    layer.setXData(xValues)
		    layer.setLineWidth(Self.PenWidth.GIAD)
		    
		    dataset = layer.addDataSet(yValues, LineColor.GIAC, Self.Title.GIAS)
		    
		  Case 1 // Points
		    
		    layer = c.addLineLayer
		    layer.setXData(xValues)
		    // Set the line width to 0 to only show point
		    layer.setLineWidth(0)
		    
		    dataset = layer.addDataSet(yValues, LineColor.GIAC, Self.Title.GIAS)
		    dataset.setDataSymbol(c.kCircleSymbol, 8)
		  Case 2 // Lines & Points
		    
		    layer = c.addLineLayer
		    layer.setXData(xValues)
		    layer.setLineWidth(Self.PenWidth.GIAD)
		    
		    dataset = layer.addDataSet(yValues, LineColor.GIAC, Self.Title.GIAS)
		    dataset.setDataSymbol(c.kCircleSymbol, 8)
		    
		  Case 3,4,5 // Bargraph, UpperLimit, LowerLimit
		    
		    layer = c.addBarLayer(yValues, -1)
		    
		    // Set bar border to transparent. Use glass lighting effect with light direction
		    // from left.
		    layer.setBorderColor(c.kTransparent, c.glassEffect(c.kNormalGlare,c.kLeft))
		    
		    // Configure the bars within a group to touch each others (no gap)
		    Dim barLayer as CDBarLayerMBS = CDBarLayerMBS(layer)
		    barLayer.setBarGap(0.2, c.kTouchBar)
		  End Select
		  
		  If Self.GraphType.GIAI = 1 Or Self.GraphType.GIAI = 2 and dataset <> Nil Then
		    Select case PointType.GIAI
		    Case 0
		      dataset.setDataSymbol(c.kSquareSymbol, 8)
		    Case 1
		      dataset.setDataSymbol(c.kCircleSymbol, 8)
		    Case 2
		      dataset.setDataSymbol(c.kTriangleSymbol, 8)
		    Case 3
		      dataset.setDataSymbol(c.kCross2Symbol, 8)
		    End Select
		  End If
		  
		  Return layer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_HMI_Init()
		  Me.LastPoint=-2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  // set Canvas and XAxis info
		  Me.LastPoint=-2
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Update(GRC as GraphClass) As boolean
		  Dim Clipped as Boolean = false
		  
		  if GRC<>nil then
		    
		    Dim x1,x2,y1,y2,x3,y3,y_zero,n1,n2,i,maxy2,miny2 as integer
		    Dim bx1,by1,bx2,by2,bz1 as Boolean
		    Dim XVal, YVal as double
		    Dim XLocal_D(), YLocal_D() as double
		    Dim XLocal_S(),YLocal_S() as string
		    Dim XLocal_I(),YLocal_I() as Int64
		    Dim XLocal_B(), YLocal_B() as boolean
		    Dim XLocalType, YLocalType as integer = 0
		    Dim Grt as integer = GraphType.GIAI
		    if (Me.XAttribute=nil) or (Me.YAttribute=nil) or (GRC.XAxis=nil) or (GRC.YAxis=nil) then
		    else
		      if XAttribute isA Double_AttributeClass then
		        XLocal_D =Double_AttributeClass( XAttribute.GIA).Values()
		        XLocalType=1
		      else 
		        if XAttribute IsA String_AttributeClass then
		          XLocal_S =String_AttributeClass( XAttribute.GIA).Values()
		          XLocalType=2
		        else
		          if XAttribute IsA Integer_AttributeClass then
		            XLocal_I = Integer_AttributeClass( XAttribute.GIA).Values()
		            XLocalType=3
		          else
		            if XAttribute IsA Boolean_AttributeClass then
		              XLocal_B = Boolean_AttributeClass( XAttribute.GIA).Values()
		              XLocalType=4
		            else
		            end
		          end
		        end
		      end
		      if YAttribute isA Double_AttributeClass then
		        YLocal_D =Double_AttributeClass( YAttribute.GIA).Values()
		        YLocalType=1
		      else 
		        if YAttribute isA String_AttributeClass then
		          YLocal_S =String_AttributeClass( YAttribute.GIA).Values()
		          YLocalType=2
		        else
		          if YAttribute isA Integer_AttributeClass then
		            YLocal_I =Integer_AttributeClass( YAttribute.GIA).Values()
		            YLocalType=3
		          else
		            if YAttribute isA Boolean_AttributeClass then
		              YLocal_B =Boolean_AttributeClass( YAttribute.GIA).Values()
		              YLocalType=4
		            else
		            end
		          end
		        end
		      end
		      
		      Select case ValueMode.GIAI
		      case 0
		        n2=(YAttribute.GIAA-1)
		      case 1
		        n2=(YAttribute.GIAA)
		      case 2
		        n2=(YAttribute.GIAN-1)
		      end
		      
		      if LastPoint=-2 then
		        n1=0
		      else
		        if  n2>LastPoint  then
		          'n1=LastPoint
		          n1=0
		        else
		          n1=0
		        end
		      end
		      
		      bx1=GRC.XAxis.Transfer2(XAttribute.GIAD(n1),x1)
		      by1=GRC.YAxis.Transfer2(YAttribute.GIAD(n1),y1)
		      bz1=GRC.YAxis.Transfer2(0,y_zero)
		      if bz1 then
		      else
		        if y_zero<GRC.y0-GRC.h0 then
		          y_zero=GRC.y0-GRC.h0
		        else
		          if y_zero>GRC.y0 then
		            y_zero=GRC.y0
		          else
		          end
		        end
		      end
		      
		      GRC.GR.ForeColor=Me.LineColor.GIAC
		      GRC.GR.PenWidth=Me.PenWidth.GIAD
		      
		      Select case Me.GraphType.GIAI
		      case 0
		      case 1,2
		        if bx1 and by1 then
		          Me.DrawPoint(GRC, x1,y1)
		        end
		      end
		      
		      for i=n1 to n2
		        // transfer coordinates into screen and check if inside
		        Select case XLocalType
		        case 1
		          XVal=XLocal_D(i)
		        case 2
		          XVal=Val(XLocal_S(i))
		        case 3
		          XVal=XLocal_I(i)
		        case 4
		          if XLocal_B(i) then
		            XVal=1
		          else
		            XVal=0
		          end
		        end
		        Select case YLocalType
		        case 1
		          YVal=YLocal_D(i)
		        case 2
		          YVal=Val(YLocal_S(i))
		        case 3
		          YVal=YLocal_I(i)
		        case 4
		          if YLocal_B(i) then
		            YVal=1
		          else
		            YVal=0
		          end
		        end
		        
		        bx2=GRC.XAxis.Transfer2(XVal,x2)
		        by2=GRC.YAxis.Transfer2(YVal,y2)
		        x3=x2
		        y3=y2
		        
		        if (bx1 and by1) and (bx2 and by2) then
		          // the line is within graph so no change on coordinates
		        else
		          // do clip the line into the screen rectangle
		          'Clipped=Clip_Coordinates(x1,y1,x2,y2,GRC.x0,GRC.y0-GRC.h0,GRC.x0+GRC.w0,GRC.y0)
		        end
		        // draw the graph according the type selection
		        
		        if (x1<>x2) or (x1=x2) or (i=n2) then
		          Select case GrT
		          case 0 // Line
		            GRC.GR.DrawLine(x1,y1,x2,y2)
		            'fx.AddLine(x1,y1,x2,y2)
		          case 1 // points
		            if bx2 and by2 then
		              DrawPoint(GRC, x2,y2)
		            end
		          case 2 // line & points
		            GRC.GR.DrawLine(x1,y1,x2,y2)
		            if bx2 and by2 then
		              DrawPoint(GRC, x2,y2)
		            end
		          case 3 // bargraph
		            GRC.GR.FillRect(x1+2,y_zero,x2-x1-2,y1-y_zero)
		          case 4 // UpperLimit
		            GRC.GR.FillRect(x1+2,y_zero,x2-x1-2,y1-y_zero)
		          case 5 // LowerLimit
		            
		          end
		          // restore uncliped points for next line
		          
		          x1=x3
		          y1=y3
		          maxy2=y1
		          miny2=y1
		          bx1=bx2
		          by1=by2
		        else
		          x1=x3
		          y1=y3
		          maxy2=max(maxy2,y2)
		          miny2=min(miny2,y2)
		          bx1=bx2
		          by1=by2
		        end
		        Me.LastPoint=i
		      next
		      'if fx.Count>0 then
		      'fx.BorderColor=LineColor.GIAC
		      'fx.BorderWidth=PenWidth.GIAD
		      'fx.FillColor=GetColor("grey")§1y
		      'GRC.GR.DrawObject(fx,0,0)
		      'end
		    end
		  end
		  //clear drawing, because currently we are using MBS Chardirector
		  //for drawing
		  GRC.GR.ClearRectangle 0,0,GRC.GR.Width,GRC.GR.Height
		  
		  return Clipped
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Clipped As boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		GraphType As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastPoint As Integer = -2
	#tag EndProperty

	#tag Property, Flags = &h0
		LineColor As Color_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PenWidth As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PointType As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ValueMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		XAttribute As MultipleValuesAttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		YAttribute As MultipleValuesAttributeClass
	#tag EndProperty


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
			Name="Clipped"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
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
			Name="LastPoint"
			Visible=false
			Group="Behavior"
			InitialValue="-2"
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
