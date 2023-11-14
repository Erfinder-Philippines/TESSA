#tag Class
Protected Class BasicClass
	#tag Method, Flags = &h0
		Sub AddAttribute(Name as string, Value as string, LinkName as string, vArrayType as integer, vArraySize as integer, vArrayMode as integer, AttGroup As AttributeGroups = AttributeGroups.Parameters, vIsDynamic as boolean = false, vNoSave as boolean = false, FromXMLFile as boolean = false)
		  // this routine looks for the given attribute if not existent already it adds one to the StepClass
		  if Me.GetAttribute(Name)<>nil then
		    Me.SIAttribute(Name,Value,LinkName,vArraySize, vArrayMode)
		  else
		    Dim NewAttribute as AttributeClass
		    Select case vArrayType
		    case AT_String
		      NewAttribute=new String_AttributeClass(Self, Name,Value,nil,LinkName, vArraySize, vArrayMode, AttGroup)
		    case AT_Integer
		      NewAttribute=new Integer_AttributeClass(Self, Name,Value,nil,LinkName, vArraySize, vArrayMode, AttGroup)
		    case AT_Double
		      NewAttribute=new Double_AttributeClass(Self, Name,Value,nil,LinkName, vArraySize, vArrayMode, AttGroup)
		    case AT_Boolean
		      NewAttribute=new Boolean_AttributeClass(Self, Name,Value,nil,LinkName, vArraySize, vArrayMode, AttGroup)
		    case AT_Enum
		      NewAttribute=new Enum_AttributeClass(Self, Name,Value,nil,LinkName, vArraySize, vArrayMode, AttGroup)
		    case AT_Buffer
		      NewAttribute=new Buffer_AttributeClass(Self, Name,Value,nil,LinkName, AttGroup)
		    case AT_DateTime
		      NewAttribute=new DateTime_AttributeClass(Self, Name,Value,nil,LinkName, vArraySize, vArrayMode, AttGroup)
		    else
		      NewAttribute=new String_AttributeClass(Self, Name,Value,nil,LinkName, vArraySize, vArrayMode, AttGroup)
		    end
		    
		    AddAttributetoList(NewAttribute)
		    
		    If NewAttribute IsA MultipleValuesAttributeClass Then
		      MultipleValuesAttributeClass(NewAttribute).DefaultValue = ""
		    End
		    NewAttribute.Changed = true
		    if FromXMLFile then
		      NewAttribute.IsDynamic=true
		      AttGroup=AttributeGroups.Dynamic
		    else
		      NewAttribute.IsDynamic=vIsDynamic
		    end
		    NewAttribute.NoSave=vNoSave
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddAttributetoList(NewAttribute as AttributeClass)
		  // this routine looks for the given attribute if not existent already it adds one to the StepClass
		  if NewAttribute <> nil then
		    if Me.GetAttribute(NewAttribute.Name) <> nil then
		      // Attribute allready exists
		      // Attention there could be a missmatch of attribute types
		      // this is not being checked
		      MsgBox("Attention an attempt has been made to override an existing attribute under the name of "+NewAttribute.Name+" in the element "+NewAttribute.MyStep.Name.GIAS)
		    else
		      // resize the array of Attributes
		      Dim NumAttributes as integer = Ubound(AttributeList())
		      if NumAttributes < 0 then
		        redim AttributeList(0)
		        NumAttributes = 0
		      else
		        NumAttributes=NumAttributes
		        if AttributeList(NumAttributes)=nil then
		        else
		          NumAttributes = NumAttributes + 1
		        end
		        redim AttributeList(NumAttributes)
		      end
		      AttributeList(NumAttributes) = NewAttribute
		    end
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFirstSubElement(NewElement As BasicClass)
		  If NewElement <> Nil Then
		    NewElement.PreviousStep = Nil
		    NewElement.UpperStep = Self
		    If Me.FirstSubStep = Nil Then
		      NewElement.NextStep = Nil
		    Else
		      NewElement.NextStep = Me.FirstSubStep
		      Me.FirstSubStep.PreviousStep = NewElement
		    End
		    Me.FirstSubStep = NewElement
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddNextElement(NewElement as BasicClass)
		  If NewElement <> Nil Then
		    NewElement.UpperStep = Me.UpperStep
		    if Me.NextStep <> Nil Then
		      Me.NextStep.PreviousStep = NewElement
		    End
		    NewElement.NextStep = Me.NextStep
		    NewElement.PreviousStep = Self
		    Me.NextStep = NewElement
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSelectionAttribute(Name as string, vLinkName as string, SelectionValues as string, vAttrIsDyn as boolean)
		  'TODO: need to ask Daniel
		  // this routine adds a selection attribute to a table
		  Dim LA as AttributeClass = Me.GetAttribute(Name)
		  if LA <> nil then
		    if LA IsA Enum_AttributeClass then
		      Enum_AttributeClass(LA).SetEnum(SelectionValues)
		      Enum_AttributeClass(LA).LinkName = vLinkName
		    end
		  else
		    // resize the array of Attributes
		    Dim NumAttributes as integer = Ubound(AttributeList())
		    if NumAttributes < 0 then
		      NumAttributes = 1
		    else
		      NumAttributes = NumAttributes + 1
		    end
		    redim AttributeList(NumAttributes)
		    
		    LA = new Enum_AttributeClass(Self, Name, SelectionValues, nil, vLinkName, 0, 0, AttributeGroups.Parameters, vAttrIsDyn)
		    AttributeList(NumAttributes - 1) = LA
		    Enum_AttributeClass(LA).SetEnum(SelectionValues)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddSubElement(NewElement as BasicClass, atFront as Boolean = false)
		  // a new element is being added to the subordinate list
		  if NewElement <> Nil Then
		    Dim LV as BasicClass = Self.FirstSubStep
		    if LV = nil then
		      Self.FirstSubStep = NewElement
		    else
		      if atFront then
		        // insert at front of list
		        LV.PreviousStep = NewElement
		        NewElement.NextStep = LV
		        Self.FirstSubStep = NewElement
		      else
		        // append to end of list
		        while LV.NextStep <> nil
		          LV = LV.NextStep
		        wend
		        LV.NextStep = NewElement
		        NewElement.PreviousStep = LV
		      end if
		    end if
		    NewElement.UpperStep = Self
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddUserFunction(FunctionName as string, Attr as AttributeClass)
		  if (FunctionName <> "") And (Attr <> nil)  Then
		    AddUserFunction(FunctionName, Attr.Name, FunctionName, 0,UF_RunMode_Direct)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddUserFunction(FunctionName as string, vAttribute as AttributeClass, FunctionTitle as string, DisplayMode as integer, RunMode as integer = UF_RunMode_Direct, Polling as boolean = true)
		  if (FunctionName <> "") And (vAttribute <> nil)  Then
		    if FunctionTitle ="" then
		      FunctionTitle=FunctionName
		    end
		    mUserFunctions.Append(new UserFunction(self,FunctionName, vAttribute, FunctionTitle, DisplayMode, RunMode, Polling))
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddUserFunction(FunctionName as string, VariableName as string, FunctionTitle as string, DisplayMode as integer, RunMode as integer = UF_RunMode_Direct, Polling as boolean = false)
		  if (FunctionName <> "") And (VariableName <> "")  Then
		    if FunctionTitle ="" then
		      FunctionTitle=FunctionName
		    end
		    Dim vAttribute as AttributeClass = GetAttribute(VariableName)
		    if vAttribute<>nil then
		      mUserFunctions.Append(new UserFunction(self,FunctionName, vAttribute, FunctionTitle, DisplayMode, RunMode, Polling))
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AllUserFunctions(vAttribute As AttributeClass) As UserFunction()
		  Dim result(-1) As UserFunction
		  If vAttribute <> nil then
		    For Each func As UserFunction in mUserFunctions
		      If func <> Nil And func.Attribute = vAttribute Then
		        result.Append(func)
		      End
		    next
		  End
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  // this is a virtual method that is called when ever a attribute is changed by the user
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttributeChanged_SYNC(ChangedAttribute as AttributeClass)
		  
		  DoSYNC=true
		  AttributeChanged(ChangedAttribute)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AttributesUbound() As Integer
		  Return Ubound(AttributeList())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckAllSubNames()
		  //check for double names, included elements and link errors
		  Dim HierarchicalLinks As Boolean = GetHierarchicalLinksSetting
		  Dim it As BasicIteratorInterface = Iterator
		  While it.HasNext
		    it.NextItem.CheckMyName(HierarchicalLinks)
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckForErrors(ByRef S as string, ByRef ErrState as integer)
		  // this error checks for any error within this element, errors only!
		  // object will only be checked for errors if they have implemented the ReportIF interface
		  
		  if self IsA ReportIF then
		    Dim ES as integer
		    ReportIF(self).CheckError(S,ES)
		    if ES>ErrState then
		      ErrState=ES
		    end
		  end
		  
		  Dim LS as BasicClass
		  
		  LS=Me.FirstSubStep
		  while LS<>nil
		    LS.CheckForErrors(S,ErrState)
		    LS=LS.NextStep
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckMyName(HierarchicalLinks As Boolean = False)
		  //check for double names, included elements and link errors
		  Dim FS as BasicClass = Self
		  if HierarchicalLinks then
		    FS = FS.UpperStep
		  else
		    while FS.UpperStep <> nil
		      FS = FS.UpperStep
		    wend
		  end
		  
		  Name_Error = getNameRepeatings(FS, Name.GIAS, HierarchicalLinks ) > 1
		  
		  if Name_Error then
		    If HierarchicalLinks  Then
		      // do not allow the same name on the same level
		      Name.SIAS(FS.FindHighestName(Name.GIAS,True))
		      Name_Error = False
		    else
		      // do not allow the same name in the whole workspace
		      Name.SIAS(FS.FindHighestName(Name.GIAS))
		      Name_Error = False
		    End
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckReply(ByRef RV as integer, TrueRV as integer, ByRef S as string, ClearS as integer, ReplyString as string, TrueState as integer)
		  If CheckReply(RV,TrueRV,S,ClearS,ReplyString,TrueState) Then
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckReply(ByRef RV as integer, TrueRV as integer, ByRef S as string, ClearS as integer, ReplyString as string, TrueState as integer) As boolean
		  // this routine will check the S string for occurencies of Replystring
		  // the ReplyString can hold more than one expected results that are separated with a "$$OR"
		  // if the routine finds one it will return true and set the calling element according the TrueState
		  // RV: State to be changed
		  // TrueRV: RV state to be set when the ReplyString is found in S string
		  //              0=repeat this SendState
		  //              1=go to next SendState,
		  //              2=last SendState
		  // ClearS:  0=clear S completely
		  //             1=remove ReplyString completely
		  //             2= remove ReplyString completely plus 12 additional letters (because of unknown parameters  "actual=x : "
		  //             3=remove ReplyString at end and give result back
		  //             4=no change
		  // TrueState = SendState to be set when true
		  Dim n as integer = 1
		  Dim RepS as string = NthField(ReplyString,"$$OR",n)
		  Dim RB as boolean = false
		  
		  while (RepS<>"") and not(RB)
		    Dim i as integer
		    i=Instr(S,RepS)
		    if i>0 then
		      //remove echo from S
		      Me.SendState=TrueState
		      Select case ClearS
		      case 0  // clear S completely
		        S=""
		      case 1  // remove ReplyString completely
		        S= Mid(S,len(RepS)+1)
		      case 2  // remove ReplyString completely plus 12 additional letters (because of unknown parameters  "actual=x : "
		        S= Mid(S,i+13+len(RepS))
		      case 3  // remove ReplyString at end and give result back
		        S=Mid(S,2,len(S)-i)
		        i=Instr(S,"/")
		        if i>0 then
		          S=left(S,i-1)
		        end
		        S=S
		      case 4 // do not change S
		        
		      else
		        
		      end
		      RV = TrueRV
		      RB = true
		      RepS=""
		    else
		      n=n+1
		      RepS = NthField(ReplyString,"$$OR",n)
		    end
		  wend
		  
		  return RB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckReply(ByRef RV as integer, TrueRV as integer, ByRef S as string, ClearS as integer, ReplyString1 as string, ReplyString2 as string, TrueState as integer)
		  // same as with reply
		  If CheckReply(RV,TrueRV,S,ClearS,ReplyString1,ReplyString2,TrueState) Then
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckReply(ByRef RV as integer, TrueRV as integer, ByRef S as string, ClearS as integer, ReplyString1 as string, ReplyString2 as string, TrueState as integer) As boolean
		  // this method will act as the one with only one ReplyString,
		  // but it will check both Replystrings and then combine the two results with a logical AND
		  // RV: State to be changed
		  // TrueRV: RV state to be set when the ReplyString is found in S string
		  //              0=repeat this SendState
		  //              1=go to next SendState,
		  //              2=last SendState
		  // ClearS:  0=clear S completely, all other choices will not change S
		  //
		  // TrueState = SendState to be set when true
		  
		  Dim n as integer = 1
		  Dim RepS as string = NthField(ReplyString1,"$$OR",n)
		  Dim RB1,RB2 as boolean = false
		  
		  while (RepS<>"") and not(RB1)
		    RB1=Instr(S,RepS)>0
		    n=n+1
		    RepS = NthField(ReplyString1,"$$OR",n)
		  wend
		  
		  n=1
		  RepS = NthField(ReplyString2,"$$OR",n)
		  
		  while (RepS<>"") and not(RB2)
		    RB2=Instr(S,RepS)>0
		    n=n+1
		    RepS = NthField(ReplyString2,"$$OR",n)
		  wend
		  
		  RB1=RB1 and RB2
		  
		  if RB1 then
		    Select case ClearS
		    case 0  // clear S completely
		      S=""
		    else // do not change S
		      
		    end
		    Me.SendState=TrueState
		    RV = TrueRV
		  end
		  return RB1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ChildCount() As Integer
		  Dim bStep As BasicClass = FirstSubStep
		  Dim count As Integer = 0
		  
		  While bStep <> Nil
		    count = bStep.ChildCount + count + 1
		    bStep = bStep.NextStep
		  Wend
		  Return count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearChangeProperty()
		  Changed = False
		  For Each Attr As AttributeClass in AttributeList
		    If Attr <> Nil Then
		      Attr.Changed = False
		    End
		  Next
		  
		  Dim BS As BasicClass = FirstSubStep
		  While BS <> Nil
		    BS.ClearChangeProperty
		    BS = BS.NextStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CollectErrorMessages(ByRef RM as string, ByRef EM as string, ByRef ErrState as integer, NoSuppressFirst as boolean)
		  // this routine will collect all errorMessage for reporting purposes (also when no error occured)
		  // also all included objects will be checked
		  // object will only be checked for messages if they have implemented the ReportIF interface
		  // with NoSuppress there is the possibility to supress the first element as this one (e.g. TestStep) might not have been tested yet
		  // thus not returning usable values
		  
		  if NoSuppressFirst then
		    if Self IsA ReportIF then
		      ReportIF(self).GetErrorMessage(RM,EM,ErrState)
		      //MainWindow.DebugWindow.AppendText("RM: "+RM+"   EM: "+EM+"  Err: "+str(ErrState)+chr(13))
		    end
		  end
		  
		  Dim LS as BasicClass
		  LS=Me.FirstSubStep
		  while LS<>nil
		    if self IsA ReportIF then
		      if ReportIF(self).CheckErrorOn then
		        LS.CollectErrorMessages(RM,EM,ErrState,true)
		      end
		    else
		      LS.CollectErrorMessages(RM,EM,ErrState,true)
		    end
		    LS=LS.NextStep
		  wend
		  
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
		Protected Sub Collection_Load(Path as string, FileName as string, Index as integer = - 1)
		  // loads a table to a collection, default Index = -1 => add as new collection
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Collection_Save(Path as string, FileName as string, Index as integer = - 1, WriteMode as integer = 0)
		  // saves a collection as a table, default Index = -1 => save last collection
		  // Index = -1 => saves last collection
		  // WriteMode same as File_Save, 0 = override, 1 = append, 2 = automatic index
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub Collection_SetActiveRecord(Index as integer = - 1)
		  // sets the active record to the given Index, if the index is bigger it is set to the last record, -1 is the last Collection
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectAllLinks()
		  // browse through all Attributes and find links that are not linked yet
		  
		  Dim LS as BasicClass
		  Dim n, NumVars as integer
		  Dim L_Name,L_Link as string
		  Dim LA as AttributeClass = Nil
		  
		  LS=Me.FirstSubStep
		  While LS<>nil
		    // connect links of included elements
		    if LS.FirstSubStep<>nil then
		      LS.ConnectAllLinks
		    end
		    //connect Links of Attributes of this element
		    NumVars=LS.AttributesUbound
		    
		    for n = 0 to NumVars
		      LA = LS.AttributeList(n)
		      if LA <> Nil Then
		        L_Link=LA.LinkName
		        L_Name=LA.Name
		        if (L_Link<>"" )  then
		          LS.ConnectThisLink(LA)
		        end
		        if LA.Link=nil then
		          if LS IsA StepClass then
		            If (L_Name = ResorceDefineName) or (L_Name="ResourceAttribute") Then
		              Dim RS As BasicClass = Nil
		              If L_Link <> "" Then
		                Dim SplitP As Integer = Instr(1,L_Link,".")
		                Dim StepName As String = Mid(L_Link,1,SplitP-1)
		                Dim VarName As String = Mid(L_Link,SplitP+1,len(L_Link)-SplitP)
		                if VarName = ResorceDefineName And StepName <> "" Then
		                  RS = Me.FindStep(StepName)
		                End
		              Else
		                RS = Me.FindStep(LA.GIAS)
		              End
		              If RS IsA Resource_StepClass Then
		                StepClass(LS).RelatedResource = Resource_StepClass(RS)
		              End
		            else
		              if LA.GIAS.Instr(1,"auto")>0 then
		                Dim ResourceName as string =NthField(LA.GIAS," ",2)
		                Dim RS as BasicClass = Me.FindStep(ResourceName)
		                If (RS<>nil) and (RS IsA Resource_StepClass) Then
		                  StepClass(LS).RelatedResource = Resource_StepClass(RS)
		                  LA.Link=Resource_StepClass(RS).ComLog
		                  LA.SIAS("")
		                End
		              end
		            end
		          End
		        else
		          If (L_Name = ResorceDefineName) or (L_Name="ResourceAttribute") Then
		            if LA.Link.MyStep<>nil then
		              if LA.Link.MyStep IsA Resource_StepClass then
		                StepClass(LS).RelatedResource = Resource_StepClass(LA.Link.MyStep)
		              end
		            end
		          end
		        end
		      End
		    Next
		    
		    LS=LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectThisLink(LinkFrom as AttributeClass)
		  // Go through all links to find the right one to connect
		  If LinkFrom<>nil Then
		    Dim tmp(-1) As String = Split(LinkFrom.LinkName.Trim, ".")
		    Dim names(-1) As String
		    For Each item As String in tmp
		      if item <> "" Then
		        names.Append(item.ReplaceAll("&#046", "."))
		      End
		    Next
		    if names.Ubound >= 0 Then
		      Dim BS as BasicClass = LinkFrom.MyStep
		      Dim attrName As String
		      If names.Ubound = 0 Then
		        attrName = names(0)
		      Elseif names(0) = "Interface" Then
		        // replace it by the next upper step of type external take LE to find that
		        BS = Me.UpperStep
		        Dim NotFound as boolean = true
		        While NotFound
		          if BS IsA  External_TESSA_Module Then
		            NotFound = false
		          ElseIf BS.UpperStep = nil Then
		            NotFound = false
		          Else
		            BS = BS.UpperStep
		          End
		        Wend
		        If Not BS IsA  External_TESSA_Module Then
		          BS = Nil
		        End
		        
		      Else
		        attrName = names(names.Ubound)
		        Dim tempStep As BasicClass = SearchLinkStepClass(names, BS)
		        If tempStep = Nil Then
		          tempStep = SearchLinkStepClass(names, BS)
		        End
		        BS = tempStep
		        
		      End
		      If BS <> Nil Then
		        // find Attribute of element know and link two
		        LinkFrom.ConnectLink(BS.GetAttribute(attrName))
		      End
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  #Pragma Unused ConfigText
		  mUICaller = New Caller
		  
		  Name=Me.IAS("Name", "BasicClass",false)
		  Name.Format=1
		  DerivedType = Me.IAS("DerivedType", "", False)
		  DerivedType.ReadOnly = True
		  
		  UniqueID = GenerateUID
		  SYNC1=GetSYNCTime
		  SYNC2=SYNC1
		  SYNC_ID = Global_SYNC_ID
		  
		  ELT = IAX("ELT", "0,0", false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyToClipboard()
		  Dim source As String = ""
		  Me.Save(source, 0)
		  if source <> "" Then
		    Dim c As new Clipboard
		    c.Text = ""
		    c.AddRawData(source, ObjectRawData)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteIncludedElements()
		  Dim BS As BasicClass = FirstSubStep
		  While BS <> Nil
		    DeleteBasicStepClass(BS, True)
		    BS=FirstSubStep
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ErrorBeep(SoundName as string = "")
		  // searches for the upper TESSA program and executes a beep if activated
		  #Pragma Unused SoundName
		  
		  Dim BS as BasicClass = self
		  while not(BS IsA TESSA_Prog_StepClass) and (BS.UpperStep<>nil)
		    BS=BS.UpperStep
		  wend
		  
		  if BS IsA TESSA_Prog_StepClass then
		    if TESSA_Prog_StepClass(BS).Beep_on_Error.GIAB then
		      'MainWindow.Sound(SoundName)
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindElement(ElementType as Introspection.TypeInfo) As BasicClass
		  //Search for an element inside an element with that type and give it back if found
		  
		  Dim LE, FE as BasicClass = nil
		  
		  FE=nil
		  
		  LE=Me.FirstSubStep
		  
		  while (LE<>nil) and (FE=nil)
		    //test for element name
		    if Introspection.GetType(LE) = ElementType then
		      FE=LE
		    else
		      //see if element is inside this element
		      if (LE.FirstSubStep<>nil) then
		        FE=LE.FindElement(ElementType)
		      end
		    end
		    
		    //take next element
		    LE=LE.NextStep
		  wend
		  
		  return FE
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindElement(ElementType as Introspection.TypeInfo, ByRef LastElement as BasicClass) As BasicClass
		  //Search for an element inside an element with that type and give it back if found
		  
		  Dim LE, FE as BasicClass
		  
		  FE=nil
		  
		  LE=Me.FirstSubStep
		  
		  while (LE<>nil) and (FE=nil)
		    //test for element name
		    
		    if Introspection.GetType(LE) = ElementType then
		      if LastElement=nil then
		        FE=LE
		      else
		        if LastElement=LE then
		          LastElement=nil
		        end
		      end
		    else
		      //see if element is inside this element
		      if (LE.FirstSubStep<>nil) then
		        FE=LE.FindElement(ElementType, LastElement)
		      end
		    end
		    //take next element
		    LE=LE.NextStep
		  wend
		  
		  return FE
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindElement(ElementName as string, AllTree as boolean = false) As BasicClass
		  //Search for an element inside an element with that name and give it back if found
		  
		  Dim LE, FE as BasicClass = nil
		  
		  FE=nil
		  LE=FirstSubStep
		  
		  while (LE<>nil) and (FE=nil)
		    //test for element name
		    if LE.Name.GIAS=ElementName then
		      FE=LE
		    else
		      //see if element is inside this element
		      if (LE.FirstSubStep<>nil) then
		        FE=LE.FindElement(ElementName,false)
		      end
		    end
		    //take next element
		    LE=LE.NextStep
		  wend
		  
		  if (FE=nil) and AllTree then
		    LE=UpperStep
		    while (FE=nil) and (LE<>nil)
		      FE=LE.FindElement(ElementName,false)
		      LE=LE.UpperStep
		    wend
		  end
		  
		  return FE
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindElementByUniqueID(UniqueID As String) As BasicClass
		  //Search for an element inside an element with that Unique ID and give it back if found
		  If UniqueID <> "" Then
		    
		    If TESSAGlobalFunctions.BS_UID_LookupDict <> Nil Then
		      Dim bc As BasicClass = TESSAGlobalFunctions.LookupBS_by_UID(UniqueID)
		      If bc <> Nil Then
		        Return bc
		      End If
		    End If
		    
		    Dim it As BasicIteratorInterface = Iterator
		    While it.HasNext
		      Dim BS As BasicClass = it.NextItem
		      If BS.GetUniqueID = UniqueID Then
		        Return BS
		      End
		    Wend
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindEveryElement(ElementType as Introspection.TypeInfo) As BasicClass
		  Dim LE as BasicClass = self
		  
		  while (LE.UpperStep <> nil)
		    LE = LE.UpperStep
		  wend
		  return LE.FindElement(ElementType)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindEveryElement(ElementName as string) As BasicClass
		  Dim LE as BasicClass = self
		  
		  while (LE.UpperStep <> nil)
		    LE = LE.UpperStep
		  wend
		  return LE.FindElement(ElementName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindHighestName(BaseName As String, OneLevelOnly as boolean = false) As String
		  Dim version As Integer = 0
		  Dim versions(-1) As Integer
		  
		  Dim it As BasicIteratorInterface = Iterator
		  Call GetVersionOfName(BaseName)
		  While it.HasNext
		    Dim ver As Integer = GetVersionOfName(baseName, it.NextItem.Name.GIAS)
		    if ver > 0 And versions.IndexOf(ver) = -1 Then
		      versions.Append(ver)
		    End
		  Wend
		  
		  if versions.Ubound >= 0 Then
		    versions.Sort
		    For i As Integer = 0 to versions.Ubound - 1
		      if (versions(i) + 1) <> versions(i + 1) Then
		        version = versions(i)
		        Exit
		      End
		    Next
		    if version = 0 Then
		      version = versions(versions.Ubound)
		    End
		  End
		  
		  if version > 0 Then
		    Return baseName + "_" + Str(version)
		  End
		  Return baseName
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FindStep(StepName as string) As BasicClass
		  Dim SE, LE as BasicClass
		  
		  // find element first
		  SE=Self
		  while SE.UpperStep<>nil
		    SE=SE.UpperStep
		  wend
		  LE=SE.FindElement(StepName)
		  
		  Return LE
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateFullPath() As String()
		  Dim fullPath(-1) As String
		  Dim BS As BasicClass = Self
		  While BS <> Nil
		    fullPath.Insert(0, BS.Name.GIAS)
		    BS = BS.UpperStep
		  Wend
		  Return fullPath
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttribute(Index as integer) As AttributeClass
		  // seaches for the Attribute with that name
		  if Index >= 0 and Index <= AttributesUbound Then
		    Return Me.AttributeList(Index)
		  end
		  return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttribute(Name as string) As AttributeClass
		  // seaches for the Attribute with that name
		  for n as Integer = 0 to AttributesUbound
		    if Me.AttributeList(n).Name = Name then
		      Return Me.AttributeList(n)
		    end
		  next
		  return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttributeNumber(Name as string) As integer
		  // seaches for the Attribute with that name
		  Return Me.AttributeList.IndexOf(Me.GetAttribute(Name))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContextMenuItems() As MenuItem()
		  Dim items(-1) As MenuItem
		  
		  Dim copyItem As new MenuItem(CopyMenuItem, CopyMenuItem)
		  copyItem.KeyboardShortcut = App.kCopyEditShortcut
		  AddHandler copyItem.Action, AddressOf OnMenuItemTriggered
		  
		  Dim pasteItem As new MenuItem(PasteMenuItem, PasteMenuItem)
		  pasteItem.KeyboardShortcut = App.kPasteEditShortcut
		  Dim c As new Clipboard
		  pasteItem.Enabled = c.RawDataAvailable(ObjectRawData)
		  Dim cutItem As new MenuItem(CutMenuItem, CutMenuItem)
		  cutItem.KeyboardShortcut = App.kCutEditShortcut
		  Dim deleteItem As new MenuItem(DeleteMenuItem, DeleteMenuItem)
		  deleteItem.Icon = DeleteIcon16
		  
		  items.Append(cutItem)
		  items.Append(copyItem)
		  items.Append(pasteItem)
		  items.Append(deleteItem)
		  items.Append(new MenuItem(MenuItem.TextSeparator))
		  
		  Dim saveAsElement As new MenuItem(SaveAsElementItem, SaveAsElementItem)
		  items.Append(saveAsElement)
		  AddHandler saveAsElement.Action, AddressOf OnMenuItemTriggered
		  items.Append(new MenuItem(MenuItem.TextSeparator))
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDataFolderItem() As FolderItem
		  Dim f As FolderItem = GetDataStartFolderItem
		  If f <> Nil Then
		    If Not f.Exists Then
		      f.CreateAsFolder
		    End
		    f = f.Child("Testsequences")
		    If f <> Nil Then
		      If Not f.Exists Then
		        f.CreateAsFolder
		      End
		      Dim TP As TESSA_Prog_StepClass = GetTESSAProgram
		      If TP <> Nil Then
		        Dim TPItem As FolderItem = TP.ProgFolderItem
		        If TPItem <> Nil Then
		          Dim SequenceName As String = TPItem.DisplayName
		          If SequenceName.InStr(".xml") > 0 or SequenceName.InStr(".XML") > 0 Then
		            SequenceName = SequenceName.Left(SequenceName.Len - 4)
		          End
		          f = f.Child(SequenceName)
		          If f <> Nil Then
		            If Not f.Exists Then
		              f.CreateAsFolder
		            End
		            Dim stepNames(-1) As String
		            Dim BS As BasicClass = Self
		            While BS <> Nil And BS.GetUniqueID <> TP.GetUniqueID
		              stepNames.Append(BS.Name.GIAS)
		              BS = BS.UpperStep
		            Wend
		            For i As Integer = stepNames.Ubound DownTo 0
		              f = f.Child(stepNames(i))
		              If f = Nil Then
		                Exit For
		              End
		              If Not f.Exists Then
		                f.CreateAsFolder
		              End
		            Next
		          End
		        End
		      End
		    End
		  End
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDataStartFolderItem() As FolderItem
		  'Method to get start FolderItem to the some data of the Basic Class
		  'can be overloaded
		  Return GetWorkingFolderItem
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDebugInfo() As string
		  return Me.ErrorText
		  
		  Me.ErrorText=""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHierarchicalLinksSetting() As boolean
		  // get the hierarchical link setting of the upper TESSA_Prog_StepClass
		  Dim BS as BasicClass = Self
		  While BS.UpperStep <> nil and not BS IsA TESSA_Prog_StepClass
		    BS = BS.UpperStep
		  wend
		  
		  if BS IsA TESSA_Prog_StepClass then
		    Return TESSA_Prog_StepClass(BS).Hierarchical_Links.GIAB
		  else
		    BS = BS.FirstSubStep
		    if BS <> Nil then
		      While BS.NextStep <> nil and not BS IsA TESSA_Prog_StepClass
		        BS = BS.NextStep
		      wend
		      if BS IsA TESSA_Prog_StepClass then
		        Return TESSA_Prog_StepClass(BS).Hierarchical_Links.GIAB
		      end
		    end
		  end
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHigherStep() As BasicClass
		  Dim LS as BasicClass = Me.UpperStep
		  if LS = nil then
		    return nil
		  else
		    if LS.NextStep = nil then
		      Return LS.GetHigherStep
		    else
		      Return LS.NextStep
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLowestStep() As BasicClass
		  Dim LS as BasicClass = Me.FirstSubStep
		  if LS = nil then
		    return Self
		  else
		    while LS.NextStep <> nil
		      LS = LS.NextStep
		    wend
		    
		    if LS = nil then
		      Return self
		    else
		      Return LS.GetLowestStep
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNextStep() As BasicClass
		  //find the next step in the hierarchical linked list
		  if (Me.FirstSubStep=nil) then
		    if Me.NextStep=nil then
		      //there is no included and no next step get one higher
		      return Me.GetHigherStep
		    else
		      //there is no included step so take the next one
		      return Me.NextStep
		    end
		  else
		    //there are included steps so take the first one as next
		    return Me.FirstSubStep
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPreviousStep() As BasicClass
		  if Me.PreviousStep=nil then
		    if Me.UpperStep=nil then
		      return Self
		    else
		      Return Me.UpperStep
		    end
		  else
		    if Me.PreviousStep.FirstSubStep=nil then
		      return Me.PreviousStep
		    else
		      //get last one of included elements
		      return Me.PreviousStep.GetLowestStep
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPreviousTestStepClassCount(ID As String, ByRef Count As Integer) As Boolean
		  If Me IsA Test_StepClass  Then
		    Dim notInvisible As Boolean = true
		    Dim iter As BasicClass = Me
		    While iter <> Nil
		      If iter IsA Test_StepClass And Test_StepClass(iter).HMI_Page.GIAI = 0 Then
		        notInvisible = False
		        Exit
		      End
		      iter = iter.UpperStep
		    Wend
		    If notInvisible Then
		      Count = Count + 1
		    End
		  End
		  
		  Dim BS As BasicClass = Me.FirstSubStep
		  While BS <> Nil
		    If BS.GetUniqueID = ID Then
		      Return true
		    End
		    If BS.GetPreviousTestStepClassCount(ID, Count) Then
		      Return True
		    End
		    BS = BS.NextStep
		  Wend
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReport() As TestReport_StepClass
		  // get the next higher Test_Step
		  Dim FS as BasicClass = self
		  Dim AX as TESSA_Prog_StepClass = nil
		  Dim TR as TestReport_StepClass = nil
		  
		  while (FS.UpperStep<>nil)
		    if FS IsA TESSA_Prog_StepClass then
		      AX = TESSA_Prog_StepClass(FS)
		    end
		    FS=FS.UpperStep
		  wend
		  
		  if AX<>nil then
		    FS=self.FirstSubstep
		    while (FS.NextStep<>nil)
		      if FS IsA TestReport_StepClass then
		        TR=TestReport_StepClass(FS)
		      end
		      FS=FS.NextStep
		    wend
		  end
		  return TR
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTESSAProgram() As TESSA_Prog_StepClass
		  // get the next higher Test_Step
		  Dim FS as BasicClass = self
		  Dim AX as TESSA_Prog_StepClass = nil
		  
		  while FS.UpperStep <> nil
		    if FS IsA TESSA_Prog_StepClass then
		      AX = TESSA_Prog_StepClass(FS)
		    end
		    FS = FS.UpperStep
		  wend
		  
		  return AX
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUniqueID() As String
		  If UniqueID = "" Then
		    UniqueID = GenerateUID
		  End
		  Return UniqueID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUpperTest_Step() As Test_StepClass
		  // get the next higher Test_Step
		  Dim FS as BasicClass = self
		  
		  while (FS.UpperStep<>nil) and not(FS IsA Test_StepClass)
		    FS=FS.UpperStep
		  wend
		  
		  if FS IsA Test_StepClass then
		    return Test_StepClass(FS)
		  else
		    return nil
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUpper_TESSA_Program() As TESSA_Prog_StepClass
		  // get the next higher Test_Step
		  Dim FS as BasicClass = self
		  
		  while (FS.UpperStep<>nil) and not(FS IsA TESSA_Prog_StepClass)
		    FS=FS.UpperStep
		  wend
		  
		  if FS IsA TESSA_Prog_StepClass then
		    return TESSA_Prog_StepClass(FS)
		  else
		    return nil
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetUserFunction(id As String) As UserFunction
		  If id <> "" then
		    For Each func As UserFunction in mUserFunctions
		      If func <> Nil And func.FunctionName = id Then
		        Return func
		      End
		    next
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get_Num_Incl_Elements(ByRef Link_Errors as integer)
		  Dim i,n as integer
		  
		  Me.Num_Links=0
		  Me.Local_Link_Errors=0
		  
		  Dim FA As AttributeClass = Nil
		  For i = 0 to AttributesUbound
		    FA = AttributeClass(Me.AttributeList(i))
		    If FA <> Nil Then
		      if FA.LinkName<>"" then
		        Me.Num_Links=Me.Num_Links+1
		        
		        If Self IsA StepClass And FA.Name = ResorceDefineName Then
		          if StepClass(Self).RelatedResource = Nil Then
		            Me.Local_Link_Errors=Me.Local_Link_Errors+1
		          End
		        ElseIf FA.Link=nil then
		          Me.Local_Link_Errors=Me.Local_Link_Errors+1
		        end
		      ElseIf Self IsA StepClass And FA.Name = ResorceDefineName And FA.GIAS <> "" Then
		        Me.Num_Links=Me.Num_Links+1
		      end
		    End
		  Next
		  
		  Link_Errors=Link_Errors+Me.Local_Link_Errors
		  
		  Dim FS as BasicClass = Me.FirstSubStep
		  i=0
		  n=0
		  while FS<>nil
		    i=i+1
		    FS.Get_Num_Incl_Elements(n)
		    FS=FS.NextStep
		  wend
		  Me.Sub_Link_Errors=n
		  
		  Link_Errors=Link_Errors+Me.Sub_Link_Errors
		  
		  Me.Num_Included_Elements=i
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAB(AttrNr as integer) As Boolean
		  // seaches for the Attribute with that Attribut number and gives it's value back as string
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    Return SA.GIAB
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAB(AttrNr as integer, Index as integer) As Boolean
		  // seaches for the Attribute with that Attribut number and gives it's value back as string
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    Return SA.GIAB(Index)
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAB(Name as string) As boolean
		  // seaches for the Attribute with that name and gives it's value back as boolean
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    return FV.GIAB
		  End
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAD(AttrNr as integer) As Double
		  // seaches for the Attribute with that Attribut number and gives it's value back as string
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    Return SA.GIAD
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAD(AttrNr as integer, Index as integer) As Double
		  // seaches for the Attribute with that Attribut number and gives it's value back as string
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    Return SA.GIAD(Index)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAD(Name as string) As double
		  // seaches for the Attribute with that name and gives it's value back as string
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    return FV.GIAD
		  End
		  return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAI(Name as string) As integer
		  // seaches for the Attribute with that name and gives it's value back as integer
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    return FV.GIAI
		  End
		  return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAI(Name as string, DefaultValue as integer) As integer
		  // seaches for the Attribute with that name and gives it's value back as string
		  // if not found it sets it to the DefaultValue
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    return FV.GIAI
		  End
		  Me.AddAttribute(Name, str(DefaultValue), "",AT_Integer, 1, 0)
		  return DefaultValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAS(AttrNr as integer) As string
		  // seaches for the Attribute with that Attribut number and gives it's value back as string
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    Return SA.GIAS
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAS(AttrNr as integer, Index as integer) As string
		  // seaches for the Attribute with that Attribut number and gives it's value back as string
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    Return SA.GIAS(Index)
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAS(Name as string) As string
		  // seaches for the Attribute with that name and gives it's value back as string
		  Dim FV as AttributeClass = GetAttribute(Name)
		  if FV <> nil then
		    return FV.GIAS
		  End
		  return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAS(Name as string, Index as integer) As string
		  // seaches for the Attribute with that name and gives the value with index back as string
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    return FV.GIAS(Index)
		  End
		  return ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GTA(FV as AttributeClass) As AttributeClass
		  // seaches for the Attribute with that name and then gets the link in the next array!
		  If (FV<>Nil) and (FV IsA AttributeClass) Then
		    Dim linkAttr As AttributeClass = AttributeClass(FV)
		    If linkAttr <> Nil Then
		      While (linkAttr<>Nil) And (linkAttr.Link<>Nil) And not((linkAttr IsA MultipleValuesAttributeClass) and MultipleValuesAttributeClass(linkAttr).IsArray)
		        FV = linkAttr.Link
		        linkAttr = AttributeClass(FV)
		      Wend
		    End
		  End
		  Return FV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GTA(Name as string) As AttributeClass
		  // seaches for the Attribute with that name and then gets the link in the next array!
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  If FV <> Nil Then
		    Dim linkAttr As AttributeClass = AttributeClass(FV)
		    If linkAttr <> Nil Then
		      While (linkAttr <> Nil) And (linkAttr.Link <> Nil) And ((not linkAttr IsA MultipleValuesAttributeClass) Or (not MultipleValuesAttributeClass(linkAttr).IsArray))
		        FV = linkAttr.Link
		        linkAttr = AttributeClass(FV)
		      Wend
		    End
		  End
		  Return FV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasUserFunction(vAttribute As AttributeClass) As Boolean
		  If vAttribute <> nil then
		    For Each func As UserFunction in mUserFunctions
		      If func <> Nil And func.Attribute = vAttribute Then
		        Return true
		      End
		    next
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAA(vName as string, DefaultValue as string, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Anchors_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as Anchors_AttributeClass
		  if SetArray then
		    NAS= new Anchors_AttributeClass(self,vName,DefaultValue,nil,"",1,0, AttGroup)
		  else
		    NAS= new Anchors_AttributeClass(self,vName,DefaultValue,nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAB(vName as string, DefaultValue as boolean = false, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Boolean_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as Boolean_AttributeClass
		  Dim S as string
		  if DefaultValue then
		    S = "on"
		  else
		    S = "off"
		  end
		  if SetArray then
		    NAS= new Boolean_AttributeClass(self,vName,S,nil,"",1,0,AttGroup)
		  else
		    NAS= new Boolean_AttributeClass(self,vName,S,nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IABuffer(vName as string, DefaultValue as string, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Buffer_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS As Buffer_AttributeClass = New Buffer_AttributeClass(Self, vName, DefaultValue, nil,"", AttGroup)
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAC(vName as string, DefaultValue as string, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Color_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as Color_AttributeClass
		  if SetArray then
		    NAS= new Color_AttributeClass(self,vName,DefaultValue,nil,"",1,0, AttGroup)
		  else
		    NAS= new Color_AttributeClass(self,vName,DefaultValue,nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAD(vName as string, DefaultValue as double = 0, SetArray as Boolean = false, AttGroup as AttributeGroups = AttributeGroups.Parameters, vFormat as Uint16 = 0) As Double_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as Double_AttributeClass
		  if SetArray then
		    NAS= new Double_AttributeClass(self,vName,str(DefaultValue),nil,"",1,0, AttGroup, false, vFormat)
		  else
		    NAS= new Double_AttributeClass(self,vName,str(DefaultValue),nil,"",0,0, AttGroup, false, vFormat)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAE(vName as string, DefaultValue as string, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Enum_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim EAS as Enum_AttributeClass = nil
		  Dim NAS as AttributeClass = Me.GetAttribute(vName)
		  if NAS IsA Enum_AttributeClass then
		    EAS = Enum_AttributeClass(NAS)
		    EAS.SetEnum(DefaultValue)
		  end
		  
		  if EAS = nil then
		    if SetArray then
		      EAS = new Enum_AttributeClass(self,vName,DefaultValue,nil,"",1,0, AttGroup)
		    else
		      EAS = new Enum_AttributeClass(self,vName,DefaultValue,nil,"",0,0, AttGroup)
		    end
		    Me.AddAttributetoList(EAS)
		  end
		  return EAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAI(vName as string, DefaultValue as integer = 0, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Integer_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as Integer_AttributeClass
		  if SetArray then
		    NAS= new Integer_AttributeClass(self,vName,str(DefaultValue),nil,"",1,0, AttGroup)
		  else
		    NAS= new Integer_AttributeClass(self,vName,str(DefaultValue),nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAI16(vName as string, DefaultValue as integer = 0, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As UInt16_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as UInt16_AttributeClass
		  if SetArray then
		    NAS = new UInt16_AttributeClass(self,vName,str(DefaultValue),nil,"",1,0, AttGroup)
		  else
		    NAS = new UInt16_AttributeClass(self,vName,str(DefaultValue),nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAI32(vName as string, DefaultValue as integer = 0, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As UInt32_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as UInt32_AttributeClass
		  if SetArray then
		    NAS = new UInt32_AttributeClass(self,vName,str(DefaultValue),nil,"",1,0, AttGroup)
		  else
		    NAS = new UInt32_AttributeClass(self,vName,str(DefaultValue),nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAI8(vName as string, DefaultValue as integer = 0, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As UInt8_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as UInt8_AttributeClass
		  if SetArray then
		    NAS = new UInt8_AttributeClass(self,vName,str(DefaultValue),nil,"",1,0, AttGroup)
		  else
		    NAS = new UInt8_AttributeClass(self,vName,str(DefaultValue),nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAP(vName as string, DefaultValue as string, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Picture_Attribute
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAP as Picture_Attribute
		  if SetArray then
		    NAP =  new Picture_Attribute(self,vName,DefaultValue,nil,"",1,0, AttGroup)
		  else
		    NAP = new Picture_Attribute(self,vName,DefaultValue,nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAP)
		  return NAP
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAPath(vName as string, DefaultValue as string = "", SetArray as Boolean = false, AsFolder As Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Path_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as Path_AttributeClass
		  if SetArray then
		    NAS = new Path_AttributeClass(self, vName, DefaultValue, nil,"", 1, 0, AttGroup)
		  else
		    NAS = new Path_AttributeClass(self, vName, DefaultValue,nil,"", 0, 0, AttGroup)
		  end
		  NAS.SetType(AsFolder)
		  Me.AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAPoint(vName as string, DefaultValue as string, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Point_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as Point_AttributeClass
		  if SetArray then
		    NAS = new Point_AttributeClass(self, vName, DefaultValue, nil,"", 1, 0, AttGroup)
		  else
		    NAS = new Point_AttributeClass(self, vName, DefaultValue, nil,"", 0, 0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAR(vName as string, DefaultValue as string, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Resource_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim RAS as Resource_AttributeClass
		  if SetArray then
		    RAS = new Resource_AttributeClass(self,vName,DefaultValue,nil,"",1,0, AttGroup)
		  else
		    RAS = new Resource_AttributeClass(self,vName,DefaultValue,nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(RAS)
		  return RAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAS(vName as string, DefaultValue as string = "", SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As String_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as String_AttributeClass
		  if SetArray then
		    NAS = new String_AttributeClass(self,vName,DefaultValue,nil,"",2,0, AttGroup)
		  else
		    NAS = new String_AttributeClass(self,vName,DefaultValue,nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IASSingleline(vName as string, DefaultValue as string, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As String_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS As String_AttributeClass = Nil
		  If SetArray Then
		    NAS = New String_AttributeClass(Self, vName, DefaultValue, nil,"", 1, 0, AttGroup)
		  Else
		    NAS = New String_AttributeClass(Self, vName, DefaultValue, nil,"", 0, 0, AttGroup)
		  End
		  NAS.Format=1
		  AddAttributetoList(NAS)
		  Return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IASSingleVallue(vName as string, DefaultValue as string, AttGroup As AttributeGroups = AttributeGroups.Parameters) As SingleStringAttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS As SingleStringAttributeClass = New SingleStringAttributeClass(Self, vName, DefaultValue,nil, "", AttGroup)
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAT(vName as string, DefaultValue as string, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As DateTime_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as DateTime_AttributeClass
		  if SetArray then
		    NAS = new DateTime_AttributeClass(self,vName,DefaultValue,nil,"",1,0, AttGroup)
		  else
		    NAS = new DateTime_AttributeClass(self,vName,DefaultValue,nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IAX(vName as string, DefaultValue as string, SetArray as Boolean = false, AttGroup As AttributeGroups = AttributeGroups.Parameters) As Coordinates_AttributeClass
		  // This routine is used to initialize the Attributes in the constructor of an element
		  // Adds the Attribute to the element and set it to the default value and returns the default value
		  Dim NAS as Coordinates_AttributeClass
		  if SetArray then
		    NAS = new Coordinates_AttributeClass(self,vName,DefaultValue,nil,"",1,0, AttGroup)
		  else
		    NAS = new Coordinates_AttributeClass(self,vName,DefaultValue,nil,"",0,0, AttGroup)
		  end
		  AddAttributetoList(NAS)
		  return NAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Indent(toBasic As BasicClass = Nil) As Integer
		  Dim count As Integer = 0
		  Dim BS As BasicClass = Self
		  If toBasic = Nil Then
		    BS = UpperStep
		  End
		  
		  While BS <> Nil
		    If toBasic <> Nil And toBasic.UniqueID = BS.UniqueID Then
		      Exit While
		    End
		    count = count + 1
		    BS = BS.UpperStep
		  Wend
		  Return count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndentSpaces(toBasic As BasicClass = Nil) As string
		  Dim SP As string = ""
		  Dim BS As BasicClass = Self
		  If toBasic = Nil Then
		    BS = UpperStep
		  End
		  
		  While BS <> Nil
		    If toBasic <> Nil And toBasic.UniqueID = BS.UniqueID Then
		      Exit While
		    End
		    SP=SP+" "
		    BS = BS.UpperStep
		  Wend
		  Return SP
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitAfterLoad()
		  // this routine is being called right after loading in order to arrange certain attribute configurations
		  // so no included element are know or could be called
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertAttribute(index As Integer, attr As AttributeClass)
		  If attr <> Nil Then
		    if index < 0 then
		      index = 0
		    ElseIf index > AttributesUbound Then
		      index = AttributesUbound + 1
		    End
		    AttributeList.Insert(index, attr)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsChanged(includeSubSteps As Boolean = True) As Boolean
		  If Changed Then
		    Return True
		  End
		  For Each attr As AttributeClass in AttributeList
		    If attr <> Nil And attr.Changed Then
		      Return True
		    End
		  Next
		  
		  If includeSubSteps Then
		    Dim BS As BasicClass = Self.FirstSubStep
		    While BS <> Nil
		      If BS.IsChanged Then
		        Return True
		      End
		      BS = BS.NextStep
		    Wend
		    Return False
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Iterator() As BasicIteratorInterface
		  Return new BasicIterator(Self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadBasicAttributeDesc()
		  ParseAttributesDescription("%WORKINGFOLDER%" + PathSeparator + "BasicDescription", "BasicClass_desc.xml")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadExternals()
		  // Send init to all included elements
		  Dim LS as BasicClass = Me.FirstSubStep
		  while LS <> nil
		    LS.LoadExternals
		    if LS IsA External_TESSA_Module then
		      External_TESSA_Module(LS).LoadExternalPart(1)
		    end
		    LS = LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NextProp(StartBC as BasicClass) As BasicClass
		  Dim NextBC as BasicClass = nil
		  
		  if (Me.FirstSubStep=nil)  then
		    if Me.NextStep=nil then
		      NextBC = Me.UpperStep
		      while (NextBC<>nil) and (NextBC.NextStep=nil)
		        NextBC = NextBC.UpperStep
		        if NextBC=StartBC then
		          NextBC=nil
		        end
		      wend
		      if NextBC<>nil then
		        NextBC = NextBC.NextStep
		      end
		    else
		      NextBC = Me.NextStep
		    end
		  else
		    NextBC = Me.FirstSubStep
		  end
		  
		  return NextBC
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function OnMenuItemTriggered(item As MenuItem) As Boolean
		  if item <> Nil Then
		    Select Case item.Tag
		    Case CopyMenuItem
		      CopyToClipboard
		    Case SaveAsElementItem
		      Dim elementDialog As new SaveInElementLibrary
		      elementDialog.SetBasicClass(Self)
		      elementDialog.Show
		    End
		  End
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ParseAttributesDescription(SubFolder As String, FileName As String)
		  Dim text As String = OpenMeasFileForLoad(SubFolder, FileName, false)
		  If text.Len > 0 Then
		    Dim document As new XmlDocument(text)
		    If document <> Nil Then
		      // check basic node of document:
		      Dim basic As XmlNode = document.FirstChild
		      If basic <> Nil Then
		        // and now walk over all sub element:
		        Dim element As XmlNode = basic.FirstChild
		        While element <>Nil
		          Dim count As Integer  = AttributesUbound
		          For i as Integer = 0 to count
		            If AttributeList(i).Name = element.Name Then
		              If element.FirstChild <> Nil Then
		                AttributeList(i).Description  = element.FirstChild.value
		              Else
		                AttributeList(i).Description  = ""
		              End
		              Exit
		            End
		          Next
		          element = element.NextSibling
		        Wend
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse_Header(ByRef AttributeString as string)
		  //--------------------------------------------------------------------------------------------------------------
		  //
		  // this routine parses the header of a xml element consisting of none to many attributes
		  // an attribute consists is built upon the same structure:
		  // <StepName_AttrtibuteName="the value_part may contain any sign exept paranthese"_  (underline are one or more spaces)
		  // it is easy to find the middle of the next expression with the combination =" that only occurs in this combination at the start of the attributes vaslue part
		  // the following combination of Value Parts are possible:
		  //
		  // AttributeName="any number any letter"
		  // AttributeName="Link L_StepName.L_AttributeName"
		  //                           Establishes a link to the L_AttributeName in the Step L_StepName
		  // AttributeName="Link L_StepName.L_AttributeName[4]"
		  //                           Establishes a link to the L_AttributeName in the Step L_StepName and gets/set the fourth value
		  // AttributeName="Link A_StepName.A_AttributeName[P_StepName.P_AttributeName]"
		  //                           Establishes a link picker, that allows to get a indexed value out of an array
		  //                           A_AttributeName in the Step A_StepName is the array and
		  //                           P_AttributeName in the Step P_StepName gives the number inside the array of the value to be picked out or put in
		  // AttributeName="Array 10 20 30 40"
		  //                           Establishes an array with 4 elements and fills them with the values separated with spaces
		  // AttributeName="Array100 10 20 30 40"
		  //                           Establishes an array with 100 elements from the start and fills the first 4
		  // AttributeName="LinkedArray L_StepName.L_AttributeName"
		  //                           Establishes a linked array to the L_AttributeName in the Step L_StepName
		  // AttributeName="LinkedArray100 L_StepName.L_AttributeName"
		  //                           Establishes a linked array with 100 elements to the L_AttributeName in the Step L_StepName
		  // AttributeName="Interface.L_AttributeName"
		  //                           used in External Steps to define interface links that are established according the given name of the external step
		  // AttributeName%S= defines a dynamic string attribute that has been established during running TESSA,
		  //                              => it saves the type with the attributes name behind the "%" character, %S = string, %I = integer, %D = double, %E = Enum, %T = DateTIme
		  // AttributeName%E= defines a dynamic Enum attribute that has been established during running TESSA, as it is dynamic, the choices have to be saved too,
		  //                               this will be done after the keyword "ENUM" => note the this keyword is not to be used in any selection
		  // AttributeName%T= defines a dynamic DateTime attribute that has been established during running TESSA, as it is dynamic, the 
		  //--------------------------------------------------------------------------------------------------------------
		  
		  Dim AttributeName, AttributeExtention, FullValue, LinkName, SelectName, ArraySizeNumber as string
		  Dim AttributeType as integer = AT_String
		  Dim AttributeIsDynamic as boolean = false
		  Dim startPoint, midPoint, endPoint, ExtentionPoint, LinkPoint, ArrayPoint, SelectPoint as integer = 1
		  Dim AttrGroup as AttributeGroups = AttributeGroups.Parameters
		  
		  Dim ArraySize, ArrayMode, ArrayPoint2, startLinkName, startValue, startSelectName as integer
		  
		  startPoint=InStr(startPoint,AttributeString," ")
		  
		  while startPoint>0
		    // go to next start separated with a space
		    midPoint=InStr(startPoint,AttributeString,AttrMid)
		    endPoint=InStr(midPoint+2,AttributeString,AttrEnd)
		    
		    AttributeName=""
		    FullValue=""
		    AttributeExtention=""
		    startValue=1
		    ArrayMode=ArrayMode_Dynamic
		    
		    if midPoint>0 then
		      if endPoint=0 then
		        // entry is last one without space after qutation mark
		        endPoint=len(AttributeString)
		        // remove quotation mark at end
		        while (Mid(AttributeString,endPoint,1)<>chr(34)) and (endPoint>1)
		          endPoint=endPoint-1
		        wend
		      end
		      //now take name of attribute
		      AttributeName=Trim(Mid(AttributeString,startPoint+1,midPoint-startPoint-1))
		      // check if attribute is dynamic, if yes take the designator "%" away
		      if AttributeName.Mid(AttributeName.Len-1,1)="%" then
		        Dim AttributeTypeDescriptor as string = AttributeName.Mid(AttributeName.Len,1)
		        AttributeIsDynamic=true
		        AttrGroup=AttributeGroups.Dynamic
		        AttributeName=AttributeName.Mid(1,AttributeName.Len-2)
		        Select case AttributeTypeDescriptor
		        case is = "S"
		          AttributeType=AT_String
		        case is = "I"
		          AttributeType=AT_Integer
		        case is = "D"
		          AttributeType=AT_Double
		        case is = "B"
		          AttributeType=AT_Boolean
		        case is = "E"
		          AttributeType=AT_Enum
		        case is = "T"
		          AttributeType=AT_DateTime
		        else
		          AttributeType=AT_String
		        end
		      else
		        AttributeIsDynamic=false
		      end
		      // check if attribute is valable
		      if endPoint>StartPoint then
		        //take the right part of the attribute definition from ="......"
		        FullValue= Mid(AttributeString,midPoint+2,endPoint-midPoint-2)
		        //now look for the start of a possible attribute extention like Link, Array, LinkedArray...
		        ExtentionPoint=InStr(1,FullValue," ")
		        if ExtentionPoint>0 then
		          AttributeExtention=Mid(FullValue,1,ExtentionPoint-1)
		        else
		          //the attribute may only have a extention (Array and ArrayNr)
		          AttributeExtention=FullValue
		        end
		        //now check all possible Attribute extentions
		        if AttributeExtention="Enum" then
		          SelectPoint=InStr(1,FullValue,"Enum")
		          startLinkName=InStr(SelectPoint+1,FullValue," ")+1
		          startSelectName=InStr(startLinkName+1,FullValue," ")+1
		          startValue= InStr(startSelectName+1,FullValue," ")+1
		          
		          LinkName=Mid(FullValue,startLinkName,startSelectName-startLinkName-1)
		          SelectName=Trim(Mid(FullValue,startSelectName,startValue-startSelectName-1))
		          FullValue=Trim(Mid(FullValue,startLinkName,len(FullValue)-startLinkName+1))
		          
		          AddSelectionAttribute(AttributeName,"",FullValue,AttributeIsDynamic)
		          
		        else
		          if AttributeExtention="Interface" then
		            //extention for External_TESSA_Module
		          else
		            // now check for array and link that can be combined
		            LinkPoint=InStr(1,AttributeExtention,"Link")
		            ArrayPoint=InStr(1,AttributeExtention,"Array")
		            //do the array first
		            if ArrayPoint>0 then
		              // check if there is a array size given
		              if Mid(FullValue,ArrayPoint+5,1)=" " then
		                //no array size is given, array is dynamic
		                ArraySize=1
		                ArrayPoint2=ArrayPoint+5
		              else
		                //array size is given by a number
		                ArrayPoint=ArrayPoint+5
		                ArrayPoint2=InStr(ArrayPoint,FullValue," ")
		                ArraySizeNumber=Mid(FullValue,ArrayPoint,ArrayPoint2-ArrayPoint)
		                ArraySize=val(ArraySizeNumber)
		                ArrayMode=ArrayMode_Fixed
		              end
		              startValue= InStr(ArrayPoint2,FullValue," ")+1
		            else
		              ArraySize=0
		            end
		            //now check the Links
		            if LinkPoint>0 then
		              startLinkName=InStr(LinkPoint+1,FullValue," ")+1
		              startValue=InStr(startLinkName,FullValue," ")
		              if startValue>0 then
		                LinkName=Mid(FullValue,startLinkName,startValue-startLinkName)
		              else
		                startValue=Len(FullValue)+1
		                LinkName=Mid(FullValue,startLinkName,startValue-startLinkName+2)
		              end
		            else
		              LinkName=""
		            end
		            // extract rest of possible array values
		            FullValue=Mid(FullValue,startValue,len(FullValue)-startValue+1)
		            //generate or set the attribute
		            if AttributeName="ID" then
		              SetUniqueID(FullValue)
		            elseif AttributeName="SYNC" then
		              SetSYNCValues(FullValue)
		            else
		              Me.AddAttribute( AttributeName, FullValue,LinkName, AttributeType, ArraySize, ArrayMode, AttrGroup, AttributeIsDynamic, false, true )
		            end
		          end
		        end
		        //set startPoint to the next possible attribute
		        startPoint=endPoint
		      else
		        //may have taken some empty spaces start again one letter to the right
		        startPoint=startPoint+1
		      end
		    else
		      //may have taken some empty spaces start again one letter to the right
		      startPoint=startPoint+1
		    end
		    startPoint=InStr(startPoint,AttributeString," ")
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Propagate(methodName As String, Optional params() As Variant)
		  // this error checks for any error within this element, errors only!
		  // object will only be checked for errors if they have implemented the ReportIF interface
		  
		  Dim selfInfo As Introspection.TypeInfo = Introspection.GetType(Self)
		  If selfInfo <> Nil Then
		    Dim methods() As Introspection.MethodInfo = selfInfo.GetMethods
		    For Each item as Introspection.MethodInfo in methods
		      if item <> Nil And item.Name.Lowercase = methodName.Lowercase Then
		        if params <> Nil Then
		          Dim parameters() As Introspection.ParameterInfo = item.GetParameters
		          If parameters.UBound = params.UBound Then
		            Try
		              item.Invoke(self, params)
		            Catch e as RunTimeException
		              AddDebugTextCR("Cannot ivoke method: " + methodName)
		            End
		            Exit
		          End
		          
		        Else
		          Try
		            item.Invoke(self)
		          Catch e as RunTimeException
		            AddDebugTextCR("Cannot ivoke method: " + methodName)
		          End
		        End
		      End
		    Next
		  End
		  
		  
		  Dim LS as BasicClass = Me.FirstSubStep
		  while LS<>nil
		    LS.Propagate(methodName, params)
		    LS=LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh_Teststep_ReportList(byref ix as integer, NoSuppressFirst as boolean)
		  if NoSuppressFirst then
		    if Self IsA ReportIF then
		      ReportIF(self).Add_TeststepReportList(ix)
		    end
		  end
		  
		  Dim LS as BasicClass
		  LS=Me.FirstSubStep
		  while LS<>nil
		    'LS.Refresh_Teststep_ReportList(ix,true)
		    'LS=LS.NextStep
		    'wend
		    // new in order not to call add_teststepreportlist if it is a Test_StepClass
		    // Add_TeststepReportList(ix) in Test_StepClass was commented out
		    if LS isa Test_StepClass then
		      LS.Refresh_Teststep_ReportList(ix,false)
		    else
		      LS.Refresh_Teststep_ReportList(ix,true)
		    end
		    LS=LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveAttribute(index as integer) As Boolean
		  if index >= 0 And index <= AttributesUbound Then
		    AttributeList.Remove(index)
		    Return True
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveAttribute(Name As String) As Boolean
		  Dim index As Integer = GetAttributeNumber(Name)
		  if index >= 0 And index <= AttributesUbound Then
		    AttributeList.Remove(index)
		    Return True
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceAttribute(Old_Attr As String, New_Attr as string)
		  if (Old_Attr<>"") and (New_Attr<>"") then
		    Dim vNew as AttributeClass = GetAttribute(New_Attr)
		    Dim vOld as AttributeClass = GetAttribute(Old_Attr)
		    if (vNew<>nil) and (vOld<>nil) then
		      vNew.SIAS(vOld.GIAS)
		      if (vNew IsA AttributeClass) and (vOld IsA AttributeClass) then
		        AttributeClass(vNew).Link=AttributeClass(vOld).Link
		        AttributeClass(vNew).LinkName=AttributeClass(vOld).LinkName
		      end
		      Call RemoveAttribute(Old_Attr)
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetAllErrors(ResetState as integer)
		  // this routine will reset all errorMessage for reporting purposes
		  // also all included objects will be reset
		  if Self IsA ReportIF then
		    ReportIF(self).ResetError(ResetState)
		    //MainWindow.DebugWindow.AppendText("RM: "+RM+"   EM: "+EM+"  Err: "+str(ErrState)+chr(13))
		  end
		  
		  Dim LS as BasicClass = Me.FirstSubStep
		  while LS <> nil
		    LS.ResetAllErrors(ResetState)
		    LS = LS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(byRef S as string, Level as integer, IncludeSubSteps as boolean = true)
		  // saves the Element as XML into the string S
		  Dim i as integer
		  
		  // handle tab indent
		  for i=1 to Level
		    S=S+chr(9)
		  next
		  
		  // save headder
		  S=S+"<"+Me.BasicTypeName+" Name="+QM+Name.GIAS+QM+" "
		  
		  #if SYNC_Feature
		    if DoSYNC then
		      if SYNC_ID=Global_SYNC_ID then
		        SYNC1=Global_SYNC_Time
		      else
		        SYNC2=SYNC1
		        SYNC1=Global_SYNC_Time
		        SYNC_ID=Global_SYNC_ID
		      end
		      DoSYNC=false
		    end
		    S=S+"ID="+QM+str(GetUniqueID)+QM+" "+"SYNC="+QM+str(SYNC_ID)+" "+str(SYNC1)+" "+str(SYNC2)+QM+" "
		  #endif
		  
		  //save Attributes
		  for i=1 to AttributesUbound
		    Me.AttributeList(i).Save(S)
		  next
		  
		  // save included elements if there are any
		  if (Me.FirstSubStep=nil) or not(IncludeSubSteps) then
		    // no included elements end element
		    S=S+"/>"
		  else
		    //save included elements
		    Dim LS as BasicClass
		    LS=FirstSubStep
		    S=S+">"
		    while LS<>nil
		      S=S+chr(13)
		      LS.Save(S,Level+1)
		      LS=LS.NextStep
		    wend
		    S=S+chr(13)
		    // handle tab indent
		    for i=0 to Level-1
		      S=S+chr(9)
		    next
		    S=S+"</"+Me.BasicTypeName+">"
		    //saveEnd
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveAdditionalData(folder As FolderItem)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveAdditionalDataForAll(folder As FolderItem)
		  Dim it As BasicIteratorInterface = Self.Iterator
		  While it.HasNext
		    Dim BS As BasicClass = it.NextItem
		    If BS <> Nil Then
		      BS.SaveAdditionalData(folder)
		    End
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveWithoutSubSubStep(ByRef S As String, Level As Integer)
		  // saves the Element as XML into the string S
		  
		  // handle tab indent
		  for i As Integer = 0 to Level - 1
		    S = S + chr(9)
		  Next
		  
		  // save headder
		  S = S + "<" + Me.BasicTypeName + " "
		  //save Attributes
		  for i As Integer = 0 to AttributesUbound
		    Me.AttributeList(i).Save(S)
		  Next
		  
		  // save included elements if there are any
		  if (Me.FirstSubStep <> Nil) Then
		    //save included elements
		    S=S+">"
		    Dim LS as BasicClass = FirstSubStep
		    while LS<>nil
		      If LS.FirstSubStep = Nil Then
		        S = S + chr(13)
		        LS.Save(S, Level + 1)
		      End
		      LS=LS.NextStep
		    Wend
		    S = S + chr(13)
		    // handle tab indent
		    for i As Integer = 0 to Level - 1
		      S = S + chr(9)
		    next
		    S = S + "</"+Me.BasicTypeName + ">"
		    //saveEnd
		  Else
		    // no included elements end element
		    S = S + "/>"
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SearchLinkStepClass(stepNames() As String, BS As BasicClass) As BasicClass
		  If BS <> Nil And stepNames.Ubound >= 0 Then
		    Dim rootStepName As String = stepNames(0)
		    If IsNumeric(rootStepName) Then
		      stepNames.Remove(0)
		      Dim n As Integer = Val(rootStepName)
		      Dim i As Integer = 0
		      While BS.UpperStep <> Nil And i < n
		        BS = BS.UpperStep
		        i = i + 1
		      Wend
		    Else
		      While True
		        If BS.Name.GIAS = rootStepName Or BS.UpperStep = Nil Then
		          If BS.Name.GIAS = rootStepName Then
		            stepNames.Remove(0)
		          End
		          Exit While
		        Else
		          BS = BS.UpperStep
		        End
		      Wend
		    End
		    
		    Dim i as Integer = 0
		    While BS <> Nil And i < stepNames.Ubound
		      Dim StepName as String = stepNames(i)
		      Dim it As BreadthIterator = new BreadthIterator(BS)
		      Dim needToExit As Boolean = False
		      if i = 0 Then
		        BS = it.NextItem
		      End
		      While it.HasNext And not needToExit
		        BS = it.NextItem
		        If BS.Name.GIAS = StepName Then
		          needToExit = True
		        End
		        if not needToExit Then
		          BS = Nil
		        End
		      Wend
		      i = i + 1
		    Wend
		  End
		  Return BS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send(CommandString as string, Address as integer)
		  // virtual routine for sending
		  #Pragma Unused CommandString
		  #Pragma Unused Address
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetSYNCValues(Values as string)
		  SYNC_ID = NthField(Values," ",1)
		  SYNC1 = Val(NthField(Values," ",2))
		  SYNC2 = Val(NthField(Values," ",3))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetUniqueID(vID as string)
		  if vID <> "" Then
		    UniqueID = vID
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAB(Name as string, Value as boolean)
		  // seaches for the Attribute with that name and sets it's value to Value
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    FV.SIAB(Value)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAD(AttrNr as integer, Value as double)
		  // seaches for the Attribute with that Attribut number and sets it's value
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    SA.SIAD(Value)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAD(AttrNr as integer, Value as double, Index as integer)
		  // seaches for the Attribute with that Attribut number and sets it's value
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    SA.SIAD(Value, Index)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAD(Name as string, Value as double)
		  // seaches for the Attribute with that name and sets it's value to Value
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    FV.SIAD(Value)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAI(Name as string, Value as integer)
		  // seaches for the Attribute with that name and sets it's value to Value
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    FV.SIAI(Value)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAS(AttrNr as integer, Value as string)
		  // seaches for the Attribute with that Attribut number and sets it's value
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    SA.SIAS(Value)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAS(AttrNr as integer, Value as string, Index as integer)
		  // seaches for the Attribute with that Attribut number and sets it's value
		  Dim SA As AttributeClass = GetAttribute(AttrNr)
		  If SA <> Nil Then
		    SA.SIAS(Value, Index)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAS(Name as string, Value as string)
		  // seaches for the Attribute with that name and sets it's value to Value
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    FV.SIAS(Value)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAS(Name as string, Value as string, Link as string)
		  // seaches for the Attribute with that name and sets it's value to Value
		  Dim FV as AttributeClass =Me.GetAttribute(Name)
		  if FV <> nil then
		    FV.SIAS(Value)
		    if Link <> "" And FV IsA AttributeClass Then
		      AttributeClass(FV).LinkName = Link
		      AttributeClass(FV).Link = nil
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAttribute(Name as string, Value as string, LinkName as string, vArraySize as integer, vArrayMode as integer)
		  // seaches for the Attribute with that name and sets it's value to Value
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    FV.SOAttribute(Value,LinkName, vArraySize, vArrayMode)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(Name as string, Value as string)
		  // seaches for the Attribute with that name and sets it's value to Value
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    FV.SOAS(Value)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(Name as string, Value as string, Index as integer)
		  // seaches for the Attribute with that name and sets it's value to Value
		  Dim FV as AttributeClass = Me.GetAttribute(Name)
		  if FV <> nil then
		    FV.SOAS(Value, Index)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartUserFunction(func As UserFunction)
		  if Self IsA UserFunctions And func <> Nil And func.Attribute <> nil then
		    mCurrentUserFunction = func
		    if mCurrentUserFunction.RunMode=0 then
		      Dim resAttr As AttributeClass = UserFunctions(Self).ResourceAttribute
		      Dim selfAttr As AttributeClass = func.Attribute
		      If selfAttr <> Nil And resAttr <> Nil then
		        Dim RS as string = ""
		        //if  UserFunctions(Self).Run(RS, resAttr) then -> Changed 2015-01-23 AH
		        
		        Dim LoopCount as integer = 0
		        Dim tr as double = UserFunctions(Self).GetTimeouttime
		        Dim TimeOutStartTime as double = GetActTime_msec
		        
		        //wait some time before start working on User Function
		        Dim WaitTime As Double = UserFunctions(Self).WaitBeforeStart
		        While GetActTime_msec < (TimeOutStartTime + WaitTime)
		          App.YieldToNextThread
		        Wend
		        
		        // wait for reply or timeout
		        Dim NoReply as integer = 1
		        While  (NoReply < 2)
		          While  (NoReply < 1)
		            NoReply = UserFunctions(Self).Poll(RS, resAttr)
		            if LoopCount > 1000000 then
		              NoReply = 3
		              tr = GetActTime_msec-TimeOutStartTime
		            end
		            LoopCount = LoopCount + 1
		            if (GetActTime_msec > (tr + TimeOutStartTime)) then
		              NoReply = 3
		              tr = GetActTime_msec - TimeOutStartTime
		            end
		          wend
		          if (GetActTime_msec > (tr + TimeOutStartTime)) then
		            NoReply = 3
		            tr = GetActTime_msec - TimeOutStartTime
		          end
		          if NoReply > 0 then
		            LoopCount = 0
		          end
		          if NoReply = 1 then
		            if  UserFunctions(Self).Run(RS, resAttr) then
		              NoReply = 0
		            else
		              NoReply = 3
		            end
		          end
		        wend
		        'update self attribute
		        if NoReply = 2 And RS <> "" Then
		          selfAttr.SIAS(RS)
		        End
		        //End
		      End
		      UserFunctions(Self).UserFunctionFinished
		      mCurrentUserFunction = Nil
		    else
		      mCurrentUserFunction = func
		      App.ManualOperation.StartOP(mCurrentUserFunction)
		    end
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Swap(first As Integer, second As Integer)
		  If first <> second And first >= 0 And first <= AttributesUbound And second >= 0 And second <= AttributesUbound Then
		    If first < second Then
		      Dim attr As AttributeClass = AttributeList(second)
		      AttributeList.Remove(second)
		      AttributeList.Insert(first, attr)
		      first = first + 1
		      attr = AttributeList(first)
		      AttributeList.Remove(first)
		      AttributeList.Insert(second, attr)
		    Else
		      Dim attr As AttributeClass = AttributeList(first)
		      AttributeList.Remove(first)
		      AttributeList.Insert(second, attr)
		      second = second + 1
		      attr = AttributeList(second)
		      AttributeList.Remove(second)
		      AttributeList.Insert(first, attr)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Swap(first As String, second As String)
		  if first <> "" And second <> "" Then
		    Swap(GetAttributeNumber(first), GetAttributeNumber(second))
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SyncElement(SyncTree as BasicClass)
		  if SyncTree<>nil then
		    // sync self
		    Dim SyncPartner as BasicClass = SyncTree.FindElement(UniqueID)
		    if SyncPartner=nil then
		      //add to tree
		      
		    else
		      //decide which one to take
		      if SyncPartner.SYNC_ID<>SYNC_ID then
		        if SyncPartner.SYNC2=SYNC1 then
		          // take new newerSyncPartner
		          // => nothing to do
		        elseif SyncPartner.SYNC1=SYNC2 then
		          // take the element as it is newer
		          SwapElements(SyncPartner,self)
		        else
		          // conflict
		          
		        end
		      else
		        if SyncPartner.SYNC1>SYNC2 then
		          //take SyncPartner
		          //=> nothing to do
		        else
		          //take new element
		          SwapElements(SyncPartner,self)
		        end
		      end
		      // sync included
		      Dim BS as BasicClass
		      BS=FirstSubStep
		      while BS<>nil
		        BS.SyncElement(SyncTree)
		        BS=BS.NextStep
		      wend
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ThreadSafeMethodCall(callback As Object, methodName As String, vWaitTime As integer, ParamArray params As Variant)
		  mUICaller.PushMethodWithArrayAsParams (callback, methodName, params)
		  if vWaitTime>0 then
		    If App.CurrentThread <> Nil Then
		      App.CurrentThread.Sleep(vWaitTime)
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvasFromTimer(t as Timer)
		  mUpdateCanvasHMI.UpdateCanvas (mUpdateCanvasMode)
		  t.Mode = Timer.ModeOff
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  // virtual method has to be implemented by children using this
		  // you may use the below example source code
		  
		  if (Attr<>nil) and (FuncName<>"") then
		    Select case Attr
		    case Is = Name // put here the name of the attribute
		      Select case FuncName
		      case is = "unknown"
		        // put here your code
		      end
		    end
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected AttributeList(-1) As AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		BasicTypeName As String
	#tag EndProperty

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
		Changed As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DerivedType As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoSYNC As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		ELT As Coordinates_AttributeClass
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEnableDrag
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEnableDrag = value
			End Set
		#tag EndSetter
		EnableDrag As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		ErrorText As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Expanded As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		FirstSubStep As BasicClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Local_Link_Errors As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mChanged As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mCurrentUserFunction As UserFunction = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnableDrag As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mUICaller As Caller = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		mUpdateCanvasHMI As HMICanvasInterface
	#tag EndProperty

	#tag Property, Flags = &h0
		mUpdateCanvasMode As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mUpdateCanvasTimer As Timer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mUserFunctions(-1) As UserFunction
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Name_Error As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		NextStep As BasicClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Num_Included_Elements As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Num_Links As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		PreviousStep As BasicClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SendState As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Sub_Link_Errors As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SYNC1 As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SYNC2 As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SYNC_ID As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TestReportList As TestReportCollection
	#tag EndProperty

	#tag Property, Flags = &h21
		Private UniqueID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		UpperStep As BasicClass = nil
	#tag EndProperty


	#tag Constant, Name = AttrEnd, Type = String, Dynamic = False, Default = \"\" ", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AttrMid, Type = String, Dynamic = False, Default = \"\x3D\"", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ClearComplete, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CopyMenuItem, Type = String, Dynamic = False, Default = \"Copy", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CutMenuItem, Type = String, Dynamic = False, Default = \"Cut", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DeleteMenuItem, Type = String, Dynamic = False, Default = \"Delete", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NoChange, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PasteMenuItem, Type = String, Dynamic = False, Default = \"Paste", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RemoveReply, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = RemoveTerm, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ResorceDefineName, Type = String, Dynamic = False, Default = \"Resource", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = SaveAsElementItem, Type = String, Dynamic = False, Default = \"Save As Element", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UF_RunMode_Direct, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = UF_RunMode_OP_Loop, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="BasicTypeName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoSYNC"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Expanded"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
			EditorType=""
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
			Name="Local_Link_Errors"
			Visible=false
			Group="Behavior"
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
			Name="Name_Error"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Included_Elements"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Links"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendState"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sub_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
		#tag ViewProperty
			Name="mUpdateCanvasMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
