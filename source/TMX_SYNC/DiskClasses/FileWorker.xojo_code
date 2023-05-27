#tag Class
Protected Class FileWorker
Inherits WorkerThread
	#tag Method, Flags = &h21
		Private Function CopyFile(sourceFile as FolderItem, destination as FolderItem, overwrite As Boolean) As Integer
		  Dim error As Integer = 101
		  if sourceFile <> Nil And sourceFile.Exists and not sourceFile.Directory And destination <> Nil Then
		    if mCurerntSYNCFolder <> Nil then
		      mCurerntSYNCFolder.SetCurrentFile(sourceFile.NativePath)
		      mCurerntSYNCFolder.CurrentProgress.SIAD(0.0)
		    End
		    
		    Dim OldFile As FolderItem = destination.Child(sourceFile.Name)
		    if OldFile <> Nil and OldFile.Exists Then
		      If Not overwrite Then
		        Return 0
		      End
		      
		      Select Case mTransferLocation.CopyMode.GIAI
		      Case 0
		        'copy mode
		        OldFile.Delete
		        error = OldFile.LastErrorCode
		        if error = 0 Then
		          PostLogMessage("Old File:" + OldFile.NativePath + " has been deleted")
		        Else
		          PostLogMessage("Old File:" + OldFile.NativePath + " has not been deleted")
		        End
		      Case 2
		        'backup mode
		        if sourceFile.ModificationDate > OldFile.ModificationDate Then
		          OldFile.Delete
		          error = OldFile.LastErrorCode
		          if error = 0 Then
		            PostLogMessage("Old File:" + OldFile.NativePath + " has been deleted")
		          Else
		            PostLogMessage("Old File:" + OldFile.NativePath + " has not been deleted")
		          End
		        Else
		          PostLogMessage("File:" + OldFile.NativePath + " has the newest version")
		          Return 0
		        End
		      End
		    End
		    
		    sourceFile.CopyFileTo(destination)
		    error = sourceFile.LastErrorCode
		    if error = 0 Then
		      if mCurerntSYNCFolder <> Nil And error = 0 Then
		        mCurerntSYNCFolder.IncrementFiles(1)
		        mCurerntSYNCFolder.CurrentProgress.SIAD(100.0)
		      End
		      PostLogMessage("File:" + sourceFile.NativePath + " has been transfered")
		    else
		      PostLogMessage("File:" + sourceFile.NativePath + " was failed")
		    End
		  End
		  Return error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CopyFileorFolder(source as FolderItem, destination as FolderItem, includeSubFolder As Boolean, CreateSourceFolder As Boolean, overwrite As Boolean) As Integer
		  Dim error As Integer = 101
		  If source <> Nil Then
		    If source.directory Then
		      Dim newFolder As FolderItem = destination
		      If CreateSourceFolder Then
		        newFolder = destination.child(source.name)
		      End
		      If newFolder = Nil Then
		        Return error
		      End
		      newFolder.createAsFolder
		      if mCurerntSYNCFolder <> Nil Then
		        mCurerntSYNCFolder.SetCurrentFolder(newFolder.NativePath)
		      End
		      error = newFolder.LastErrorCode
		      For i As Integer = 1 To source.count
		        Dim sourceItem As FolderItem = source.Item(i)
		        If sourceItem.directory Then
		          If includeSubFolder Then
		            error = CopyFileOrFolder(sourceItem, newFolder, includeSubFolder, True, overwrite)
		          End
		        Else
		          error = CopyFile(sourceItem, newFolder, overwrite)
		          IncreaseCurrentProgress(SizeOfFolderOrFile(sourceItem))
		        End
		      Next
		      If mCurerntSYNCFolder <> Nil then
		        mCurerntSYNCFolder.IncrementFolders(1)
		      End
		    Else
		      error = CopyFile(source, destination, overwrite)
		      IncreaseCurrentProgress(SizeOfFolderOrFile(source))
		    End
		  End
		  Return error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DeleteSourceData(TransferItem As SyncBasicItem) As Boolean
		  Return DeleteSourceFolder(TransferItem.LocalItem.GIAS)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PrepareAndCopy(SourceItem As FolderItem, TargetItem As FolderItem, IncludeSubFolder As Boolean) As Integer
		  If SourceItem <> Nil And TargetItem <> Nil Then
		    mFullProgress = SizeOfFolderOrFile(SourceItem)
		    mCurrentProgress = 0.0
		    IncreaseCurrentProgress(0.0)
		    
		    if (not TargetItem.Exists) And TargetItem.Directory Then
		      TargetItem.CreateAsFolder
		    End
		    If mTransferLocation <> Nil then
		      Dim ChildFolderName As String = ""
		      Select Case mTransferLocation.TargetOption.GIAI
		      Case 0
		        'nothing
		      Case 1
		        Dim CurrentDate As New Date
		        ChildFolderName = CurrentDate.SQLDate
		      Case 2
		        Dim CurrentDate As New Date
		        ChildFolderName = CurrentDate.SQLDate + "-" + Format(CurrentDate.Hour, "0#\.") + Format(CurrentDate.Minute, "0#\.") + Format(CurrentDate.Second, "0#")
		      End
		      If ChildFolderName <> "" Then
		        TargetItem = TargetItem.Child(ChildFolderName)
		        if TargetItem <> Nil And (not TargetItem.Exists) then
		          TargetItem.CreateAsFolder
		        End
		      End
		      Return CopyFileorFolder(SourceItem, TargetItem, IncludeSubFolder, False, mTransferLocation.CheckNewerVersion.GIAB)
		    End
		  End
		  Return 101
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Work(TransferItem As SyncBasicItem) As Integer
		  Dim SourcePath As String = TransferItem.LocalItem.GIAS
		  Dim TargetPath As String = TransferItem.RemoteItem.GIAS
		  If SourcePath <> "" And TargetPath <> "" Then
		    Dim SourceFolderItem As FolderItem = GetFolderItem(SourcePath)
		    If SourceFolderItem <> Nil and SourceFolderItem.Exists Then
		      Dim TargetFolderItem As FolderItem = GetFolderItem(TargetPath)
		      Dim IncludeSubFolder As Boolean = False
		      If TransferItem IsA SYNCModule.SYNC_Folder Then
		        IncludeSubFolder = SYNCModule.SYNC_Folder(TransferItem).IncludeSubFolder.GIAB
		      End
		      Return PrepareAndCopy(SourceFolderItem, TargetFolderItem, IncludeSubFolder)
		    Else
		      PostLogMessage("Transfer error: Source folder " + SourceFolderItem.NativePath + " not found")
		    End
		  End
		  Return 101
		End Function
	#tag EndMethod


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
			InitialValue="-2147483648"
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
