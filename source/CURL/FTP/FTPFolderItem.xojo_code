#tag Class
Class FTPFolderItem
	#tag Method, Flags = &h0
		Sub Cancel()
		  If mCurrentFTPCommand <> Nil Then
		    mCurrentFTPCommand.Cancel
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Child(childName As String) As FTPFolderItem
		  Dim child As FTPFolderItem = Nil
		  Dim error As Integer = PerformChild
		  If error = 0 Then
		    child = FindChild(childName)
		    If child = Nil And Exist And Directory Then
		      child = New FTPFolderItem(childName, Self)
		      ConnectChild(child)
		    End
		  End
		  Return child
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ConnectChild(child As FTPFolderItem)
		  If child <> Nil Then
		    AddHandler child.LogMessage, AddressOf HandleChildLogMessage
		    
		    AddHandler child.DownloadProgress, AddressOf HandleChildDownloadProgress
		    AddHandler child.DownloadingStarted, AddressOf HandleChildDownloadStarted
		    AddHandler child.DownloadingFinished, AddressOf HandleChildDownloadFinished
		    
		    AddHandler child.Deleted, AddressOf HandleChildDeleted
		    
		    AddHandler child.UploadProgress, AddressOf HandleChildUploadProgress
		    AddHandler child.UploadingStarted, AddressOf HandleChildUploadStarted
		    AddHandler child.UploadingFinished, AddressOf HandleChildUploadFinished
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(name As String, parent As FTPFolderItem)
		  If parent <> Nil And parent.Exist And parent.Directory Then
		    mUserInfo = parent.mUserInfo
		    mUseMLSD = parent.mUseMLSD
		    
		    Dim parentPath As String = parent.mPath
		    mName = name
		    ProcessedFTPPath(parentPath)
		    mPath = parentPath + mName
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(path As String, userInfo As FTPUserData, useMLSD As Boolean)
		  mPath = path
		  mUserInfo = userInfo
		  mUseMLSD = useMLSD
		  If mPath <> "" Then
		    If mPath.Right(1) = "/" Then
		      mPath = mPath.Left(mPath.Len - 1)
		    End
		    mName = NthField(mPath, "/", CountFields(mPath, "/"))
		    Dim parentPath As String = ParentPath
		    If mName <> "" Then
		      PostLogMessage("Start parsing base info for " + mPath)
		      Dim e As Integer = 0
		      Dim items(-1) As FTPFolderItem = ListFolder(parentPath, mUserInfo, e)
		      If e = 0 Then
		        For Each item As FTPFolderItem In items 
		          If item.Name = mName Then
		            mExist = True
		            mDirectory = item.Directory
		            If Not Directory Then
		              mSize = item.Size
		              mLastModifyDate = item.LastModifyDate
		            End
		            Exit For
		          End
		        Next
		        PostLogMessage("Parsing base info successful " + mPath)
		      Else
		        PostLogMessage("Error parsing " + mPath + ": Result = " + ErrorString(e))
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Constructor(InitData As String, parentPath As String, userInfo As FTPUserData, mlsdFormat As Boolean)
		  mUserInfo = userInfo
		  mUseMLSD = mlsdFormat
		  if InitData <> "" Then
		    If mUseMLSD Then
		      parseMLSD(InitData)
		    Else
		      parseNormal(InitData)
		    End
		    ProcessedFTPPath(parentPath)
		    mPath = parentPath + mName
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateAsFolder() As Integer
		  Dim error As Integer = 0
		  If Not Directory Or Not Exist Then
		    Dim FTPClass As New BasicFTPClass
		    FTPClass.UserData = mUserInfo
		    FTPClass.OptionURL = FTPClass.OptionURL + mPath
		    FTPClass.CollectOutputData = True
		    FTPClass.CollectHeaderData = True
		    FTPClass.OptionDirListOnly = True
		    FTPClass.YieldTime = True
		    Dim ws() As String
		    ws.Append("MKD "+ mName)
		    FTPClass.SetOptionPostQuote(ws)
		    FTPClass.ClearData
		    AddHandler FTPClass.LogMessage, AddressOf HandleFTPLogMessage
		    
		    mCurrentFTPCommand = FTPClass
		    FTPClass.SmartPerform
		    mLastFTPError = FTPClass.LastError
		    mCurrentFTPCommand = Nil
		    
		    If mLastFTPError = 0 Then
		      mExist = True
		      mDirectory = True
		      mSize = 0
		    Else
		      error = Integer(ErrorCode.eFTPError)
		    End
		  End
		  Return error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Delete() As Integer
		  Dim error As Integer = 0
		  If mExist Then
		    If Directory Then
		      If PerformChild = 0 Then
		        For Each item As FTPFolderItem In mChildren
		          If item <> Nil Then
		            error = item.Delete
		            If error <> 0 Then
		              Exit For
		            End
		          End
		        Next
		        
		        If error = 0 Then
		          Dim FTPClass As New BasicFTPClass
		          FTPClass.UserData = mUserInfo
		          FTPClass.OptionURL = FTPClass.OptionURL + mPath
		          FTPClass.CollectOutputData = True
		          FTPClass.CollectHeaderData = True
		          FTPClass.OptionDirListOnly = True
		          FTPClass.YieldTime = True
		          Dim ws() As String
		          ws.Append("RMD "+ mName)
		          FTPClass.SetOptionPostQuote(ws)
		          FTPClass.ClearData
		          AddHandler FTPClass.LogMessage, AddressOf HandleFTPLogMessage
		          
		          mCurrentFTPCommand = FTPClass
		          FTPClass.SmartPerform
		          mLastFTPError = FTPClass.LastError
		          mCurrentFTPCommand = Nil
		          If mLastFTPError = 0 Then
		            mExist = False
		          Else
		            error = Integer(ErrorCode.eFTPError)
		          End
		        End
		      Else
		        error = Integer(ErrorCode.eCannotPerformChild)
		      End
		    Else
		      Dim FTPClass As New BasicFTPClass
		      FTPClass.UserData = mUserInfo
		      FTPClass.OptionDirListOnly = true
		      FTPClass.YieldTime = True
		      Dim ws() As String
		      ws.Append("DELE "+ mPath)
		      FTPClass.SetOptionPostQuote(ws)
		      FTPClass.ClearData
		      AddHandler FTPClass.LogMessage, AddressOf HandleFTPLogMessage
		      
		      mCurrentFTPCommand = FTPClass
		      FTPClass.SmartPerform
		      mLastFTPError = FTPClass.LastError
		      mCurrentFTPCommand = Nil
		      
		      If mLastFTPError = 0 Then
		        mExist = False
		        mSize = 0
		      Else
		        error = Integer(ErrorCode.eFTPError)
		      End
		    End
		  End
		  RaiseEvent Deleted(Self)
		  Return error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DetailErrorString(errNo As Integer) As String
		  Dim errorMsg As String = ""
		  If ErrorCode(errNo) = ErrorCode.eFTPError Then
		    errorMsg = "Error from FTP: " + BasicFTPClass.ErrorString(mLastFTPError)
		  Else
		    errorMsg = ErrorString(errNo)
		  End
		  Return errorMsg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Directory() As Boolean
		  Return mDirectory
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Download(target As FolderItem, overwrite As OverwriteMode, recursively As Boolean = True, createSourceFolder As Boolean = True) As Integer
		  Dim error As Integer = 0
		  RaiseEvent DownloadingStarted(Self)
		  If Exist Then
		    If CheckFolder(target) Then
		      If Directory Then
		        If createSourceFolder Then
		          target = target.Child(mName)
		          If target <> Nil Then
		            target.CreateAsFolder
		          Else
		            error = Integer(ErrorCode.eDestinationNotFolderOrNotExist)
		          End
		        End
		        
		        If PerformChild = 0 Then
		          For Each item As FTPFolderItem In mChildren
		            If item <> Nil Then
		              If item.Directory Then
		                If recursively Then
		                  error = item.Download(target, overwrite, recursively, True)
		                End
		              Else
		                error = item.Download(target, overwrite, recursively, True)
		              End
		            End
		          Next
		        Else
		          error = Integer(ErrorCode.eCannotPerformChild)
		        End
		        
		      Else
		        target = target.Child(mName)
		        If target <> Nil Then
		          Dim canDownload As Boolean = True
		          If target.Exists Then
		            If overwrite = OverwriteMode.OverwriteNo Then
		              canDownload = False
		              error = 0
		            ElseIf overwrite = OverwriteMode.OverwriteOnlyNewest Then
		              If mLastModifyDate < target.ModificationDate Then
		                canDownload = False
		                error = 0
		              End
		            End
		          End
		          If canDownload Then
		            Dim FileDownloader As New DownloadFTPClass
		            FileDownloader.UserData = mUserInfo
		            AddHandler FileDownloader.LogMessage, AddressOf HandleFTPLogMessage
		            AddHandler FileDownloader.DownloadProgress, AddressOf HandleFTPDownloadProgress
		            
		            mCurrentFTPCommand = FileDownloader
		            FileDownloader.DownloadFile(mPath, target)
		            mLastFTPError = FileDownloader.LastError
		            mCurrentFTPCommand = Nil
		            If mLastFTPError <> 0 Then
		              error = Integer(ErrorCode.eFTPError)
		            End
		          End
		        Else
		          error = Integer(ErrorCode.eDestinationNotExist)
		        End
		      End
		    Else
		      error = Integer(ErrorCode.eDestinationNotFolderOrNotExist)
		    End
		  Else
		    error = Integer(ErrorCode.eNotExist)
		  End
		  RaiseEvent DownloadingFinished(Self)
		  Return error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ErrorString(errNo As Integer) As String
		  Dim errorMsg As String = ""
		  Select case ErrorCode(errNo)
		  Case ErrorCode.eFTPError
		    errorMsg = "Error from FTP"
		  Case ErrorCode.eEmptyPath
		    errorMsg = "Empty Path"
		  Case ErrorCode.eNotExist
		    errorMsg = "Item does not exist"
		  Case ErrorCode.eNotDirectory
		    errorMsg = "Item is not directory"
		  Case ErrorCode.eCannotPerformChild
		    errorMsg = "Item cannot load child items"
		  Case ErrorCode.eDestinationNotFolderOrNotExist
		    errorMsg = "Destination is not folder or does not exist"
		  Case ErrorCode.eDestinationNotExist
		    errorMsg = "Destionation does not exist"
		  Case ErrorCode.eCannotCreateFolder
		    errorMsg = "Cannot create item as folder"
		  Else
		    errorMsg = Str(errNo)
		  End
		  Return errorMsg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Exist() As Boolean
		  Return mExist
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindChild(childName As String) As FTPFolderItem
		  For Each item As FTPFolderItem In mChildren
		    If item <> Nil And item.Name = childName Then
		      Return item
		    End
		  Next
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChildDeleted(child As FTPFolderItem, item As FTPFolderItem)
		  RaiseEvent Deleted(item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChildDownloadFinished(child As FTPFolderItem, item As FTPFolderItem)
		  RaiseEvent DownloadingFinished(item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChildDownloadProgress(child As FTPFolderItem, filePath As String, bytesReceived As Double, bytesTotal As Double)
		  RaiseEvent DownloadProgress(filePath, bytesReceived, bytesTotal)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChildDownloadStarted(child As FTPFolderItem, item As FTPFolderItem)
		  RaiseEvent DownloadingStarted(item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChildLogMessage(child As FTPFolderItem, msg As String)
		  PostLogMessage(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChildUploadFinished(child As FTPFolderItem, item As FTPFolderItem)
		  RaiseEvent UploadingFinished(item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChildUploadProgress(child As FTPFolderItem, filePath As String,  bytesSent As Double, bytesTotal As Double)
		  RaiseEvent UploadProgress(filePath, bytesSent, bytesTotal)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleChildUploadStarted(child As FTPFolderItem, item As FTPFolderItem)
		  RaiseEvent UploadingStarted(item)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPDownloadProgress(ftpClass As DownloadFTPClass, bytesReceived As Double, bytesTotal As Double)
		  RaiseEvent DownloadProgress(Path, bytesReceived, bytesTotal)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPLogMessage(ftpClass As BasicFTPClass, msg As String)
		  PostLogMessage(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPUploadProgress(ftpClass As UploadFTPClass, bytesSent As Double, bytesTotal As Double)
		  RaiseEvent UploadProgress(Path, bytesSent, bytesTotal)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastModifyDate() As Date
		  Return mLastModifyDate
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ListFolder(path As String, userInfo As FTPUserData, ByRef e As Integer) As FTPFolderItem()
		  Dim rItems(-1) As FTPFolderItem
		  If path = "" Then
		    e = Integer(ErrorCode.eEmptyPath)
		  Else
		    ProcessedFTPPath(path)
		    If path.Left(1) = "/" Then
		      path = path.Mid(2)
		    End
		    
		    Dim ListingFolder As New BasicFTPClass
		    ListingFolder.UserData = userInfo
		    If mUseMLSD Then
		      ListingFolder.OptionCustomRequest = "MLSD"
		    Else
		      ListingFolder.OptionDirListOnly = False
		    End
		    ListingFolder.CollectOutputData = True
		    ListingFolder.OptionURL = ListingFolder.OptionURL + path
		    ListingFolder.YieldTime = True
		    AddHandler ListingFolder.LogMessage, AddressOf HandleFTPLogMessage
		    
		    mCurrentFTPCommand = ListingFolder
		    ListingFolder.SmartPerform
		    mLastFTPError = ListingFolder.LastError
		    mCurrentFTPCommand = Nil
		    
		    If mLastFTPError = 0 Then
		      Dim data As String = ReplaceLineEndings(ListingFolder.OutputData, EndOfLine)
		      For Each item As String in data.Split(EndOfLine)
		        If item <> "" Then
		          rItems.Append(New FTPFolderItem(item, path, userInfo, mUseMLSD))
		        End
		      Next
		    Else
		      e = Integer(ErrorCode.eFTPError)
		    End
		  End
		  Return rItems
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Name() As String
		  Return mName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ParentPath() As String
		  Dim parentPath As String = mPath.Left(mPath.Len - mName.Len)
		  If parentPath = "" Then
		    parentPath = "/"
		  End
		  Return parentPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parseMLSD(data As String)
		  const separator = ";"
		  Dim items(-1) As String = data.Split(separator)
		  For Each item As String in items
		    if item = "" Then
		      Continue
		    End
		    if item.InStr("modify=") > 0 Then
		      Dim modifyStr As String = item.Right(item.Len - 7)
		      mLastModifyDate = New Date
		      mLastModifyDate.Year = Val(modifyStr.Left(4))
		      mLastModifyDate.Month = Val(modifyStr.Mid(5, 2))
		      mLastModifyDate.Day = Val(modifyStr.Mid(7, 2))
		      mLastModifyDate.Hour = Val(modifyStr.Mid(9, 2)) + mLastModifyDate.GMTOffset
		      mLastModifyDate.Minute = Val(modifyStr.Mid(11, 2))
		      mLastModifyDate.Second = Val(modifyStr.Mid(13, 2))
		    ElseIf item.InStr("type=") > 0 Then
		      if item.InStr("file") > 0 Then
		        mDirectory = False
		      ElseIf item.InStr("dir") > 0 Then
		        mDirectory = True
		      End
		    ElseIf item.InStr("size=") > 0 Then
		      mSize = Val(item.Right(item.Len - 5))
		    End
		  Next
		  mName = Trim(items(items.Ubound))
		  mExist = (mName <> "." And mName <> "..")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub parseNormal(data As String)
		  data = data.Trim
		  Dim pattern As New RegEx
		  pattern.SearchPattern = cUnixFTPPattern
		  Dim match As RegExMatch = pattern.Search(data)
		  If match <> Nil Then
		    'parse unix
		    If match.SubExpressionCount = 8 Then
		      // Unix style, 7 + 1 entries
		      '1 - is folder
		      '2 - permissions
		      '3 - owner
		      '4 - group
		      '5 - size
		      '6 - modification date
		      '7 - name
		      
		      Dim first As String = match.SubExpressionString(1).Left(1)
		      If first = "d" Then
		        mDirectory = True
		      ElseIf first = "-" Then
		        mDirectory = False
		      ElseIf first = "l" Then
		        'Symbolic link
		        mDirectory = True
		      End
		      
		      mSize = Val(match.SubExpressionString(5))
		      
		      Dim dateString As String = match.SubExpressionString(6).Titlecase
		      'temperarily
		      mLastModifyDate = New Date
		      mLastModifyDate.Year = 2000
		      
		      mName = match.SubExpressionString(7)
		      
		      mExist = (mName <> "" And mName <> "." And mName <> "..")
		    End
		  Else
		    pattern.SearchPattern = cDosFTPPattern
		    match = pattern.Search(data)
		    If match <> Nil Then
		      'parse Dos
		      If match.SubExpressionCount = 4 Then
		        // DOS style, 3 + 1 entries
		        '1 - modification date
		        '2 - is folder or file size
		        '3 - name
		        
		        Dim dateString As String = match.SubExpressionString(1)
		        mLastModifyDate = New Date
		        
		        mLastModifyDate.Month = Val(dateString.Left(2))
		        mLastModifyDate.Day = Val(dateString.Mid(4, 2))
		        mLastModifyDate.Year = 1900 + Val(dateString.Mid(7, 2))
		        If mLastModifyDate.Year < 1971 Then
		          mLastModifyDate.Year = mLastModifyDate.Year + 100
		        End
		        mLastModifyDate.Hour = Val(dateString.Mid(dateString.Len - 6, 2)) + mLastModifyDate.GMTOffset
		        mLastModifyDate.Minute = Val(dateString.Mid(dateString.Len - 3, 2))
		        If dateString.Right(2) = "PM" Then
		          mLastModifyDate.Hour = mLastModifyDate.Hour + 12
		        End
		        
		        Dim second As String = match.SubExpressionString(2)
		        If second = "<DIR>" Then
		          mDirectory = True
		        Else
		          mSize = Val(second)
		        End
		        
		        mName = match.SubExpressionString(3)
		        
		        mExist = (mName <> "" And mName <> "." And mName <> "..")
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Path() As String
		  Return mPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PerformChild(force As Boolean = False) As Integer
		  Dim error As Integer = 0
		  If Exist Then
		    If Directory Then
		      If Not mChildrenParsed Or force Then
		        mChildrenParsed = True
		        PostLogMessage("Parsing children for " + mPath)
		        mChildren = ListFolder(mPath, mUserInfo, mLastFTPError)
		        For Each item As FTPFolderItem In mChildren
		          ConnectChild(item)
		        Next
		        If mLastFTPError = 0 Then
		          PostLogMessage("Parsing children successful " + mPath)
		        Else
		          error = Integer(ErrorCode.eFTPError)
		          PostLogMessage("Error parsing children " + mPath + ": Result = " + ErrorString(error))
		        End
		      End
		    Else
		      error = Integer(ErrorCode.eNotDirectory)
		    End
		  Else
		    error = Integer(ErrorCode.eNotExist)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PostLogMessage(msg As String)
		  RaiseEvent LogMessage(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Size() As UInt64
		  Return mSize
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Upload(source As FolderItem, overwrite As OverwriteMode, recursively As Boolean = True, createSourceFolder As Boolean = True) As Integer
		  Dim error As Integer = 0
		  RaiseEvent UploadingStarted(Self)
		  If source = Nil Then
		    error = Integer(ErrorCode.eDestinationNotExist)
		  Else
		    If source.Directory Then
		      Dim ftpItem As FTPFolderItem = Self
		      Dim canUpload As Boolean = True
		      If createSourceFolder Then
		        ftpItem = Child(source.Name)
		        If ftpItem = Nil Then
		          canUpload = False
		        Elseif ftpItem.CreateAsFolder <> 0 Then
		          canUpload = False
		          error = Integer(ErrorCode.eCannotCreateFolder)
		        End
		      End
		      
		      If canUpload And ftpItem <> Nil Then
		        If ftpItem.PerformChild = 0 Then
		          For i As Integer = 1 to source.count
		            Dim item As FolderItem = source.Item(i)
		            If item <> Nil Then
		              If item.Directory Then
		                If recursively Then
		                  error = ftpItem.Upload(item, overwrite, recursively, True)
		                End
		              Else
		                Dim child As FTPFolderItem = ftpItem.Child(item.Name)
		                If child <> Nil Then
		                  error = child.Upload(item, overwrite)
		                End
		              End
		            End
		          Next
		        Else
		          error = Integer(ErrorCode.eCannotPerformChild)
		        End
		      End
		    Else
		      Dim canUpload As Boolean = True
		      Dim folderPath As String = mPath
		      Dim fileName As String = source.Name
		      
		      If Directory Then
		        If Exist Then
		          If overwrite = OverwriteMode.OverwriteNo Or overwrite = OverwriteMode.OverwriteOnlyNewest Then
		            If PerformChild = 0 Then
		              Dim child As FTPFolderItem = FindChild(source.Name)
		              If child <> Nil And child.Exist Then
		                If overwrite = OverwriteMode.OverwriteNo Then
		                  canUpload = False
		                Else
		                  If source.ModificationDate < child.LastModifyDate Then
		                    canUpload = False
		                  End
		                End
		              Else
		                error = Integer(ErrorCode.eNotExist)
		              End
		            Else
		              error = Integer(ErrorCode.eCannotPerformChild)
		              canUpload = False
		            End
		          End
		        End
		      Else
		        folderPath = ParentPath
		        fileName = mName
		        If Exist Then
		          If overwrite = OverwriteMode.OverwriteNo Then
		            canUpload = False
		          ElseIf overwrite = OverwriteMode.OverwriteOnlyNewest Then
		            If source.ModificationDate < LastModifyDate Then
		              canUpload = False
		            End
		          End
		        End
		      End
		      
		      If canUpload Then
		        Dim FileUploader As New UploadFTPClass
		        FileUploader.UserData = mUserInfo
		        AddHandler FileUploader.LogMessage, AddressOf HandleFTPLogMessage
		        AddHandler FileUploader.UploadProgress, AddressOf HandleFTPUploadProgress
		        
		        mCurrentFTPCommand = FileUploader
		        FileUploader.UploadFile(source, folderPath, fileName)
		        mLastFTPError = FileUploader.LastError
		        If mLastFTPError = 0 Then
		          mExist = True
		          mSize = source.Length
		          mLastModifyDate = New Date
		        Else
		          error = Integer(ErrorCode.eFTPError)
		        End
		        mCurrentFTPCommand = Nil
		      End
		    End
		  End
		  RaiseEvent UploadingFinished(Self)
		  Return error
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Deleted(item As FTPFolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadingFinished(item As FTPFolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadingStarted(item As FTPFolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event DownloadProgress(filePath As String, bytesReceived As Double, bytesTotal As Double)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LogMessage(msg As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UploadingFinished(item As FTPFolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UploadingStarted(item As FTPFolderItem)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event UploadProgress(filePath As String, bytesSent As Double, bytesTotal As Double)
	#tag EndHook


	#tag Property, Flags = &h21
		Private mChildren(-1) As FTPFolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChildrenParsed As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCurrentFTPCommand As BasicFTPClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDirectory As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mExist As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastFTPError As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastModifyDate As Date = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSize As UInt64 = 0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mUseMLSD As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mUserInfo As FTPUserData = nil
	#tag EndProperty


	#tag Constant, Name = cDosFTPPattern, Type = String, Dynamic = False, Default = \"^(\\d\\d-\\d\\d-\\d\\d\\d\?\\d\?\\s+\\d\\d:\\d\\d[AP]M)\\s+(<DIR>|\\d+)\\s+(\\S.*)$", Scope = Private
	#tag EndConstant

	#tag Constant, Name = cUnixFTPPattern, Type = String, Dynamic = False, Default = \"^([-dl])([a-zA-Z-]{9\x2C9})\\s+\\d+\\s+(\\S*)\\s+(\\S*)\\s+(\\d+)\\s+(\\S+\\s+\\S+\\s+\\S+)\\s+(\\S.*)", Scope = Private
	#tag EndConstant


	#tag Enum, Name = ErrorCode, Type = Integer, Flags = &h0
		eFTPError = 1000
		  eEmptyPath
		  eNotExist
		  eNotDirectory
		  eCannotPerformChild
		  eDestinationNotFolderOrNotExist
		  eDestinationNotExist
		eCannotCreateFolder
	#tag EndEnum


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
