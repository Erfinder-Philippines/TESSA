#tag Class
Protected Class Loger
	#tag Method, Flags = &h0
		Sub AddLogsListener(listener As SystemHelper.LogsListenerInterface)
		  If listener <> Nil Then
		    mLogsListeners.Append(listener)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function Instance() As SystemHelper.Loger
		  If mInstance is Nil Then
		    mInstance = new Loger
		  End
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LogInfo(File As FolderItem, info As String)
		  If File <> Nil And info <> "" Then
		    Dim now As new Date
		    Dim entry As String = now.ShortDate + " " + now.LongTime +  " " + info
		    For Each listener As SystemHelper.LogsListenerInterface in mLogsListeners
		      If listener <> Nil Then
		        listener.NewMessage(info, now)
		      End
		    Next
		    Call OpenMeasFileForSave(entry + EndOfLine, File, True)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveLogsListener(listener As SystemHelper.LogsListenerInterface)
		  If listener <> Nil Then
		    Dim index As Integer = mLogsListeners.IndexOf(listener)
		    If index >= 0 Then
		      mLogsListeners.Remove(index)
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mInstance As SystemHelper.Loger = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLogsListeners(-1) As SystemHelper.LogsListenerInterface
	#tag EndProperty


	#tag ViewBehavior
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
