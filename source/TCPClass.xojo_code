#tag Class
Protected Class TCPClass
Inherits TCPSocket
	#tag Event
		Sub Connected()
		  
		  if Me.Resource.Debug.GIAB then
		    AddDebugTextCR("TCP connected ")
		  end
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  
		  if Resource<>nil then
		    'var S as string = ReadAll(Encodings.ASCII)
		    'Resource.ComLog.SIAS(S)
		    'Resource.AddToComLog(S)
		    'Resource.ComLog.SIAS( ReadAll(Encodings.ASCII))
		    Resource.AddToComLog( ReadAll(Encodings.ASCII))
		  end
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error(err As RuntimeException)
		  
		  AddDebugTextCR("TCP Error "+str(Me.LastErrorCode) +" occured, at command "+Me.Command)
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub SendComplete(userAborted as Boolean)
		  // function switched off
		  
		  if Me.Resource.Debug.GIAB then
		    if userAborted then
		      AddDebugTextCR("TCPIP '"+Me.Command+"' aborted by user")
		    else
		      AddDebugTextCR("TCPIP "+Me.Command+" send complete")
		    end
		  end
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub Close()
		  //close the socket
		  
		  if Me.IsConnected then
		    Super.Close
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectIP(TAddress as string, TPort as integer, TLF as string = "13", vTries as integer = 3, vTimeout as integer = 100)
		  // TAddress holds the TCP IP address
		  // TPort holds the Port
		  // TLF is a string with the "End of Line" characters to be send with each command separated by a commman, eg. 10,13 will add LF and CR to the command
		  // vTimeout holds the timeout in msec
		  // vTries hold the number of tries on errors
		  
		  if Me.TimeOut<vTimeOut then
		    Me.TimeOut=vTimeOut
		  end
		  if Me.Tries<vTries then
		    Me.Tries=vTries
		  end
		  
		  Dim start, stop, Rep as integer
		  
		  Rep=0
		  
		  Address=TAddress
		  Port=TPort
		  EOL=""
		  DIm i as integer = 1
		  while NthField(TLF,",",i)<>""
		    EOL=EOL+chr(val(NthField(TLF,",",i)))
		    i=i+1
		  wend
		  
		  while (Rep<Tries) and not(Me.IsConnected)
		    Connect
		    
		    start = Ticks
		    //while the socket isn't connected
		    While (Not Me.IsConnected) and (((Ticks-start)<TimeOut) or (Ticks<start))
		      //poll the socket to let it do its things
		      Me.Poll
		      //check to see if the socket got an error
		      If Me.LastErrorCode <> 0 then
		        AddDebugTextCR( "TCP Socket "+Me.Address+" Error: " + str(Me.LastErrorCode))
		        Exit
		      End
		    Wend
		    stop = Ticks
		    
		    //if we broke the loop because we're connected
		    If Me.IsConnected then
		      Me.Resource.connected.SOAB(true)
		      if Me.Resource.Debug.GIAB then
		        AddDebugTextCR("TCP Socket "+Me.Address+" Connected in " + Str(stop - start) + "  ticks")
		      end
		      //here would be a great place to do a synchronous read operation...
		    else
		      Me.Resource.connected.SOAB(false)
		      if Me.WriteError then
		        AddDebugTextCR("TCP  "+Me.Address+" Write Error")
		      else
		        AddDebugTextCR("TCP Socket "+Me.Address+" not connected")
		      end
		    end
		    Rep=Rep+1
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(FS as TCP_ResourceClass, vTries as integer = 3, vTimeout as integer = 100)
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From StepClass
		  // Constructor() -- From RectControl
		  if FS<>nil then
		    if FS IsA Resource_StepClass then
		      Me.Resource=FS
		    else
		      AddDebugTextCR("Definied TCP class is no resource class")
		    end
		  else
		    AddDebugTextCR("No TCP Resource class definied")
		  end
		  
		  Me.TimeOut=vTimeOut
		  Me.Tries=vTries
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init(NID as integer)
		  // Initializes appilcation specific Attributes for simulation, logging and error handling
		  
		  if (NID>-1) and (NID<System.NetworkInterfaceCount) then
		    Me.NetworkInterface=System.GetNetworkInterface(NID)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send(CommandString as string)
		  Dim start as integer
		  if Me.Resource<>nil then
		    
		    Me.Command=CommandString
		    
		    if Me.IsConnected then
		      
		      Me.Command=Me.Command+Me.EOL
		      
		      if Me.Resource.Debug.GIAB then
		        AddDebugTextCR("SendTCP( "+Me.Command+" )")
		      end
		      
		      //send text
		      Me.Write Me.Command
		      Me.Flush
		      start = Ticks
		      while ((Me.BytesLeftToSend>0)  and ((Ticks-start)<10))
		      wend
		      
		      if Me.WriteError then
		        AddDebugTextCR(" TCP "+Me.Address+" Write Error")
		      end
		    else
		      AddDebugTextCR(" TCP "+Me.Address+" not connected")
		    end
		  else
		    AddDebugTextCR(" TCP "+Me.Address+" resource not set ")
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Command As string
	#tag EndProperty

	#tag Property, Flags = &h0
		EOL As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Resource As TCP_ResourceClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Testcase As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeOut As Integer = 120
	#tag EndProperty

	#tag Property, Flags = &h0
		Tries As Integer = 1
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Command"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EOL"
			Visible=false
			Group="Behavior"
			InitialValue="13"
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="Port"
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
		#tag ViewProperty
			Name="Testcase"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="TimeOut"
			Visible=false
			Group="Behavior"
			InitialValue="120"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tries"
			Visible=false
			Group="Behavior"
			InitialValue="1"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
