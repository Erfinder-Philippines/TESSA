#tag Class
Protected Class Picture_Attribute
Inherits Path_AttributeClass
	#tag Method, Flags = &h0
		Function GIAP() As Picture
		  Return GIAP(ActiveValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAP(index As Integer) As Picture
		  Dim rImage As Picture = Nil
		  
		  Dim path As String = GIAS(Index)
		  if path <> "" Then
		    Dim pathItem As FolderItem = GetFolderItemFromPath(path)
		    If pathItem <> Nil And pathItem.Exists and (not pathItem.Directory) Then
		      rImage = Picture.Open(pathItem)
		    Else
		      Dim containSeparator As Boolean = False
		      If TargetMacOS Then
		        containSeparator = (path.InStr(":") > 0)
		      Else
		        containSeparator = (path.InStr(":") > 0)
		      End
		      if not containSeparator Then
		        rImage = GetPicture("img", path)
		        if rImage = Nil Then
		          rImage = GetPicture("", path)
		        End
		      End
		    End
		  End
		  Return rImage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetType(AsFolder As Boolean)
		  Super.SetType(AsFolder)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAP(SetValue as Picture)
		  SIAP(SetValue, ActiveValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAP(SetValue as Picture, Index as integer)
		  if SetValue <> Nil And MyStep <> Nil Then
		    Dim f as FolderItem = MyStep.GetDataFolderItem
		    If f <> Nil Then
		      Dim fileName As String = Name + "_" + Str(index)
		      f = f.Child(fileName + ".png")
		      if f <> Nil Then
		        SetValue.Save(f, SetValue.SaveAsPNG)
		        SIAS(f.NativePath, Index) // absolut => native
		      End
		    End
		  End
		End Sub
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="isNativePath"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="FirstValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mirror"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ActiveValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ArrayMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Group"
			Visible=false
			Group="Behavior"
			InitialValue="AttributeGroups.Parameters"
			Type="AttributeGroups"
			EditorType="Enum"
			#tag EnumValues
				"0 - System"
				"1 - Settings"
				"2 - Appearance"
				"3 - Parameters"
				"4 - Dynamic"
				"5 - Collective"
			#tag EndEnumValues
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
			Name="IsArray"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsCollection"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDynamic"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="LinkName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="NoSave"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
