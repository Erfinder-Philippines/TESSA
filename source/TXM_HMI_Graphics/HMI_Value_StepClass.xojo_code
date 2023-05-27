#tag Class
Protected Class HMI_Value_StepClass
Inherits HMI_StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  
		  Select case ChangedAttribute
		  case Is= Instrument
		    Select Case Instrument.GIAI
		    case 0 // Value Front
		      Coordinates.SetNewSize(100,100,50)
		    case 1 // Value
		      Coordinates.SetNewSize(50,100,50)
		    case 2 // Bargraph_Vertical
		      Coordinates.SetNewSize(50,70,300)
		    case 3 // Bargraph_Horizontal
		      Coordinates.SetNewSize(0,300,50)
		    case 4 // Gauge
		      Coordinates.SetNewSize(0,250,150)
		    end
		    Set_Koordinates
		  case Is= Alarm_Mode
		    
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  ForegroundColor = IAC("ForegroundColor", "&cFFFFFF", false, AttributeGroups.Appearance)
		  ValueColor =IAC("ValueColor","&c00FF00",false, AttributeGroups.Appearance)
		  
		  Measure=IAS("Measure", "",false, AttributeGroups.Appearance)
		  Format=IAS("Format", "",false, AttributeGroups.Appearance)
		  Value=IAS("Value", "",false)
		  
		  Instrument=IAE("Instrument","0 ValueFront Value Bargraph_Vertical Bargraph_Horizontal Gauge",false, AttributeGroups.Appearance)
		  ScaleStart=IAD("Start",0,false, AttributeGroups.Appearance)
		  ScaleEnd=IAD("End",0,false, AttributeGroups.Appearance)
		  ScaleStep=IAD("Step",0,false, AttributeGroups.Appearance)
		  ShowNumericValue = IAB("ShowNumericValue",false)
		  
		  Alarm_Low=IAD("Alarm_Low",0,false, AttributeGroups.Appearance)
		  Alarm_High=IAD("Alarm_High",0,false, AttributeGroups.Appearance)
		  Alarm_Mode=IAE("Alarm_Mode","0 none low high low&high",false, AttributeGroups.Appearance)
		  Alarm_Color = IAC("Alarm_Color","&cFF0000",false, AttributeGroups.Appearance)
		  
		  TextSize.SIAI(16)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return new HMI_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  Super.Paint(g, mode)
		  Dim UpdateAll As Boolean = true
		  'If mode = 2 Then
		  'UpdateAll = false
		  'End
		  Repaint(g, UpdateAll)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Repaint(g As Graphics, UpdateAll As Boolean = false)
		  if App.HMI_Active then
		    if (Me.LastValue <> Me.Value.GIAD) or UpdateAll then
		      Dim  y0 As Integer = Coordinates.Height
		      Dim W As Integer = Coordinates.Width-15
		      Dim w0 as integer = W/2
		      Dim H As Integer = Coordinates.Height
		      Dim x0 as Integer = Coordinates.Offset
		      
		      Dim ForeColorChoice as color = ValueColor.GIAC
		      Dim ForeColorChoice_High as color = ValueColor.GIAC
		      Dim ForeColorChoice_Low as color = ValueColor.GIAC
		      if (Alarm_Mode.GIAI>1) and (Value.GIAD>Alarm_High.GIAD) then
		        ForeColorChoice = Alarm_Color.GIAC
		        ForeColorChoice_High = Alarm_Color.GIAC
		      else
		        if ((Alarm_Mode.GIAI=1) or (Alarm_Mode.GIAI=3)) and (Value.GIAD<Alarm_Low.GIAD) then
		          ForeColorChoice = Alarm_Color.GIAC
		          ForeColorChoice_Low = Alarm_Color.GIAC
		        end
		      end
		      
		      Select case Me.Instrument.GIAI
		        //----------------------------------------------
		      case 0  // show value as number with title in front
		        W = W-Measure.GIAS.Len*TextSize.GIAI/3
		        g.TextSize = TextSize.GIAI
		        Dim yMid as integer = (y0 + 8 + g.TextSize) / 2
		        // title and measure
		        If UpdateAll Then
		          DrawString(g, Title.GIAS, 10, yMid )
		          if Measure.GIAS<>"" then DrawString(g, "["+Measure.GIAS+"]", x0 + W + 5, yMid )
		          
		          // draw alarm limits
		          if Alarm_Mode.GIAI>1 then
		            Dim ys as integer = yMid-5
		            g.forecolor = ForeColorChoice_High
		            Dim points() as Integer  = Array(0,x0-40, ys-16, x0-14, ys-16, x0-4, ys, x0-40,ys)
		            g.FillPolygon points()
		            g.forecolor = TextColor.GIAC
		            g.TextSize = 10
		            g.DrawString(Str(Alarm_High.GIAS), x0-38, ys - 3)
		          end
		          if (Alarm_Mode.GIAI=1) or ( Alarm_Mode.GIAI=3) then
		            Dim ys as integer = yMid+15
		            g.forecolor = ForeColorChoice_Low
		            Dim points() as Integer  = Array(0,x0-40, ys-16, x0-4, ys-16, x0-14, ys, x0-40,ys)
		            g.FillPolygon points()
		            g.forecolor = TextColor.GIAC
		            g.TextSize = 10
		            g.DrawString(Str(Alarm_Low.GIAS), x0-38, ys -3)
		          end
		          
		        End
		        // display value
		        g.forecolor = ForegroundColor.GIAC
		        if H>45 then
		          g.FillRoundRect(x0, 10, W, H-10,10,10)
		        else
		          g.FillRect(x0, 10, W, H-10)
		        end
		        
		        g.forecolor = TextColor.GIAC
		        g.TextSize = TextSize.GIAI
		        
		        if Format.GIAS = "" then
		          g.DrawString(Value.GIAS, x0 + W/2 - Value.GIAS.Len * TextSize.GIAI/3, yMid )
		        else
		          Dim VS as string = Format(Value.GIAD, Format.GIAS)
		          g.DrawString(VS, x0 + W/2 - VS.Len*TextSize.GIAI/3, yMid)
		        end
		        //--------------------------------
		      case 1  // show value as number with title above
		        // title and measure
		        H = H - 35
		        g.forecolor = TextColor.GIAC
		        g.TextSize = TextSize.GIAI
		        If UpdateAll Then
		          DrawString(g, Title.GIAS, x0, y0 - H-10 )
		          if Measure.GIAS<>"" then DrawString( g, "["+Measure.GIAS+"]", x0 + W - Measure.GIAS.Len*g.TextSize, y0 -H-10)
		        End
		        // display value
		        g.forecolor = ForegroundColor.GIAC
		        if H>40 then
		          g.FillRoundRect(x0, y0-H, W, H,15,15)
		        else
		          g.FillRect(x0, y0-H, W, H)
		        end
		        
		        g.forecolor = TextColor.GIAC
		        g.TextSize = 2*H/3
		        if Format.GIAS = "" then
		          Dim ff as string = Value.GIAS
		          g.DrawString(ff, x0 + 5 + W/2 - ff.Len*g.TextSize /4 , y0-H/2+g.TextSize/2 )
		        else
		          Dim ff as string = Format(Value.GIAD, Format.GIAS)
		          g.DrawString(ff, x0 + 5 + W/2 - ff.Len*g.TextSize /4, y0-H/2+g.TextSize/2 )
		        end
		        Dim yMid as integer = y0 - H / 2
		        // draw alarm limits
		        if Alarm_Mode.GIAI>1 then
		          Dim ys as integer = yMid-5
		          g.forecolor = ForeColorChoice_High
		          Dim points() as Integer  = Array(0,x0-40, ys-16, x0-14, ys-16, x0-4, ys, x0-40,ys)
		          g.FillPolygon points()
		          g.forecolor = TextColor.GIAC
		          g.TextSize = 10
		          g.DrawString(Str(Alarm_High.GIAS), x0-38, ys - 3)
		        end
		        if (Alarm_Mode.GIAI=1) or ( Alarm_Mode.GIAI=3) then
		          Dim ys as integer = yMid+15
		          g.forecolor = ForeColorChoice_Low
		          Dim points() as Integer  = Array(0,x0-40, ys-16, x0-4, ys-16, x0-14, ys, x0-40,ys)
		          g.FillPolygon points()
		          g.forecolor = TextColor.GIAC
		          g.TextSize = 10
		          g.DrawString(Str(Alarm_Low.GIAS), x0-38, ys -3)
		        end
		        
		        
		        //--------------------------------
		      case 2 // show value as vertical bargraph
		        H = H - TextSize.GIAI*2
		        Dim ys As Integer
		        //draw scale
		        Dim s1 As Double = ScaleStart.GIAD
		        Dim s2 As Double = ScaleEnd.GIAD
		        if s2<=s1 then
		          Dim wh as double = Value.GIAD*0.2
		          if wh=0 then wh =1
		          s1 = Value.GIAD-1
		          s2 = Value.GIAD+1
		        end
		        If ScaleStep.GIAD <= 0 Then
		          ScaleStep.SIAD((s2-s1) / 10)
		        End
		        
		        If UpdateAll Then
		          //draw title
		          g.TextSize = TextSize.GIAI
		          DrawString(g, Title.GIAS, x0, y0-H-15)
		          g.TextSize = 10
		          if Measure.GIAS<>"" then g.DrawString("[" + Measure.GIAS + "]", 6, 15)
		          
		          Dim n As Integer = (s2-s1) / ScaleStep.GIAD
		          Dim hs As Integer =  H*ScaleStep.GIAD/(s2-s1)
		          
		          For i As Integer = 0 to n
		            ys = y0 - (i * hs)
		            g.DrawString(Str(s1 + i*ScaleStep.GIAD), 4, ys - 5)
		            g.DrawLine(4, ys, x0, ys)
		          Next
		        End
		        
		        //draw value in box
		        Dim yValue As  Integer = H * (Value.GIAD - s1) / (s2-s1)
		        
		        if Value.GIAD > ScaleEnd.GIAD then
		          // value is bigger than scale
		          g.forecolor = ForeColorChoice
		          g.fillrect(x0, y0 - H, W, H)
		          Dim h1 as integer = W/3
		          Dim points() as Integer  = Array(0, x0+10, y0-H+10+h1, x0+w0, y0-H+10, x0+W-10, y0-H+10+h1)
		          g.forecolor = ForegroundColor.GIAC
		          g.FillPolygon points()
		          g.DrawString(Value.GIAS, x0+w0-Value.GIAS.Len*3, y0-H+30+h1)
		        else
		          if Value.GIAD < ScaleStart.GIAD then
		            // value is smaller than scale
		            g.forecolor = ForegroundColor.GIAC
		            g.fillrect(x0, y0 - H, W, H)
		            // display triangle at bottom
		            Dim h1 as integer = W/3
		            Dim points() as Integer  = Array(0, x0+10, y0-10-h1, x0+w0, y0-10, x0+W-10, y0-10-h1)
		            g.forecolor = ForeColorChoice
		            g.FillPolygon points()
		            g.forecolor = TextColor.GIAC
		            g.DrawString(Value.GIAS, x0+w0-Value.GIAS.Len*3, y0-15-h1)
		          else
		            // value is ok
		            g.forecolor = ForegroundColor.GIAC
		            g.fillrect(Coordinates.Offset, y0 - H, W, H)
		            g.forecolor = ForeColorChoice
		            g.fillrect(x0, y0 - yValue, W, yValue)
		            if ShowNumericValue.GIAB then
		              g.forecolor = TextColor.GIAC
		              g.DrawString(Value.GIAS, x0+w0-Value.GIAS.Len*3, y0-yValue-15)
		            end
		          end
		        end
		        
		        // draw alarm limits
		        if Alarm_Mode.GIAI>1 then
		          ys = y0 - H*(Alarm_High.GIAD-s1)/(s2-s1)
		          g.forecolor = ForegroundColor.GIAC
		          Dim points() as Integer  = Array(0,10, ys-16, 10, ys, x0, ys, x0-10,ys-16)
		          g.FillPolygon points()
		          g.forecolor = TextColor.GIAC
		          g.DrawString(Str(Alarm_High.GIAS), 14, ys - 5)
		          g.DrawLine(10,ys,x0+W,ys)
		        end
		        if (Alarm_Mode.GIAI=1) or ( Alarm_Mode.GIAI=3) then
		          ys = y0 - H*(Alarm_Low.GIAD-s1)/(s2-s1)
		          g.forecolor = ForegroundColor.GIAC
		          Dim points() as Integer  = Array(0,10, ys-16, 10, ys, x0, ys, x0-10,ys-16)
		          g.FillPolygon points()
		          g.forecolor = TextColor.GIAC
		          g.DrawString(Str(Alarm_Low.GIAS), 14, ys -5)
		          g.DrawLine(10,ys,x0+W,ys)
		        end
		        //----------------------------------
		      case 3 // show value as horizontal bargraph
		        H = H - 55
		        W=W-20
		        x0=x0+5
		        If UpdateAll Then
		          //draw title
		          DrawString(g, Title.GIAS, x0, 20)
		          g.TextSize = TextSize.GIAI - 2
		          if Measure.GIAS<>"" then
		            g.DrawString("[" + Measure.GIAS + "]", x0+W-20, 20)
		          end
		          //draw scale
		          if ScaleStep.GIAD < 1 then
		            ScaleStep.SIAD(H / 20)
		          end
		          Dim n As Integer = (ScaleEnd.GIAD - ScaleStart.GIAD) / ScaleStep.GIAD
		          Dim ws As Integer = W / n
		          Dim s1,s2 as Double
		          s1 = ScaleStart.GIAD
		          s2 = ScaleStep.GIAD
		          Dim xs As Integer
		          for i As Integer = 0 to n
		            xs = x0 + (i * ws)
		            g.DrawString(Str(s1 + i * s2), xs-5, H + 53)
		            g.DrawLine(xs, H + 30, xs, H +35)
		          next
		        End
		        //draw value in box
		        Dim xValue As  Integer = Coordinates.Width * (Value.GIAD - ScaleStart.GIAD) / (ScaleEnd.GIAD - ScaleStart.GIAD)
		        if Value.GIAD > ScaleEnd.GIAD then
		          g.forecolor = ValueColor.GIAC
		          g.fillrect(x0, 30, W, H)
		        else
		          if Value.GIAD < ScaleStart.GIAD then
		            g.forecolor = ForegroundColor.GIAC
		            g.fillrect(x0, 30, W, H)
		          else
		            g.forecolor = ForegroundColor.GIAC
		            g.fillrect(x0, 30, W, H)
		            g.forecolor = ValueColor.GIAC
		            g.fillrect(x0, 30, xValue, H)
		          end
		        end
		        //----------------------------------------
		      case 4 //  gauge
		        
		        
		      end
		    end
		    Me.LastValue = Me.Value.GIAD
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  if Visible.GIAB then mUIUpdater.UpdateCanvas(0)
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Alarm_Color As Color_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Alarm_High As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Alarm_Low As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Alarm_Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ForegroundColor As Color_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Format As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Instrument As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastValue As double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Measure As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ScaleEnd As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ScaleStart As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ScaleStep As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowNumericValue As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ValueColor As Color_AttributeClass = nil
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
	#tag EndViewBehavior
End Class
#tag EndClass
