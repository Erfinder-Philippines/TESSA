#tag Module
Protected Module FTP
	#tag Method, Flags = &h1
		Protected Sub ProcessedFTPPath(ByRef Path As String)
		  Path = Path.Trim
		  // only one slash specified
		  If Path = "/" Then
		    Path = ""
		  Else
		    
		    // ensure the first char is a slash
		    If Path.Left(1) <> "/" Then
		      Path = "/" + Path
		    End
		    
		    // ensure the last char is a slash
		    If Path.Right(1) <> "/" Then
		      Path = Path + "/"
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Enum, Name = OverwriteMode, Type = Integer, Flags = &h0
		OverwriteNo=0
		  OverwriteAlways
		OverwriteOnlyNewest
	#tag EndEnum


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
