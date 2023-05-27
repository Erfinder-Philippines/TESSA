#tag Class
Protected Class FTP_Transfer_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Host = IAS("Host", "", False)
		  UserName = IAS("UserName", "", False)
		  UserPassword = IAS("UserPassword", "", False)
		  Port = IAI("Port", 21, False)
		  MLSDListening = IAB("MLSDListening", False, False)
		  
		  TransferDirection = IAE("TransferDirection", "0 Download Upload", False)
		  LocalItem = IAPath("LocalFolder", "", False, True)
		  RemoteItem = IAS("RemoteFolder", "", False)
		  IncludeSubFolder = IAB("IncludeSubFolder", True, False)
		  OverWrite = IAE("OverWrite", "0 OverwriteNo OverwriteAlways OverwriteOnlyNewest", False)
		  
		  Result = IAE("Status", "0 Pennding Pass Failed", False, AttributeGroups.Settings)
		  ResultText = IAS("ResultText", "", False ,AttributeGroups.Settings)
		  Progress = IAD("Progress", 0.0, False, AttributeGroups.Settings)
		  
		  Result.ReadOnly = True
		  ResultText.ReadOnly = True
		  Progress.ReadOnly = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetUserData() As FTPUserData
		  Return New FTPUserData(Host.GIAS, UserName.GIAS, UserPassword.GIAS, Port.GIAI)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPDownloadFinished(child As FTPFolderItem, item As FTPFolderItem)
		  If item <> Nil And Not item.Directory Then
		    IncreaseProgress(item.size)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPDownloadProgress(ftpClass As FTPFolderItem, filePath As String, bytesReceived As Double, bytesTotal As Double)
		  Progress.SIAD((mCurrentProgress + bytesReceived) / mFullProgress * 100.0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPDownloadStarted(child As FTPFolderItem, item As FTPFolderItem)
		  If item <> Nil And Not item.Directory Then
		    mFullProgress = mFullProgress + item.size
		    IncreaseProgress(0)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPUploadFinished(child As FTPFolderItem, item As FTPFolderItem)
		  If item <> Nil And Not item.Directory Then
		    IncreaseProgress(item.Size)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleFTPUploadProgress(ftpClass As FTPFolderItem, path As String, bytesSent As Double, bytesTotal As Double)
		  Progress.SIAD((mCurrentProgress + bytesSent) / mFullProgress * 100.0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub IncreaseProgress(value As Double)
		  mCurrentProgress = mCurrentProgress + value
		  If mFullProgress = 0 Then
		    Progress.SIAD(0.0)
		  Else
		    Progress.SIAD(mCurrentProgress / mFullProgress * 100.0)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OverWriteMode() As FTP.OverwriteMode
		  Dim mode As FTP.OverwriteMode = FTP.OverwriteMode.OverwriteNo
		  Select Case OverWrite.GIAI
		  Case 1
		    mode = FTP.OverwriteMode.OverwriteAlways
		  Case 2
		    mode = FTP.OverwriteMode.OverwriteOnlyNewest
		  End
		  Return mode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PrepareAndDownload()
		  Dim RemotePath As String = RemoteItem.GIAS
		  Dim TargetItem As FolderItem = LocalItem.GIAF
		  
		  If RemotePath <> "" And TargetItem <> Nil Then
		    mFullProgress = 1000
		    
		    If (Not TargetItem.Exists) And TargetItem.Directory Then
		      TargetItem.CreateAsFolder
		    End
		    
		    Dim FTPItem As New FTPFolderItem(RemotePath, GetUserData, MLSDListening.GIAB)
		    AddHandler FTPItem.DownloadProgress, AddressOf HandleFTPDownloadProgress
		    AddHandler FTPItem.DownloadingStarted, AddressOf HandleFTPDownloadStarted
		    AddHandler FTPItem.DownloadingFinished, AddressOf HandleFTPDownloadFinished
		    
		    Dim error As Integer = FTPItem.Download(TargetItem, OverWriteMode, IncludeSubFolder.GIAB, False)
		    If error = 0 Then
		      SetResult(True, "Downlaoding: " + RemotePath + " from FTP to folder " + TargetItem.NativePath + " was succeed")
		    Else
		      SetResult(False, "Downlaoding: " + RemotePath + " from FTP to folder " + TargetItem.NativePath + " was failed with error: " + FTPItem.DetailErrorString(error))
		    End
		  Else
		    SetResult(False, "Transfer error: Source folder not found")
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PrepareAndUpload()
		  Dim Source As FolderItem = LocalItem.GIAF
		  Dim TargetFolder As String = RemoteItem.GIAS
		  If Source <> Nil And TargetFolder <> "" Then
		    mFullProgress = SizeOfFolderOrFile(Source)
		    
		    FTP.ProcessedFTPPath(TargetFolder)
		    Dim FTPItem As New FTPFolderItem(TargetFolder, GetUserData, MLSDListening.GIAB)
		    
		    Dim canUpload As Boolean = True
		    If Not FTPItem.Exist Then
		      Dim error As Integer = FTPItem.CreateAsFolder
		      if error <> 0 Then
		        canUpload = False
		      End
		    End
		    
		    If canUpload Then
		      AddHandler FTPItem.UploadProgress, AddressOf HandleFTPUploadProgress
		      AddHandler FTPItem.UploadingFinished, AddressOf HandleFTPUploadFinished
		      
		      Dim error As Integer = FTPItem.Upload(Source, OverWriteMode, IncludeSubFolder.GIAB, False)
		      If error = 0 Then
		        SetResult(True, "Uplaoding from folder: " + Source.NativePath + " to FTP folder: " + TargetFolder + " was succeed")
		      Else
		        SetResult(False, "Uploading from folder: " + Source.NativePath + " to FTP folder: " + TargetFolder + " was failed with error: " + FTPItem.DetailErrorString(error))
		      End
		      
		    End
		  Else
		    SetResult(False, "Transfer error: Source folder not found")
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SetResult(success As Boolean, msg As String)
		  If success Then
		    Result.SIAI(1)
		    Progress.SIAD(100.0)
		  Else
		    Result.SIAI(2)
		  End
		  ResultText.SIAS(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  Result.SIAI(0)
		  ResultText.SIAS("No Error")
		  Progress.SIAD(0.0)
		  mFullProgress = 0.0
		  mCurrentProgress = 0.0
		  IncreaseProgress(0.0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Select Case TransferDirection.GIAI
		  Case 0
		    PrepareAndDownload
		  Case 1
		    PrepareAndUpload
		  Else
		    SetResult(False, "Transfer error: Unknown transfer direction")
		  End
		  Return True
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Host As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		IncludeSubFolder As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LocalItem As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCurrentProgress As Double = 0.0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFullProgress As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		MLSDListening As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		OverWrite As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Port As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Progress As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RemoteItem As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Result As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ResultText As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TransferDirection As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Username As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		UserPassword As String_AttributeClass = nil
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
			Name="DebugOn"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="Local_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxRetries"
			Visible=false
			Group="Behavior"
			InitialValue="5"
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
			Name="NextTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
			Name="RetryWait"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWaitTime"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Untitled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
