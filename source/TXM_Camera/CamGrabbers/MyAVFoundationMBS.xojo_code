#tag Class
Protected Class MyAVFoundationMBS
Inherits AVFoundationMBS
	#tag Event
		Sub captureStillImageAsynchronouslyCompleted(CaptureStillImageOutput as AVCaptureStillImageOutputMBS, prepareJpegStillImage as boolean, tag as variant, error as NSErrorMBS, imageDataSampleBuffer as CMSampleBufferMBS, JpegStillImage as memoryblock)
		  CamGrabbersManager.instance.ProcessMacImage(CaptureStillImageOutput, Picture.FromData(JpegStillImage))
		End Sub
	#tag EndEvent


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
