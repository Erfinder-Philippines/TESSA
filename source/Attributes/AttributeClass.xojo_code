#tag Class
Protected Class AttributeClass
	#tag Method, Flags = &h21
		Private Sub AddOutAttribute(attr As AttributeClass)
		  If attr <> Nil Then
		    mOutLinks.Append(attr)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttributeChanged()
		  if MyStep<>nil then
		    MyStep.AttributeChanged_SYNC(self)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Collection_AddRecord(Number as integer = 1)
		  // adds a record to a collection (and all included attributes)
		  // default value is one more record, but it can also be any positive number
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Collection_DeleteRecord(Index as integer = - 1)
		  // Deletes the record with the number "Index" from a collection and all included attributes
		  // if Index is -1 then the last record is being deleted
		  // what happens if there is only one collection left?
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Collection_Init(AttrGroupName as string, NumberofRecords as integer = 1)
		  // initializes a attribute.group and all included attributes as collection
		  // add the NumberofRecords given (default is 1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Collection_SetActiveRecord(Index as integer)
		  // sets the active record to the given Index, if the index is bigger it is set to the last record
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectLink(inAttr As AttributeClass)
		  If inAttr <> Nil Then
		    Link = inAttr
		    LinkName = inAttr.GetLinkAddress(Self)
		    Changed = True
		    Link.AddOutAttribute(Self)
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Attr As AttributeClass)
		  If Attr <> Nil Then
		    Constructor(Attr.MyStep, Attr.Name, Attr.Link, Attr.LinkName, Attr.Group, Attr.IsDynamic)
		    Changed = Attr.Changed
		    Description = Attr.Description
		    ReadOnly = Attr.ReadOnly
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(UpperStep as BasicClass, vName as string, vLink as AttributeClass, vLinkName as string, vGroup as AttributeGroups, AttrIsDynamic as boolean = false, vFormat as Uint16 = 0)
		    Name = vName
		  MyStep = UpperStep
		  Group = vGroup
		  IsDynamic = AttrIsDynamic
		  LinkName = vLinkName
		  Format = vFormat
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsValue(value As String) As Boolean
		  Return GOAS = value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyActiveValue()
		  // this routine is for compatibility only
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyAllLinkValue()
		  'it is avitual function must be overridden in subclasses
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DisconnectLink()
		  
		  Link.RemoveOutAttribute(Self)
		  Link = Nil
		  LinkName = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DoPropagate(vAttrName as string) As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllValues() As String
		  // returns all values as a string from Index 0 to the last value (of the active collection)
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAsLinkableAttributeClass() As AttributeClass
		  return self
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAsMultipleValuesAttributeClass() As MultipleValuesAttributeClass
		  if self IsA MultipleValuesAttributeClass then
		    return MultipleValuesAttributeClass(self)
		  else
		    return nil
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFormat() As string
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFormatInfo() As string
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLinkAddress(sourceAttr As AttributeClass) As String
		  Return GetLinkAddress(sourceAttr, MyStep.GetHierarchicalLinksSetting)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetLinkAddress(sourceAttr As AttributeClass, HierarchicalLinks As Boolean) As string
		  Dim linkPath As String = ""
		  If HierarchicalLinks Then
		    Dim linkFullPath(-1) As String = MyStep.GenerateFullPath
		    Dim index As Integer = 0
		    Dim upperCount As Integer = 0
		    if sourceAttr <> Nil Then
		      if sourceAttr.MyStep.GetUniqueID = MyStep.GetUniqueID Then
		        index = linkFullPath.Ubound
		      Else
		        Dim sourceFullPath(-1) As String = sourceAttr.MyStep.GenerateFullPath
		        Dim count As Integer = Min(linkFullPath.Ubound, sourceFullPath.Ubound)
		        If count > 0 Then
		          ReDim sourceFullPath(sourceFullPath.Ubound + 1)
		          ReDim linkFullPath(linkFullPath.Ubound + 1)
		          count = Min(linkFullPath.Ubound, sourceFullPath.Ubound)
		          For i as Integer = 0 to count - 1
		            If linkFullPath(i) = sourceFullPath(i) And linkFullPath(i + 1) <> sourceFullPath(i + 1) Then
		              index = i
		              Exit For i
		            End
		          Next
		        End
		        upperCount = sourceFullPath.Ubound - index - 1
		      End
		    End
		    
		    if index < 0 Then
		      index = 0
		    End
		    Dim temp(-1) As String
		    For j as Integer = index to linkFullPath.Ubound
		      if linkFullPath(j) <> "" Then
		        temp.Append(linkFullPath(j))
		      End
		    Next
		    linkPath = Me.Name
		    If temp.Ubound >= 0 Then
		      linkPath = Join(temp, ".") + "." + linkPath
		    End
		    if upperCount > 0 Then
		      linkPath = Str(upperCount) + "." + linkPath
		    End
		  Else
		    linkPath = Me.MyStep.Name.GIAS + "." + Me.Name
		  End
		  PrepStringForXMLSaving(linkPath)
		  Return linkPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLinkAsAttributeClass() As AttributeClass
		  if Link<>nil then
		    return Link
		  else
		    return nil
		  end
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetOutLinkCount(GlobalTopmostElement As BasicClass, IsUpdateoutLink As Boolean, ByRef Count As Integer)
		  If GlobalTopmostElement <> Nil And MyStep <> Nil Then
		    Dim attr As AttributeClass = Nil
		    Dim n As Integer = GlobalTopmostElement.AttributesUbound
		    For i As Integer = 0 to n
		      attr = GlobalTopmostElement.GetAttribute(i)
		      If attr <> Nil Then
		        If attr.Link <> Nil And MyStep.GetUniqueID = attr.Link.MyStep.GetUniqueID And Me.Name = attr.Link.Name Then
		          Count = Count + 1
		          If IsUpdateoutLink Then
		            attr.LinkName = Me.GetLinkAddress(attr)
		          End
		        End
		      End
		    Next
		    Dim BS As BasicClass = GlobalTopmostElement.FirstSubStep
		    While BS <> Nil
		      GetOutLinkCount(BS, IsUpdateoutLink, Count)
		      BS = BS.NextStep
		    Wend
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get_Connected_Step() As BasicClass
		  // gives back the upper element of a linked attribute
		  // this is a standard routine and should not be overriden
		  If Link = Nil Then
		    return MyStep
		  else
		    Return Link.MyStep
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIA() As AttributeClass
		  
		  If (Link<>Nil) and not((self IsA MultipleValuesAttributeClass) and MultipleValuesAttributeClass(self).IsArray) Then
		    'return Link
		    'Version without recursion:
		    Dim ac as AttributeClass = Link
		    Dim i as integer=0
		    while (ac.Link<>nil)
		      if ac=self then
		        // self link error
		        AddDebugTextCR("Found self link at "+MyStep.Name.GOAS+"."+Name)
		        Exit
		      elseif (ac IsA MultipleValuesAttributeClass) and MultipleValuesAttributeClass(ac).IsArray then
		        // exit when attribute is an array
		        Exit
		      else
		        ac=ac.Link
		        if i>10 then
		          // no more than 10 links
		          AddDebugTextCR("Link Overflow at "+MyStep.Name.GOAS+"."+Name)
		          Exit
		        end
		        i=i+1
		      end
		    wend
		    return ac
		  else
		    Return self
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAA() As integer
		  //returns the number of the active value of the linked Attribute (or local if not linked)
		  Return GIA.GOAA
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAB() As boolean
		  // Get active value as boolean, takes the Linked value if there is one
		  
		  Return GIA.GOAB
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAB(Index as integer, first as boolean = false) As Boolean
		  // Get value of Index as boolean, takes the Linked value if there is one
		  Return GIA.GOAB(Index)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAD() As Double
		  // Get active Value as double, takes the Linked value if there is one
		  return GIA.GOAD
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAD(Index as integer, first as boolean = false) As Double
		  // Get value of Index as double, takes the Linked value if there is one
		  Return GIA.GOAD(Index)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAI() As Int64
		  // Get active value as integer, takes the Linked value if there is one
		  Return GIA.GOAI
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAI(Index as integer, first as boolean = false) As Int64
		  // Get value of Index as integer, takes the Linked value if there is one
		  Return GIA.GOAI(Index)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAN() As integer
		  // gives back the number of values of the linked Attribute (or local if not linked)
		  // this is a standard routine and should not be overriden
		  // If (Link<>Nil) and not((self IsA MultipleValuesAttributeClass) and MultipleValuesAttributeClass(self).IsArray) Then
		  return GIA.GOAN
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAS() As string
		  // Get active value as string, takes the Linked value if there is one
		  Return GIA.GOAS
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAS(Index as integer, first as boolean = false) As string
		  // Get value of Index as string, takes the Linked value if there is one
		  Return GIA.GOAS(Index)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIEnumCount() As integer
		  Return GIA.GOEnumCount
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIUS() As BasicClass
		  // get the upper step of an attribut's linked value if there is a link
		  Return GIA.GOUS
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAA() As integer
		  //returns the number of the active value
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAB() As Boolean
		  // Get Local Value as boolean, for multiple value attributes as index should use ActiveValue
		  Return GOAB(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAB(Index as integer) As Boolean
		  // Get Local Value as boolean
		  // virtual method has to be overriden!
		  #Pragma Unused Index
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAD() As Double
		  // Get Local Value as double, for multiple value attributes as index should use ActiveValue
		  Return GOAD(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAD(Index as integer) As Double
		  // Get Local Value of Index as double
		  // virtual method has to be overriden
		  #Pragma Unused Index
		  return 0.0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAI() As Int64
		  // Get Local Value as integer, for multiple value attributes as index should use ActiveValue
		  Return GOAI(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAI(Index as integer) As Int64
		  // Get Local Value of Index as Integer
		  // virtual method has to be overriden
		  #Pragma Unused Index
		  return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAN() As integer
		  // gives back the number of values
		  // has to be overridden
		  return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAS() As string
		  // Get Local Value as String, for multiple value attributes as index should use ActiveValue
		  Return GOAS(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAS(Index as integer) As string
		  // Get Local Value as String
		  // virtual method has to be overriden
		  #Pragma Unused Index
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOASave() As string
		  // Get Local Value as string, replace reserved letters, does not take the Linked value but the one attached to the Attribute
		  // this is a standard routine and should not be overriden
		  return GOASave(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOASave(Index as integer) As string
		  // Get Local Value as string, replace reserved letters, does not take the Linked value but the one attached to the Attribute
		  // virtual method has to be overriden
		  Return GOAS(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAT() As text
		  // Get Local Value as String, for multiple value attributes as index should use ActiveValue
		  Return GOAS(0).ToText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAT(Index as integer) As text
		  // Get Local Value as String
		  // virtual method has to be overriden
		  #Pragma Unused Index
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOEnumCount() As integer
		  // get the number of enums if it is a enum variable
		  Return GOAN
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOUS() As BasicClass
		  // get the upper step of an attribut's linked value if there is a link
		  return MyStep
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDefault() As Boolean
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveOutAttribute(attr As AttributeClass)
		  If attr <> Nil Then
		    Dim index As Integer = mOutLinks.IndexOf(attr)
		    If index <> -1 Then
		      mOutLinks.Remove(index)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDefault()
		  // resets the default value to the actual value
		  Changed = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(byRef S as string)
		  // saves the attribute to a string
		  If ((Group <> TESSAGlobalFunctions.AttributeGroups.System) And (Changed Or (Not IsDefault)) And Not(NoSave)) Or (Link <> Nil) Or (LinkName <> "") Or IsDynamic Then
		    SaveAttribute(Name, S)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveAttribute(AttrName As String, byRef S as string)
		  // saves the attribute to a string
		  If Me.Link <> Nil Then
		    S = S + AttrName + "=" + chr(34) + "Link " + Me.Link.GetLinkAddress(Self) + chr(34) + " "
		  ElseIf LinkName<>"" Then
		    S = S + AttrName + "=" + chr(34) + "Link " + Me.LinkName + chr(34) + " "
		  Else
		    Dim Item As String = Me.GOASave
		    If (Item <> "") or IsDynamic Then
		      S = S + AttrName + "=" + chr(34) + Item + chr(34) + " "
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPropagate(vPropagate as boolean)
		  mPropagate = vPropagate
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SIA() As AttributeClass
		  if Link=nil then
		    return self
		  else
		    'Version without recursion:
		    Dim ac as AttributeClass = Link
		    Dim i as integer=0
		    while (ac.Link<>nil)
		      if ac=self then
		        AddDebugTextCR("Found self link at "+MyStep.Name.GOAS+"."+Name)
		        Exit
		      else
		        ac=ac.Link
		        if i>10 then
		          AddDebugTextCR("Link Overflow at "+MyStep.Name.GOAS+"."+Name)
		          Exit
		        end
		        i=i+1
		      end
		    wend
		    return ac
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAA(Index as integer)
		  // virtual method here for compatibility reasons, does not make sense to set index when it is no array
		  #Pragma Unused Index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAB(SetValue as boolean)
		  //set active value as string, sets also the local value
		  // this is a standard routine and should not be overriden
		  'Super.SIAB(SetValue)
		  
		  SIA.SOAB(SetValue)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAB(SetValue as boolean, Index as integer)
		  //set value of index as string, sets also the local value
		  // this is a standard routine and should not be overriden
		  
		  SIA.SOAB(SetValue, Index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAD(SetValue as double)
		  //set active value as string, sets also the local value
		  // this is a standard routine and should not be overriden)
		  
		  SIA.SOAD(SetValue)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAD(SetValue as double, Index as integer)
		  //set value of index as string, sets also the local value
		  // this is a standard routine and should not be overriden
		  
		  SIA.SOAD(SetValue, Index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIADSum(SetValue as double, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  If Link <> Nil Then
		    Link.SIADSum(SetValue, index)
		  else
		    SOADSum(SetValue, Index)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAI(SetValue as Int64)
		  //set active value as string, sets also the local value
		  // this is a standard routine and should not be overriden
		  
		  SIA.SOAI(SetValue)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAI(SetValue as Int64, Index as integer)
		  //set value of index as integer, sets also the local value
		  // this is a standard routine and should not be overriden
		  
		  SIA.SOAI(SetValue, Index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAN(Index as integer)
		  // sets the active value to the given index
		  SIA.SOAN(Index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAS(SetValue as string)
		  //set active value as string, sets also the local value
		  // this is a standard routine and should not be overriden
		  
		  SIA.SOAS(SetValue)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAS(SetValue as string, Index as integer)
		  //set value of index as string, sets also the local value
		  // this is a standard routine and should not be overriden
		  
		  SIA.SOAS(SetValue, Index)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAA(Index as integer)
		  // virtual method has to be overriden as list implementation is not generic but type dependent
		  // sets the active value to the given index
		  #Pragma Unused Index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAB(SetValue as Boolean)
		  //sets loacal active value as boolean, for multiple value attributes as index should use ActiveValue
		  SOAB(SetValue, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAB(SetValue as Boolean, Index as integer)
		  //sets loacal active value as string
		  // virtual method has to be overriden
		  #Pragma Unused SetValue
		  #Pragma Unused Index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAD(SetValue as double)
		  //sets loacal active value as double, for multiple value attributes as index should use ActiveValue
		  SOAD(SetValue, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAD(SetValue as double, Index as integer)
		  // virtual method has to be overriden
		  #Pragma Unused SetValue
		  #Pragma Unused Index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOADSum(SetValue as double, Index as integer)
		  // override
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAI(SetValue as Int64)
		  //sets loacal active value as integer, for multiple value attributes as index should use ActiveValue
		  SOAI(SetValue, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAI(SetValue as Int64, Index as integer)
		  // virtual method has to be overriden
		  #Pragma Unused SetValue
		  #Pragma Unused Index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAN(Index as integer)
		  // virtual method has to be overriden as list implementation is not generic but type dependent
		  // sets the number of values to the given index
		  #Pragma Unused Index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as string)
		  //sets loacal active value as string, for multiple value attributes as index should use ActiveValue
		  SOAS(SetValue, 0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as string, Index as integer)
		  // virtual method has to be overriden
		  #Pragma Unused SetValue
		  #Pragma Unused Index
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAttribute(Value as string, vLinkName as string, vArraySize as integer, vArrayMode as integer)
		  SOAS(Value)
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mChanged
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mChanged = value
			End Set
		#tag EndSetter
		Changed As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDescription
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDescription = value
			End Set
		#tag EndSetter
		Description As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Format As Integer = 0
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mGroup
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mGroup = value
			End Set
		#tag EndSetter
		Group As AttributeGroups
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mIsCollection
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mIsCollection = value
			End Set
		#tag EndSetter
		IsCollection As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mIsDynamic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mIsDynamic = value
			End Set
		#tag EndSetter
		IsDynamic As boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLink
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mLink = value
			End Set
		#tag EndSetter
		Link As AttributeClass
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mLinkName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  PrepStringFromXMLLoading(value)
			  mLinkName = value
			End Set
		#tag EndSetter
		LinkName As string
	#tag EndComputedProperty

	#tag Property, Flags = &h1
		Protected mActiveCollection As AttributeCollection = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChanged As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h1
		#tag Note
			
			.
		#tag EndNote
		Protected mCollections() As AttributeCollection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDescription As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mGroup As AttributeGroups = AttributeGroups.Parameters
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsCollection As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIsDynamic As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLink As AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLinkName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMyStep As WeakRef = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNoSave As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOutLinks() As AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPropagate As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReadOnly As Boolean = False
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if mMyStep <> nil then
			    return BasicClass (mMyStep.Value)
			  end if
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMyStep = new WeakRef (value)
			End Set
		#tag EndSetter
		MyStep As BasicClass
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mName = value
			End Set
		#tag EndSetter
		Name As string
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNoSave
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mNoSave = value
			End Set
		#tag EndSetter
		NoSave As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mReadOnly
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mReadOnly = value
			End Set
		#tag EndSetter
		ReadOnly As Boolean
	#tag EndComputedProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
			EditorType=""
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
			InitialValue=""
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
			Name="IsDynamic"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
		#tag ViewProperty
			Name="IsCollection"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
