#tag Class
Protected Class Table_StepClass
Inherits HMI_StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  Super.AttributeChanged(ChangedAttribute)
		  If ChangedAttribute <> Nil Then
		    Select case ChangedAttribute
		    case Is = NumberOfRows
		      SetNumRows(NumberOfRows.GIAI)
		    case Is = DateTimeControling
		      SetNumRows(NumberOfRows.GIAI)
		    case Is = ActiveRow
		      SetTableRow(ActiveRow.GIAI,false)
		    end
		  End
		  MainWindow.RedrawAttributeList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearValues()
		  Dim i as integer
		  
		  Select Case DateTimeControling.GIAI
		  case 0 // none
		    
		  case 1 // date
		    for i=0 to Date.GIAN
		      Date.SIAS("",i)
		    next
		  case 2 // date_time
		    for i = 0 to Time.GIAN
		      Date.SIAS("",i)
		      Time.SIAS("",i)
		    next
		  case 3 // time
		    for i = 0 to Time.GIAN
		      Time.SIAS("",i)
		    next
		  end
		  Dim Attr as AttributeClass
		  for i=FirstDynamicAttribute to AttributesUbound
		    Attr = GetAttribute(i)
		    if Attr<>nil then
		      for i = 0 to Attr.GIAN
		        Attr.SIAS("",i)
		      next
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  File = IAPath("File","",false, False)
		  BasicPath = IAPath("BasicPath","",false, True)
		  
		  FileFormat = IAE("FileFormat", "0 txt", false)
		  FileAppend = IAB("FileAppend", false, false)
		  LoadAtStart = IAB("LoadAtStart", false, false)
		  SaveAtEnd = IAB("SaveAtEnd", false, false)
		  SaveEvery = IAI("SaveEvery", 0, false)
		  IsCollection = IAB("IsCollection",false,false)
		  ActiveCollection = IAI("ActiveCollection",0,false)
		  
		  TableType = IAE("TableType", "0 dynamic static once repeating ring Direct", false)
		  ResetAtTestStepStart = IAE("ResetAtTestStepStart", "0 none Reset_to_First_Line ClearTable Reset_and_ClearValues", false)
		  
		  NumberOfRows = IAI("Rows", 0, false)
		  ActiveRow = IAI("ActiveRow", 0, false)
		  
		  FilterAttribute = IAS("FilterAttribute", "", false)
		  FilterValue = IAS("FilterValue", "", false)
		  RecordAttribute = IAS("RecordAttribute", "", false)
		  
		  DateTimeControling = IAE("DateTimeControling", "0 none date date_time time", False)
		  
		  Date = IAS("Date", "", false,AttributeGroups.Dynamic)
		  Time = IAD("Time", 0, false,AttributeGroups.Dynamic)
		  
		  FirstDynamicAttribute = AttributesUbound + 1
		  
		  AddUserFunction("save", File.Name, "save", 0,UF_RunMode_Direct)
		  AddUserFunction("load", File.Name, "load", 0,UF_RunMode_Direct)
		  AddUserFunction("SetRow", NumberOfRows, "SetRow", 0,UF_RunMode_Direct)
		  AddUserFunction("Clear", ResetAtTestStepStart, "Clear", 0,UF_RunMode_Direct)
		  
		  Coordinates.Width = 700
		  Coordinates.Height = 400
		  Coordinates.Offset = 0
		  Coordinates.ResetDefault
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyValuesOneBack()
		  // this method shifts all values down V[n-1] = V[n] and deletes the oldes value V[0]
		  
		  Dim i,n as integer
		  
		  for n=0 to date.GOAN-1
		    date.SOAS(date.GOAS(n+1),n)
		  next
		  for n=0 to Time.GOAN-1
		    Time.SOAS(Time.GOAS(n+1),n)
		  next
		  Dim Attr as MultipleValuesAttributeClass = Nil
		  for i = FirstDynamicAttribute to AttributesUbound
		    Attr = MultipleValuesAttributeClass(GetAttribute(i))
		    if Attr<>nil then
		      for n=0 to Attr.GOAN-1
		        Attr.SOAS(Attr.GOAS(n+1),n)
		      next
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return new Table_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub FillDateTimeAttributes()
		  Select Case DateTimeControling.GIAI
		  case 0 // none
		  Case 1 // date
		    Date.SOAS(GetActDate)
		  Case 2 //date and time
		    Date.SOAS(GetActDate)
		    Me.Time.SOAD(GetActTime_sec - Me.StartTime)
		  Case 3 // time
		    Me.Time.SOAD(GetActTime_sec - Me.StartTime)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillDimensionTableLine(EA as MultipleValuesAttributeClass)
		  // get first TableDimension and start iterating to fill the EA line with Dimension definitions
		  if EA <> nil And Me.FirstSubStep IsA TableDimension_StepClass then
		    EA.DeleteAllValues
		    TableDimension_StepClass(Me.FirstSubStep).FillRecursiveDimensionLine("",EA)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDimension(n as integer) As TableDimension_StepClass
		  Dim i as integer = 0
		  Dim LS as BasicClass = Me.FirstSubStep
		  while LS <> nil
		    if LS isA TableDimension_StepClass then
		      if i = n then
		        Return TableDimension_StepClass(LS)
		      end
		      i = i + 1
		    end
		    LS = LS.NextStep
		  wend
		  return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDimension(name As String) As TableDimension_StepClass
		  Dim LS as BasicClass = Me.FirstSubStep
		  while LS <> nil
		    if LS isA TableDimension_StepClass then
		      If LS.Name.GIAS = name Then
		        Return TableDimension_StepClass(LS)
		      end
		    end
		    LS = LS.NextStep
		  wend
		  return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDimensionChoice(n as integer) As AttributeClass
		  Dim TD As TableDimension_StepClass = GetDimension(n)
		  If TD <> Nil Then
		    Return TD.DimensionList
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDimensionChoiceString() As string
		  Dim CS as string=""
		  Dim EA as AttributeClass = nil
		  Dim LS as BasicClass = FirstSubStep
		  // assemble the whole dimension choice from all sub - dimension tables
		  if LS <> nil then
		    while LS <> nil
		      if LS isA TableDimension_StepClass then
		        EA = TableDimension_StepClass(LS).DimensionList
		        CS = CS + EA.GIAS + " "
		      end
		      LS = LS.NextStep
		    wend
		    CS = CS.Mid(1, CS.Len - 1)
		  end
		  
		  return CS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDimensionName(n as integer) As string
		  Dim TD As TableDimension_StepClass = GetDimension(n)
		  If TD <> Nil Then
		    Return TD.Name.GIAS
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMaxNumberofValues() As integer
		  // get the maximal number of values/lines in this table
		  Dim NumVars as integer = AttributesUbound
		  Dim MaxNumberValues as integer = 0
		  for n As Integer = 0 to NumVars
		    Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(AttributeList(n))
		    If attr <> Nil And attr.IsArray Then
		      MaxNumberValues = Max(MaxNumberValues, attr.GOAN)
		    end
		  next
		  return  MaxNumberValues
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTableAsText(StartLine as integer, NumValues as integer) As string
		  
		  // save line by line
		  Dim FileContent as string = ""
		  Dim NumVars As Integer = AttributesUbound
		  Dim MoreValues as Boolean = true
		  
		  Dim i, MaxNumberValues As Integer = 0
		  //first write the headders
		  Dim ValueLine as string = ""
		  for n As Integer = 0 to NumVars
		    Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(AttributeList(n))
		    If attr <> Nil And attr.IsArray Then
		      ValueLine = ValueLine + attr.Name + chr(9)
		      MaxNumberValues = Max(MaxNumberValues, attr.GOAN)
		      MoreValues = true
		    end
		  next
		  
		  ValueLine = left(ValueLine,len(ValueLine) - 1)
		  FileContent = FileContent + ValueLine + CR
		  
		  // this routine is for saving only part of the table
		  if (NumValues < StartLine) or (NumValues=0) then
		    NumValues = MaxNumberValues-1
		  else
		    NumValues = NumValues-1
		  end
		  if StartLine = 0 then
		    StartLine = -1
		  end
		  
		  for i = StartLine + 1 to NumValues
		    ValueLine = ""
		    for n As Integer = 10 to NumVars
		      Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(AttributeList(n))
		      If attr <> Nil And attr.IsArray Then
		        ValueLine = ValueLine + attr.GOAS(i) + chr(9)
		      End
		    Next
		    ValueLine = left(ValueLine, len(ValueLine) - 1)
		    //if ValueLine<>"" then
		    FileContent = FileContent + ValueLine + CR
		    //end
		  next
		  
		  return FileContent
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitAfterLoad()
		  // arrange time and date variables to arrays if set to on
		  
		  SetNumRows(NumberOfRows.GIAI)
		  
		  Select case Me.TableType.GIAI
		  case 0 //dynamic
		    Me.SetTableRow(0)
		  case 1 //static
		    Me.SetTableRow(Me.NumberOfRows.GIAI - 1)
		  case 2 //once
		    Me.SetTableRow(0)
		  case 3 //repeating
		    Me.SetTableRow(0)
		  case 4 // ring memory
		    Me.SetTableRow(Me.NumberOfRows.GIAI - 1)
		  end
		  Me.StartTime = GetActTime_sec
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // this routne is being called from an upper Test_StepClass when it proceeds it's start procedure
		  
		  // set  active lin
		  Select case Me.TableType.GIAI
		  case 0,3 //dynamic table or repeating table
		    Select case ResetAtTestStepStart.GIAI
		    case 0 // no reset
		    case 1 // reset active to first line
		      SetTableRow(0)
		    case 2// clear the whole table
		      SetNumRows(1)
		      SetTableRow(0)
		    else // reset pointer and clear values
		      SetTableRow(0)
		      ClearValues
		    end
		  case 1 //static table
		    
		  case 2,4 //go through table once only or ring buffer
		    Select case ResetAtTestStepStart.GIAI
		    case 0 // no reset
		    case 1 // reset active to first line
		      SetTableRow(0)
		    case 2// clear the whole table
		      ClearValues
		    else // reset pointer and clear values
		      SetTableRow(0)
		      ClearValues
		    end
		  else
		  end
		  
		  Me.StartTime = GetActTime_sec
		  
		  Super.Init_Teststep_Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalInit()
		  
		  SetNumRows(NumberOfRows.GIAI)
		  
		  if Me.LoadAtStart.GIAB then
		    if not Me.Loaded then
		      if Me.File.GIAS <> "" then
		        Me.Load( "", File.GIAS )
		      end
		    end
		  end
		  
		  if Me.NumDimensions > 0 then
		    'Me.TransferTableToDimensions
		  end
		  
		  // set  active lin
		  Select case Me.TableType.GIAI
		  case 0 //dynamic
		    Me.SetTableRow(0)
		  case 1 //static
		    Me.SetTableRow(Me.NumberOfRows.GIAI - 1)
		  case 2 //once
		    Me.SetTableRow(0)
		  case 3 //repeating
		    Me.SetTableRow(0)
		  case 4 // ring memory
		    Me.SetTableRow(Me.NumberOfRows.GIAI - 1)
		  end
		  Me.StartTime = GetActTime_sec
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(FolderPath as string, FileName as string)
		  'If FolderPath = "" Then
		  'FolderPath = Me.BasicPath.GIAS
		  'End
		  If FolderPath = "" Then
		    FolderPath=GetWorkingFolder
		  End
		  
		  If FileName = "" Then
		    FileName = Me.File.GIAS
		  End
		  
		  Dim FileOk as Boolean = false
		  Dim FileContent as string =""
		  Dim ContentLine as string = ""
		  
		  FileOk = File_Load( FileContent, FileName, FolderPath, False, False )
		  
		  if FileOk then
		    //determine the end of line sign by counting CR and NL
		    Dim NumCR as integer = CountCharacters(FileContent,CR)
		    Dim NumNL as integer = CountCharacters(FileContent,NL)
		    Dim EONSign as string
		    if NumCR>NumNL then
		      EONSign=CR
		    else
		      EONSign=NL
		    end
		    // reset table
		    SetNumRows(NumberOfRows.GIAI)
		    Dim i as integer = 1
		    ContentLine = NthField(FileContent,EONSign,i)
		    //determin how many and which Attributes to load
		    Dim startP,endP as integer = 1
		    Dim NumVars as integer = 0
		    Dim VarName as string
		    Dim VarValue as string
		    
		    Dim VarCollection(50) as MultipleValuesAttributeClass
		    Dim VP as MultipleValuesAttributeClass
		    
		    while endP > 0
		      endP = InStr(startP,ContentLine,TAB)
		      if endP > 0 then
		        VarName = Mid(ContentLine,startP,endP - startP)
		        startP = endP + 1
		      else
		        VarName = Mid(ContentLine,startP,len(ContentLine) - startP + 1)
		      end
		      
		      Dim VS as AttributeClass = GetAttribute(VarName)
		      
		      if VS IsA MultipleValuesAttributeClass then
		        VP = MultipleValuesAttributeClass(VS)
		        if VP <> nil then
		          NumVars = NumVars + 1
		          if NumVars = UBound(VarCollection()) then
		            Redim VarCollection(NumVars + 1)
		          end
		          VarCollection(NumVars) = VP
		          VP.DeleteAllValues
		        end
		      end
		    wend
		    
		    Dim n as Integer
		    //now read the values one line after the other
		    i=i+1
		    
		    ContentLine = NthField(FileContent,EONSign,i)
		    while (ContentLine<>"")
		      n = 1
		      startP = 1
		      endP = 1
		      while endP > 0
		        endP = InStr(startP,ContentLine,TAB)
		        if endP > 0 then
		          VarValue = Mid(ContentLine,startP,endP-startP)
		          startP = endP + 1
		        else
		          VarValue = Mid(ContentLine,startP,len(ContentLine) - startP + 1)
		        end
		        VarValue=TrimString(VarValue,true,true,false,false)
		        if n <= NumVars then
		          VarCollection(n).AddValue(VarValue)
		        end
		        n = n + 1
		      wend
		      i=i+1
		      ContentLine = NthField(FileContent,EONSign,i)
		    wend
		    Me.Loaded = true
		    NumberOfRows.SIAI(i-2)
		  else
		    MsgBox("Table "+Name.GIAS+" was not able to open file "+FileName+EndOfLine+"FolderPath: " + FolderPath)
		    AddWarningTextCR("Table "+Name.GIAS+" was not able to open file "+FileName)
		    Me.Loaded = false
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NumDimensions() As integer
		  // return the number of dimensions of that table
		  Dim i as integer = 0
		  Dim LS as BasicClass = Me.FirstSubStep
		  while LS <> nil
		    if LS isA TableDimension_StepClass then
		      i = i + 1
		    end
		    LS = LS.NextStep
		  wend
		  return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  Super.Paint(g, mode)
		  DrawString(g, Title.GIAS, 5, 18)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  Super.Reset
		  
		  Select case Me.TableType.GIAI
		  case 0 //dynamic
		    Me.SetTableRow(0)
		  case 1 //static
		    SetTableRow(Me.NumberOfRows.GIAI - 1)
		  case 2 //once
		    Me.SetTableRow(0)
		  case 3 //repeating
		    Me.SetTableRow(0)
		  case 4 // ring memory
		    SetTableRow(0)
		  end
		  
		  Me.StartTime = GetActTime_sec
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(FolderPath as string, FileName as string, StartLine as integer, NumValues as integer)
		  Dim FileOk As Boolean = false
		  Dim ErrorS as string
		  
		  if FileName = "" then
		    FileName = Me.File.GIAS
		  end
		  
		  // save line by line
		  Dim FileContent as string = ""
		  Dim NumVars As Integer = AttributesUbound
		  Dim MoreValues as Boolean = true
		  
		  Dim i, MaxNumberValues As Integer = 0
		  //first write the headders
		  Dim ValueLine as string = ""
		  for n As Integer = 0 to NumVars
		    Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(AttributeList(n))
		    If attr <> Nil And attr.IsArray Then
		      ValueLine = ValueLine + attr.Name + chr(9)
		      MaxNumberValues = Max(MaxNumberValues, attr.GOAN)
		      MoreValues = true
		    end
		  next
		  
		  if Me.FileAppend.GIAB and ((Me.SaveEvery.GIAI = 0) or (StartLine > 0))then
		  else
		    ValueLine = left(ValueLine,len(ValueLine) - 1)
		    FileContent = FileContent + ValueLine + CR
		  end
		  
		  // this routine is for saving only part of the table
		  if (NumValues < StartLine) or (NumValues=0) then
		    NumValues = MaxNumberValues-1
		  else
		    NumValues = NumValues-1
		  end
		  if StartLine = 0 then
		    StartLine = -1
		  end
		  for i = StartLine + 1 to NumValues
		    ValueLine = ""
		    for n As Integer = 10 to NumVars
		      Dim attr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(AttributeList(n))
		      If attr <> Nil And attr.IsArray Then
		        ValueLine = ValueLine + attr.GOAS(i) + chr(9)
		      End
		    Next
		    ValueLine = left(ValueLine, len(ValueLine) - 1)
		    //if ValueLine<>"" then
		    FileContent = FileContent + ValueLine + CR
		    //end
		  next
		  
		  Dim WriteMode as integer = 0
		  if FileAppend.GIAB then
		    WriteMode = 1
		  else
		  end
		  
		  FileOk=File_Save( FileContent, ErrorS, FileName, FolderPath, WriteMode )
		  WriteMode=WriteMode
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetDimensionChoice() As boolean
		  Dim CS as string=""
		  Dim EA as AttributeClass = nil
		  Dim LS as BasicClass = FirstSubStep
		  // assemble the whole dimension choice from all sub - dimension tables
		  if LS <> nil then
		    while LS <> nil
		      if LS isA TableDimension_StepClass then
		        EA = TableDimension_StepClass(LS).DimensionList
		        CS = CS + EA.GIAS + " "
		      end
		      LS = LS.NextStep
		    wend
		    CS = CS.Mid(1, CS.Len - 1)
		    // now set this choice
		    return SetDimensionChoice(CS)
		  else
		    return false
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetDimensionChoice(ChoiceString as string) As boolean
		  Dim EA as AttributeClass=Me.GetAttribute(cDimension)
		  Dim k,n as integer
		  
		  // now find and set the appropriate line
		  Dim RevisionNotFound as boolean=true
		  n=0
		  if (EA<>nil) and (EA IsA String_AttributeClass) then
		    k=EA.GIAN
		    while RevisionNotFound  and (n<k)
		      if ChoiceString=EA.GIAS(n) then
		        RevisionNotFound=false
		        Me.SetTableRow(n)
		      end
		      if RevisionNotFound then
		        n=n+1
		      end
		    wend
		  end
		  return not(RevisionNotFound)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetDimensionChoice_NextLine() As boolean
		  Dim CS as string=""
		  Dim EA as AttributeClass = nil
		  Dim LS as BasicClass = Me.FirstSubStep
		  if LS <> nil then
		    while LS <> nil
		      if LS isA TableDimension_StepClass then
		        EA = TableDimension_StepClass(LS).DimensionList
		        CS = CS + EA.GIAS + " "
		      end
		      LS = LS.NextStep
		    wend
		    CS = CS.Mid(1, CS.Len - 1)
		    return Me.SetDimensionChoice_NextLine(CS)
		  else
		    return false
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetDimensionChoice_NextLine(ChoiceString as string) As boolean
		  Dim EA as AttributeClass=Me.GetAttribute(cDimension)
		  Dim k,n as integer
		  
		  
		  // now find and set the appropriate line
		  Dim RevisionNotFound as boolean=true
		  n=0
		  if (EA<>nil) and (EA IsA String_AttributeClass) then
		    k=EA.GIAN
		    while RevisionNotFound  and (n<k)
		      
		      if ChoiceString=EA.GIAS(n) then
		        RevisionNotFound=false
		        Me.SetTableRow(n+1)                        // same as in SetDimensionChoice EXCEPT for "+1"
		      end
		      if RevisionNotFound then
		        n=n+1
		      end
		    wend
		  end
		  return not(RevisionNotFound)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNumRows(NumR as integer)
		  
		  Select Case DateTimeControling.GIAI
		  case 0 // none
		    Date.IsArray = False
		    Date.SIAN(1)
		    Time.IsArray = False
		    Time.SIAN(1)
		  case 1 // date
		    Date.IsArray = True
		    Date.SIAN(NumR)
		    Time.IsArray = False
		    Time.SIAN(1)
		  case 2 // date_time
		    Date.IsArray = True
		    Date.SIAN(NumR)
		    Time.IsArray = True
		    Time.SIAN(NumR)
		  case 3 // time
		    Date.IsArray = False
		    Date.SIAN(1)
		    Time.IsArray = True
		    Time.SIAN(NumR)
		  end
		  Dim i as integer
		  Dim Attr as MultipleValuesAttributeClass = Nil
		  for i = FirstDynamicAttribute to AttributesUbound
		    Attr = MultipleValuesAttributeClass(GetAttribute(i))
		    if Attr<>nil then
		      Attr.IsArray = True
		      Attr.IsDynamic = True
		      Attr.SIAN(NumR)
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTableRow(Index as integer, IncrementIndex as boolean = false)
		  
		  FillDateTimeAttributes
		  
		  if IncrementIndex then
		    Index=ActiveRowInternal
		    Index=Index+1
		  end
		  
		  if Index < 0 then
		    Index = 0
		  end
		  
		  if Index > (NumberOfRows.GIAI -1) then
		    Select case TableType.GIAI
		    case 0 //dynamic
		      NumberOfRows.SIAI(Index + 1)
		    case 1 //static
		      Index=NumberOfRows.GIAI -1
		    case 2 //once
		      Index=NumberOfRows.GIAI -1
		    case 3 //repeating
		      Index=ActiveRowInternal
		    case 4 // ring memory
		      CopyValuesOneBack
		      Index=NumberOfRows.GIAI -1
		    end
		  end
		  
		  Me.ActiveRowInternal=Index
		  ActiveRow.SIAI(Index)
		  
		  Select Case DateTimeControling.GIAI
		  case 0 // none
		    
		  case 1 // date
		    Date.SIAA(Index)
		    Date.SIAS(GetActDate,Index)
		  case 2 // date_time
		    Date.SIAA(Index)
		    Time.SIAA(Index)
		    Date.SIAS(GetActDate,Index)
		    Time.SIAD(GetActTime_sec-StartTime,Index)
		  case 3 // time
		    Time.SIAA(Index)
		    Time.SIAD(GetActTime_sec-StartTime,Index)
		  end
		  
		  for n as Integer = FirstDynamicAttribute to AttributesUbound
		    AttributeList(n).SIAA(Index)
		    AttributeList(n).CopyActiveValue
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Sort()
		  //
		  Dim FV,LA,RA as AttributeClass
		  Dim n,i,k,j, NumVars as integer
		  Dim S as string
		  Dim LastRecordValue as string
		  
		  LastRecordValue=""
		  FV=GetAttribute("FilterAttribute")
		  RA=GetAttribute("RecordAttribute")
		  LastRecordValue=RA.GIAS(0)
		  
		  if FV IsA AttributeClass then
		    FV = AttributeClass(FV).Link
		    if FV<>nil then
		      n=FV.GIAN
		      j=0
		      Me.SetTableRow(0)
		      NumVars = AttributesUbound
		      for i=0 to n-1
		        S=FV.GOAS(i)
		        if S=Me.FilterValue.GIAS then
		          Me.SetTableRow(j+1)
		          for k=FirstDynamicAttribute-2 to NumVars
		            LA=Me.AttributeList(k)
		            // Get value of linked variable
		            S=LA.GIAS(i)
		            // set value to local variable
		            LA.SOAS(S,j)
		          next
		          if RA<>nil then
		            if LastRecordValue<>RA.GIAS(i+1) then
		              LastRecordValue=RA.GIAS(i+1)
		              j=j+1
		            end
		          else
		            j=j+1
		          end
		        end
		      next
		      Me.SetTableRow(j+1)
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_End() As Boolean
		  // save table if there is a file attached to it
		  
		  Select case Me.TableType.GIAI
		    
		  case 0 //dynamic
		    
		  case 1 //static
		    
		  case 2 //once
		    
		  case 3 //repeating
		    
		  case 4 //ring buffer
		    
		  case 5 // sorting
		    
		  end
		  
		  if SaveAtEnd.GIAB then
		    if File.GIAS<>"" then
		      Save(BasicPath.GIAS, File.GIAS, 0, GetMaxNumberofValues)
		    end
		  end
		  
		  // 2016-01-18 chanrei1 commenting out, SetDimensionChoice probably not needed here
		  //if Me.SetDimensionChoice then
		  //dim bla as string
		  //end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Exit()
		  Super.Step_Exit
		  
		  if Me.SaveAtEnd.GIAB then
		    if Me.File.GIAS <> "" then
		      Me.Save(BasicPath.GIAS,File.GIAS, 0, GetMaxNumberofValues)
		    end
		  end
		  
		  // 2016-01-18 chanrei1 commenting out, SetDimensionChoice probably not needed here
		  //Call Me.SetDimensionChoice
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  InternalInit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Super.Step_Init_AfterLoad
		  InternalInit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  #if FixIssue36
		    // the code below has no effect, and S is not used further
		  #else
		    // in order to move values from linked Attributes process fetch
		    Dim S as string
		    Dim NumVars as Integer = AttributesUbound
		    Dim LocAttr as  AttributeClass
		    for n as Integer = FirstDynamicAttribute-2 to NumVars
		      LocAttr = AttributeList(n)
		      if LocAttr IsA MultipleValuesAttributeClass then
		        if MultipleValuesAttributeClass(LocAttr).Link<>nil then
		          S=LocAttr.GIAS
		        end
		      end
		    next
		  #endif
		  
		  //handle automatic increment of rows
		  Dim NumRow as Integer = Me.NumberOfRows.GIAI
		  Select case Me.TableType.GIAI
		  case 0 //dynamic
		    SetTableRow(Me.ActiveRowInternal,true)
		  case 1 //static
		    
		  case 2 //once
		    SetTableRow(Me.ActiveRowInternal,true)
		  case 3 //repeating
		    SetTableRow(Me.ActiveRowInternal,true)
		  case 4 // ring buffer
		    SetTableRow(Me.ActiveRowInternal,true)
		  case 5 //sorting
		    Me.Sort
		  end
		  
		  if Me.SaveEvery.GIAI>0 then
		    dim n,ar, ls,se as integer
		    ar=Me.ActiveRowInternal
		    ls=Me.LastSaveLine
		    se=Me.SaveEvery.GIAI
		    if (Me.ActiveRowInternal-2)>=(Me.LastSaveLine+Me.SaveEvery.GIAI) then
		      Me.Save(BasicPath.GIAS,File.GIAS,Me.LastSaveLine, Me.ActiveRowInternal-1)
		      Me.LastSaveLine=Me.ActiveRowInternal-1
		    end
		  end
		  
		  if Visible.GIAB then
		    mUIUpdater.UpdateCanvas(0)
		  end if
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  Select case Me.TableType.GIAI
		    
		  case 0 //dynamic
		    
		  case 1 //static
		    
		  case 2 //once
		    
		  case 3 //repeating
		    
		  case 4 // sorting
		    
		  end
		  return Super.Step_Start
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TransferTableToDimensions()
		  // get first TableDimension and start iterating to fill the EA line with Dimension definitions
		  // Find Dimension table
		  Dim EA as AttributeClass = Me.GetAttribute(cDimension)
		  if EA<>nil then
		    // take every line and put it into down the
		    Dim Level as integer = 1
		    Dim BS as BasicClass = Me.FirstSubStep
		    while BS<>nil
		      if BS IsA TableDimension_StepClass then
		        TableDimension_StepClass(BS).TransferTableToDimensions( EA, Level)
		        Level=Level+1
		      end
		      BS=BS.NextStep
		    wend
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  if (Attr<>nil) and (FuncName<>"") then
		    Select case Attr
		    case Is = File
		      Select case FuncName
		      case is = "save"
		        Save(BasicPath.GIAS, File.GIAS, 0, GetMaxNumberofValues)
		      case is = "load"
		        Load( BasicPath.GIAS, File.GIAS )
		      case is = "SetRow"
		        
		      case is = "Clear"
		        ClearValues()
		      end
		      
		      
		    end
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ActiveCollection As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ActiveRow As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ActiveRowInternal As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		BasicPath As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Date As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DateTimeControling As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		File As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FileAppend As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FileFormat As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FilterAttribute As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FilterValue As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FirstDynamicAttribute As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected IsCollection As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastSaveLine As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LoadAtStart As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Loaded As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		NumberOfRows As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RecordAttribute As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ResetAtTestStepStart As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SaveAtEnd As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SaveEvery As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		StartTime As double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		TableType As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Time As Double_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = cDimension, Type = String, Dynamic = False, Default = \"Dimension", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="mUpdateCanvasMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ActiveRowInternal"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
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
			Name="DebugOn"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="FirstDynamicAttribute"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="LastSaveLine"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="integer"
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
			Name="Loaded"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="MaxRetries"
			Visible=false
			Group="Behavior"
			InitialValue="5"
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
			Name="NextTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
			Name="RetryWait"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWaitTime"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SAMStepID"
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
			Name="StartTime"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="double"
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
			Name="Untitled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
