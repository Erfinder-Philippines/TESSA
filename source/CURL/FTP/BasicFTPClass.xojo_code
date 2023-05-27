#tag Class
Private Class BasicFTPClass
Inherits CURLSMBS
	#tag Event
		Function Read(count as integer) As string
		  mSize = mSize + count
		  if mStream <> Nil then
		    Return mStream.Read(count)
		  End
		  Return ""
		End Function
	#tag EndEvent

	#tag Event
		Function RestartRead() As boolean
		  if mStream <> Nil then
		    mStream.Position = 0
		  End
		  Return False
		End Function
	#tag EndEvent

	#tag Event
		Function Seek(pos as Int64, whence as integer) As Integer
		  dim result as integer = kSeekReturnFail
		  if mStream <> Nil Then
		    Select case whence
		    case kSeekOriginCurrent
		      mStream.Position = mStream.Position + pos
		      result = kSeekReturnOk
		    case kSeekOriginEnd
		      mStream.Position = mStream.Length + pos
		      result = kSeekReturnOk
		    case kSeekOriginSet
		      mStream.Position = pos
		      result = kSeekReturnOk
		    end Select
		  End
		  Return result
		End Function
	#tag EndEvent

	#tag Event
		Function Write(data as string, dataSize as Integer) As integer
		  if mStream <> Nil Then
		    mStream.Write(data)
		  End
		  mSize = mSize + LenB(data)
		  Return LenB(data)
		End Function
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Cancel()
		  Me.Cancel = True
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ErrorString(errNo As Integer) As String
		  // error codes for the CURL library
		  Dim info As String = "Unknow Error"
		  Select Case errNo
		  Case -1
		    info = "Function missing"
		  Case   0
		    info = "No errors"
		  Case   1
		    info = "Unsupported protocol. The URL you passed to libcurl used a protocol that this libcurl does not support"
		  Case   2
		    info = "Very early initialization code failed or option not available"
		  Case   3
		    info = "The URL was not properly formatted"
		  Case   4
		    info = "URL malformat user"
		  Case   5
		    info = "Couldn't resolve proxy. The given proxy host could not be resolved"
		  Case   6
		    info = "Couldn't resolve host. The given remote host was not resolved"
		  Case   7
		    info = "Failed to connect to host or proxy"
		  Case   8
		    info = "The server sent data libcurl couldn't parse"
		  Case   9
		    info = "We were denied access to the resource given in the URL. For FTP, this occurs while trying to change to the remote directory"
		  Case 10
		    info = "While waiting for the server to connect back when an active FTP session is used, an error code was sent over the control connection or similar"
		  Case 11
		    info = "After having sent the FTP password to the server, libcurl expects a proper reply. This error code indicates that an unexpected code was returned"
		  Case 12
		    info = "During an active FTP session while waiting for the server to connect, the timeout expired"
		  Case 13
		    info = "libcurl failed to get a sensible result back from the server as a response to either a PASV or a EPSV command. The server is flawed"
		  Case 14
		    info = "FTP servers return a 227-line as a response to a PASV command. If libcurl fails to parse that line, this return code is passed back"
		  Case 15
		    info = "An internal failure to lookup the host used for the new connection"
		  Case 16
		    info = "A problem was detected in the HTTP2 framing layer. This is somewhat generic and can be one out of several problems, see the error buffer for details"
		  Case 17
		    info = "Received an error when trying to set the transfer mode to binary or ASCII"
		  Case 18
		    info = "A file transfer was shorter or larger than expected. This happens when the server first reports an expected transfer size, and then delivers data that doesn't match the previously given size"
		  Case 19
		    info = "FTP couldn't retrieve file. This was either a weird reply to a 'RETR' command or a zero byte transfer complete"
		  Case 20
		    info = "FTP write error"
		  Case 21
		    info = "When sending custom QUOTE commands to the remote server, one of the commands returned an error code that was 400 or higher"
		  Case 22
		    info = "HTTP returned error that is >= 400"
		  Case 23
		    info = "An error occurred when writing received data to a local file, or an error was returned to libcurl from a write callback"
		  Case 24
		    info = "Malformat user"
		  Case 25
		    info = "Failed starting the upload. For FTP, the server typically denied the STOR command. The error buffer usually contains the server's explanation for this"
		  Case 26
		    info = "There was a problem reading a local file or an error returned by the read callback."
		  Case 27
		    info = "Out of memory. A memory allocation request failed. This is serious badness and things are severely screwed up if this ever occurs"
		  Case 28
		    info = "Operation timeouted. The specified time-out period was reached according to the conditions"
		  Case 29
		    info = "FTP couldn't se ASCII"
		  Case 30
		    info = "FTP port failed. The FTP PORT command returned error. This mostly happens when you haven't specified a good enough address for libcurl to use"
		  Case 31
		    info = "The FTP REST command returned error. This should never happen if the server is sane"
		  Case 32
		    info = "FTP couldn't get size"
		  Case 33
		    info = "HTTP range error. The server does not support or accept range requests"
		  Case 34
		    info = "HTTP Post failed. This is an odd error that mainly occurs due to internal confusion"
		  Case 35
		    info = "SSL connect error. A problem occurred somewhere in the SSL/TLS handshake"
		  Case 36
		    info = "Couldn't download resume. The download could not be resumed because the specified offset was out of the file boundary"
		  Case 37
		    info = "Failed to read file. A file given with FILE:// couldn't be opened. Most likely because the file path doesn't identify an existing file"
		  Case 38
		    info = "LDAP cannot bind. LDAP bind operation failed"
		  Case 39
		    info = "LDAP search failed"
		  Case 40
		    info = "Library not found"
		  Case 41
		    info = "Function not found. A required zlib function was not found"
		  Case 42
		    info = "Aborted by callback. A callback returned abort to libcurl"
		  Case 43
		    info = "Bad function argument. A function was called with a bad parameter"
		  Case 44
		    info = "Bad calling order"
		  Case 45
		    info = "Interface failed. A specified outgoing interface could not be used"
		  Case 46
		    info = "Bad password entered"
		  Case 47
		    info = "Too many redirects. When following redirects, libcurl hit the maximum amount"
		  Case 48
		    info = "User specified an unknown option"
		  Case 49
		    info = "A telnet option string was Illegally formatted"
		  Case 50
		    info = "Obsolete"
		  Case 51
		    info = "SSL peer certificate error. The remote server's SSL certificate or SSH md5 fingerprint was deemed not OK"
		  Case 52
		    info = "Got nothing error. Nothing was returned from the server, and under the circumstances, getting nothing is considered an error"
		  Case 53
		    info = "SSL crypto engine not found"
		  Case 54
		    info = "Cannot set SSL crypto engine as default"
		  Case 55
		    info = "Failed sending network data"
		  Case 56
		    info = "Failure in receiving network data"
		  Case 57
		    info = "Share is in use"
		  Case 58
		    info = "Problem with the local certificate"
		  Case 59
		    info = "Couldn't use specified cipher"
		  Case 60
		    info = "Peer certificate cannot be authenticated with known CA certificates"
		  Case 61
		    info = "Unrecognized transfer encoding"
		  Case 62
		    info = "Invalid LDAP Url"
		  Case 63
		    info = "Maximum file size exceeded"
		  Case 64
		    info = "Request FTP SSL level failed"
		  Case 65
		    info = "Sending the data requires a rewind that failed. When doing a send operation curl had to rewind the data to retransmit, but the rewinding operation failed"
		  Case 66
		    info = "Initiating the SSL Engine failed"
		  Case 67
		    info = "The remote server denied curl to login. User, password or similar was not accepted and we failed to login"
		  Case 68
		    info = "File not found on TFTP server"
		  Case 69
		    info = "Permission problem on TFTP server"
		  Case 70
		    info = "Out of disk space on the server"
		  Case 71
		    info = "Illegal TFTP operation"
		  Case 72
		    info = "Unknown TFTP transfer ID"
		  Case 73
		    info = "File already exists and will not be overwritten"
		  Case 74
		    info = "No such user. This error should never be returned by a properly functioning TFTP server"
		  Case 75
		    info = "Character conversion failed"
		  Case 76
		    info = "Caller must register conversion callbacks"
		  Case 77
		    info = "Problem with reading the SSL CA cert (path? access rights?)"
		  Case 78
		    info = "Remote file not found. The resource referenced in the URL does not exist"
		  Case 79
		    info = "An unspecified error occurred during the SSH session"
		  Case 80
		    info = "Failed to shut down the SSL connection"
		  Case 81
		    info = "Socket is not ready for send/recv wait till it's ready and try again"
		  Case 82
		    info = "Failed to load CRL file, missing or wrong format"
		  Case 83
		    info = "Issuer check failed"
		  Case 84
		    info = "The FTP server does not understand the PRET command at all or does not support the given argument"
		  Case 85
		    info = "Mismatch of RTSP CSeq numbers"
		  Case 86
		    info = "Mismatch of RTSP Session Identifiers"
		  Case 87
		    info = "Unable to parse FTP file list (during FTP wildcard downloading)"
		  Case 88
		    info = "Chunk callback reported error"
		  Case 89
		    info = "No connection available, the session will be queued"
		  Case 90
		    info = "Failed to match the pinned key specified with CURLOPT_PINNEDPUBLICKEY"
		  Case 91
		    info = "Status returned failure when asked with CURLOPT_SSL_VERIFYSTATUS"
		  Case 92
		    info = "Stream error in the HTTP/2 framing layer"
		  Else
		    If errNo >= Integer(ErrorCode.eUserInfoNotInstalled) Then
		      Select Case ErrorCode(errNo)
		      Case ErrorCode.eUserInfoNotInstalled
		        info = "User info is not installed"
		      Case ErrorCode.eEmptyHost
		        info = "Host is empty"
		      Case ErrorCode.eRemotePathNotValid
		        info = "Remote path is invalid"
		      Case ErrorCode.eSourcePathNotValid
		        info = "Source path is invalid"
		      End
		    Else
		      info = str(errNo)
		    End
		  End
		  Return info
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSize() As Integer
		  Return mSize
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function InstallUserData() As Integer
		  Dim error As Integer = 0
		  if mUserData = Nil Then
		    error = Integer(ErrorCode.eUserInfoNotInstalled)
		  Else
		    If mUserData.Host = "" Then
		      error = Integer(ErrorCode.eEmptyHost)
		    Else
		      
		      If mUserData.Host.Right(1) <> "/" Then
		        mUserData.Host = mUserData.Host + "/"
		      End
		      If mUserData.Host.Left(7) <> "ftps://" Then
		        if mUserData.Host.Left(6) <> "ftp://" Then
		          mUserData.Host = "ftp://" + mUserData.Host
		        End
		      End
		      
		      OptionURL = mUserData.Host
		      OptionUsername = mUserData.UserName
		      OptionPassword = mUserData.UserPassword
		      OptionPort = mUserData.Port
		      
		      // ssh connection
		      If mUserData.Host.Left(4) = "ftps" Then
		        OptionUseSSL = Me.KFTPSSL_CONTROL
		        OptionSSLVerifyPeer = 0
		        OptionSSLVerifyHost = 0
		      End
		    End
		  End
		  mSize = 0
		  Return error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LastError() As Integer
		  Return mLastErrorCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Perform() As Integer
		  Return Super.Perform
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function PerformMT() As Integer
		  Return Super.PerformMT
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PostLogMessage(msg As String)
		  RaiseEvent LogMessage(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SmartPerform()
		  If mLastErrorCode = 0 Then
		    If App.CurrentThread = Nil Then
		      mLastErrorCode = Perform
		    End
		    mLastErrorCode = PerformMT
		  End
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event LogMessage(msg As String)
	#tag EndHook


	#tag Property, Flags = &h1
		Protected mLastErrorCode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mSize As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mStream As BinaryStream = nil
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
			  mLastErrorCode = InstallUserData
			End Set
		#tag EndSetter
		UserData As FTPUserData
	#tag EndComputedProperty


	#tag Enum, Name = ErrorCode, Flags = &h0
		eUserInfoNotInstalled = 100
		  eEmptyHost
		  eSourcePathNotValid
		eRemotePathNotValid
	#tag EndEnum


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
