#tag Module
Protected Module SystemHelper
	#tag Method, Flags = &h0
		Function GetLogFolder() As FolderItem
		  Dim item As FolderItem = GetWorkingFolderItem
		  if CheckFolder(item) Then
		    item = item.Child(LogFolder)
		    If item <> Nil Then
		      if not item.Exists Then
		        item.CreateAsFolder
		      End
		      Return item
		    End
		  End
		  Return nil
		End Function
	#tag EndMethod


	#tag Constant, Name = LogFolder, Type = String, Dynamic = False, Default = \"Log", Scope = Public
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
