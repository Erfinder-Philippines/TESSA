#tag Class
Protected Class SYNCClass
Inherits BasicSyncClass
	#tag Method, Flags = &h0
		Sub CancelAll()
		  Dim BS As BasicClass = me.FirstSubStep
		  While BS <> Nil
		    If BS IsA SYNC_Location Then
		      SYNC_Location(BS).Cancel
		    End
		    BS = BS.NextStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanQuit() As Boolean
		  Dim result As Boolean = True
		  Dim BS As BasicClass = Me.FirstSubStep
		  While BS <> Nil
		    if BS IsA SYNC_Location And SYNC_Location(BS).AtAppClose.GIAB Then
		      result = False
		      Exit While
		    End
		    BS = BS.NextStep
		  Wend
		  if not result Then
		    mChecker.CheckAtEnd
		  End
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From BasicTransferClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  mChecker = new SYNCChecker
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContextMenuItems() As MenuItem()
		  Dim items(-1) As MenuItem
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isRunning() As Boolean
		  Dim result As Boolean = False
		  Dim BS As BasicClass = Me.FirstSubStep
		  While BS <> Nil
		    if BS IsA SYNC_Location And SYNC_Location(BS).isRunning Then
		      result = True
		      Exit While
		    End
		    BS = BS.NextStep
		  Wend
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartChecking()
		  if mChecker <> Nil then
		    mChecker.SetSYNCClass(Self)
		    mChecker.Run
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StopChecking(isHard As Boolean = false)
		  if mChecker <> Nil Then
		    If isHard And mChecker.State <> Thread.NotRunning then
		      mChecker.Kill
		    Else
		      mChecker.Stop
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mChecker As SYNCChecker = nil
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
			InitialValue=""
			Type="Integer"
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
			Name="Local_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
