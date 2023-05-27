#tag Class
Protected Class WorkerThread
Inherits Thread
Implements SystemHelper.LogsListenerInterface
	#tag Event
		Sub Run()
		  // invoke the worker interface
		  If mTransferLocation <> Nil Then
		    Call mUICaller.PushMethod (AddressOf Self.ShowProgressWindow, "ShowProgressWindow")
		    SystemHelper.Loger.Instance.AddLogsListener(Self)
		    DoWork
		    SystemHelper.Loger.Instance.RemoveLogsListener(Self)
		    App.YieldToNextThread
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function AllTransferClasses(transferClass As BasicClass) As SyncBasicItem()
		  Dim items(-1) As SyncBasicItem
		  If transferClass <> Nil then
		    If transferClass IsA SyncBasicItem And SyncBasicItem(transferClass).Active.GIAB Then
		      items.Append(SyncBasicItem(transferClass))
		    End
		    Dim BS As BasicClass = transferClass.FirstSubStep
		    While BS <> Nil
		      Dim subItems(-1) As SyncBasicItem = AllTransferClasses(BS)
		      For Each item As SyncBasicItem In subItems
		        items.Append(item)
		      Next
		      BS = BS.NextStep
		    Wend
		  End
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub CancelWork()
		  For Each TransferItem As SyncBasicItem in TransferItems
		    If TransferItem <> Nil Then
		      TransferItem.Status.SIAI(4)
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mUICaller = New Caller
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DeleteSourceData(TransferItem As SyncBasicItem) As Boolean
		  #Pragma Unused TransferItem
		  'virtual class
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DeleteSourceFolder(SourcePath As String) As Boolean
		  If SourcePath <> "" Then
		    Dim item As FolderItem = GetFolderItem(SourcePath)
		    If item <> Nil And item.Exists Then
		      Dim fileOrFolder As String = "File"
		      If item.Directory Then
		        fileOrFolder = "Folder"
		      End
		      Dim error As Integer = DeleteFolder(item, True)
		      If error = 0 Then
		        PostLogMessage(fileOrFolder + ":" + SourcePath + " has been deleted")
		      Else
		        PostLogMessage(fileOrFolder + ":" + SourcePath + " has not been deleted")
		      End
		      Return (error = 0)
		    End
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub DoWork()
		  mTransferLocation.Progress.SIAD(0.0)
		  mTransferLocation.Status.SIAI(1)
		  if TransferItems.Ubound < 0 Then
		    mTransferLocation.Status.SIAI(2)
		    mTransferLocation.Progress.SIAD(100.0)
		  Else
		    mTransferLocation.Status.SIAI(1)
		    For Each TransferItem As SyncBasicItem in TransferItems
		      if TransferItem <> Nil Then
		        TransferItem.Status.SIAI(0)
		        TransferItem.Progress.SIAD(0.0)
		      End
		    Next
		    
		    Dim count As Integer = TransferItems.Ubound
		    Dim locationStatus As Integer = 1
		    For i As Integer = 0 To count
		      Dim TransferItem As SyncBasicItem = TransferItems(i)
		      if TransferItem <> Nil Then
		        TransferItem.Status.SIAI(1)
		        TransferItem.InitSYNCItem(mTransferLocation)
		        mTransferLocation.SetCurrentSYNCFolder(TransferItem.Name.GIAS)
		        If TransferItem IsA SYNCModule.SYNC_Folder Then
		          mCurerntSYNCFolder = SYNCModule.SYNC_Folder(TransferItem)
		          mCurerntSYNCFolder.ClearCurrentValues
		        End
		        
		        Dim result As Integer = Work(TransferItem)
		        
		        TransferItem.Progress.SIAD(100.0)
		        UpdateMainProgress
		        
		        If result = 0 Then
		          if mTransferLocation.CopyMode.GIAI = 1 Then
		            'Copy-Mode:Push
		            PostLogMessage("SYNC folder: " + TransferItem.Name.GIAS + ". Start deleting Source Data, because Copy-Mode:Push was selected.")
		            if DeleteSourceData(TransferItem) Then
		              PostLogMessage("SYNC folder: " + TransferItem.Name.GIAS + ". Copy-Mode:Push. Deleting Source Data was succeed.")
		            Else
		              PostLogMessage("SYNC folder: " + TransferItem.Name.GIAS + ". Copy-Mode:Push. Deleting Source Data was failed.")
		            End
		          End
		          locationStatus = 2
		          TransferItem.Status.SIAI(2)
		          PostLogMessage("SYNC direction: "  + mTransferLocation.CopyMode.GIAS + "SYNC folder: " + TransferItem.Name.GIAS + ". Transfer was succeed")
		        Else
		          TransferItem.Status.SIAI(3)
		          If locationStatus = 1 Then
		            locationStatus = 3
		          End
		          PostLogMessage("SYNC direction: "  + mTransferLocation.CopyMode.GIAS + "SYNC folder: " + TransferItem.Name.GIAS + ". Transfer was failed." + _
		          chr(13) + "Last error:" +FTPFolderItem.ErrorString(result))
		        End
		      Else
		        PostLogMessage("Transfer error: Transfer Item is NULL")
		      End
		    Next
		    mTransferLocation.Status.SIAI(locationStatus)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub IncreaseCurrentProgress(progress As Double)
		  mCurrentProgress = mCurrentProgress + progress
		  If mCurerntSYNCFolder <> Nil Then
		    mCurerntSYNCFolder.Progress.SIAD(mCurrentProgress / mFullProgress * 100.0)
		  End
		  UpdateMainProgress
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitTransfer(TransferLocation As SYNCModule.SYNC_Location)
		  'virtual method need to overload in sub classes
		  'need to init transfering
		  If TransferLocation <> Nil Then
		    Dim CurrenDate As new Date
		    if TransferLocation.SaveLog.GIAB Then
		      Dim fld As FolderItem = TransferLocation.logFolderPath
		      
		      if fld <> nil And fld.Directory Then
		        If not fld.Exists Then
		          fld.CreateAsFolder
		        End
		        
		        fld = fld.Child(CurrenDate.SQLDate)
		        if not fld.Exists then
		          fld.CreateAsFolder
		        End
		        
		        Dim LogFileName As String = "Transfer_" + TransferLocation.Name.GIAS + "_" + Format(CurrenDate.Hour, "0#\.") + Format(CurrenDate.Minute, "0#\.") + Format(CurrenDate.Second, "0#") + ".log"
		        LogFileName  = LogFileName.ReplaceAll(" ", "")
		        mLOGFile = fld.Child(LogFileName)
		      End
		    else
		      mLOGFile = Nil
		    End
		    
		    // set parameters
		    TransferLocation.LastExecutionDate.SIAS(CurrenDate.ShortDate)
		    TransferLocation.LastExecutionTime.SIAS(Format(CurrenDate.Hour, "0#\.") + Format(CurrenDate.Minute, "0#\.") + Format(CurrenDate.Second, "0#"))
		    ReDim TransferItems(-1)
		    mTransferLocation = TransferLocation
		    mTransferLocation.ClearCurrentValues
		    TransferItems = AllTransferClasses(TransferLocation)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Kill()
		  CancelWork
		  Super.Kill
		  If mProgressWindow <> Nil Then
		    mProgressWindow.Close
		    mProgressWindow = Nil
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function logFilePath() As FolderItem
		  Return mLOGFile
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewMessage(msg As String, msgDate As Date)
		  // Part of the SystemHelper.LogsListenerInterface interface.
		  If mTransferLocation <> Nil Then
		    mTransferLocation.LastLog.SIAS(msg)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PostLogMessage(msg As String)
		  SystemHelper.Loger.Instance.LogInfo(mLOGFile, msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ShowProgressWindow()
		  mProgressWindow = New SyncProgressWindow(Self)
		  mProgressWindow.Show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateMainProgress()
		  Dim total As Double = 0.0
		  Dim dbCount As Double = TransferItems.Ubound + 1
		  For Each item As SyncBasicItem In TransferItems
		    If item <> Nil Then
		      total = total + item.Progress.GIAD
		    End
		  Next
		  mTransferLocation.Progress.SIAD(total / dbCount)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function Work(TransferItem As SyncBasicItem) As Integer
		  'virtual method need to overload in sub classes
		  #Pragma Unused TransferItem
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mCurerntSYNCFolder As SYNCModule.SYNC_Folder = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCurrentProgress As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mFullProgress As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mLOGFile As FolderItem = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mProgressWindow As SyncProgressWindow = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mTransferLocation As SYNCModule.SYNC_Location = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mUICaller As Caller = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TransferItems(-1) As SyncBasicItem
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mTransferLocation
			End Get
		#tag EndGetter
		TransferLocation As SYNCModule.SYNC_Location
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
