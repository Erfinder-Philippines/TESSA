#tag Class
Protected Class CamGrabber
	#tag Method, Flags = &h0
		Sub CloseGrabber()
		  If TargetMacOS Then
		    mSession.stopRunning
		    mSession.beginConfiguration
		    If mMacVideoDeviceInput <> Nil Then
		      mSession.removeInput(mMacVideoDeviceInput)
		      mMacVideoDeviceInput = Nil
		    End
		    If mMacCaptureImageOutput <> Nil Then
		      mSession.removeOutput(mMacCaptureImageOutput)
		      mMacCaptureImageOutput = Nil
		    End
		    
		    If mVideoPreviewLayer<> Nil Then
		      mVideoPreviewLayer.removeFromSuperlayer
		      mVideoPreviewLayer = Nil
		    End
		    
		    mSession.commitConfiguration
		  Else
		    Call mCaller.PushMethod (AddressOf self.CloseGrabberWin, "CloseGrabberWin")
		  End
		  mInitialized = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CloseGrabberWin()
		  If DSGrabber <> Nil Then
		    DSGrabber.SetCanvas(Nil)
		    'Stop the grabber
		    Call DSGraph.MediaControl.StopWhenReady
		    If DSGraph.MediaControl.Lasterror = 1 Then
		      Call DSGraph.MediaControl.StopWhenReady
		    End If
		    
		    'IMPORTANT: Relinquish ownership of the video window.
		    'Failing to call Owner setter can lead to assert failures within
		    'the video renderer, as it still assumes that it has a valid
		    'parent window.
		    DSGraph.VideoWindow.Visible = False
		    DSGraph.VideoWindow.Owner = Nil
		    
		    'Release DirectShow classes
		    DSGrabber = Nil
		    DSGraph = Nil
		    DSCapture = Nil
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(deviceName As String, deviceInputName As String, deviceIndex As Integer)
		  #if TargetMacOS Then
		    mSession = new AVCaptureSessionMBS
		    mSession.sessionPreset = AVFoundationMBS.AVCaptureSessionPreset640x480
		  #Endif
		  
		  mVideoDevice = deviceName
		  mVideoDeviceInputName = deviceInputName
		  mVideoDeviceInput = deviceIndex
		  
		  mCaller = new Caller
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentFrame() As Picture
		  If TargetMacOS Then
		    If mMacCaptureImageOutput <> Nil Then
		      Dim conn As AVCaptureConnectionMBS = Nil
		      For Each connection As AVCaptureConnectionMBS In mMacCaptureImageOutput.connections
		        For Each port As AVCaptureInputPortMBS In connection.inputPorts
		          If port.mediaType = AVFoundationMBS.AVMediaTypeVideo Then
		            conn = connection
		            Exit For connection
		          End
		        Next
		      Next
		      mLastMacImg = Nil
		      mMacCaptureImageOutput.captureStillImageAsynchronously(conn, True, 0)
		      Dim pic as picture = mLastMacImg
		      Dim i As Integer = 0
		      Do
		        App.DoEvents
		        i = i + 1
		        pic = mLastMacImg
		      Loop Until (i > 5000000) Or (pic <> Nil And Not pic.isBlackMBS)
		      If pic <> Nil Then
		        pic = pic.ScaleMBS(VIDEO_WIDTH, VIDEO_HEIGHT)
		      End
		      Return pic
		    End
		  Else
		    if DSGrabber <> Nil Then
		      dim pic as picture = DSGrabber.Current
		      dim i as integer = 0
		      do
		        App.YieldToNextThread
		        i = i + 1
		        pic = DSGrabber.Current
		      loop until (i > 5000000) or (pic <> nil and not pic.isBlackMBS)
		      if pic <> Nil Then
		        pic = pic.ScaleMBS(VIDEO_WIDTH, VIDEO_HEIGHT)
		      End
		      Return pic
		    End
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  CloseGrabber
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitGrabber()
		  Call mCaller.PushMethod (AddressOf self.InitGrabberInternal, "InitGrabberInternal")
		  If App.CurrentThread <> Nil Then
		    App.CurrentThread.Sleep(100)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InitGrabberInternal()
		  If TargetMacOS Then
		    If mMacVideoDeviceInput <> Nil Then
		      CloseGrabber
		    End
		    mSession.beginConfiguration
		    Dim error As NSErrorMBS
		    mMacVideoDeviceInput = AVCaptureDeviceInputMBS.deviceInputWithDevice(MacCaptureDevice, error)
		    If mMacVideoDeviceInput = Nil Then
		      'present error
		    Else
		      mSession.addInputWithNoConnections(mMacVideoDeviceInput)
		      mInitialized = True
		    End
		    mSession.commitConfiguration
		  Else
		    if DSGrabber <> Nil then
		      CloseGrabber
		    End
		    'Create the graph and capture classes
		    DSCapture = New DirectShowCaptureGraphBuilderMBS
		    DSGraph = New DirectShowGraphBuilderMBS
		    
		    'Attach the filter graph to the capture graph
		    Call DSCapture.SetFilterGraph(DSGraph)
		    
		    If DSSelectedDevice <> Nil Then
		      
		      'Create and new Grabber class
		      DSGrabber = New clsDSGrabber
		      
		      'Set the source filter
		      DSSourceFilter = DSSelectedDevice.BindBaseFilter
		      
		      'Add Capture filter to our graph.
		      Call DSGraph.AddFilter(DSSourceFilter, "Video Capture")
		      Call DSGraph.AddFilter(DSGrabber.BaseFilter, "Grabber")
		      
		      'Render the preview pin on the video capture filter
		      Call DSCapture.RenderStream(DirectShowPinMBS.PIN_CATEGORY_PREVIEW, DSCapture.MEDIATYPE_Video, DSSourceFilter, DSGrabber.BaseFilter)
		      
		      'Set the video window properties
		      DSGraph.VideoWindow.Owner = MainWindow
		      DSGraph.VideoWindow.WindowStyle = BitwiseOr(DSGraph.VideoWindow.WS_CHILD, DSGraph.VideoWindow.WS_CLIPCHILDREN)
		      DSGraph.VideoWindow.Visible = False
		      
		      'Move the VideoWindow "off screen"
		      Call DSGraph.VideoWindow.SetWindowPosition(-VIDEO_WIDTH, 0, VIDEO_WIDTH, VIDEO_HEIGHT)
		      
		      mInitialized = true
		    End If
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsInitialized() As Boolean
		  Return mInitialized
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsPreviewing() As Boolean
		  If TargetMacOS Then
		    Return mSession.isRunning
		  Else
		    If DSGraph <> Nil Then
		      Return DSGraph.MediaControl.GetState = DirectShowMediaControlMBS.kStateRunning
		    End
		  End
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function MacCaptureDevice() As AVCaptureDeviceMBS
		  Dim captureDevice As AVCaptureDeviceMBS = AVCaptureDeviceMBS.defaultDeviceWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		  Dim videoDevices(-1) As AVCaptureDeviceMBS = AVCaptureDeviceMBS.devicesWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		  For Each device As AVCaptureDeviceMBS In videoDevices
		    If device.modelID = VideoDevice Then
		      captureDevice = device
		      Exit For
		    End
		  Next
		  Return captureDevice
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessMacImage(macImageCapure As AVCaptureStillImageOutputMBS, img As Picture)
		  If macImageCapure = mMacCaptureImageOutput Then
		    mLastMacImg = img
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVideoCanvas(Canvas As CamCanvasInterface, displayControl As RectControl)
		  if TargetMacOS Then
		    Dim previewViewLayer As CALayerMBS = displayControl.CALayerMBS
		    previewViewLayer.BackgroundColor = CGColorMBS.Black
		    
		    mVideoPreviewLayer = New AVCaptureVideoPreviewLayerMBS(mSession)
		    mVideoPreviewLayer.frame = CGMakeRectMBS(0, displayControl.height - VIDEO_HEIGHT, VIDEO_WIDTH, VIDEO_HEIGHT)
		    mVideoPreviewLayer.autoresizingMask = mVideoPreviewLayer.kCALayerNotSizable + mVideoPreviewLayer.kCALayerTopEdge
		    
		    previewViewLayer.addSublayer(mVideoPreviewLayer)
		  Else
		    if DSGrabber <> Nil Then
		      DSGrabber.SetCanvas(Canvas)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartPreview()
		  Call mCaller.PushMethod (AddressOf self.StartPreviewInternal, "StartPreviewInternal")
		  If App.CurrentThread <> Nil Then
		    App.CurrentThread.Sleep(100)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub StartPreviewInternal()
		  If mInitialized Then
		    If TargetMacOS Then
		      If mMacVideoDeviceInput <> Nil And Not mSession.isRunning Then
		        mSession.beginConfiguration
		        mMacCaptureImageOutput = New AVCaptureStillImageOutputMBS
		        mMacCaptureImageOutput.outputSettings = New Dictionary(AVFoundationMBS.AVVideoCodecKey:AVFoundationMBS.AVVideoCodecJPEG)
		        mSession.addOutput(mMacCaptureImageOutput)
		        mSession.commitConfiguration
		        mSession.startRunning
		      End
		    Elseif DSGrabber <> Nil And DSGraph <> Nil Then
		      If DSGraph.MediaControl.GetState <> DirectShowMediaControlMBS.kStateRunning Then
		        'Start the preview
		        Call DSGraph.MediaControl.Run
		        If DSGraph.MediaControl.Lasterror = 1 Then
		          Call DSGraph.MediaControl.Run
		        End If
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoDevice() As String
		  Return mVideoDevice
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoDeviceIndex() As Integer
		  Return mVideoDeviceInput
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoDeviceInputName() As String
		  Return mVideoDeviceInputName
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private DSCapture As DirectShowCaptureGraphBuilderMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DSGrabber As clsDSGrabber
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DSGraph As DirectShowGraphBuilderMBS
	#tag EndProperty

	#tag ComputedProperty, Flags = &h21
		#tag Getter
			Get
			  Dim i,j As Integer
			  
			  Dim devenum As DirectShowEnumMonikerMBS
			  Dim dev As DirectShowMonikerMBS
			  Dim chanenum As DirectShowEnumMonikerMBS
			  Dim chan As DirectShowMonikerMBS
			  
			  'Set the enumerater for VideoInput devices
			  devenum = New DirectShowEnumMonikerMBS(DirectShowEnumMonikerMBS.CLSID_VideoInputDeviceCategory)
			  dev = devenum.NextObject
			  j = 0
			  While dev <> Nil
			    If dev.Properties.FriendlyName = mVideoDevice  Then
			      chanenum = dev.EnumMonikers(True)  'wjkwjk -- for some reason EnumMonikers *always* returns Nil
			      If chanenum = Nil Then
			        if j = mVideoDeviceInput Then
			          Return dev
			        End
			      Else
			        i = 1
			        chan = chanenum.NextObject
			        While chan <> Nil
			          If i = mVideoDeviceInput Then
			            Return chan
			          End If
			          chan = chanenum.NextObject
			          i = i + 1
			        Wend
			      End If
			    End If
			    dev = devenum.NextObject
			    j = j + 1
			  Wend
			  Return Nil
			End Get
		#tag EndGetter
		Private DSSelectedDevice As DirectShowMonikerMBS
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private DSSourceFilter As DirectShowBaseFilterMBS
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCaller As Caller = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mInitialized As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastMacImg As Picture = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMacCaptureImageOutput As AVCaptureStillImageOutputMBS = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMacVideoDeviceInput As AVCaptureDeviceInputMBS = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSession As AVCaptureSessionMBS = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoDevice As String = "None"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoDeviceInput As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoDeviceInputName As String = "None"
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVideoPreviewLayer As AVCaptureVideoPreviewLayerMBS = nil
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mVideoPreviewLayer
			End Get
		#tag EndGetter
		VideoPreviewLayer As AVCaptureVideoPreviewLayerMBS
	#tag EndComputedProperty


	#tag Constant, Name = VIDEO_HEIGHT, Type = Double, Dynamic = False, Default = \"480", Scope = Public
	#tag EndConstant

	#tag Constant, Name = VIDEO_WIDTH, Type = Double, Dynamic = False, Default = \"640", Scope = Public
	#tag EndConstant


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
