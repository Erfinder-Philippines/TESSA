#tag Class
Protected Class FTPWorker
Inherits WorkerThread
	#tag Method, Flags = &h1
		Protected Sub CancelWork()
		  Super.CancelWork
		  if mCurrentFTPItem <> Nil Then
		    mCurrentFTPItem.Cancel
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DeleteSourceData(TransferItem As SyncBasicItem) As Boolean
		  Dim Direction As String = TransferItem.TransferDirection.GIAS
		  If Direction = "Upload" Then
		    Return DeleteSourceFolder(TransferItem.LocalItem.GIAS)
		  ElseIf Direction = "Download" Then
		    Dim TargetPath As String = TransferItem.RemoteItem.GIAS
		    If TargetPath <> "" Then
		      Dim FTPItem As New FTPFolderItem(TargetPath, mUserData, SYNC_FTP_Location(mTransferLocation).MLSDListening.GIAB)
		      AddHandler FTPItem.Deleted, AddressOf HandleFTPDeleted
		      Return (FTPItem.Delete = 0)
		    End
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoWork()
		  if mUserData.Host <> "" Then
		    Super.DoWork
		  Else
		    PostLogMessage("Destination Host is empty")
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FolderNameByTargetOption(targetOption As Integer) As String
		  Dim ChildFolderName As String = ""
		  Select Case targetOption
		  Case 0
		    'nothing
		  Case 1
		    Dim CurrentDate As New Date
		    ChildFolderName = CurrentDate.SQLDate
		  Case 2
		    Dim CurrentDate As New Date
		    ChildFolderName = CurrentDate.SQLDate + "-" + Format(CurrentDate.Hour, "0#\.") + Format(CurrentDate.Minute, "0#\.") + Format(CurrentDate.Second, "0#")
		  End
		  Return ChildFolderName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPDeleted(child As FTPFolderItem, item As FTPFolderItem)
		  If item <> Nil Then
		    If item.Directory Then
		      'If e = 0 Then
		      PostLogMessage("Folder " + item.Path + " has been deleted from FTP.")
		      'Else
		      'PostLogMessage("Error deleting folder from FTP: " + item.Path + ": Result = " + SystemHelper.ErrorInfo(e))
		      'End
		    Else
		      'If e = 0 Then
		      PostLogMessage("File: " + item.Path + "has been deleted from FTP.")
		      'Else
		      'PostLogMessage(i"Error deleting file from FTP: " + item.Path + ": Result = " + SystemHelper.ErrorInfo(e))
		      'End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPDownloadFinished(child As FTPFolderItem, item As FTPFolderItem)
		  If item <> Nil Then
		    If item.Directory Then
		      If mCurerntSYNCFolder <> Nil Then
		        mCurerntSYNCFolder.IncrementFolders(1)
		      End
		    Else
		      If mCurerntSYNCFolder <> Nil Then
		        mCurerntSYNCFolder.IncrementFiles(1)
		        mCurerntSYNCFolder.CurrentProgress.SIAD(100.0)
		      End
		      IncreaseCurrentProgress(item.size)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPDownloadProgress(ftpClass As FTPFolderItem, filePath As String, bytesReceived As Double, bytesTotal As Double)
		  If ftpClass <> Nil Then
		    PostLogMessage(filePath + " Downloading " + Format(bytesReceived / bytesTotal, "-0%") + " " + Format(bytesReceived / 1024.0, "0") + " of " + format(bytesTotal / 1024.0, "0") + " KB")
		  End
		  If mCurerntSYNCFolder <> Nil Then
		    mCurerntSYNCFolder.CurrentProgress.SIAD(bytesReceived / bytesTotal * 100.0)
		    mCurerntSYNCFolder.Progress.SIAD((mCurrentProgress + bytesReceived) / mFullProgress * 100.0)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPDownloadStarted(child As FTPFolderItem, item As FTPFolderItem)
		  If item <> Nil Then
		    If item.Directory Then
		      if mCurerntSYNCFolder <> Nil Then
		        mCurerntSYNCFolder.SetCurrentFolder(item.Path)
		      End
		    Else
		      if mCurerntSYNCFolder <> Nil Then
		        mCurerntSYNCFolder.SetCurrentFile(item.Path)
		        mCurerntSYNCFolder.CurrentProgress.SIAD(0.0)
		      End
		      
		      mFullProgress = mFullProgress + item.size
		      IncreaseCurrentProgress(0)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPLogMessage(ftpClass As FTPFolderItem, msg As String)
		  PostLogMessage(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPUploadFinished(child As FTPFolderItem, item As FTPFolderItem)
		  If item <> Nil Then
		    If item.Directory Then
		      If mCurerntSYNCFolder <> Nil Then
		        mCurerntSYNCFolder.IncrementFolders(1)
		      End
		    Else
		      If mCurerntSYNCFolder <> Nil Then
		        mCurerntSYNCFolder.IncrementFiles(1)
		        mCurerntSYNCFolder.CurrentProgress.SIAD(100.0)
		      End
		      IncreaseCurrentProgress(item.Size)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPUploadProgress(ftpClass As FTPFolderItem, path As String, bytesSent As Double, bytesTotal As Double)
		  If ftpClass <> Nil Then
		    PostLogMessage(path + "Uploading " + Format(bytesSent / bytesTotal, "-0%") + " " + Format(bytesSent / 1024.0, "0") + " of " + format(bytesTotal / 1024.0, "0") + " KB")
		  End
		  If mCurerntSYNCFolder <> Nil Then
		    mCurerntSYNCFolder.CurrentProgress.SIAD(bytesSent / bytesTotal * 100.0)
		    mCurerntSYNCFolder.Progress.SIAD((mCurrentProgress + bytesSent) / mFullProgress * 100.0)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPUploadStarted(child As FTPFolderItem, item As FTPFolderItem)
		  If item <> Nil Then
		    If item.Directory Then
		      If mCurerntSYNCFolder <> Nil Then
		        mCurerntSYNCFolder.SetCurrentFolder(item.Path)
		      End
		    Else
		      If mCurerntSYNCFolder <> Nil Then
		        mCurerntSYNCFolder.SetCurrentFile(item.Path)
		        mCurerntSYNCFolder.CurrentProgress.SIAD(0.0)
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OverWriteMode() As FTP.OverwriteMode
		  Dim overwrite As FTP.OverwriteMode = FTP.OverwriteMode.OverwriteNo
		  If mTransferLocation.CheckNewerVersion.GIAB Then
		    overwrite = FTP.OverwriteMode.OverwriteAlways
		  ElseIf mTransferLocation.CopyMode.GIAI = 2 Then
		    overwrite = FTP.OverwriteMode.OverwriteOnlyNewest
		  End
		  Return overwrite
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrepareAndDownload(SourcePath As String, TargetItem As FolderItem, IncludeSubFolder As Boolean) As Integer
		  Dim error As Integer = 999
		  If SourcePath <> "" And TargetItem <> Nil Then
		    mFullProgress = 1000
		    mCurrentProgress = 0.0
		    IncreaseCurrentProgress(0.0)
		    
		    If (Not TargetItem.Exists) And TargetItem.Directory Then
		      TargetItem.CreateAsFolder
		    End
		    If mTransferLocation <> Nil Then
		      Dim ChildFolderName As String = FolderNameByTargetOption(mTransferLocation.TargetOption.GIAI)
		      
		      If ChildFolderName <> "" Then
		        TargetItem = TargetItem.Child(ChildFolderName)
		        if TargetItem <> Nil And Not TargetItem.Exists Then
		          TargetItem.CreateAsFolder
		        End
		      End
		      
		      Dim FTPItem As New FTPFolderItem(SourcePath, mUserData, SYNC_FTP_Location(mTransferLocation).MLSDListening.GIAB)
		      AddHandler FTPItem.LogMessage, AddressOf HandleFTPLogMessage
		      AddHandler FTPItem.DownloadProgress, AddressOf HandleFTPDownloadProgress
		      AddHandler FTPItem.DownloadingStarted, AddressOf HandleFTPDownloadStarted
		      AddHandler FTPItem.DownloadingFinished, AddressOf HandleFTPDownloadFinished
		      
		      mCurrentFTPItem = FTPItem
		      error = FTPItem.Download(TargetItem, OverWriteMode, IncludeSubFolder, False)
		      mCurrentFTPItem = Nil
		      
		      If error = Integer(FTPFolderItem.ErrorCode.eFTPError) Then
		        PostLogMessage(FTPItem.DetailErrorString(error))
		      End
		    End
		  Else
		    PostLogMessage("Transfer error: Source folder not found")
		  End
		  Return error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrepareAndUpload(Source As FolderItem, TargetFolder As String, IncludeSubFolder As Boolean) As Integer
		  Dim error As Integer = 999
		  If Source <> Nil And TargetFolder <> "" Then
		    mFullProgress = SizeOfFolderOrFile(Source)
		    mCurrentProgress = 0.0
		    IncreaseCurrentProgress(0.0)
		    
		    FTP.ProcessedFTPPath(TargetFolder)
		    Dim MLSdListening As Boolean = SYNC_FTP_Location(mTransferLocation).MLSDListening.GIAB
		    If mTransferLocation <> Nil Then
		      Dim ChildFolderName As String = FolderNameByTargetOption(mTransferLocation.TargetOption.GIAI)
		      
		      If ChildFolderName <> "" Then
		        TargetFolder = TargetFolder + "/" + ChildFolderName
		      End
		      
		      Dim FTPItem As New FTPFolderItem(TargetFolder, mUserData, SYNC_FTP_Location(mTransferLocation).MLSDListening.GIAB)
		      AddHandler FTPItem.LogMessage, AddressOf HandleFTPLogMessage
		      
		      Dim canUpload As Boolean = True
		      If Not FTPItem.Exist Then
		        error = FTPItem.CreateAsFolder
		        if error <> 0 Then
		          canUpload = False
		        End
		      End
		      
		      If canUpload Then
		        AddHandler FTPItem.UploadProgress, AddressOf HandleFTPUploadProgress
		        AddHandler FTPItem.UploadingStarted, AddressOf HandleFTPUploadStarted
		        AddHandler FTPItem.UploadingFinished, AddressOf HandleFTPUploadFinished
		        
		        mCurrentFTPItem = FTPItem
		        error = FTPItem.Upload(Source, OverWriteMode, IncludeSubFolder, False)
		        mCurrentFTPItem = Nil
		        
		        If error = Integer(FTPFolderItem.ErrorCode.eFTPError) Then
		          PostLogMessage(FTPItem.DetailErrorString(error))
		        End
		      End
		    End
		  Else
		    PostLogMessage("Transfer error: Source folder not found")
		  End
		  Return error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Work(TransferItem As SyncBasicItem) As Integer
		  Dim result As Integer = 999
		  Dim SourcePath As String = TransferItem.LocalItem.GIAS
		  Dim TargetPath As String = TransferItem.RemoteItem.GIAS
		  If SourcePath <> "" And TargetPath <> "" Then
		    Dim SourceFolderItem As FolderItem = GetFolderItem(SourcePath)
		    Dim IncludeSubFolder As Boolean = False
		    If TransferItem IsA SYNCModule.SYNC_Folder Then
		      IncludeSubFolder = SYNCModule.SYNC_Folder(TransferItem).IncludeSubFolder.GIAB
		    End
		    
		    Dim Direction As String = TransferItem.TransferDirection.GIAS
		    If Direction = "Upload" Then
		      result = PrepareAndUpload(SourceFolderItem, TargetPath, IncludeSubFolder)
		    ElseIf Direction = "Download" Then
		      result = PrepareAndDownload(TargetPath, SourceFolderItem, IncludeSubFolder)
		    Else
		      PostLogMessage("Transfer error: Unknown transfer direction")
		    End
		  End
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mCurrentFTPItem As FTPFolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserData As FTPUserData = nil
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUserData
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mUserData = value
			End Set
		#tag EndSetter
		UserData As FTPUserData
	#tag EndComputedProperty


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
