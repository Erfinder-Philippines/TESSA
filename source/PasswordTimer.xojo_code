#tag Class
Protected Class PasswordTimer
Inherits Timer
	#tag Event
		Sub Action()
		  Select case mEventType
		  Case EventTypes.Start
		    MainWindow.RemainingTimeLabel.Text = Format(mProgMaxTimer / 60 - 0.5, "00") + ":" + Format(mProgMaxTimer mod 60, "00")
		    Period = 1000
		    mEventType = EventTypes.Action
		  Case EventTypes.Action
		    // Timer that shows the timing of a test sequence
		    mProgTimerAct = mProgMaxTimer-(GetActTime_sec - mProgTimerStart)
		    MainWindow.RemainingTimeLabel.Text = Format(mProgTimerAct / 60 - 0.5, "00") + ":" + Format(mProgTimerAct mod 60, "00")
		    if mProgTimerAct<0 then
		      App.Security_Lock
		    end
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
		Sub StartPasswordTimer()
		  
		  mProgTimerStart = GetActTime_sec
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartTimer(ProgTime as integer)
		  mProgTimerStart = GetActTime_sec
		  mProgTimerAct = 0
		  
		  mProgmaxTimer = ProgTime
		  
		  if Mode = Timer.ModeOff then
		    mEventType = EventTypes.Start
		    Period = 1
		    Mode = Timer.ModeMultiple
		  end
		  
		  if App.SecurityState=1 then
		    App.SecurityState=2
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopTimer()
		  Mode = Timer.ModeOff
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mEventType As EventTypes = EventTypes.Action
	#tag EndProperty

	#tag Property, Flags = &h0
		mProgMaxTimer As double = 600
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
			Name="mProgMaxTimer"
			Visible=false
			Group="Behavior"
			InitialValue="600"
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
