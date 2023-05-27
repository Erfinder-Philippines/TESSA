#tag Class
Protected Class CamGrabbersManager
	#tag Method, Flags = &h0
		Sub CloseAllGrabbers()
		  For Each grab As CamGrabber in mGrabbers
		    If grab <> Nil then
		      grab.CloseGrabber
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  UpdateGrabbers
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllGrabbers()
		  For Each grab As CamGrabber in mGrabbers
		    If grab <> Nil then
		      grab.CloseGrabber
		      grab = Nil
		    End
		  Next
		  ReDim mGrabbers(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  DeleteAllGrabbers
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGrabber(deviceName As String, deviceIndex As Integer) As CamGrabber
		  If deviceName <> "" And deviceIndex >= 0 Then
		    For Each grab As CamGrabber in mGrabbers
		      If grab <> Nil And grab.VideoDevice = deviceName And grab.VideoDeviceIndex = deviceIndex Then
		        Return grab
		      End
		    Next
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function instance() As CamGrabbersManager
		  if mInstance = Nil then
		    mInstance = new CamGrabbersManager
		  end
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsAnyVideoDeviceFound() As Boolean
		  Return mGrabbers.Ubound >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessMacImage(macImageCapure As AVCaptureStillImageOutputMBS, img As Picture)
		  For Each grabber As CamGrabber In mGrabbers
		    grabber.ProcessMacImage(macImageCapure, img)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateGrabbers()
		  DeleteAllGrabbers
		  Dim i As Integer
		  If TargetMacOS Then
		    Dim videoDevices(-1) As AVCaptureDeviceMBS = AVCaptureDeviceMBS.devicesWithMediaType(AVFoundationMBS.AVMediaTypeVideo)
		    For Each device As AVCaptureDeviceMBS In videoDevices
		      mGrabbers.Append(New CamGrabber(device.modelID, device.localizedName, 0))
		    Next
		  Else
		    Dim devenum As DirectShowEnumMonikerMBS
		    Dim dev As DirectShowMonikerMBS
		    Dim chanenum As DirectShowEnumMonikerMBS
		    Dim chan As DirectShowMonikerMBS
		    
		    'Set the enumerater for VideoInput devices
		    devenum = New DirectShowEnumMonikerMBS(DirectShowEnumMonikerMBS.CLSID_VideoInputDeviceCategory)
		    Dim j As Integer = 0
		    If devenum <> Nil Then
		      if devenum.Handle <> 0 Then
		        dev = devenum.NextObject
		        While dev <> Nil
		          chanenum = dev.EnumMonikers(True)  'wjkwjk -- for some reason EnumMonikers *always* returns Nil
		          If chanenum <> Nil Then
		            'Add a composite input device
		            chan = chanenum.NextObject
		            i = 1
		            While chan <> Nil
		              mGrabbers.Append(new CamGrabber(dev.Properties.FriendlyName + " (" + chan.Properties.FriendlyName + ")", _
		              dev.Properties.FriendlyName + " (" + chan.Properties.FriendlyName + ")", i))
		              chan = chanenum.NextObject
		              i = i + 1
		            Wend
		          Else
		            'Add a non-composite input device
		            mGrabbers.Append(new CamGrabber(dev.Properties.FriendlyName, dev.Properties.FriendlyName, j))
		            j = j + 1
		          End
		          dev = devenum.NextObject
		        Wend
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VideoDevices() As Pair()
		  Dim devices() As Pair
		  For Each grab As CamGrabber in mGrabbers
		    if grab <> Nil then
		      devices.Append(grab.VideoDeviceIndex : grab.VideoDeviceInputName : grab.VideoDevice)
		    End
		  Next
		  Return devices
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mGrabbers(-1) As CamGrabber
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mInstance As CamGrabbersManager = nil
	#tag EndProperty


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
