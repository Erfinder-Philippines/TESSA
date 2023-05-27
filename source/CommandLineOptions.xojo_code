#tag Module
Protected Module CommandLineOptions
	#tag Constant, Name = cAutomaticEnd, Type = String, Dynamic = False, Default = \"ae", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cHelpLongOption, Type = String, Dynamic = False, Default = \"help", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cHelpOption, Type = String, Dynamic = False, Default = \"h", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cHelpText, Type = String, Dynamic = False, Default = \"-h\x2C \xE2\x80\x94help - print help information about all command line arguments and options\n-v\x2C \xE2\x80\x94version - print info about current version about program", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cTestSequenceOption, Type = String, Dynamic = False, Default = \"s", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cUseGlobalResourceOption, Type = String, Dynamic = False, Default = \"g", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cVersionLongOption, Type = String, Dynamic = False, Default = \"version", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cVersionOption, Type = String, Dynamic = False, Default = \"v", Scope = Public
	#tag EndConstant

	#tag Constant, Name = cWorkspaceOption, Type = String, Dynamic = False, Default = \"w", Scope = Public
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
End Module
#tag EndModule
