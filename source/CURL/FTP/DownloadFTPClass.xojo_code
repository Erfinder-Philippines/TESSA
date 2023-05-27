#tag Class
Private Class DownloadFTPClass
Inherits BasicFTPClass
	#tag Event
		Function Progress(dltotal as Int64, dlnow as Int64, ultotal as Int64, ulnow as Int64, percent as double) As boolean
		  'downloading
		  If ultotal = 0 And dltotal <> 0 Then
		    DownloadProgress(dlnow, dltotal)
		  End
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub DownloadFile(FilePath As String, File As FolderItem)
		  If mLastErrorCode = 0 Then
		    If File = Nil Then
		      mLastErrorCode = Integer(ErrorCode.eSourcePathNotValid)
		    Elseif FilePath.Len <= 1 Then
		      mLastErrorCode = Integer(ErrorCode.eRemotePathNotValid)
		    Else
		      if FilePath.Right(1) = "/" Then
		        FilePath = FilePath.Left(FilePath.Len - 1)
		      End
		      
		      If File.Exists Then
		        File.Delete
		        if File.LastErrorCode = 0 Then
		          PostLogMessage("Old File:" + File.NativePath + " has been deleted")
		        Else
		          PostLogMessage("Old File:" + File.NativePath + " has not been deleted")
		        End
		      End
		      
		      Try
		        mStream = BinaryStream.Create(File)
		      Catch err As IOException
		        mLastErrorCode = Integer(ErrorCode.eSourcePathNotValid)
		      End
		      
		      If mLastErrorCode = 0 Then
		        YieldTime = True
		        OptionURL = OptionURL + FilePath
		        PostLogMessage("Downloading to " + File.NativePath  + " :File " + FilePath + " was started")
		        SmartPerform
		        mStream.Close
		      End
		      
		      if mLastErrorCode = 0 then
		        PostLogMessage("Dowloading finished. File " + file.NativePath + " size: "+ Format(GetSize / 1024, "0") + " KB")
		      Else
		        PostLogMessage("Error downloading file: " + File.NativePath + ": Result = " + ErrorString(mLastErrorCode))
		      End
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DownloadProgress(bytesReceived As Double, bytesTotal As Double)
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
