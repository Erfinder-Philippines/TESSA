#tag Class
Protected Class ElementTypeFactory
	#tag Method, Flags = &h21
		Private Function AddElementType(vName as string, vFolder as FolderItem) As ElementType
		  // add a new element type to the list
		  If vName.Len > 0 Then
		    Dim newType as new ElementType(vName, vFolder)
		    mElementTypeList.Append(newType)
		    return newType
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttributeDescription(Attr As AttributeClass) As string
		  if Attr <> Nil Then
		    Return GetAttributeDescription(Attr.MyStep, Attr.Name)
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttributeDescription(BasicClass as BasicClass, AttributeName as string) As string
		  if BasicClass <> Nil And AttributeName <> "" Then
		    Dim element As ElementType = GetElementType(BasicClass)
		    If element <> Nil Then
		      Return element.GetAttributeDescription(AttributeName)
		    End
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBasicClassDescription(BasicClass as BasicClass) As string
		  if BasicClass <> Nil Then
		    Dim element As ElementType = GetElementType(BasicClass)
		    If element <> Nil Then
		      Return element.GetMainDescription
		    End
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBasicStepBigIcon(BS As BasicClass) As Picture
		  Dim element As ElementType = GetElementType(BS)
		  if element <> Nil Then
		    Return element.getBigIcon
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBasicStepIcon(BS As BasicClass) As Picture
		  Dim pic As Picture = Nil
		  Dim element As ElementType = GetElementType(BS)
		  if element <> Nil Then
		    pic = element.getIcon
		  End
		  If pic = Nil Then
		    Dim f As FolderItem = GetFolderItemFromPath(GetElementsFolder)
		    if f <> nil then
		      f = f.Child("img")
		      If f <> Nil Then
		        Dim typeName As String = BS.BasicTypeName
		        If BS.DerivedType.GIAS <> "" Then
		          typeName = BS.DerivedType.GIAS
		        End
		        f = f.Child(typeName + ".png")
		        If f <> nil then
		          pic = Picture.Open(f)
		        End
		      End
		    End
		  End
		  If pic = Nil Then
		    pic = EmptyPic
		  End
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetElementPath(BasicClass as BasicClass) As FolderItem
		  if BasicClass <> Nil Then
		    Dim element As ElementType = GetElementType(BasicClass)
		    If element <> Nil Then
		      Return element.GetPath
		    End
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetElementType(BasicClass as BasicClass) As ElementType
		  If BasicClass = Nil Then
		    Return Nil
		  Else
		    If BasicClass.BasicTypeName.Len <= 0 Then
		      Return Nil
		    End
		  End
		  
		  Dim count As Integer = mElementTypeList.Ubound
		  Dim oneTypeList(-1) As ElementType
		  For i  As Integer = 0 to count
		    If mElementTypeList(i) <> Nil Then
		      If mElementTypeList(i).GetType = BasicClass.BasicTypeName Then
		        oneTypeList.Append(mElementTypeList(I))
		      End
		    End
		  Next
		  
		  count = oneTypeList.Ubound
		  if BasicClass.DerivedType.GIAS = "" Then
		    If count = 0 Then
		      Return oneTypeList(0)
		    End
		  End
		  
		  For i As Integer = 0 to count
		    If oneTypeList(i).GetDerivedType = BasicClass.DerivedType.GIAS Then
		      Return oneTypeList(i)
		    End
		  Next
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetElementType(path As FolderItem) As ElementType
		  if path <> Nil then
		    For Each element As ElementType in mElementTypeList
		      If element = Nil then
		        Continue
		      End
		      if element.GetPath <> Nil And element.GetXMLpath = path.NativePath then  // absolut => native
		        Return element
		      End
		    Next
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function instance() As ElementTypeFactory
		  If mInstance Is Nil then
		    mInstance = new ElementTypeFactory
		  End
		  Return mInstance
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadAllElements()
		  Dim S as string = GetElementsFolder
		  Dim f As FolderItem = GetFolderItemFromPath(S)
		  If CheckFolder(f) Then
		    f=f.Child("Elements")
		    if f<>nil then
		      // load elements folder
		      ReDim mElementTypeList(-1)
		      mTreeRoot = new ElementTreeNode
		      if f<>nil then
		        LoadFolder(f, mTreeRoot)
		        if mElementTypeList.Ubound < 0 Then
		          AddWarningTextCR("Could not load list of TestStep elements in "+f.ShellPath)
		          AddWarningTextCR("The folder alias "+str(f.alias))
		          AddWarningTextCR("The folder has "+str(f.Count)+" subfolders")
		        End
		      else
		        AddWarningTextCR("Could not load list of TestStep elements, Folder is nil")
		      end
		    else
		      AddWarningTextCR("Could not load list of TestStep elements in "+S)
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadFolder(dir as FolderItem, parentNode as ElementTreeNode)
		  If dir <> Nil Then
		    Dim cnt As Integer = dir.Count
		    
		    #if false // #59 let us skip this code because it is only called for folders whose name does not match name
		      // the xml file inside, which should be considered an error
		      '// iterate first over all xml files
		      'For idx As Integer = 1 To cnt
		      'Dim f As FolderItem = dir.Item(idx)
		      'if f <> Nil And not f.Directory And f.Name.Right(4) = ".xml" Then
		      'Dim elementName As String = f.Name
		      'elementName = elementName.Left(elementName.Len - 4)
		      'AddElementType(elementName, dir)
		      'end if
		      'next
		    #endif
		    
		    // iterate over all folders
		    for idx As Integer = 1 to cnt
		      Dim f As FolderItem = dir.Item(idx)
		      If f <> Nil And f.Directory And f.Visible Then
		        Dim elemIt As FolderItem = TESSAGlobalFunctions.ElemFolder(f)
		        dim node as new ElementTreeNode
		        node.name = f.Name
		        parentNode.children.Append node
		        dim imgFile as FolderItem = f.Child(f.Name+".png")
		        if imgFile <> nil and imgFile.Exists then
		          try
		            dim p as Picture = Picture.Open(imgFile)
		            node.image = p
		          catch exc as RuntimeException
		            ' ignore
		          end try
		        End If
		        If elemIt <> Nil Then
		          Dim elementName As String = elemIt.Name
		          If elementName.Right(4) = ".xml" Then
		            elementName = elementName.Left(elementName.Len - 4)
		          End
		          dim addedType as ElementType = AddElementType(elementName, f)
		          node.element = addedType
		        Else
		          LoadFolder(f, node)
		        End
		      End
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TreeRoot() As ElementTreeNode
		  return mTreeRoot
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mElementTypeList() As ElementType
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Shared mInstance As ElementTypeFactory = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTreeRoot As ElementTreeNode
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
