#tag Class
Protected Class UIUpdater
	#tag Method, Flags = &h0
		Sub Constructor(BS As BasicClass, HMIInterface As HMICanvasInterface)
		  mBasic = BS
		  mHMIInterface = HMIInterface
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HMIInterface() As HMICanvasInterface
		  Return mHMIInterface
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditMode(type As Boolean)
		  If mBasic <> Nil And mHMIInterface <> Nil Then
		    mBasic.ThreadSafeMethodCall (AddressOf mHMIInterface.SetEditMode, "SetEditMode", 0, type)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocus()
		  If mBasic <> Nil And mHMIInterface <> Nil Then
		    mBasic.ThreadSafeMethodCall (AddressOf mHMIInterface.SetFocus, "SetFocus",0)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHMIInterface(obj As HMICanvasInterface)
		  mHMIInterface = obj
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, SetValue as string)
		  If mBasic <> Nil And mHMIInterface <> Nil Then
		    mBasic.ThreadSafeMethodCall (AddressOf mHMIInterface.SetProperty, "SetProperty", 0, PropertyName, SetValue)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisible(visible As Boolean)
		  if mBasic <> Nil And mHMIInterface <> Nil Then
		    mBasic.ThreadSafeMethodCall (AddressOf mHMIInterface.SetVisible, "SetVisible", 0, visible)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvas(mode As Integer)
		  If mBasic <> Nil And mHMIInterface <> Nil Then
		    #if true // new
		      // let's delay updates a bit so that we don't do them too often
		      if mBasic.mUpdateCanvasTimer <> nil and mBasic.mUpdateCanvasTimer.Mode = Timer.ModeSingle then
		        // we already have an update scheduled - ignore this new one
		        if mBasic.mUpdateCanvasHMI <> mHMIInterface then break // should always be the same or we'll need to change this code
		      else
		        dim t as new Timer
		        mBasic.mUpdateCanvasTimer = t
		        mBasic.mUpdateCanvasHMI = mHMIInterface
		        AddHandler t.Action, AddressOf mBasic.UpdateCanvasFromTimer
		        t.Period = 100 // delay 0.1s
		        t.Mode = Timer.ModeSingle
		      end
		      mBasic.mUpdateCanvasMode = mode
		    #else // old
		      mBasic.ThreadSafeMethodCall (AddressOf mHMIInterface.UpdateCanvas, "UpdateCanvas", 0, mode)
		    #endif
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBasic As BasicClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHMIInterface As HMICanvasInterface = nil
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
