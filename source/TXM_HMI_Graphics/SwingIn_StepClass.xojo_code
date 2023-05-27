#tag Class
Protected Class SwingIn_StepClass
Inherits Graph_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.Input=Me.IAD("Input",0,false)
		  Me.Input_Relative=Me.IAD("Input_Relative",0,false)
		  
		  Me.AbsoluteDeviation=Me.IAD("AbsoluteDeviation",10,false)
		  Me.RelativeDeviation=Me.IAD("RelativeDeviation",1,false)
		  
		  Me.SetPoint=Me.IAD("SetPoint",10,false)
		  Me.SwingInTime=Me.IAD("SwingInTime",10000,false)
		  Me.RelativeSetPoint=Me.IAD("RelativeSetPoint",10,false)
		  
		  Me.CountDown=Me.IAD("Countdown",0,false)
		  Me.MaxTime=Me.IAD("MaxTime",7200,false)
		  
		  Me.SwingState=Me.IAE("SwingState","0 Outside CountDown Locked Passed TimeOut",false)
		  
		  Me.LoopCounter=Me.IAS("LoopCounter","",false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  Super.Paint(g, mode)
		  if g<>nil and mHMIGraph <> Nil then
		    Dim S,CD as string
		    g.TextSize=14
		    Select case Me.SwingState.GIAI
		    case 0
		      CD=""
		      S=Me.Name.GIAS+" is outside of absolute range"
		      mHMIGraph.DrawLine(-999,Me.Setpoint.GIAD-Me.AbsoluteDeviation.GIAD ,999,Me.Setpoint.GIAD-Me.AbsoluteDeviation.GIAD,GetColor("orange"),2)
		      mHMIGraph.DrawLine(-999,Me.Setpoint.GIAD+Me.AbsoluteDeviation.GIAD ,999,Me.Setpoint.GIAD+Me.AbsoluteDeviation.GIAD,GetColor("orange"),2)
		    case 1
		      g.ForeColor=GetColor("green")
		      S=Me.Name.GIAS+" is inside of relative range"
		      CD="Count down "+Format(Me.CountDown.GIAD,"##'###.#")
		      mHMIGraph.DrawRect(Me.WindowStartTime,Me.Setpoint.GIAD-Me.AbsoluteDeviation.GIAD,Me.WindowStartTime+Me.SwingInTime.GIAD,Me.Setpoint.GIAD+Me.AbsoluteDeviation.GIAD,GetColor("orange"),2)
		      mHMIGraph.DrawRect(Me.WindowStartTime,Me.StartValue-Me.RelativeDeviation.GIAD,Me.WindowStartTime+Me.SwingInTime.GIAD,Me.StartValue+Me.RelativeDeviation.GIAD,GetColor("green"),1)
		    else
		      CD = ""
		      S=Me.Name.GIAS
		    end
		    mHMIGraph.DrawFillRect(mHMIGraph.x0+3, mHMIGraph.y0-mHMIGraph.h0+3,mHMIGraph.w0-6,25,GetColor("white"))
		    mHMIGraph.DrawString(S, mHMIGraph.x0+10, mHMIGraph.y0-mHMIGraph.h0+20,GetColor("black"),14)
		    if CD<>"" then
		      mHMIGraph.DrawString(CD, mHMIGraph.x0+mHMIGraph.w0-130,mHMIGraph.y0-mHMIGraph.h0+20,GetColor("black"),14)
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  Me.SwingState.SIAI(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Repeat() As boolean
		  
		  Dim RV as Boolean
		  Dim RestTime as double
		  Dim ActTime as double
		  Dim ActValue as double
		  Dim i  as integer
		  
		  RV=true
		  ActTime=GetActTime_sec
		  i=Me.SwingState.GIAI
		  Select case i
		  case 0
		    // outside the absolute range
		    if  abs(Me.Input.GIAD-Me.Setpoint.GIAD)<Me.AbsoluteDeviation.GIAD then
		      // the input value has reached the absolute range, start new lock window, set new relative start value
		      Me.SwingState.SIAI(1)
		      Me.EndWindow=Me.SwingInTime.GIAD+ActTime
		      Me.WindowStartTime=ActTime-Me.StartTime
		      // set the start value of the swing in according the input setting
		      if Me.Input_Relative.Link=nil then
		        Me.StartValue=Me.Input.GIAD
		      else
		        Me.StartValue=Me.Input_Relative.GIAD
		      end
		      Me.RelativeSetPoint.SIAD(Me.StartValue)
		      Me.CountDown.SIAD(Me.SwingInTime.GIAD)
		      UpdateHMI
		      Me.LoopCounter.SIAS(Me.LoopCounter.GIAS+"1")
		    else
		      // nothing to do
		    end
		  case 1
		    // inside the absolute range and inside relative window
		    // choose the right input for the swingin
		    if Me.Input_Relative.Link=nil then
		      ActValue=Me.Input.GIAD
		    else
		      ActValue=Me.Input_Relative.GIAD
		    end
		    if  abs(ActValue-Me.StartValue)<Me.RelativeDeviation.GIAD then
		      // input value is still inside the lock Window
		      if  ActTime>Me.EndWindow then
		        // timer has reached end within the lock window
		        Me.SwingState.SIAI(3)
		        Me.LoopCounter.SIAS(Me.LoopCounter.GIAS+"3")
		        RV=false
		      else
		        // timer has not yet reached the end of the lock window
		        RestTime=Me.EndWindow-ActTime
		        Me.CountDown.SIAD(RestTime)
		      end
		    else
		      // input value has left the relative deviation range => reset and start from beginning
		      Me.SwingState.SIAI(0)
		      UpdateHMI
		      Me.LoopCounter.SIAS(Me.LoopCounter.GIAS+"0")
		    end
		  end
		  
		  Me.SIAD("OverallTime",ActTime-Me.StartTime)
		  
		  if (ActTime-Me.StartTime)>Me.MaxTime.GIAD then
		    // a timeout has occured the swingin loop will be left immetiately
		    Me.SwingState.SIAI(4)
		    RV=false
		  end
		  
		  if App.HMI_Active then
		    if mHMIGraph<>nil then
		      mHMIGraph.Update
		    end
		    mUIUpdater.UpdateCanvas(0)
		  end
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As Boolean
		  Me.SwingState.SIAI(0)
		  Me.StartTime=GetActTime_sec
		  return Super.Step_Start
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AbsoluteDeviation As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CountDown As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EndWindow As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Input As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input_Relative As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LoopCounter As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxTime As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Reached As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		RelativeDeviation As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RelativeSetPoint As Double_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Setpoint As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartTime As double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		StartValue As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		SwingInTime As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SwingState As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowStartTime As double
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
			Name="EndWindow"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
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
			Name="Reached"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="StartTime"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StartValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Double"
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
			Name="WindowStartTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
