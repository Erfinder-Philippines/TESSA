#tag Class
Protected Class clsDSGrabber
Inherits DirectShowSampleGrabberMBS
	#tag Event
		Sub NewFrame(Time as double)
		  #Pragma Unused Time
		  if mCamCanvas <> nil then
		    mCamCanvas.ProcessFrame(Me.Current)
		  end
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor()
		  // Calling the overridden superclass constructor.
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(canvas As CamCanvasInterface)
		  mCamCanvas = canvas
		  Super.Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCanvas(canvas As CamCanvasInterface)
		  mCamCanvas = canvas
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mCamCanvas As CamCanvasInterface = nil
	#tag EndProperty


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
