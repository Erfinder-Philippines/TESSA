#tag Class
Class FTPUserData
	#tag Method, Flags = &h0
		Sub Constructor(Host As String, UserName As String = "", UserPass As String = "", Port As UInt16 = 21)
		  mHost = Host.Trim
		  mUserName = UserName
		  mUserPassword = UserPass
		  mPort = Port
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mHost
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mHost = value.Trim
			End Set
		#tag EndSetter
		Host As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mHost As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPort As UInt16 = 21
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mUserPassword As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPort
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPort = value
			End Set
		#tag EndSetter
		Port As UInt16
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUserName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mUserName = value
			End Set
		#tag EndSetter
		UserName As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mUserPassword
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mUserPassword = value
			End Set
		#tag EndSetter
		UserPassword As String
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Host"
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
			Name="Port"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt16"
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
			Name="UserName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UserPassword"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
