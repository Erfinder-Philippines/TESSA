#tag Class
Private Class UploadFTPClass
Inherits BasicFTPClass
	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  'uploading
		  If dltotal = 0 And ultotal <> 0 Then
		    UploadProgress(ulnow, ultotal)
		  End
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub UploadFile(File As FolderItem, TargetFolder As String, fileName As String = "")
		  If mLastErrorCode = 0 Then
		    If TargetFolder = "" Then
		      mLastErrorCode = Integer(ErrorCode.eRemotePathNotValid)
		    ElseIf CheckFile(File) Then
		      If TargetFolder.Right(1) <> "/" Then
		        TargetFolder = TargetFolder + "/"
		      End
		      
		      If fileName = "" Then
		        fileName = File.Name
		      End
		      
		      Try
		        mStream = BinaryStream.Open(File, False)
		      Catch err As IOException
		        mLastErrorCode = Integer(ErrorCode.eSourcePathNotValid)
		      End
		      
		      If mLastErrorCode = 0 Then
		        OptionUpload = True
		        OptionAppend = False
		        YieldTime = True
		        OptionInFileSize = mStream.Length
		        OptionURL = OptionURL + TargetFolder + fileName
		        
		        PostLogMessage("Uploading to " + OptionURL  + ". File " + File.NativePath + " was started")
		        mLastErrorCode = Perform
		        mStream.Close
		      End
		      
		      if mLastErrorCode = 0 then
		        PostLogMessage("Uploading finished. File " + file.NativePath + " size: "+ Format(GetSize / 1024, "0") + " KB")
		      Else
		        PostLogMessage("Error uploading file: " + File.NativePath + ". Result = " + ErrorString(mLastErrorCode))
		      End
		    Else
		      mLastErrorCode = Integer(ErrorCode.eSourcePathNotValid)
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event UploadProgress(bytesSent As Double, bytesTotal As Double)
	#tag EndHook


	#tag ViewBehavior
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
