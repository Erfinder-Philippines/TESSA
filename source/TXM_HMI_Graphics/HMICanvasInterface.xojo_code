#tag Interface
Protected Interface HMICanvasInterface
	#tag Method, Flags = &h0
		Function CanvasRect() As REALbasic.Rect
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetUI()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCoordinates(X as integer, Offset as integer, Y as integer, W as integer, H as integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditMode(type As Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocus()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHMIClass(HMIClass As HMI_StepClass)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, SetValue as string)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisible(value As Boolean)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvas(mode As Integer)
		  
		End Sub
	#tag EndMethod


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
End Interface
#tag EndInterface
