#tag Class
Protected Class UserFunction
	#tag Method, Flags = &h0
		Sub Constructor(CallingElement as BasicClass, FunctionName as string, vAttribute as AttributeClass, FunctionTitle as string, DisplayMode as integer, RunMode as integer, Polling as boolean)
		  mCallingElement = CallingElement
		  mFunctionName = FunctionName
		  mAttribute = vAttribute
		  mFunctionTitle = FunctionTitle
		  mDisplayMode = DisplayMode
		  mRunMode = RunMode
		  mPolling = Polling
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAttribute
			  
			End Get
		#tag EndGetter
		Attribute As AttributeClass
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCallingElement
			  
			End Get
		#tag EndGetter
		CallingElement As BasicClass
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDisplayMode
			End Get
		#tag EndGetter
		DisplayMode As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFunctionName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  #Pragma Unused value
			  
			End Set
		#tag EndSetter
		FunctionName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFunctionTitle
			End Get
		#tag EndGetter
		FunctionTitle As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAttribute As AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCallingElement As BasicClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDisplayMode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFunctionName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFunctionTitle As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPolling As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			// defines if a function is being processed right away or in the manual_OP_Loop
		#tag EndNote
		Private mRunMode As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPolling
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPolling = Value
			End Set
		#tag EndSetter
		Polling As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mRunMode
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mRunMode=value
			End Set
		#tag EndSetter
		RunMode As Integer
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="DisplayMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FunctionName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FunctionTitle"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
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
			Name="Polling"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
	#tag EndViewBehavior
End Class
#tag EndClass
