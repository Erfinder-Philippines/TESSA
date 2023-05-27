#tag Class
Protected Class Path_AttributeClass
Inherits String_AttributeClass
	#tag Method, Flags = &h1
		Protected Function CheckParentFolders(Name As String, parent As FolderItem, ByRef count As Integer) As FolderItem
		  If Name = "" Or parent = Nil Or count < 0 Then
		    Return Nil
		  End
		  
		  Dim f As FolderItem = parent.Child(Name)
		  If CheckFolder(f) Then
		    Return f
		  Else
		    count = count - 1
		    Return CheckParentFolders(Name, parent.Parent, count)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAF() As FolderItem
		  Dim path As String = Super.GIAS
		  If path <> "" Then
		    Return GetFolderItemFromPath(path)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAS(Index as integer) As String
		  Dim Result As String = Super.GOAS(Index)
		  if Result <> "" Then
		    Dim pathFromTemplate As String = GetPathValueFromTemplate(Result)
		    if pathFromTemplate <> "" Then
		      Result = pathFromTemplate
		    End
		  End
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOASave(Index as integer) As String
		  // Get Local Value as String (from Index)
		  Dim S As String = Super.GOAS()
		  if Not isNativePath Then
		    S = S.ReplaceAll("""", "&quot;")
		    S = GetTemplateValueFromPath(S)
		  End
		  Return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsExists() As Boolean
		  Dim f As FolderItem = GIAF
		  if f <> Nil Then
		    Return f.Exists
		  End
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsFolder() As Boolean
		  Return mFolder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OriginalValue() As String
		  If Link <> Nil Then
		    If Link IsA Path_AttributeClass Then
		      Return Path_AttributeClass(Link).OriginalValue
		    Else
		      Return Link.GIAS
		    End
		  End
		  Return Super.GOAS(GOAA)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetType(AsFolder As Boolean)
		  if mFolder <> AsFolder Then
		    mFolder = AsFolder
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAF(item As FolderItem)
		  if item <> Nil Then
		    SIAS(item.NativePath)
		  Else
		    SIAS("")
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		isNativePath As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFolder As Boolean = False
	#tag EndProperty


	#tag ViewBehavior
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
			Name="isNativePath"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ActiveValue"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
