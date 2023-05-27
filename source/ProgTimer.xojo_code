#tag Class
Protected Class ProgTimer
Inherits Timer
	#tag Event
		Sub Action()
		  Select case mEventType
		  Case EventTypes.Start
		    HMI_Window.TimerDisplay.Visible = true
		    HMI_Window.TimerBackground.Visible = true
		    HMI_Window.TimerForeground.Visible = true
		    HMI_Window.TimerDisplay.Text = Format(0, "00:00")
		    Me.Period = 1000
		    mEventType = EventTypes.Action
		  Case EventTypes.Finished
		    HMI_Window.TimerDisplay.Visible = False
		    HMI_Window.TimerBackground.Visible = False
		    HMI_Window.TimerForeground.Visible = False
		    mEventType = EventTypes.Action
		    Me.Mode = Timer.ModeOff
		  Case EventTypes.Action
		    
		    // Timer that shows the timing of a test sequence
		    mProgTimerAct = (GetActTime_sec - mProgTimerStart)
		    
		    HMI_Window.TimerForeground.Width = HMI_Window.TimerBackground.Width*(mProgTimerAct / mProgMaxTimer)
		    if HMI_Window.TimerForeground.Width > (HMI_Window.TimerBackground.Width - 4) then
		      HMI_Window.TimerForeground.Width = HMI_Window.TimerBackground.Width - 4
		    end
		    HMI_Window.TimerDisplay.Text = Format(mProgTimerAct / 60 - 0.5, "00") + ":" + Format(mProgTimerAct mod 60, "00")
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function GetActTime() As Double
		  Return mProgTimerAct
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HaltTimer()
		  Me.Mode = Timer.ModeOff
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResumeTimer()
		  mProgTimerStart = GetActTime_sec - mProgTimerAct
		  Me.Mode = Timer.ModeMultiple
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartTimer(ProgTime as string)
		  mProgTimerStart = GetActTime_sec
		  mProgTimerAct = 0
		  
		  if ProgTime <> "" then
		    App.GlobalTestSequence.MaxProgTime.SIAS(ProgTime)
		  end
		  if App.GlobalTestSequence <> nil then
		    Dim S as string = App.GlobalTestSequence.MaxProgTime.GIAS
		    Dim i as integer = S.Instr(1, ":")
		    if i > 0 then
		      mProgMaxTimer = Val(S.Mid(1, i - 1)) * 60 + Val(S.Mid(i + 1, 2))
		    else
		      mProgMaxTimer = Val(S)
		    end
		  end
		  
		  if Me.Mode = Timer.ModeOff then
		    mEventType = EventTypes.Start
		    Me.Period = 1
		    Me.Mode = Timer.ModeMultiple
		  end
		  
		  if App.SecurityState=1 then
		    App.SecurityState=2
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopTimer()
		  Me.Mode = Timer.ModeOff
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mEventType As EventTypes = EventTypes.Action
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mProgMaxTimer As Double = 60
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mProgTimerAct As double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mProgTimerStart As double
	#tag EndProperty


	#tag Enum, Name = EventTypes, Flags = &h21
		Start
		  Finished
		  Action
		UpdatePasswordTimer
	#tag EndEnum


	#tag ViewBehavior
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
			Name="Enabled"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="RunModes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Off"
				"1 - Single"
				"2 - Multiple"
			#tag EndEnumValues
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Period"
			Visible=true
			Group="Behavior"
			InitialValue="1000"
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
	#tag EndViewBehavior
End Class
#tag EndClass
