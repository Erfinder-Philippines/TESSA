#tag Class
Protected Class SYNCChecker
Inherits Thread
	#tag Event
		Sub Run()
		  While mLoopAgain
		    Dim tmpTime As Double = Microseconds / 1000000
		    if (tmpTime - mCheckingTime) > SleepingTime Then
		      mCheckingTime = tmpTime
		      CheckSYNC(mSYNC)
		      App.YieldToNextThread
		    End
		    Me.Sleep(1000)
		  Wend
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckAtEnd()
		  If mIsCheckAtEndFinished Then
		    mCheckState = CheckOption.CheckAtEnd
		    CheckSYNC(mSYNC)
		    mIsCheckAtEndFinished = False
		    mCheckAtEndFinishTimer.Mode = Timer.ModeMultiple
		    mCheckAtEndFinishTimer.Period = CheckingEndTime * 1000
		    mCheckAtEndFinishTimer.Enabled = True
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CheckSYNC(sync As SYNCModule.SYNCClass)
		  if sync <> Nil And sync.Active.GIAB then
		    Dim BS As BasicClass = sync.FirstSubStep
		    While BS  <> Nil
		      If BS IsA SYNCModule.SYNC_Location Then
		        Dim SYNCDiskLoc As SYNCModule.SYNC_Location = SYNCModule.SYNC_Location(BS)
		        if SYNCDiskLoc.Active.GIAB Then
		          Dim NeedStart As Boolean = false
		          
		          If mCheckState = CheckOption.CheckAtStart And SYNCDiskLoc.AtAppStartup.GIAB Then
		            'AppStart
		            NeedStart = True
		          ElseIf mCheckState = CheckOption.CheckNormal Then
		            if SYNCDiskLoc.AtTime.GIAB then
		              'Time
		              Dim LastExecDate As Date = Nil
		              if not ParseDate(SYNCDiskLoc.LastExecutionDate.GIAS, LastExecDate) Then
		                LastExecDate = new Date
		                LastExecDate.Day = LastExecDate.Day - 1
		              End
		              
		              Dim StartTime As Double = ConvertTimeValue(SYNCDiskLoc.StartTime.GIAS)
		              Dim CurrentDate As new Date
		              Dim CurrentTime As Double = CurrentDate.Hour * 3600 + CurrentDate.Minute * 60 + CurrentDate.Second
		              
		              LastExecDate.Hour = CurrentDate.Hour
		              LastExecDate.Minute = CurrentDate.Minute
		              LastExecDate.Second = CurrentDate.Second
		              If LastExecDate < CurrentDate And CurrentTime >= StartTime Then
		                NeedStart = True
		              End
		            End
		            If SYNCDiskLoc.AtInterval.GIAB Then
		              Dim interval As Double = SYNCDiskLoc.Interval.GIAD
		              interval = interval * 3600
		              if interval > 0 then
		                Dim LastStartTime As Double = ConvertTimeValue(SYNCDiskLoc.LastExecutionTime.GIAS)
		                Dim CurrentDate As new Date
		                if LastStartTime <= 0 Then
		                  SYNCDiskLoc.LastExecutionTime.SIAS(Format(CurrentDate.Hour, "0#\.") + Format(CurrentDate.Minute, "0#\.") + Format(CurrentDate.Second, "0#"))
		                Else
		                  Dim CurrentTime As Double = CurrentDate.Hour * 3600 + CurrentDate.Minute * 60 + CurrentDate.Second
		                  if CurrentTime >= (LastStartTime + interval) Then
		                    NeedStart = True
		                  End
		                End
		              End
		            End
		          ElseIf mCheckState = CheckOption.CheckAtEnd And SYNCDiskLoc.AtAppClose.GIAB Then
		            'AppClose
		            NeedStart = True
		          End
		          
		          If NeedStart Then
		            SYNCDiskLoc.StartTransfering
		          Else
		            SYNCDiskLoc.Status.SIAI(0)
		          End
		        End
		      End
		      BS = BS.NextStep
		    Wend
		    mCheckState = CheckOption.CheckNormal
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CheckTimerTrigered(t As Timer)
		  If not mSYNC.isRunning Then
		    'transferring at close has been finished now we stop timer and close app
		    t.Enabled = False
		    mIsCheckAtEndFinished = True
		    Quit
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor()
		  mCheckAtEndFinishTimer = new Timer
		  AddHandler mCheckAtEndFinishTimer.Action , AddressOf CheckTimerTrigered
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Kill()
		  mCheckingTime = 0
		  Super.Kill
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resume()
		  mCheckingTime = Microseconds / 1000000
		  Super.Resume
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Run()
		  mCheckingTime = 0
		  Super.Run
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSYNCClass(sync As SYNCModule.SYNCClass)
		  mSYNC = sync
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Stop()
		  mLoopAgain = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Suspend()
		  mCheckingTime = 0
		  Super.Suspend
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCheckAtEndFinishTimer As Timer = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCheckingTime As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCheckState As CheckOption = CheckOption.CheckAtStart
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsCheckAtEndFinished As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLoopAgain As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSYNC As SYNCModule.SYNCClass = nil
	#tag EndProperty


	#tag Constant, Name = CheckingEndTime, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SleepingTime, Type = Double, Dynamic = False, Default = \"20", Scope = Public
	#tag EndConstant


	#tag Enum, Name = CheckOption, Type = Integer, Flags = &h0
		CheckAtStart
		  CheckNormal
		CheckAtEnd
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
			Name="DebugIdentifier"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ThreadState"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="ThreadStates"
			EditorType="Enum"
			#tag EnumValues
				"0 - Running"
				"1 - Waiting"
				"2 - Paused"
				"3 - Sleeping"
				"4 - NotRunning"
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
			Name="Priority"
			Visible=true
			Group="Behavior"
			InitialValue="5"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StackSize"
			Visible=true
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
	#tag EndViewBehavior
End Class
#tag EndClass
