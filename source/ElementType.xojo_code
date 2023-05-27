#tag Class
Protected Class ElementType
	#tag Method, Flags = &h21
		Private Sub AddAttribute(vName as string, vDescription as string)
		  If vName <> "" Then
		    Dim index As Integer = mAttributes.IndexOf(vName)
		    If index < 0 Then
		      mAttributes.Append(vName)
		      mAttributesDescription.Append(vDescription)
		    ElseIf vDescription <> "" Then
		      mAttributesDescription(index) = vDescription
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Name as string, Folder as FolderItem)
		  mName = Name
		  mPath = Folder
		  if CheckFolder(mPath) then
		    Folder = mPath.Child(mPath.Name + ".xml")
		    if CheckFile(Folder) Then
		      mXMLpath = Folder.NativePath // absolut => native
		      Dim BS As BasicClass = Parse_Element(OpenMeasFileForLoad(mXMLpath, false))
		      If BS <> Nil Then
		        mTypeName = BS.BasicTypeName
		        mDerivedType = BS.DerivedType.GIAS
		      End
		      loadAttributes(BS)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnableDrag() As Boolean
		  Dim XMLPointer As Integer = 1
		  Dim S as string = OpenMeasFileForLoad(GetXMLPath)
		  Dim BS As BasicClass = Parse_XML(S, XMLPointer)
		  if BS <> Nil Then
		    Return BS.EnableDrag
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttributeDescription(AttrName as string) As string
		  If Not mLoaded Then
		    LoadData
		  End
		  For i As Integer = 0 To mAttributes.Ubound
		    if mAttributes(i) = AttrName Then
		      Return mAttributesDescription(i)
		    End
		  Next
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAttributeList() As String()
		  Return mAttributes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getBigIcon() As Picture
		  If mBigIcon = Nil then
		    Dim path As FolderItem = mPath.Child(mName + "64.png")
		    If path <> Nil then
		      mBigIcon = Picture.Open(path)
		    End
		  End
		  Return mBigIcon
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDerivedType() As String
		  Return mDerivedType
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getIcon() As Picture
		  If mIcon = Nil then
		    Dim path As FolderItem = mPath.Child(mName + ".png")
		    If path <> Nil then
		      mIcon = Picture.Open(path)
		    End
		  End
		  Return mIcon
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMainDescription() As String
		  Return GetAttributeDescription("MainDesc")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetName() As String
		  Return mName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPath() As FolderItem
		  Return mPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetType() As String
		  Return mTypeName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetXMLFormatAttributeDecription(vIndex as integer) As string
		  Dim attributeName As String = mAttributes(vIndex)
		  Return "<" + attributeName + ">"+ mAttributesDescription(vIndex) + "</"+attributeName + ">"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetXMLpath() As String
		  Return mXMLpath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub loadAttributes(BS As BasicClass)
		  if BS <> Nil Then
		    Me.AddAttribute("MainDesc", "")
		    For i as Integer = 0 to BS.AttributesUbound
		      Dim attr As AttributeClass = BS.GetAttribute(i)
		      If attr <> Nil And attr.Description = "" Then
		        AddAttribute(attr.Name, attr.Description)
		      End
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadData()
		  Dim path As FolderItem = mPath.Child(mPath.Name + "_desc.xml")
		  If path <> Nil then
		    Dim text As String = OpenMeasFileForLoad(path.NativePath, false) // absolut => native
		    // directly access the attribute spliting the string
		    If text.Len > 0 Then
		      Dim strList(-1) As String = text.Split(">"+chr(10))
		      If strList.Ubound > 0 Then
		        Dim SD as string
		        For n As Integer = 0 To strList.Ubound - 1
		          SD = strList(n)
		          Me.AddAttribute(Peel(SD,"<",">"), Peel(SD,">","</"))
		        Next
		      End
		      mLoaded = true
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveData()
		  // add Element name
		  Dim S As String = "<" + mName + ">" + chr(10)
		  // add attribute data
		  Dim count As Integer = mAttributes.Ubound
		  For  i As Integer = 0 to count
		    S = S + chr(9) + GetXMLFormatAttributeDecription(i) + chr(10)
		  Next
		  S = S + "</" + mName + ">" + chr(10)
		  // open file to write and save data
		  Dim path As FolderItem = mPath.Child(mName + "_desc.xml")
		  If path = Nil or (Not OpenMeasFileForSave(S, path)) then
		    MsgBox "The Description File  elements could not be saved."
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDesckForAttribute(attrName As String, attrDesc As String)
		  if attrName <> "" Then
		    if attrName = "Element " + mName Then
		      attrName = "MainDesc"
		    End
		    Dim index As Integer = mAttributes.IndexOf(attrName)
		    if index >= 0 Then
		      mAttributesDescription(index) = attrDesc
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mAttributes(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mAttributesDescription(-1) As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBigIcon As Picture = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDerivedType As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIcon As Picture = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLoaded As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPath As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTypeName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mXMLpath As String
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
