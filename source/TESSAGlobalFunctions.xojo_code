#tag Module
Protected Module TESSAGlobalFunctions
	#tag Method, Flags = &h0
		Sub AddDebugText(S as string)
		  
		  
		  if DebugDirect then
		    Dim txtName As String = "DebugPring_"
		    Dim f As FolderItem = GetFolderItem(GetScreenshotsFolder)
		    If CheckFolder(f) Then
		      f = f.Child("DebugTexts")
		      If f <> Nil Then
		        If Not f.Exists Then
		          f.CreateAsFolder
		        End
		        Dim CurrentDate As new Date
		        f = f.Child(txtName + "-" + Format(CurrentDate.Hour, "0#\.") + ".txt")
		        If f <> Nil Then
		          Call OpenMeasFileForSave(S, f, true)
		        End
		      End
		    End
		  else
		    DebugInfo.AppendString(S)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDebugTextCR(S as string)
		  
		  DebugInfo.AppendString(S+CR)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddDebugText_(S as string)
		  
		  DebugInfo.ResetBuffer
		  DebugInfo.AppendString(S)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddWarningText(S as string)
		  //Add warning info line
		  WarningInfo.AppendString(S)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddWarningTextCR(S as string)
		  //Add warning info line
		  WarningInfo.AppendString(S+CR)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Assert(valid as Boolean, msg as String = "")
		  if not valid then
		    dim exc as new RuntimeException
		    exc.Message = msg
		    raise exc
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AutoFormat(Value as double, NumDec as integer) As string
		  Dim i as integer = 0
		  Dim n as double = abs(value)
		  Dim S as string = "#"
		  
		  while (n>1) and (i<=NumDec)
		    S=S+"#"
		    i=i+1
		    n=n/10
		  wend
		  i = NumDec-i
		  S=S+"."
		  while i>0
		    S=S+"#"
		    i=i-1
		  wend
		  
		  return format(Value,S)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AverageBrightness(image As Picture) As Double
		  Dim Result As Double = 0
		  Dim count As Integer = 0
		  If image <> Nil then
		    Dim surf As RGBSurface = image.RGBSurface
		    Dim lastX As Integer = image.Width - 1
		    Dim lastY As Integer = image.Height - 1
		    count = lastX * lastY
		    Dim temp As Color
		    For y As Integer = 0 To lastY
		      For x As Integer = 0 To lastX
		        temp = surf.Pixel(x, y)
		        Result = Result + (0.299 * temp.Red + 0.587 * temp.Green + 0.114 * temp.Blue) / 255
		      Next
		    Next
		  End
		  If count > 0 Then
		    Result = Result / count
		  End
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Bin(Value as Int64, NumBit as integer, Spaces as boolean = true, Reverse as boolean = false) As string
		  // transforms a Int64 into a binary string "1001101"
		  // adds spaces every 8 digits if Spapes is true
		  // builds the string LSB first when Reverse is true
		  
		  Dim S as string
		  Dim n as integer
		  
		  S=Bin(Value)
		  
		  for n=S.len to NumBit-1
		    if Spaces and ((n mod 8)=0) then
		      S=" "+S
		    end
		    S="0"+S
		  next
		  
		  if Reverse then
		    Dim S1 as string = S
		    S=""
		    for n=S1.len downto 1
		      S=S+S1.Mid(n,1)
		    next
		  end
		  
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcCRC16(byRef polynom() as byte, StartPos as integer, EndPos as integer, Poly as UInt16, crc as UInt16) As UInt16
		  // this routine calculates the CRC16 value according to 
		  // http://www.sunshine2k.de/coding/javascript/crc/crc_js.html
		  // and
		  // http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html
		  
		  Dim i, n as integer
		  Dim b as Byte
		  
		  for i=StartPos to EndPos
		    b=polynom(i)
		    crc=Bitwise.Bitxor(crc, b)
		    for n=1 to 8
		      if Bitwise.BitAnd(crc, &h80)=0 then
		        crc=Bitwise.ShiftLeft(crc,1)
		      else
		        crc=Bitwise.ShiftLeft(crc,1)
		        crc=Bitwise.Bitxor(crc, Poly)
		      end
		    next
		  next
		  return crc
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcCRC8(byRef polynom() as byte, StartPos as integer, EndPos as integer, Poly as byte, crc as byte) As byte
		  // this routine calculates the CRC8 value according to 
		  // http://www.sunshine2k.de/coding/javascript/crc/crc_js.html
		  // and
		  // http://www.sunshine2k.de/articles/coding/crc/understanding_crc.html
		  
		  
		  Dim i, n as integer
		  Dim b as Byte
		  
		  for i=StartPos to EndPos
		    b=polynom(i)
		    crc=Bitwise.Bitxor(crc, b)
		    for n=1 to 8
		      if Bitwise.BitAnd(crc, &h80)=0 then
		        crc=Bitwise.ShiftLeft(crc,1)
		      else
		        crc=Bitwise.ShiftLeft(crc,1)
		        crc=Bitwise.Bitxor(crc, Poly)
		      end
		    next
		  next
		  return crc
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckFile(f as folderItem) As boolean
		  // returns true if f is not nil and an existing file
		  If f <> Nil And f.Exists Then
		    Return Not f.Directory
		  else
		    Return False
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckFolder(fool as folderItem) As boolean
		  // returns true if it is not nil and an existing folder
		  If fool <> Nil And fool.Exists Then
		    Return fool.Directory
		  end
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckFolderItem(fool as folderItem) As integer
		  // checks a fileItem directory returns 0 if it is nil, 1 if it is a folder, 2  if it is a  file, 3 if it is nonexisting
		  If fool <> Nil Then
		    If fool.Exists Then
		      if fool.Directory then
		        return 1
		      else
		        return 2
		      end
		    else
		      Return 3
		    end
		  else
		    Return 0
		  end
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckReply(ByRef RV as integer, TrueRV as integer, ByRef S as string, ClearS as integer, ReplyString as string, TrueState as integer, ByRef SendST as integer) As boolean
		  if ReplyString<>"" then
		    Dim i as integer
		    i=Instr(S,ReplyString)
		    if i>0 then
		      //remove echo from S
		      SendST=TrueState
		      Select case ClearS
		      case 0  // clear S completely
		        S=""
		      case 1  // remove ReplyString completely
		        S= Mid(S,len(ReplyString)+1)
		      case 2  // remove ReplyString completely plus 12 additional letters (because of unknown parameters  "actual=x : "
		        S= Mid(S,i+13+len(ReplyString))
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
		      RV= TrueRV
		      return true
		    end
		  end
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckReply(ByRef S as string, ReplyString as string) As boolean
		  
		  if Instr(S,ReplyString)>0 then
		    //remove echo from S
		    S=Mid(S,len(ReplyString)+1,len(S))
		    return true
		  else
		    return false
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ChooseBarcode()
		  BarcodeChoice.Show
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearPathName(byRef Path as string)
		  // clears all PathSeparators at beginning, at end and double sparators
		  
		  #if TargetMacOS
		    while Path.Mid(1,1)=PathSeparator
		      Path=Path.Mid(2,Path.Len-1)
		    wend
		  #endif
		  
		  while Path.Mid(Path.Len,1)=PathSeparator
		    Path=Path.Mid(1,Path.Len-1)
		  wend
		  
		  Path = ReplaceAll(Path,PathSeparator+PathSeparator,PathSeparator)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CollectInfoFromAll() As String
		  Dim result As String
		  Dim it As Runtime.ObjectIterator = Runtime.IterateObjects
		  While it.MoveNext
		    If it.Current IsA CollectInfoInterface Then
		      result = result + "*******************************************" +CR
		      result = result + "Information from: " + CollectInfoInterface(it.Current).TitleInfo +CR
		      result = result + CollectInfoInterface(it.Current).CollectInfo +CR
		    End
		  Wend
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CollectSystemInformation(SystemState as String_AttributeClass,Include_OS_Information as boolean = false, Include_Resource_Info as boolean = true, Include_ComLog_Info as boolean = true, Include_Debug_Info as boolean = true, Include_Warning_Info as boolean = true, Include_TestReport as boolean = true)
		  if SystemState<>nil then
		    SystemState.SIAS("TESSA System Information from "+GetActDate+CR)
		    SystemState.SIASAdd("MemoryUsed: "+str(Runtime.MemoryUsed))
		    SystemState.SIASAdd("ObjectCount: "+str(Runtime.ObjectCount))
		    
		    'if Include_OS_Information then
		    'Dim paramsLine As String = ""
		    '#If TargetMacOS
		    'paramsLine = "system_profiler -detailLevel basic -timeout 30"
		    '#ElseIf TargetLinux
		    'paramsLine = "lscpu"
		    '#ElseIf TargetWindows
		    'paramsLine = "systeminfo.exe"
		    '#Endif
		    'If paramsLine <> "" Then
		    'Dim cmd As new Shell
		    'cmd.Mode = 0
		    'cmd.Execute(paramsLine)
		    'SystemState.SIASAdd("OS System Information *******************************************"+CR+cmd.Result+CR)
		    'End
		    'end
		    if Include_Resource_Info then
		      
		    end
		    if Include_ComLog_Info then
		      Dim DS as string = ""
		      IterateResources(DS,App.GlobalResources)
		      if DS<>"" then
		        SystemState.SIASAdd(CR+"TESSA ComLog Information *******************************************"+CR+DS+CR)
		      else
		        SystemState.SIASAdd(CR+" no TESSA ComLog Information found ***********************"+CR)
		      end
		    end
		    if Include_Debug_Info then
		      SystemState.SIASAdd(CR+"TESSA Debug Information *******************************************"+CR+GetAllDebugInfo+CR)
		      DeleteAllDebugInfo
		    end
		    if Include_Warning_Info then
		      SystemState.SIASAdd("TESSA Warning Information *******************************************"+CR+GetAllWarningInfo+CR)
		      DeleteAllWarningsInfo
		    end
		    if Include_TestReport then
		      SystemState.SIASAdd("TESSA Lasr Test Report *******************************************"+CR+GetLastTestreport+CR)
		    end
		    
		    File_Save_DebugText(SystemState)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorHex(value As Double) As String
		  Dim result As String = Hex(value)
		  If result.Len = 1 Then
		    result = "0" + result
		  end
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ColorToString(col As Color) As String
		  Return "&c" + ColorHex(col.Red) + ColorHex(col.Green) + ColorHex(col.Blue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertDate(vDate as date, format as integer) As string
		  Dim S as string = ""
		  Select case format
		  case 0 // yyyy-mm-dd
		    S=str(vDate.year)
		    if vDate.Month<10 then
		      S=S+"-0"+str(vDate.Month)
		    else
		      S=S+"-"+str(vDate.Month)
		    end
		    if vDate.Day<10 then
		      S=S+"-0"+str(vDate.Day)
		    else
		      S=S+"-"+str(vDate.Day)
		    end
		  case 1 // yy-mm-dd
		    S=str(vDate.year)
		    S=S.Mid(3,2)
		    if vDate.Month<10 then
		      S=S+"-0"+str(vDate.Month)
		    else
		      S=S+"-"+str(vDate.Month)
		    end
		    if vDate.Day<10 then
		      S=S+"-0"+str(vDate.Day)
		    else
		      S=S+"-"+str(vDate.Day)
		    end
		  case 2 // dd-mm-yyyy
		    if vDate.Day<10 then
		      S="0"+str(vDate.Day)
		    else
		      S=str(vDate.Day)
		    end
		    if vDate.Month<10 then
		      S=S+"-0"+str(vDate.Month)
		    else
		      S=S+"-"+str(vDate.Month)
		    end
		    S=S+"-"+str(vDate.Year).Mid(3,2)
		  case 3 // dd-mm-yy
		    if vDate.Day<10 then
		      S="0"+str(vDate.Day)
		    else
		      S=str(vDate.Day)
		    end
		    if vDate.Month<10 then
		      S=S+"-0"+str(vDate.Month)
		    else
		      S=S+"-"+str(vDate.Month)
		    end
		    S=S+"-"+str(vDate.Year)
		  end
		  
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertDate(ShortDate as string) As string
		  // converts the european short date format dd.mm.yy into yyyy-mm-dd
		  
		  Dim S as string
		  
		  if val(ShortDate.Mid(1,4))>2000 then
		    S=ShortDate
		  else
		    if ShortDate<>"" then
		      if val(ShortDate.Mid(7,2))>60 then
		        S="19"+ShortDate.Mid(7,2)+"-"+ShortDate.Mid(4,2)+"-"+ShortDate.Mid(1,2)
		      else
		        S="20"+ShortDate.Mid(7,2)+"-"+ShortDate.Mid(4,2)+"-"+ShortDate.Mid(1,2)
		      end
		    else
		      S=""
		    end
		  end
		  
		  return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertDate(vDate as string, format as integer, separator as string) As date
		  Dim d As New Date
		  
		  Select case format
		  case 0 // dd-mm-yyyy or dd-mm-yy
		    Dim dY as integer = val(NthField(vDate,separator,3))
		    if dY<20 then
		      dY=2000+dY
		    else
		      if dY<100 then
		        dY=dY+1900
		      end
		    end
		    d.Year = dY
		    d.Month = val(NthField(vDate,separator,2))
		    d.Day = val(NthField(vDate,separator,1))
		    
		  case 1 // yyyy-mm-dd or yy-mm-dd
		    Dim dY as integer = val(NthField(vDate,separator,1))
		    if dY<60 then
		      dY=2000+dY
		    else
		      if dY<100 then
		        dY=dY+1900
		      end
		    end
		    d.Year = dY
		    d.Month = val(NthField(vDate,separator,2))
		    d.Day = val(NthField(vDate,separator,3))
		  end
		  
		  return d
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertEPROM(S as string) As string
		  
		  Dim SOUT as string
		  Dim L,KL as string
		  Dim n,i,EPLine as integer
		  Dim EoL as string
		  
		  // determine end of line sign
		  n=CountCharacters(S,CR)
		  i=CountCharacters(S,NL)
		  if n>i then
		    EoL=CR
		  else
		    EoL=NL
		  end
		  
		  SOUT=""
		  
		  n=0
		  L="XX"
		  EPLine=0
		  
		  while (EPLine<32) and (n<100)
		    // find next line
		    if EPLine<16 then
		      KL=StrHex(EPLine*16,2)
		      do
		        //get next line
		        L=TrimString(GetStringValue(S,n,EoL),true,true,true,true)
		        n=n+1
		      loop until (Left(L,2)=KL) or (n>100)
		    else
		      KL=StrHex(EPLine*16,3)
		      do
		        //get next line
		        L=TrimString(GetStringValue(S,n,EoL),true,true,true,true)
		        n=n+1
		      loop until  (Left(L,3)=KL) or (n>100)
		    end
		    
		    //found line
		    // strip line from headder
		    i=InStr(L,chr(9))
		    if i>0 then
		      L=Mid(L,i+1,len(L)-i)
		    end
		    // get rid of  trailing Tabs/NL/CR/Spaces
		    L=TrimString(L,true,true,true,true)
		    
		    for i=0 to 15
		      SOUT=SOUT+TESSAGlobalFunctions.GetStringValue(L,i," ")
		    next
		    SOUT=SOUT+CR
		    EPLine=EPLine+1
		    
		  wend
		  
		  return SOUT
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConvertTimeValue(S as string) As double
		  // converts a string in the form of hh.mm.ss into number of seconds
		  return val(S.mid(1,2))*3600+val(S.Mid(4,2))*60+val(S.Mid(7,2))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Count2Characters(Source as string, Search1 as string, Search2 as string) As integer
		  Dim n,i as integer
		  
		  i=0
		  for n=0 to Source.len-(min(Search1.Len,Search2.Len)-1)
		    if Source.Mid(n,Search1.Len)=Search1 then
		      i=i+1
		    end
		    if Source.Mid(n,Search2.Len)=Search2 then
		      i=i+1
		    end
		  next
		  
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountCharacters(byRef Source as string, Search as string) As integer
		  Dim n,i as integer
		  
		  i=0
		  for n=0 to Source.len-(Search.Len-1)
		    if Source.Mid(n,Search.Len)=Search then
		      i=i+1
		    end
		  next
		  
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountOfAllFilesFromFolder(f As FolderItem, subFolder As Boolean) As UInt64
		  Dim size As Integer = 0
		  If f <> Nil Then
		    If f.Directory Then
		      Dim count As Integer = f.Count
		      For i As Integer = 1 to count
		        Dim item As FolderItem = f.Item(i)
		        If item.Directory Then
		          If subFolder Then
		            size = size + CountOfAllFilesFromFolder(item, True)
		          End
		        Else
		          size = size + 1
		        End
		      Next
		    End
		  End
		  Return size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountSingleCharacters(byRef Source as string, Search as string) As integer
		  Dim n,i,k,j as integer =0
		  Dim mb as MemoryBlock
		  if Source<>"" then
		    mb=Source
		    k=Source.len
		    j=asc(Search)
		    for n=0 to k-1
		      if mb.Int8Value(n)=j then
		        i=i+1
		      end
		    next
		  end
		  
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateDragRowImage(ElementIcon As Picture, ElementName As String) As Picture
		  Dim IconWidth, IconHeight As Integer = 10
		  If ElementIcon <> Nil then
		    IconWidth = ElementIcon.Width
		    IconHeight = ElementIcon.Height
		  Else
		    IconWidth = 0
		    IconHeight = 16
		  End
		  IconWidth = IconWidth + ElementName.Len * 9
		  IconHeight = IconHeight + 4
		  
		  Dim DragPicture As Picture = new Picture(IconWidth, IconHeight, 32)
		  DragPicture.Graphics.ForeColor = RGB(51,153,255)
		  DragPicture.Graphics.FillRect(0,0, IconWidth, IconHeight)
		  
		  Dim LeftMargin As Integer = 5
		  If ElementIcon <> Nil then
		    DragPicture.Graphics.DrawPicture(ElementIcon, 2, (IconHeight - DragPicture.Height) * 0.5)
		    LeftMargin = LeftMargin + ElementIcon.Width
		  End
		  DragPicture.Graphics.ForeColor = &cFFFFFF
		  DragPicture.Graphics.DrawString(ElementName, LeftMargin, (IconHeight + DragPicture.Graphics.TextSize) * 0.5)
		  
		  Return DragPicture
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllDebugInfo()
		  DebugInfo.ResetBuffer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllWarningsInfo()
		  WarningInfo.ResetBuffer
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteBasicStepClass(BS As BasicClass, deleteSubSteps As Boolean = False)
		  If BS <> Nil Then
		    If deleteSubSteps Then
		      BS.DeleteIncludedElements
		    End
		    // delete object itself
		    if BS.PreviousStep = nil then
		      // element is first in row
		      if BS.NextStep = nil then
		        // element is only one in row
		        if BS.UpperStep <> Nil then
		          BS.UpperStep.FirstSubStep = nil
		        end
		      else
		        // element sis first one with follower in row
		        BS.NextStep.PreviousStep = Nil
		        if BS.UpperStep <> Nil then
		          BS.UpperStep.FirstSubStep = BS.NextStep
		        end
		      end
		    else
		      // element is not first in row
		      if BS.NextStep = Nil then
		        // element is last one in row
		        BS.PreviousStep.NextStep = Nil
		      else
		        BS.NextStep.PreviousStep = BS.PreviousStep
		        BS.PreviousStep.NextStep = BS.NextStep
		      end
		    end
		    // delete all links pointing to this element
		    BS.UpperStep = Nil
		    BS.NextStep = Nil
		    BS.PreviousStep = Nil
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DeleteFolder(folder As FolderItem, continueIfError As Boolean = False) As Integer
		  if folder <> Nil And folder.Exists Then
		    Dim result As Integer = 0
		    While folder.Count > 0
		      Dim item As FolderItem = folder.TrueItem(1)
		      If item <> Nil Then
		        If item.Directory Then
		          result = DeleteFolder(item, continueIfError)
		        Else
		          item.Delete
		          result= item.LastErrorCode
		        End
		        if result <> 0 And (not continueIfError) Then
		          Return result
		        End
		      End
		    Wend
		    If result = 0 Then
		      folder.Delete
		      Return folder.LastErrorCode
		    End
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeterminAutoScale(vMin as double, vMax as double, ByRef Scale_Step as double, ByRef Scale_Min as double, ByRef Scale_Max as double, NumSteps as integer)
		  Dim D, DR as double
		  Dim f as integer
		  
		  D=vMax-vMin
		  
		  if D>0 then
		    f=0
		    DR=D
		    //transform the basic scale into a scale between 10 and 100 => determin basic scale (...0.01, 0.1,1,10,100...)
		    if DR>100 then
		      while DR>100
		        DR=DR/10
		        f=f+1
		      wend
		    else
		      while DR<10
		        DR=DR*10
		        f=f-1
		      wend
		    end
		    
		    //determin step with the found basic scale (20,50,100)
		    if DR>50 then
		      if NumSteps>9 then
		        Scale_Step=5
		      else
		        if NumSteps<6 then
		          Scale_Step=20
		        else
		          Scale_Step=10
		        end
		      end
		    else
		      if DR>20 then
		        if NumSteps>9 then
		          Scale_Step=2
		        else
		          if NumSteps<6 then
		            Scale_Step=10
		          else
		            Scale_Step=5
		          end
		        end
		      else
		        if DR>=10 then
		          if NumSteps>9 then
		            Scale_Step=1
		          else
		            if NumSteps<6 then
		              Scale_Step=5
		            else
		              Scale_Step=2
		            end
		          end
		        else
		          Scale_Step=1
		        end
		      end
		    end
		    
		    //transform the scale step into the basic scale
		    while f>0
		      Scale_Step=Scale_Step*10
		      f=f-1
		    wend
		    
		    while f<0
		      Scale_Step=Scale_Step/10
		      f=f+1
		    wend
		    
		    // determin the maximal scale in multiples of the found scale steps
		    Scale_Max=0
		    if vMax>0 then
		      while (Scale_Max-Scale_Step)<vMax
		        Scale_Max=Scale_Max+Scale_Step
		      wend
		    else
		      if vMax<0 then
		        while (Scale_Max-Scale_Step)>vMax
		          Scale_Max=Scale_Max-Scale_Step
		        wend
		      else
		        Scale_Max=0
		      end
		    end
		    
		    // do the same with the minimum scale step
		    Scale_Min=0
		    if vMin<0 then
		      while Scale_Min>vMin
		        Scale_Min=Scale_Min-Scale_Step
		      wend
		    else
		      if vMin>0 then
		        while (Scale_Min+Scale_Step)<vMin
		          Scale_Min=Scale_Min+Scale_Step
		        wend
		      else
		        Scale_Min=0
		      end
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ElemFolder(Entry As FolderItem) As FolderItem
		  //-----------------------------------------------------
		  // An ElemItem is a folder wich can be interpreted as a
		  // full-valid element. This means, that such a folder
		  // must hold information about an element and facultatively
		  // an element image and description.
		  // If this case matches, the system will generate a single entry
		  // for this folder rather than a folder with subentries.
		  //-----------------------------------------------------
		  Dim cnt As Integer = -1
		  
		  Dim LocItem, PosItem as folderItem = nil
		  
		  If Entry <> Nil Then
		    // folder name
		    Dim name As String = Entry.DisplayName
		    cnt = Entry.Count
		    
		    For idx As Integer = 1 To Entry.Count
		      LocItem = Entry.Item(idx)
		      if LocItem<>nil then
		        If LocItem.DisplayName = name + ".xml" Then
		          cnt = cnt -1
		          PosItem = LocItem
		        ElseIf LocItem.DisplayName = name + ".png" Then
		          cnt = cnt - 1
		        ElseIf LocItem.DisplayName = name + "_desc.xml" Then
		          cnt = cnt - 1
		        End
		      end
		    Next
		  End
		  
		  // success means cnt >= 0, on MAC the .DS_Store file might be present!
		  If cnt >= 0 And (PosItem<>nil) Then
		    Return PosItem
		  Else
		    Return Nil
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub File_Coordinate(pFileName as Path_AttributeClass, pFolder as Path_AttributeClass, pFileIndex as Integer_AttributeClass = nil, vExtention as string = "")
		  // this method will coordinate the settings in the 3 linked attributes for Path, File and File-Index
		  // it will:
		  // arrange the Path (include %......%)
		  // arrange the File (include %Path% or %.....%)
		  // update Index according the latest version saved
		  
		  if (pFileName<>nil) and (pFolder<>nil) then
		    if pFolder.GIAS="" then
		      if PFileName.GIAS="" then
		      else
		        if vExtention<>"" then
		          
		        end
		      end
		    else
		      
		    end
		  else
		    // error
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File_Load(byRef FileContent as string, FileName as string, FilePath as string = "", showError as boolean = false, showDialog as boolean = false, FileIndex as Integer = -1, Extention as string = "txt") As boolean
		  Dim f As FolderItem = Nil
		  Dim t As TextInputStream = Nil
		  Dim  ResultOk As Boolean = false
		  
		  FileContent=""
		  f = File_Open(FileContent, FileName, FilePath, False, showDialog)
		  
		  if f<>nil then
		    if (f.exists) and not(f.Directory) then
		      t=TextInputStream.Open(f)
		      if t<>nil then
		        FileContent=t.ReadAll(Encodings.UTF8)
		        t.Close
		        // ANR: need to replace all line endings with platform-specific ones
		        FileContent=ReplaceLineEndings(FileContent,EndOfLine)
		        FileContent=FileContent.ReplaceAll("AXTDL","TESSA") // remove later again
		        ResultOk=true
		      else
		        ResultOk=false
		        FileContent=FileContent+CR+"Text Inputstream found, but could not be opend"
		      end
		    else
		      FileContent=FileContent+CR+"File "+FileName+" does not exist or is a folder"
		    end
		  else
		    FileContent=FileContent+CR+"File "+FileName+" is nil"
		  end
		  
		  return ResultOk
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File_Load_byRef(byRef FileContent as string, FileName as string, FilePath as string = "", showError as boolean = false, showDialog as boolean = false, FileIndex as Integer = -1, Extention as string = "txt") As boolean
		  Dim f As FolderItem = nil
		  Dim t As TextInputStream = Nil
		  Dim  ResultOk As Boolean = false
		  
		  FileContent=""
		  f = File_Open(FileContent, FileName, FilePath, false, showDialog)
		  
		  if f<>nil then
		    if (f.exists) and not(f.Directory) then
		      t=TextInputStream.Open(f)
		      if t<>nil then
		        FileContent=t.ReadAll(Encodings.UTF8)
		        t.Close
		        // ANR: need to replace all line endings with platform-specific ones
		        FileContent=ReplaceLineEndings(FileContent,EndOfLine)
		        FileContent=FileContent.ReplaceAll("AXTDL","TESSA") // remove later again
		        ResultOk=true
		      else
		        ResultOk=false
		        FileContent=FileContent+CR+"Text Inputstream found, but could not be opend"
		      end
		    else
		      FileContent=FileContent+CR+"File "+FileName+" does not exist or is a folder"
		    end
		  else
		    FileContent=FileContent+CR+"File "+FileName+" is nil"
		  end
		  
		  return ResultOk
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File_Load_wAttr(byRef FileContent as string, pFileName as Path_AttributeClass, pFilePath as Path_AttributeClass, showError as boolean = false, showDialog as boolean = false, pFileIndex as Integer_AttributeClass = nil, Extention as string = "txt") As boolean
		  Dim FileName as string = ""
		  Dim FilePath as string = ""
		  Dim FileIndex as integer = -1
		  
		  if pFileName<>nil then
		    FileName = pFileName.GIAS
		  end
		  if pFilePath<>nil then
		    FilePath = pFilePath.GIAS
		  end
		  if pFileIndex<>nil then
		    FileIndex=pFileIndex.GIAI
		  else
		    FileIndex=-1
		  end
		  
		  return File_Load(FileContent, FileName, FilePath, showError, showDialog, FileIndex, Extention)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File_Open(byRef ErrorMessage as string, FileName as string, FolderPath as string = "", ForSaving as boolean, showError as boolean = false, showDialog as boolean = false, FileIndex as Integer = -1, Extention as string = "txt") As FolderItem
		  // error ID 10.
		  Dim f as FolderItem = nil
		  Dim  ResultOk As Boolean = False
		  
		  ErrorMessage="PathSeparator is "+PathSeparator+FolderPath+CR
		  
		  ClearPathName(FolderPath)
		  ClearPathName(FileName)
		  
		  ErrorMessage=ErrorMessage+FolderPath+CR
		  
		  If FolderPath = "" Then // no path is given, only filename
		    FileName = GetPathValueFromTemplate(FileName)
		    If FileName <> "" Then
		      '#if TargetLinux
		      'FileName="/"+FileName
		      '#endif
		      f = GetFolderItemFromPath(FileName)
		      If CheckFile(f) Then
		        ResultOk = True
		      Else
		        ErrorMessage = ErrorMessage + CR + "File " + FileName + " not found.(10.1)"
		      End
		    Else
		      ErrorMessage = ErrorMessage + CR + "File path is empty.(10.2)"
		    End
		  Else
		    FolderPath = GetPathValueFromTemplate(FolderPath)
		    If FileName.Left(FolderPath.Len) = FolderPath Then
		      FileName = FileName.Right(FileName.Len - FolderPath.Len)
		    End
		    If FileName.Left(1) = PathSeparator Then
		      FileName = FileName.Right(FileName.Len - 1)
		    End
		    
		    // Get only the file name
		    If FileName <> FolderPath Then
		      Dim FileNamePath As FolderItem = GetFolderItemFromPath(FileName)
		      If FileNamePath <> Nil Then
		        FileName = FileNamePath.DisplayName
		      End If
		    End If
		    
		    Dim vol As FolderItem = Volume(0)
		    If FileName.InStr(vol.NativePath) > 0 Then // absolut => native
		      f = GetFolderItemFromPath(FileName)
		      if (CheckFile(f)) Then
		        ResultOk = True
		      Else
		        ErrorMessage = "File " + FileName + " not found.(10.3)"
		      End
		    Else
		      f = GetFolderItemFromPath(FolderPath)
		      If CheckFolder(f) Then
		        f = f.Child(FileName)
		        If CheckFile(f) Then
		          ResultOk = True
		        Else
		          ErrorMessage = "File " + FileName + " in folder "+ FolderPath + " not found.(10.4)"
		        End
		      Else
		        ErrorMessage = ErrorMessage + CR + "Path " + FolderPath + " not found.(10.5)"
		      End
		    End
		  End
		  
		  If ResultOk Then
		    ErrorMessage = ""
		  End
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File_Open_byRef(byRef ErrorMessage as string, byRef FileName as string, byRef FolderPath as string, ForSaving as boolean, showError as boolean = false, showDialog as boolean = false, FileIndex as Integer = -1, Extention as string = "txt") As FolderItem
		  // error ID 11.
		  Dim f as FolderItem = nil
		  Dim  ResultOk As Boolean = false
		  
		  ErrorMessage="PathSeparator is "+PathSeparator+FolderPath+CR
		  
		  ClearPathName(FolderPath)
		  ClearPathName(FileName)
		  
		  ErrorMessage=ErrorMessage+FolderPath+CR
		  
		  If FolderPath = "" Then // no path is given, only filename
		    FileName = GetPathValueFromTemplate(FileName)
		    If FileName <> "" Then
		      f = GetFolderItemFromPath(FileName)
		      If CheckFile(f) Then
		        ResultOk = True
		      Else
		        ErrorMessage = ErrorMessage + CR + "File " + FileName + " not found.(11.1)"
		      End
		    Else
		      ErrorMessage = ErrorMessage + CR + "File path is empty.(11.2)"
		    End
		  Else
		    FolderPath = GetPathValueFromTemplate(FolderPath)
		    If FileName.Left(FolderPath.Len) = FolderPath Then
		      FileName = FileName.Right(FileName.Len - FolderPath.Len)
		    End
		    if FileName.Left(1) = PathSeparator Then
		      FileName = FileName.Right(FileName.Len - 1)
		    End
		    
		    Dim vol As FolderItem = Volume(0)
		    If FileName.InStr(vol.NativePath) > 0 Then  // absolut => native
		      f = GetFolderItemFromPath(FileName)
		      if (CheckFile(f)) Then
		        ResultOk = True
		      Else
		        ErrorMessage = "File " + FileName + " not found.(11.3)"
		      End
		    Else
		      f = GetFolderItemFromPath(FolderPath)
		      If CheckFolder(f) Then
		        f = f.Child(FileName)
		        If CheckFile(f) Then
		          ResultOk = True
		        Else
		          ErrorMessage = "File " + FileName + " in folder "+ FolderPath + " not found.(11.4)"
		        End
		      Else
		        ErrorMessage = ErrorMessage + CR + "Path " + FolderPath + " not found.(11.5)"
		      End
		    End
		  End
		  
		  If ResultOk Then
		    ErrorMessage = ""
		  End
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File_Open_wAttr(byRef ErrorMessage as string, pFileName as Path_AttributeClass, pFilePath as Path_AttributeClass, ForSaving as boolean, showError as boolean = false, showDialog as boolean = false, pFileIndex as Integer_AttributeClass = nil, Extention as string = "txt") As FolderItem
		  Dim FileName as string = ""
		  Dim FilePath as string = ""
		  Dim FileIndex as integer = -1
		  
		  if pFileName<>nil then
		    FileName = pFileName.GIAS
		  end
		  if pFilePath<>nil then
		    FilePath = pFilePath.GIAS
		  end
		  if pFileIndex<>nil then
		    FileIndex=pFileIndex.GIAI
		  else
		    FileIndex=-1
		  end
		  
		  return File_Open_byRef(ErrorMessage, FileName, FilePath, ForSaving, showError, showDialog, FileIndex, Extention)
		  
		  pFileIndex.SIAI(FileIndex)
		  pFileName.SIAS(FileName)
		  pFilePath.SIAS(FilePath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File_Save(FileContent as string, byRef ErrorS as string, FileName as string, FilePath as string = "", WriteMode as integer = 0, showError as boolean = false, showDialog as boolean = false, FileIndex as Integer = -1, Extention as string = "txt", Security as integer = 0) As boolean
		  // will write the string FileContent as text file to disk
		  // WriteMode: 0=Overwrite, 1=append, 2=re-index
		  // security 0=none
		  // error ID 12
		  
		  Dim  ResultOk As Boolean = false
		  
		  Dim f As FolderItem = File_Open(ErrorS, FileName, FilePath, true, showDialog)
		  Select case Security
		  case 0
		  case 1
		    FileContent="Security "+CR+FileContent
		  end
		  
		  if (f<>nil) then
		    if not(f.Directory) then
		      Select case WriteMode
		      case 0 // Overwrite
		        ResultOk = OpenMeasFileForSave(FileContent, f)
		        If Not  ResultOk Then
		          ErrorS="Text Inputstream could not be opend for overwriting.(12.1)"
		        End
		      case 1 // append
		        ResultOk = OpenMeasFileForSave(FileContent, f, True)
		        If Not  ResultOk Then
		          ErrorS="Text Inputstream could not be opend for appending.(12.2)"
		        End
		      case 2 // re-index
		        if f.Exists then
		          Dim AddNewIndex as boolean
		          while (f<>nil) and f.Exists
		            AddNewIndex = true
		            FileName = f.NativePath  // absolut => native
		            Dim i1 as integer = InstrReverse(FileName,FileName.Len,"_")
		            Dim i2 as integer = InstrReverse(FileName,FileName.Len,".")
		            if i1>0 then
		              if (i2>i1) and ((i2-i1)<5)  then
		                // there is already a number => increment and replace within i1,i2
		                Dim k as integer = Val(FileName.Mid(i1+1,i2-i1))
		                if k>0 then
		                  k=k+1
		                  FileName=FileName.Mid(1,i1)+str(k)+FileName.Mid(i2,FileName.Len-i2+1)
		                  AddNewIndex=false  
		                end
		              end
		            end
		            if AddNewIndex then
		              FileName=FileName.Mid(1,i2-1)+"_1"+FileName.Mid(i2,FileName.Len-i2+1)
		            end
		            f=GetFolderItem(FileName, FolderItem.PathTypeNative)
		            FileName=FileName
		          wend
		          if (f<>nil) then
		            ResultOk = OpenMeasFileForSave(FileContent, f)
		            If Not ResultOk Then
		              ErrorS="file "+FileName+" could not be renumbered.(12.3)"
		            End
		          end
		        else
		          ResultOk = OpenMeasFileForSave(FileContent, f)
		          If Not ResultOk Then
		            ErrorS="Text Inputstream could not be opend.(12.4)"
		          End
		        end
		      end
		    else
		      ErrorS="File "+FileName+" is a dirctory! (12.5)"
		      ResultOk=false
		    end
		  else
		    ErrorS="File "+FileName+" could not be created! (12.6)"
		    ResultOk=false
		  end
		  return ResultOk
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File_Save_byRef(FileContent as string, byRef ErrorS as string, byRef FileName as string, byRef FilePath as string, WriteMode as integer = 0, showError as boolean = false, showDialog as boolean = false, byRef FileIndex as Integer, Extention as string = "txt") As boolean
		  // will write the string FileContent as text file to disk
		  // WriteMode: 0=Overwrite, 1=append, 2=re-index
		  // error ID 13
		  
		  Dim  ResultOk As Boolean = false
		  
		  Dim f As FolderItem = File_Open(ErrorS, FileName, FilePath, true, showDialog)
		  if (f<>nil) then
		    if not(f.Directory) then
		      Select case WriteMode
		      case 0 // Overwrite
		        ResultOk = OpenMeasFileForSave(FileContent, f)
		        If Not  ResultOk Then
		          ErrorS="Text Inputstream could not be opend for overwriting.(13.1)"
		        End
		      case 1 // append
		        ResultOk = OpenMeasFileForSave(FileContent, f, True)
		        If Not  ResultOk Then
		          ErrorS="Text Inputstream could not be opend for appending.(13.2)"
		        End
		      case 2 // re-index
		        if f.Exists then
		          Dim AddNewIndex as boolean
		          while (f<>nil) and f.Exists
		            AddNewIndex = true
		            FileName = f.NativePath  // absolut => native
		            Dim i1 as integer = InstrReverse(FileName,FileName.Len,"_")
		            Dim i2 as integer = InstrReverse(FileName,FileName.Len,".")
		            if i1>0 then
		              if (i2>i1) and ((i2-i1)<5)  then
		                // there is already a number => increment and replace within i1,i2
		                Dim k as integer = Val(FileName.Mid(i1+1,i2-i1))
		                if k>0 then
		                  k=k+1
		                  FileName=FileName.Mid(1,i1)+str(k)+FileName.Mid(i2,FileName.Len-i2+1)
		                  AddNewIndex=false
		                end
		              end
		            end
		            if AddNewIndex then
		              FileName=FileName.Mid(1,i2-1)+"_1"+FileName.Mid(i2,FileName.Len-i2+1)
		            end
		            f=GetFolderItem(FileName, FolderItem.PathTypeNative)
		            FileName=FileName
		          wend
		          if (f<>nil) then
		            ResultOk = OpenMeasFileForSave(FileContent, f)
		            If Not  ResultOk Then
		              ErrorS="file "+FileName+" could not be renumbered.(13.3)"
		            End
		          end
		        else
		          ResultOk = OpenMeasFileForSave(FileContent, f)
		          If Not  ResultOk Then
		            ErrorS="Text Inputstream could not be opend.(13.4)"
		          End
		        end
		      end
		    else
		      ErrorS="File "+FileName+" is a dirctory! (13.5)"
		      ResultOk=false
		    end
		  else
		    ErrorS="File "+FileName+" could not be created! (13.6)"
		    ResultOk=false
		  end
		  return ResultOk
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub File_Save_DebugText(CurrentAttribute as AttributeClass)
		  if (CurrentAttribute<>nil) and (CurrentAttribute IsA String_AttributeClass) then
		    Dim txtName As String = "DebugPring_" + CurrentAttribute.MyStep.Name.GIAS +"_"+ CurrentAttribute.Name + "_date_index"
		    Dim f As FolderItem = GetFolderItem(GetScreenshotsFolder)
		    If CheckFolder(f) Then
		      f = f.Child("DebugTexts")
		      If f <> Nil Then
		        If Not f.Exists Then
		          f.CreateAsFolder
		        End
		        Dim CurrentDate As new Date
		        f = f.Child(txtName + "-" + Format(CurrentDate.Hour, "0#\.") + Format(CurrentDate.Minute, "0#\.") + Format(CurrentDate.Second, "0#") + ".txt")
		        If f <> Nil Then
		          Call OpenMeasFileForSave(CurrentAttribute.GIAS, f)
		        End
		      End
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function File_Save_wAttr(FileContent as string, byRef ErrorS as string, pFileName as Path_AttributeClass, pFilePath as Path_AttributeClass, WriteMode as integer = 0, showError as boolean = false, showDialog as boolean = false, pFileIndex as Integer_AttributeClass, Extention as string = "txt") As boolean
		  Dim FileName as string = ""
		  Dim FilePath as string = ""
		  Dim FileIndex as integer = -1
		  
		  if pFileName<>nil then
		    FileName = pFileName.GIAS
		  end
		  if pFilePath<>nil then
		    FilePath = pFilePath.GIAS
		  end
		  if pFileIndex<>nil then
		    FileIndex=pFileIndex.GIAI
		  else
		    FileIndex=-1
		  end
		  
		  return File_Save_byRef(FileContent,ErrorS, FileName, FilePath, WriteMode, showError, showDialog, FileIndex, Extention)
		  
		  pFileIndex.SIAI(FileIndex)
		  pFileName.SIAS(FileName)
		  pFilePath.SIAS(FilePath)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FixEncoding(extends s as String) As String
		  // Set strings to UTF-8 encoding if it's nil
		  // Call this when you get strings from a file or clipboard (RawData), JSONItem or XML, where strings may have gotten nil encodings from.
		  
		  if s.Encoding = nil then
		    s = s.DefineEncoding (Encodings.UTF8)
		  end if
		  
		  return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GenerateUID() As String
		  Dim Block As MemoryBlock
		  Block = NewMemoryBlock(36)
		  
		  'Uniqueness in space - machine MAC address, 12 bytes.
		  Dim nic As NetworkInterface
		  Dim mac As String
		  
		  If System.NetworkInterfaceCount > 0 Then
		    nic = System.GetNetworkInterface(0)
		    mac = nic.MACAddress
		    mac = ReplaceAll(mac, ":", "")
		    Block.StringValue(0, 12) = mac
		  Else
		    'If there's no network interface, a random number is better than nothing.
		    'Note that the last 4 bytes of the second Rnd will be overwritten.
		    Block.DoubleValue(0) = Rnd
		    Block.DoubleValue(8) = Rnd
		  End If
		  
		  'Uniqueness in time - TotalSeconds + machine Microseconds.
		  'TotalSeconds, 8 bytes.
		  Dim DateTime As Date = New Date
		  Block.DoubleValue(12) = DateTime.TotalSeconds
		  
		  'Microseconds, which is based on boot time, 8 bytes.
		  Block.DoubleValue(20) = Microseconds
		  
		  'Further uniqueness - random number generated by
		  'motherboard, 8 bytes.
		  Block.DoubleValue(28) = Rnd
		  
		  'Get UUID.
		  Return EncodeHex(MD5(Block.StringValue(0, 36)))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAbsTime() As String
		  Dim d As New Date
		  return d.ShortDate +" "+ d.LongTime
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetActDate(Format as integer = 0) As string
		  // returns the actual date and time as string
		  
		  Dim d as date = new Date
		  Select case Format
		  case 0
		    return d.ShortDate+" "+d.ShortTime
		  case 1
		    return d.LongDate+" "+d.LongTime
		  case 2
		    return d.SQLDateTime
		  case 3 // format for CP650 test
		    Dim SD as string = d.ShortDate
		    SD=SD.Mid(1,2)+"-"+SD.Mid(4,2)+"-"+SD.Mid(7,2)+" "
		    Dim ST as string = d.LongTime
		    ST=SD+ST.Mid(1,2)+":"+ST.Mid(4,2)+":"+ST.Mid(7,2)
		    return ST
		  else
		    
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetActSumDiffTime_msec() As double
		  Return (Microseconds/1000)-TESSAGlobalFunctions.ActStartTime - SumDiffTime
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetActTime_msec() As double
		  Return (Microseconds/1000)-TESSAGlobalFunctions.ActStartTime
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetActTime_sec() As double
		  Return ((Microseconds/1000)-TESSAGlobalFunctions.ActStartTime)/1000
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllDebugInfo() As string
		  return DebugInfo.GetString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllWarningInfo() As string
		  
		  return WarningInfo.GetString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAppFolder() As String
		  Return mAppFolder
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAppFolderItem() As FolderItem
		  Dim f As FolderItem = GetFolderItem(mAppFolder)
		  If Not CheckFolder(f) Then
		    f = GetFolderItem("")
		  End
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAttributeType(Attr As AttributeClass) As String
		  Dim value As String  = "Attribute"
		  
		  Dim type As Introspection.TypeInfo = Introspection.GetType(Attr)
		  If type <> Nil then
		    value = type.Name
		  End
		  
		  if value.InStr("_AttributeClass") > 0 then
		    value = value.ReplaceAll("_AttributeClass", "")
		  ElseIf value.InStr("_Attribute") > 0 Then
		    value = value.ReplaceAll("_Attribute", "")
		  End
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetBkgdColorAccordingError(vError as integer) As Color
		  
		  Select case vError
		  case 0 // pass
		    return &cA0FFA0
		  case 3 // in progress
		    return &cFFFFA0
		  case 4 // skipped
		    return &cFFFFA0
		  case 5 // fail
		    return &cFFA0A0
		  else
		    return &cFFFFFF
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetColor(S as string) As Color
		  // this routine converts a string into a color definition
		  if S.Lowercase = "transparent" Then
		    Return RGB(255, 255, 255, 255)
		  End
		  Dim R,G,B as integer
		  
		  Select Case NthField(S," ",1)
		  Case ""
		  case is ="RGB"
		    R=GetStringValueI(S,1," ")
		    G=GetStringValueI(S,2," ")
		    B=GetStringValueI(S,3," ")
		  case is ="red"
		    R=255
		    G=0
		    B=0
		  case is ="green"
		    R=0
		    G=255
		    B=0
		  case is ="blue"
		    R=0
		    G=0
		    B=255
		  case is ="yellow"
		    R=255
		    G=255
		    B=0
		  case is ="violet"
		    R=255
		    G=0
		    B=255
		  case is="black"
		    R=0
		    G=0
		    B=0
		  case is ="white"
		    R=255
		    G=255
		    B=255
		  case is ="orange"
		    R=255
		    G=128
		    B=0
		  case is ="pink"
		    R=255
		    G=128
		    B=255
		  case is ="gray"
		    R=128
		    G=128
		    B=128
		  case is ="brown"
		    R=128
		    G=64
		    B=0
		  else
		    if InStr(1,S,"&c")>0 then
		      R=ValHex(Mid(S,3,2))
		      G=ValHex(Mid(S,5,2))
		      B=ValHex(Mid(S,7,2))
		    else
		      //if no color can be definied red is taken
		      R=255
		      G=0
		      B=0
		    end
		  end
		  
		  if InStr(1,S,"dark")>0 then
		    R=R/2
		    G=G/2
		    B=B/2
		  else
		    if InStr(1,S,"light")>0 then
		      R=128+R/2
		      G=128+G/2
		      B=128+B/2
		    end
		  end
		  
		  return RGB(R,G,B)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConfigFolder() As String
		  If WorkspaceSettings <> Nil Then
		    Return WorkspaceSettings.GetConfigFolder
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDBTestSeqFolderItem() As FolderItem
		  If WorkspaceSettings <> Nil Then
		    Return GetFolderItemFromPath(WorkspaceSettings.DataBaseTestSeq.GIAS)
		  End
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetElementsFolder() As String
		  If WorkspaceSettings <> Nil Then
		    Return WorkspaceSettings.GetElementsFolder
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetElementsPicture(SubFolder As String, PicName As String) As Picture
		  //------------------------------------------------
		  // Returns the image at the given SubFolder with the given
		  // PicName.
		  //------------------------------------------------
		  
		  // cleanup subfolder
		  //TODO: need check it
		  If SubFolder.Len <= 2 Then
		    SubFolder = ""
		  End
		  
		  Dim f As FolderItem = GetFolderItemFromPath(GetElementsFolder)
		  If f <> Nil Then
		    If SubFolder <> "" Then
		      Dim path As String = f.NativePath // absolut => native
		      If SubFolder.Left(path.Len) = path Then
		        SubFolder = SubFolder.Right(SubFolder.Len - path.Len)
		      End
		      Dim subDirs(-1) As String = SubFolder.Split(":")
		      Dim  idx As Integer = 0
		      While f <> Nil And idx <= SubDirs.Ubound
		        if subDirs(idx) <> "" Then
		          f=f.Child(subDirs(idx))
		        End
		        idx = idx + 1
		      Wend
		    End
		    
		    If f<>Nil Then
		      // regulare case
		      Dim img As FolderItem=f.Child(PicName)
		      If img <> Nil And img.Exists Then
		        Return Picture.Open(img)
		      End
		      // image not found, remove counter from the image name
		      Dim strList(-1) As String = PicName.Split("_")
		      If UBound(strList) > 0 Then
		        Dim idx As Integer
		        Dim fName As String = strList(0)
		        For idx  = 1 To UBound(strList)-1
		          fName = fName + "_" + strList(idx)
		        Next
		        img=f.Child(fName + ".png")
		        If img <> Nil And img.Exists Then
		          Return Picture.Open(img)
		        End
		      End
		    End
		  End
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetError(ErrCode as integer) As string
		  // returns the test string for a specific error code
		  
		  Select case ErrCode
		  case ErrorCode_Pass
		    return "Pass"
		  case ErrorCode_Off
		    return "Off"
		  case ErrorCode_NotDone
		    return "NotDone"
		  case ErrorCode_InProgress
		    return "InProgress"
		  case ErrorCode_Skipped
		    Return "Skipped"
		  case ErrorCode_Fail
		    return "Fail"
		  else
		    return ""
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFolderItemFromPath(path As String) As FolderItem
		  Dim f As FolderItem = Nil
		  If TargetMacOS and path.left(1) = "/" Then
		    f = GetFolderItem(path, FolderItem.PathTypeNative)
		  Else
		    f = GetFolderItem(path)
		  End
		  Return f
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFullFilePath(SubFolder As String, FileName As String) As String
		  If FileName <> "" Then
		    Dim subFolderItem As FolderItem = GetWorkingFolderItem
		    If subFolderItem <> Nil Then
		      If SubFolder <> "" Then
		        subFolderItem = subFolderItem.Child(SubFolder)
		        If subFolderItem <> Nil Then
		          subFolderItem = subFolderItem.Child(FileName)
		          If subFolderItem <> Nil And subFolderItem.Exists Then
		            Return subFolderItem.NativePath // absolut => native
		          End
		        End
		      Else
		        subFolderItem = subFolderItem.Child(FileName)
		        If subFolderItem <> Nil Then
		          If subFolderItem.Exists Then
		            Return subFolderItem.NativePath // absolut => native
		          Else
		            subFolderItem = GetFolderItemFromPath(FileName)
		            If subFolderItem <> Nil And subFolderItem.Exists Then
		              Return subFolderItem.NativePath // absolut => native
		            End
		          End
		        End
		      End
		    End
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLastTestreport() As string
		  Dim TS as string = ""
		  if App.GlobalTopmostElement<>nil then
		    Dim RS as BasicClass = App.GlobalTopmostElement.FindElement(GetTypeInfo(TestReport_StepClass))
		    if (RS<>nil) and (RS IsA TestReport_StepClass) then
		      TS = TestReport_StepClass(RS).ReportContent.GIAS
		    end
		  end
		  return TS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getNameRepeatings(BS As BasicClass, checkingName As String, OnlySameLevel as boolean = false) As Integer
		  //Checkes in whole tree how often a name appears, if more than once => error
		  Dim count As Integer = 0
		  If OnlySameLevel Then
		    If BS <> nil Then
		      BS = BS.FirstSubStep
		      While BS <> Nil
		        if BS.Name.GIAS = checkingName Then
		          count = count + 1
		        End
		        BS = BS.NextStep
		      Wend
		    End
		  Else
		    If BS <> Nil Then
		      Dim it As BasicIteratorInterface = BS.Iterator
		      While it.HasNext
		        if it.NextItem.Name.GIAS = checkingName Then
		          count = count + 1
		        end
		      Wend
		    End
		  end
		  Return count
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPathValueFromTemplate(path As String) As String
		  Return SettingsClass.GetPathValue(path, PathTemplate.GetPathTemplates(WorkspaceSettings))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPicture(SubFolder As String, PicName As String) As Picture
		  //------------------------------------------------
		  // Returns the image at the given SubFolder with the given
		  // PicName.
		  //------------------------------------------------
		  
		  // cleanup subfolder
		  //TODO: need check it
		  If SubFolder.Len <= 2 Then
		    SubFolder = ""
		  End
		  
		  Dim f As FolderItem = GetWorkingFolderItem
		  If f <> Nil Then
		    If SubFolder <> "" Then
		      Dim path As String = f.NativePath // absolut => native
		      If SubFolder.Left(path.Len) = path Then
		        SubFolder = SubFolder.Right(SubFolder.Len - path.Len)
		      End
		      Dim subDirs(-1) As String = SubFolder.Split(":")
		      Dim  idx As Integer = 0
		      While f <> Nil And idx <= SubDirs.Ubound
		        if subDirs(idx) <> "" Then
		          f=f.Child(subDirs(idx))
		        End
		        idx = idx + 1
		      Wend
		    End
		    
		    If f<>Nil Then
		      // regulare case
		      Dim img As FolderItem=f.Child(PicName)
		      If img <> Nil And img.Exists Then
		        Return Picture.Open(img)
		      End
		      // image not found, remove counter from the image name
		      Dim strList(-1) As String = PicName.Split("_")
		      If UBound(strList) > 0 Then
		        Dim idx As Integer
		        Dim fName As String = strList(0)
		        For idx  = 1 To UBound(strList)-1
		          fName = fName + "_" + strList(idx)
		        Next
		        img=f.Child(fName + ".png")
		        If img <> Nil And img.Exists Then
		          Return Picture.Open(img)
		        End
		      End
		    End
		  End
		  
		  Return Nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReportsFolder() As String
		  If WorkspaceSettings <> Nil Then
		    Return WorkspaceSettings.GetReportFolder
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetScreenshotsFolder() As String
		  If WorkspaceSettings <> Nil Then
		    Return WorkspaceSettings.GetScreenshotsFolder
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSequenceFolder() As String
		  If WorkspaceSettings <> Nil Then
		    Return WorkspaceSettings.GetSequenceFolder
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStringAttributeGroup(AttrGroup As AttributeGroups) As String
		  Dim value As String = ""
		  Select Case AttrGroup
		  Case AttributeGroups.Appearance
		    value =  "Appearance"
		  Case AttributeGroups.Parameters
		    value = "Parameters"
		  Case AttributeGroups.System
		    value = "System"
		  Case AttributeGroups.Settings
		    value = "Settings"
		  Case AttributeGroups.Dynamic
		    value = "Dynamic"
		  End
		  Return value
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStringValue(SearchString as string, Position as integer, Separator as string) As string
		  // get a specific value in a string, values separated by separator, 0 is first Position at string
		  if Position<0 then
		    Position=0
		  end
		  return NthField(SearchString,Separator,Position+1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStringValueD(SearchString as string, Position as integer, Separator as string) As double
		  // get a specific value in a string, values separated by separator, 0 is first Position at string
		  Return Val(GetStringValue(SearchString,Position,Separator))
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetStringValueI(SearchString as string, Position as integer, Separator as string) As Int64
		  // get a specific value in a string, values separated by separator, 0 is first Position at string
		  Return Val(GetStringValue(SearchString,Position,Separator))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSYNCTime() As integer
		  Dim d1 as date = new Date(2016,1,1)
		  
		  Dim d2 as date = new Date
		  
		  return (d2.TotalSeconds-d1.TotalSeconds)/60
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTemplateValueFromPath(path As String) As String
		  Dim result As String = path
		  Dim templates() As PathTemplate = PathTemplate.GetPathTemplates(WorkspaceSettings)
		  Dim possibleItem As PathTemplate = Nil
		  Dim temp As String = ""
		  For Each template As PathTemplate in templates
		    if template <> Nil Then
		      Dim str As String = GetPathValueFromTemplate(template.PathValue.GIAS)
		      If (path.InStr(str) > 0) And (str.Len >= temp.Len) Then
		        temp = str
		        possibleItem = template
		        
		        If possibleItem <> Nil And temp <> "" Then
		          result = possibleItem.Template.GIAS + result.Right(result.Len - temp.Len)
		          Exit For
		        End
		      End
		    End
		  Next
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVersionOfName(ByRef BaseName As String) As Integer
		  Dim NameVersion As Integer = 0
		  Dim VersionRegExp As new RegEx
		  VersionRegExp.SearchPattern = "_\d+$"
		  Dim Match As RegExMatch = VersionRegExp.Search(BaseName)
		  If Match <> Nil Then
		    Dim findName As String = Match.SubExpressionString(Match.SubExpressionCount - 1)
		    BaseName = BaseName.Left(BaseName.Len - findName.Len)
		    Dim version As Integer = Val(findName.ReplaceAll("_", ""))
		    If version > NameVersion Then
		      NameVersion = version
		    End
		  End
		  Return NameVersion
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVersionOfName(BaseName As String, SubName As String) As Integer
		  Dim NameVersion As Integer = 0
		  if BaseName = SubName Then
		    NameVersion = 1
		  Else
		    Dim VersionRegExp As new RegEx
		    VersionRegExp.SearchPattern = BaseName + "_\d*$"
		    Dim Match As RegExMatch = VersionRegExp.Search(SubName)
		    If Match <> Nil Then
		      Dim findName As String = Match.SubExpressionString(Match.SubExpressionCount - 1)
		      Dim version As Integer = Val(findName.Right(findName.Len - BaseName.Len).ReplaceAll("_", "")) + 1
		      If version > NameVersion Then
		        NameVersion = version
		      End
		    End
		    VersionRegExp = Nil
		  End
		  Return NameVersion
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWorkingFolder() As String
		  If WorkspaceSettings <> Nil Then
		    Return WorkspaceSettings.GetWorkingFolder
		  else
		    Return GetAppFolder
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWorkingFolderItem() As FolderItem
		  return GetFolderItemFromPath(GetWorkingFolder)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get_Next_Attribute(searchtext as string, ByRef startPoint as integer) As string
		  Dim startP, endP as integer
		  Dim result as string
		  // go to next start
		  startP=startPoint
		  result=""
		  
		  startP=InStr(startP,searchtext," ")
		  if startP>0 then
		    endP=InStr(startP,searchtext,"=")
		    if endP>0 then
		      endP=InStr(endP+2,searchtext,chr(34))
		      if endP=0 then
		        endP=len(searchtext)
		        result= Mid(searchtext,startP,endP-startP+1)
		        startPoint=0
		      else
		        result= Mid(searchtext,startP,endP-startP+1)
		        startP=endP
		      end
		    else
		      startP=0
		    end
		  else
		    startP=0
		  end
		  
		  return result
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get_Next_Element(ByRef searchtext as string, ByRef startPoint as integer, ByRef result as string) As integer
		  Dim start, endPoint as integer
		  
		  // go to next start
		  start = startPoint
		  start = InStr(start, searchtext, "<")
		  result = ""
		  if start > 0 then
		    // change in order to be able to use </> in scripts
		    //endPoint=InStr(start,searchtext,">")
		    endPoint = InStr(start, searchtext, chr(10))
		    if endPoint = 0 then
		      endPoint = InStr(start, searchtext, chr(13))
		      if endPoint = 0 Then
		        endPoint = InStr(start, searchtext, "/>")
		      End
		    end
		    if endPoint > 0 then
		      result = Mid(searchtext,start,endPoint-start)
		      startPoint = endPoint + 1
		    else
		      startPoint = 0
		    end
		  else
		    startPoint = 0
		  end
		  
		  if InStr(1, result, "</")>0 then
		    return -1 // end of list
		  else
		    if  InStr(1, result, "/>")>0  then
		      return 0 // go on in this
		    else
		      return 1 //   start new list
		    end
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get_TESSA_FolderItem(SubFolder1 as string, SubFolder2 as string, FileName as string, showError as boolean = true) As FolderItem
		  Dim f As FolderItem
		  Dim  ResultOk As Boolean
		  
		  //MsgBox "Open file "+FileName+" in subfolder "+SubFolder
		  
		  ResultOk=false
		  if (SubFolder1="") and (SubFolder2="") then
		    f= GetFolderItem(FileName) //file type defined in File Type Sets Editor
		    if f<>nil then
		      if f.exists then
		        if f.Directory then
		        else
		          ResultOk=true
		        end
		      end
		    end
		  else
		    f= GetWorkingFolderItem //file type defined in File Type Sets Editor
		    if f<>nil then
		      if f.exists then
		        if SubFolder1<>"" then
		          #If TargetMacOS
		            Dim subDirs(-1) As String = SubFolder1.Split(":")
		            Dim  idx As Integer = 0
		            While (f <> Nil) And (idx <= SubDirs.Ubound)
		              f=f.Child(subDirs(idx))
		              idx = idx + 1
		            Wend
		          #ElseIf TargetWin32
		            Dim subDirs(-1) As String = SubFolder1.Split("\")
		            Dim  idx As Integer = 0
		            While (f <> Nil) And (idx <= SubDirs.Ubound)
		              f=f.Child(subDirs(idx))
		              idx = idx + 1
		            Wend
		          #Endif
		        end
		        
		        if SubFolder2<>"" then
		          #If TargetMacOS
		            Dim subDirs(-1) As String = SubFolder2.Split(":")
		            Dim  idx As Integer = 0
		            While (f <> Nil) And (idx <= SubDirs.Ubound)
		              f=f.Child(subDirs(idx))
		              idx = idx + 1
		            Wend
		          #ElseIf TargetWin32
		            Dim subDirs(-1) As String = SubFolder2.Split("\")
		            Dim  idx As Integer = 0
		            While (f <> Nil) And (idx <= SubDirs.Ubound)
		              f=f.Child(subDirs(idx))
		              idx = idx + 1
		            Wend
		          #Endif
		        end
		        
		        if f<>nil then
		          if  f.exists then
		            f=f.Child(FileName)
		            If f <> Nil then
		              if  f.exists then
		                if f.Directory then
		                else
		                  ResultOk=true
		                end
		              end
		            end
		          end
		        end
		      end
		    End
		  end
		  
		  if not(ResultOk) And showError then
		    if SubFolder1="" then
		      MsgBox "The File "+FileName+" could not be opend."
		    else
		      MsgBox "The File "+FileName+" in Folder "+SubFolder1+" could not be opend."
		    end
		  end
		  
		  return f
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Grayscale(col As Color) As double
		  Return (0.299 * col.Red + 0.587 * col.Green + 0.114 * col.Blue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitGlobalConstants()
		  CR=chr(13)
		  NL=chr(10)
		  TAB=chr(9)
		  QM=chr(34)
		  EOL=CR+NL
		  
		  Redim Ascii_Hex_Table(255)
		  for i as integer = 0 to 255
		    Ascii_Hex_Table(i)=0
		  next
		  Ascii_Hex_Table(48)=0
		  Ascii_Hex_Table(49)=1
		  Ascii_Hex_Table(50)=2
		  Ascii_Hex_Table(51)=3
		  Ascii_Hex_Table(52)=4
		  Ascii_Hex_Table(53)=5
		  Ascii_Hex_Table(54)=6
		  Ascii_Hex_Table(55)=7
		  Ascii_Hex_Table(56)=8
		  Ascii_Hex_Table(57)=9
		  Ascii_Hex_Table(65)=10
		  Ascii_Hex_Table(97)=10
		  Ascii_Hex_Table(66)=11
		  Ascii_Hex_Table(98)=11
		  Ascii_Hex_Table(67)=12
		  Ascii_Hex_Table(99)=12
		  Ascii_Hex_Table(68)=13
		  Ascii_Hex_Table(100)=13
		  Ascii_Hex_Table(69)=14
		  Ascii_Hex_Table(101)=14
		  Ascii_Hex_Table(70)=15
		  Ascii_Hex_Table(102)=15
		  
		  DebugInfo = new MemBlockString(nil,1000000,200000)
		  AddDebugTextCR("Initialize Debug Info")
		  WarningInfo = new MemBlockString(nil,1000000,200000)
		  AddWarningTextCR("Initialize Warning Info")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Instr2(byRef Source as string, Start as integer, Search1 as string, Search2 as string) As integer
		  return MinNo0(Source.Instr(Start,Search1),Source.Instr(Start,Search2))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Instr2(byRef Source as string, Start as integer, Search1 as string, Search2 as string, byRef Leng as integer) As integer
		  
		  Dim Min1, Min2 as integer
		  
		  Min1=Source.Instr(Start,Search1)
		  Min2=Source.Instr(Start,Search2)
		  
		  if Min1<=0 then
		    if Min2<=0 then
		      return 0
		    else
		      Leng = Search2.Len
		      return Min2
		    end
		  else
		    if Min2<=0 then
		      Leng = Search1.Len
		      return Min1
		    else
		      if Min1<Min2 then
		        Leng = Search1.Len
		        return Min1
		      else
		        Leng = Search2.Len
		        return Min2
		      end
		    end
		  end
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Instr3(byRef Source as string, Start as integer, Search1 as string, Search2 as string, Search3 as string) As integer
		  Dim i as integer
		  i = MinNo0(Source.Instr(Start,Search1),Source.Instr(Start,Search2))
		  i = MinNo0(i,Source.Instr(Start,Search3))
		  return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InstrMulti(byRef Source as string, Start as integer, byRef Selection as integer, byRef Pos as integer, byRef Leng as integer, Search1 as string, Search2 as string, Search3 as string = "", Search4 as string = "", Search5 as string = "")
		  
		  Dim Min1, Min2, Minx as integer
		  Selection=0
		  Pos=0
		  Leng=0
		  
		  Min1=Source.Instr(Start,Search1)
		  Min2=Source.Instr(Start,Search2)
		  
		  if Min1<=0 then
		    if Min2<=0 then
		      // all 0
		    else
		      Leng = Search2.Len
		      Pos = Min2
		      Selection = 2
		    end
		  else
		    if Min2<=0 then
		      Leng = Search1.Len
		      Pos = Min1
		      Selection = 1
		    else
		      if Min1<Min2 then
		        Leng = Search1.Len
		        Pos = Min1
		        Selection = 1
		      else
		        Leng = Search2.Len
		        Pos = Min2
		        Selection = 2
		      end
		    end
		  end
		  
		  if Search3="" then
		    // no change
		  else
		    Minx=Source.Instr(Start,Search3)
		    if Pos <=0 then
		      if Minx<=0 then
		        Pos = 0
		        Leng = 0
		        Selection = 0
		      else
		        Pos = Minx
		        Leng = Search3.Len
		        Selection = 3
		      end
		    else
		      if Minx<=0 then
		        // no change
		      else
		        if Minx<=Pos then
		          Pos = Minx
		          Leng = Search3.Len
		          Selection = 3
		        else
		          // no change
		        end
		      end
		    end
		  end
		  
		  if Search4="" then
		    // no change
		  else
		    Minx=Source.Instr(Start,Search4)
		    if Pos <=0 then
		      if Minx<=0 then
		        Pos = 0
		        Leng = 0
		        Selection = 0
		      else
		        Pos = Minx
		        Leng = Search4.Len
		        Selection = 4
		      end
		    else
		      if Minx<=0 then
		        // no change
		      else
		        if Minx<=Pos then
		          Pos = Minx
		          Leng = Search4.Len
		          Selection = 4
		        else
		          // no change
		        end
		      end
		    end
		  end
		  
		  
		  if Search5="" then
		    // no change
		  else
		    Minx=Source.Instr(Start,Search5)
		    if Pos <=0 then
		      if Minx<=0 then
		        Pos = 0
		        Leng = 0
		        Selection = 0
		      else
		        Pos = Minx
		        Leng = Search5.Len
		        Selection = 5
		      end
		    else
		      if Minx<=0 then
		        // no change
		      else
		        if Minx<=Pos then
		          Pos = Minx
		          Leng = Search4.Len
		          Selection = 4
		        else
		          // no change
		        end
		      end
		    end
		  end
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstrReverse(source as string, StartPosition as integer, find as string) As integer
		  Dim i as integer = StartPosition
		  if (i>(source.len)) or (i<1) then
		    i=source.len
		  end
		  Dim k as integer = 0
		  while (i>0)
		    if source.Mid(i,find.len)=find then
		      k=i
		      i=-1
		    else
		      i=i-1
		    end
		  wend
		  
		  return k
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Integer2TwoComplement(d as double, tc as integer) As Uint64
		  // I is the number that has to be converted
		  // tc is the number of bytes in the number
		  Dim I as Uint64
		  
		  if d<0 then
		    // number is negative
		    I=-d
		    'Dim S1 as String=Bin(I,tc*8)+" "+str(I)
		    Dim I2 as Int64 = 256^tc-1
		    'Dim S2 as String=Bin(I2,tc*8)+" "+str(I2)
		    I=Bitwise.BitAnd(I,I2)
		    'Dim S3 as String=Bin(I,tc*8)+" "+str(I)
		    I=Bitwise.OnesComplement(I)
		    'Dim S4 as String=Bin(I,tc*8)+" "+str(I)
		    I=I+1
		    'Dim S5 as String=Bin(I,tc*8)+" "+str(I)
		    I=Bitwise.BitAnd(I,I2)
		    'Dim S6 as String=Bin(I,tc*8)+" "+str(I)
		    'S6=S6
		  else
		    // number is positive
		    I=d
		  end
		  return I
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isElementNameAsDouble(CurrentStep As BasicClass, ElementName As String) As Boolean
		  //check for double names, return True if name uses if doesn't use return False
		  If CurrentStep <> Nil Then
		    Dim isHierarchicalLinksSetting As Boolean = CurrentStep.GetHierarchicalLinksSetting
		    If isHierarchicalLinksSetting Then
		      CurrentStep = CurrentStep.UpperStep
		    Else
		      while CurrentStep.UpperStep <> nil
		        CurrentStep = CurrentStep.UpperStep
		      wend
		    End
		    Return getNameRepeatings(CurrentStep, ElementName, isHierarchicalLinksSetting) > 0
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsEmptyFolder(folder As FolderItem) As Boolean
		  If folder <> Nil and folder.Exists Then
		    Dim count As Integer = folder.Count
		    For i As Integer = 1 to count
		      Dim item As FolderItem = folder.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.Directory then
		          Dim empty As Boolean = IsEmptyFolder(item)
		          If not empty Then
		            Return empty
		          End
		        Else
		          if (folder.Item(i).DisplayName.Left(1) <> ".") Then
		            Return false
		          End
		        End
		      End
		    Next
		  End
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub IterateResources(ByRef S as string,  BS as BasicClass)
		  if BS<>nil then
		    if BS IsA ResourceClass then
		      Dim Attr as AttributeClass = BS.GetAttribute("ComLog")
		      if (Attr <>nil) and (Attr.GIAS<>"") then
		        S=S+CR+"ComLog of "+BS.Name.GIAS+": ----------"+CR+Attr.GIAS
		        Attr.SIAS("")
		      end
		    end
		    BS=BS.FirstSubStep
		    while BS<>nil
		      IterateResources(S,BS)
		      BS=BS.NextStep
		    wend
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Limit(Byref Value as integer, LowLimit as integer, HighLimit as integer)
		  // Limits the Value to the minimum LowLimit and to maximum Highlimit
		  
		  if Value>HighLimit then
		    Value=HighLimit
		  else
		    if Value<LowLImit then
		      Value=LowLimit
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarkMenuItemAsChekcedByIndex(menu As MenuItem, index As Integer)
		  If menu <> Nil Then
		    For i As Integer = 0  to menu.Count - 1
		      menu.Item(i).Checked = (i = index)
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MarkMenuItemAsChekcedByTag(menu As MenuItem, tagValue As Variant)
		  If menu <> Nil Then
		    For i As Integer = 0  to menu.Count - 1
		      menu.Item(i).Checked = menu.Item(i).Tag = tagValue
		    Next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MinNo0(Min1 as integer, min2 as integer) As integer
		  // returns the minimum of the 2 values, except for 0 or negative numbers, they are suppressed
		  
		  if Min1<=0 then
		    if Min2<=0 then
		      return 0
		    else
		      return Min2
		    end
		  else
		    if Min2<=0 then
		      return Min1
		    else
		      if Min1<Min2 then
		        return Min1
		      else
		        return Min2
		      end
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenMeasFileForLoad(ByRef FileContent as MemoryBlock, SubFolder as string, FileName as string, showError as boolean = true)
		  // error ID 9
		  
		  Dim ErrorMess as string = ""
		  Dim  ResultOk As Boolean = False
		  
		  If SubFolder <> "" Then
		    FileName = SubFolder + PathSeparator + FileName
		  End
		  
		  Dim f As FolderItem = File_Open(ErrorMess, FileName, "", True)
		  if ErrorMess="" then
		    If CheckFile(f) Then
		      Try
		        Dim t As TextInputStream =TextInputStream.Open(f)
		        If t <> Nil Then
		          Try
		            FileContent = t.ReadAll(Encodings.UTF8)
		          Finally
		            t.Close
		            ResultOk = True
		          End Try
		        Else
		          ErrorMess = "The File " + FileName + " could not be opend.(9.1)"
		        End
		      Catch e as IOException
		        //handle IO Exception
		      End Try
		    ElseIf SubFolder = "" then
		      ErrorMess = "The File "+ FileName +" was not found. (9.2)"
		    Else
		      ErrorMess = "The File " + FileName + " in Folder " + SubFolder + "  not found. (9.3)"
		    end
		  else
		    
		  end
		  
		  If Not ResultOk And showError then
		    MsgBox ErrorMess
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenMeasFileForLoad(f As FolderItem, showError as boolean = true) As String
		  Dim result As String = ""
		  If f <> Nil Then
		    result = OpenMeasFileForLoad(f.NativePath, showError) // absolut => native
		  End
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenMeasFileForLoad(FileName as string, showError as boolean = true) As string
		  return OpenMeasFileForLoad("", FileName, showError)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenMeasFileForLoad(SubFolder as string, FileName as string, showError as boolean = true) As string
		  //error ID 8 
		  
		  Dim ErrorMess as string = ""
		  Dim FileContent as string = ""
		  Dim  ResultOk As Boolean = False
		  
		  If SubFolder <> "" Then
		    FileName = SubFolder + PathSeparator + FileName
		  End
		  
		  Dim f As FolderItem = File_Open(ErrorMess, FileName, "", True)
		  if ErrorMess="" then
		    If CheckFile(f) Then
		      Try
		        Dim t As TextInputStream =TextInputStream.Open(f)
		        If t <> Nil Then
		          Try
		            FileContent = t.ReadAll(Encodings.UTF8)
		          Finally
		            t.Close
		            ResultOk = True
		            FileContent=FileContent.ReplaceAll("AXTDL","TESSA") // remove this line later again
		          End Try
		        Else
		          ErrorMess = "The File " + FileName + " could not be opend. (8.1)"
		        End
		      Catch e as IOException
		        //handle IO Exception
		      End Try
		    ElseIf SubFolder = "" then
		      ErrorMess = "The File "+ FileName +" was not found. (8.2)"
		    Else
		      ErrorMess = "The File " + FileName + " in Folder " + SubFolder + "  not found. (8.3)"
		    end
		  else
		  end
		  
		  If Not ResultOk And showError then
		    MsgBox ErrorMess
		  End
		  Return FileContent
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenMeasFileForSave(SourceData As String, filePath As FolderItem, append As Boolean = False) As boolean
		  If filePath <> Nil Then
		    Try
		      Dim t as TextOutputStream = Nil
		      If append  And filePath.Exists Then
		        t = TextOutputStream.Append(filePath)
		      Else
		        t= TextOutputStream.Create(filePath)
		      End
		      Try
		        t.Write(ConvertEncoding(SourceData, encodings.Utf8))
		      Finally
		        t.Close
		        t = nil
		        Return True
		      End Try
		    Catch e As IOException
		      //handle error
		    End Try
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OpenMeasFileForSave(SourceData As String, filePath As String) As boolean
		  If filePath <> "" Then
		    Return OpenMeasFileForSave(SourceData, GetFolderItemFromPath(filePath))
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parse_Element(SearchText as string) As BasicClass
		  Return BasicClassFactory.getInstance.ParseElement(SearchText)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse_XML(UpperStep as BasicClass, ByRef XML_Text as string, ByRef XML_Text_Pointer as integer, SP as ProgressWindow = nil)
		  // this method parses a XML file starting from at the position XML_Text_Pointer and adds it to the end of the
		  // calling object instance'  element list, it ends when the end of the object list </ or the end of the file is reached
		  
		  Dim XML_Element as string
		  Dim NewMeasStep, LastStep as BasicClass
		  Dim LevelShift as integer
		  
		  if XML_Text="" then
		    //ConError.Text="No XML content to parse"
		  else
		    // define where to add the next element: Either as first element of the
		    // upper element or linked to the last one in the row
		    // LevelShift definies if it goes up (-1) or down (1) in the hierarchy
		    LevelShift=0
		    LastStep=UpperStep.FirstSubStep
		    if LastStep<>nil then
		      While LastStep.NextStep<>nil
		        LastStep=LastStep.NextStep
		      wend
		    end
		    
		    while (XML_Text_Pointer>0) and (LevelShift>=0)
		      // get next element and parse it
		      LevelShift=Get_Next_Element(XML_Text,XML_Text_Pointer,XML_Element)
		      NewMeasStep= Parse_Element(XML_Element)
		      
		      If NewMeasStep=Nil then
		        // no new element has been produced
		      else
		        // a new element has been produced and has to be included into the list of elements
		        // put the new object into the list
		        if LastStep=nil then
		          UpperStep.FirstSubStep=NewMeasStep
		          LastStep=NewMeasStep
		        else
		          LastStep.NextStep=NewMeasStep
		          NewMeasStep.PreviousStep=LastStep
		          LastStep=NewMeasStep
		        end
		        NewMeasStep.UpperStep=UpperStep
		        
		        // if there are elements included ( LevelShift>1) then go deeper
		        if LevelShift=1 then
		          Parse_XML(NewMeasStep,XML_Text,XML_Text_Pointer, SP)
		        end
		      end
		      if SP<>nil then
		        Dim d as double = 100*XML_Text_Pointer/XML_Text.len
		        if NewMeasStep=nil then
		          SP.SetProgress(100*XML_Text_Pointer/XML_Text.len, "Parsing ("+str(d)+" %) of XML")
		          SP.Refresh
		        else
		          SP.SetProgress(d, "Parsing ("+str(d)+" %) XML of "+NewMeasStep.Name.GOAS)
		          SP.Refresh
		        end
		      end
		    wend
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Parse_XML(ByRef XML_Text as string, ByRef XML_Text_Pointer as integer, SP as ProgressWindow = nil) As BasicClass
		  Dim BS As new BasicClass("")
		  Parse_XML(BS, XML_Text, XML_Text_Pointer,SP )
		  BS = BS.FirstSubStep
		  If BS <> Nil Then
		    BS.UpperStep = Nil
		    BS.PreviousStep = Nil
		    BS.NextStep = Nil
		  End
		  Return BS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Peel(SD as string, StartSgn as string, EndSgn as string) As string
		  Dim p1, p2 as integer
		  
		  p1=SD.InStr(1,StartSgn)+1
		  p2=SD.InStr(p1,EndSgn)
		  SD= SD.Mid(p1,p2-p1)
		  
		  return SD
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrepStringForXMLSaving(byRef Value as string)
		  // replaces all pre-occupied key letters (in xml file) by numbered ones for saving into a attribute value a="..."
		  if Value<>"" then
		    Value=Value.ReplaceAll("<","&#060")
		    Value=Value.ReplaceAll("/","&#047")
		    Value=Value.ReplaceAll(">","&#062")
		    Value=Value.ReplaceAll("=","&#061")
		    Value=Value.ReplaceAll(chr(13),"&#013")
		    Value=Value.ReplaceAll(chr(10),"&#010")
		    Value=Value.ReplaceAll(chr(9),"&#009")
		    Value=Value.ReplaceAll(chr(34),"&#034")
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub PrepStringFromXMLLoading(byRef Value as string)
		  // replaces all &#... letters in a loaded xml file with the real characters
		  if Value<>"" then
		    // old code, saved for testing
		    // https://git.vakoms.com/main/tessa/issues/63
		    'Value=Value.ReplaceAll("&quot;","""")
		    'Value=Value.ReplaceAll("&#074","<")
		    'Value=Value.ReplaceAll("&#057","/")
		    'Value=Value.ReplaceAll("&#076",">")
		    'Value=Value.ReplaceAll("&#060","<")
		    'Value=Value.ReplaceAll("&#047","/")
		    'Value=Value.ReplaceAll("&#062",">")
		    'Value=Value.ReplaceAll("&#061","=")
		    
		    // new
		    Value = Value.ReplaceAll("&quot;", """")
		    Value = Value.ReplaceAll("&#060", "<")
		    Value = Value.ReplaceAll("&#062", ">")
		    Value = Value.ReplaceAll("&#047", "/")
		    Value = Value.ReplaceAll("&#061", "=")
		    
		    Value = Value.ReplaceAll("&#013",chr(13))
		    Value = Value.ReplaceAll("&#010",chr(10))
		    Value = Value.ReplaceAll("&#009",chr(9))
		    Value = Value.ReplaceAll("&#034",chr(34))
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReplaceAllCRNL(S as string) As string
		  S=ReplaceAll(S,CR+NL,".CRNL.")
		  S=ReplaceAll(S,CR,".CR.")
		  S=ReplaceAll(S,NL,".NL.")
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveScreenShot(pic As Picture, picName As String)
		  If picName = "" Then
		    picName = "Screenshot"
		  End
		  If pic <> Nil Then
		    Dim f As FolderItem = GetFolderItemFromPath(GetScreenshotsFolder)
		    If CheckFolder(f) Then
		      f = f.Child("DebugPics")
		      If f <> Nil Then
		        If Not f.Exists Then
		          f.CreateAsFolder
		        End
		        Dim CurrentDate As new Date
		        f = f.Child(picName + "-" + Format(CurrentDate.Hour, "0#\.") + Format(CurrentDate.Minute, "0#\.") + Format(CurrentDate.Second, "0#") + ".png")
		        If f <> Nil Then
		          pic.Save(f, Picture.SaveAsPNG)
		        End
		      End
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScalePicture(Pic as Picture, ScaleWith as Double, ScaleHeigth as Double) As Picture
		  Dim picReturn as Picture = Nil
		  If Pic <> Nil Then
		    picReturn = new Picture(Pic.Width * ScaleWith , Pic.Height *ScaleHeigth  , 32 )
		    picReturn.graphics.DrawPicture Pic, 0,0,picReturn.width,picReturn.height, 0,0,Pic.width,Pic.height
		  End
		  Return picReturn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScalePicture(Pic as Picture, Width as Integer, Height as Integer, Proportional as Boolean) As Picture
		  Dim picReturn as Picture = Nil
		  If Pic <> Nil Then
		    If Proportional = true then
		      // scale proportional
		      Dim dScale as Double = min(Width/Pic.Width, Height/Pic.Height)
		      picReturn = ScalePicture(Pic,dScale,dScale)
		    else
		      // scale as defined by width and heigth
		      picReturn = ScalePicture(Pic, Width/Pic.Width, Height/Pic.Height)
		    end
		  End
		  return picReturn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ScalePicture(Pic as Picture, Width as Integer, Height as Integer, Proportional_Mode as integer, Scale as double) As Picture
		  Dim picReturn as Picture = Nil
		  If Pic <> Nil Then
		    Select Case Proportional_Mode
		    case 0 // plain, no change in size
		      picReturn = Pic
		    case 1 // fix scaling
		      picReturn = ScalePicture(Pic, Scale, Scale)
		    case 2 // scale proportional to screen so all picture is visible
		      picReturn = ScalePicture(Pic,Width,Height, true)
		    case 3 // fill screen completly without proportionality
		      Dim dScale As Double = max(Width/Pic.Width, Height/Pic.Height)
		      picReturn = ScalePicture(Pic,dScale,dScale)
		    case 4 // fill screen proportionally (default)
		      picReturn = ScalePicture(Pic,Width,Height, false)
		    end
		  End
		  return picReturn
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetAppFolder(value As String)
		  Dim f As FolderItem = GetFolderItem(value)
		  If CheckFolder(f) Then
		    mAppFolder = value
		  Else
		    mAppFolder = ""
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetByte(Byref Value as integer, SetValue as integer, Mask as string)
		  // set a specific bit inside a byte
		  // give mask as integer, byte, hex (&h2ab3) or bit (&b1001)
		  
		  Value=Bitwise.BitAnd( Value ,Val(Mask))
		  
		  Value=Bitwise.BitOr(Value, SetValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetByte(Byref Value as integer, SetValue as string, Mask as string)
		  // set a specific bit inside a byte
		  // give mask as integer, byte, hex (&h2ab3) or bit (&b1001)
		  
		  Value=Bitwise.BitAnd( Value ,Val(Mask))
		  
		  Value=Bitwise.BitOr(Value, Val(SetValue))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SizeOfFolderOrFile(f As FolderItem) As UInt64
		  Dim size As UInt64 = 0
		  If f <> Nil Then
		    If f.Directory Then
		      Dim count As Integer = f.Count
		      For i As Integer = 1 to count
		        size = size + SizeOfFolderOrFile(f.Item(i))
		      Next
		    Else
		      size = size + f.Length
		    End
		  End
		  Return size
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SNMS(NMS as BasicClass, StepName as string, StepRunMode as integer, searchtext as string) As BasicClass
		  NMS.BasicTypeName = StepName
		  
		  if NMS IsA StepClass then
		    StepClass(NMS).RunMode=StepRunMode
		  end
		  
		  NMS.Parse_Header(searchtext)
		  
		  NMS.InitAfterLoad
		  
		  return NMS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StartActTimer()
		  TESSAGlobalFunctions.ActStartTime=Microseconds/1000
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StrBoolean(Value as string) As boolean
		  // transfers a string into a boolean value
		  Select case Value
		  case is="on"
		    return true
		  case is="off"
		    return false
		  case is="true"
		    return true
		  case is="false"
		    return false
		  else
		    return val(Value)>0
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StrHex(InputValue As String, OutputMode as integer, NumPos as integer, index as integer = - 1) As string
		  // converts hex numbers in forms aABC, hff11, ff:11 into  aABC, hff11, ff:11 depenting on mode
		  // OutputMode 0>=: hff11, 1 => ff:11, 2 => aABC, 3 => 11 22 33 44
		  
		  Dim A as string = ""
		  Dim i as integer = 1
		  Dim NumVals as integer = 0
		  Dim Vals(100) as Int64
		  
		  if InputValue="" then
		    Vals(0)=0
		    i=1
		  else
		    if (InputValue.Instr(1,":")>0) then
		      i=1
		      A=NthField(InputValue,":",i)
		      while (A<>"") and (i<100)
		        Vals(i-1)=ValHex(A)
		        i=i+1
		        A=NthField(InputValue,":",i)
		      wend
		      NumVals=i-1
		    else
		      if InputValue.Mid(1,1)="h" then
		        NumVals= (InputValue.Len-1)/2
		        for i=1 to NumVals
		          Vals(i-1)=Valhex(InputValue.Mid(i*2,2))
		        next
		      else
		        if InputValue.Mid(1,1)="a" then
		          NumVals = InputValue.Len-1
		          for i=1 to NumVals
		            Vals(i-1)=asc(InputValue.Mid(i+1,1))
		          next
		        else
		          if InputValue.Instr(1," ")>0 then
		            i=1
		            A=NthField(InputValue," ",i)
		            while (A<>"") and (i<100)
		              Vals(i-1)=Val(A)
		              i=i+1
		              A=NthField(InputValue," ",i)
		            wend
		            NumVals=i-1
		          else
		            Vals(0)=Val(A)
		            NumVals=1
		          end
		        end
		      end
		    end
		  end
		  
		  Select case OutputMode
		  case 0 // ff:ee:11:22
		    InputValue=""
		    for i=0 to (NumVals+1.5)/2
		      InputValue=InputValue+StrHex(16*Vals(i)+Vals(i+1),2)+":"
		    next
		    InputValue=InputValue.Mid(1,InputValue.Len-1)
		  case 1 // hffee1122
		    InputValue=""
		    for i=0 to (NumVals+1.5)/2
		      InputValue=InputValue+StrHex(16*Vals(i)+Vals(i+1),2)+":"
		    next
		    InputValue=InputValue.Mid(1,InputValue.Len-1)
		  case 2 // aABC
		    InputValue=""
		    for i=0 to NumVals-1
		      InputValue=InputValue+chr(Vals(i))
		    next
		  case 3 // 11 22 33
		    Select case NumPos
		    case 0,1,2// 11 22 33
		      InputValue=""
		      for i=0 to NumVals-1
		        InputValue=InputValue+str(Vals(i))+" "
		      next
		      InputValue=InputValue.Mid(1,InputValue.Len-1)
		    case 4// 1122 3344
		      InputValue=""
		      for i=0 to NumVals/2-1
		        InputValue=InputValue+str(256*Vals(i)+Vals(i+1))+" "
		      next
		      InputValue=InputValue.Mid(1,InputValue.Len-1)
		    end
		  case 4// h00,h11,h22.... used in PIIOX write EEPROM
		    InputValue=""
		    for i=0 to NumVals-1
		      InputValue=InputValue+",h"+StrHex(Vals(i),2)
		    next
		  end
		  
		  return InputValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StrHex(V as UInt64, NumDigits as integer = -1, Mode as integer = 0) As string
		  // transforms a integer into the hex notation with a fixed number of digits
		  // mode defines if there will be a space or a column every byte for better readability
		  // 0 = no addings
		  // 1 = add spaces
		  // 2 = add ":"
		  // 3 = add ",h"  => f1,ha0,h11
		  // 4 = add " h" => f1 ha0 h11
		  
		  Dim S as string
		  Dim M as Uint64
		  Dim n as integer
		  
		  S=""
		  
		  if NumDigits=-1 then
		    if V<256 then
		      NumDigits=2
		    elseif V<65536 then
		      NumDigits=4
		    elseif V<=16777215 then
		      NumDigits=6
		    elseif V<=4294967295 then
		      NumDigits=8
		    elseif V<=281474976710655 then
		      NumDigits=12
		    else
		      NumDigits=16
		    end
		  end
		  
		  for n=1 to NumDigits
		    M=V mod 16
		    if M<0 then M=-M
		    Select case M
		    case 0 to 9
		      S=str(M)+S
		    case 10
		      S="a"+S
		    case 11
		      S="b"+S
		    case 12
		      S="c"+S
		    case 13
		      S="d"+S
		    case 14
		      S="e"+S
		    case 15
		      S="f"+S
		    case 16
		      S="0"+S
		    else
		      S="*"+S
		    end
		    V=V/16
		    
		    if n<>NumDigits then
		      Select case Mode
		      case 1
		        if (n mod 2) = 0 then
		          S=" "+S
		        end
		      case 2
		        if (n mod 2) = 0 then
		          S=":"+S
		        end
		      case 3
		        if (n mod 2) = 0 then
		          S=",h"+S
		        end
		      case 4
		        if (n mod 2) = 0 then
		          S=" h"+S
		        end
		      end
		    end
		    
		  next
		  
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringIsNumber(S as string) As boolean
		  // gives back true if the given string is a number
		  
		  Dim i as integer = Asc(S)
		  return (i>47) and (i<58)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StrInt(Value as UInt64, L as integer) As string
		  // returns a integer value as a string adds trailing zeros "0" if needed to fill the whole length
		  
		  Dim S as string = str(Value)
		  
		  while S.Len<L
		    S="0"+S
		  wend
		  
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SwapElements(B1 as BasicClass, B2 as BasicClass)
		  Dim B3 as BasicCLass = new BasicClass("")
		  
		  B3.UpperStep = B1.Upperstep
		  B3.NextStep = B1.NextStep
		  B3.PreviousStep=B1.PreviousStep
		  
		  B1.UpperStep = B2.Upperstep
		  B1.NextStep = B2.NextStep
		  B1.PreviousStep=B2.PreviousStep
		  
		  B2.UpperStep = B3.Upperstep
		  B2.NextStep = B3.NextStep
		  B2.PreviousStep=B3.PreviousStep
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TakeScreenShot(win As Window) As Picture
		  'Dim pic As Picture = Nil
		  'If w <> Nil Then
		  'w = w.TrueWindow
		  'If w <> Nil Then
		  'pic = ScreenshotRectMBS(w.Left, w.Top, w.Width, w.Height)
		  'End
		  'End
		  'Return pic
		  '
		  Dim pic As Picture = Nil
		  If win <> Nil Then
		    win = win.TrueWindow
		    If win <> Nil Then
		      Dim x,y,w,h as Integer
		      Dim scale as Double = win.ScaleFactor
		      #If TargetMacOS
		        scale = 1
		      #Endif
		      x = win.Left * scale
		      y = win.Top * scale
		      w = win.Width * scale
		      h = win.Height * scale
		      pic = ScreenshotRectMBS(x, y, w, h)
		    End
		  End
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrimString(S as string, LF_Trim as boolean = true, CR_Trim as boolean = true, Space_Trim as boolean = true, Tab_Trim as boolean = true) As string
		  
		  while (LF_Trim and (Left(S,1)=chr(10))) or (CR_Trim and (Left(S,1)=chr(13))) or (Space_Trim and (Left(S,1)=" ")) or (TAB_Trim and (Left(S,1)=chr(9)))
		    S=Right(S,len(S)-1)
		  wend
		  
		  while (LF_Trim and (Right(S,1)=chr(10))) or (CR_Trim and (Right(S,1)=chr(13))) or (Space_Trim and (Right(S,1)=" ")) or (TAB_Trim and (Right(S,1)=chr(9)))
		    S=Left(S,len(S)-1)
		  wend
		  
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TrimString(S as string, TrimChar as string) As string
		  // remove trim string on left side
		  while S.Mid(1,TrimChar.Len)=TrimChar
		    S=S.Mid(TrimChar.Len+1,S.Len-TrimChar.Len)
		  wend
		  // remove trim string on right side
		  while S.Mid(S.Len-TrimChar.Len+1,TrimChar.Len)=TrimChar
		    S=S.Mid(1,S.Len-TrimChar.Len)
		  wend
		  
		  return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TwoComplement2Integer(I as Int64, tc as integer) As double
		  // I is the number that has to be converted
		  // tc is the number of bytes in the number
		  Dim R as double = I
		  
		  if I>=(256^tc)/2 then
		    // number is negative
		    'Dim S1 as String=Bin(I,tc*8)+" "+str(I)
		    Dim I2 as Int64 = 256^tc-1
		    'Dim S2 as String=Bin(I2,tc*8)+" "+str(I2)
		    I=Bitwise.BitAnd(I,I2)
		    'Dim S3 as String=Bin(I,tc*8)+" "+str(I)
		    I=I-1
		    'Dim S4 as String=Bin(I,tc*8)+" "+str(I)
		    I=Bitwise.OnesComplement(I)
		    'Dim S5 as String=Bin(I,tc*8)+" "+str(I)
		    I=Bitwise.BitAnd(I,I2)
		    'Dim S6 as String=Bin(I,tc*8)+" "+str(I)
		    R=I
		    R=-R
		  else
		    // number is positive
		  end
		  return R
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValBin(S as string, Reverse as boolean = false) As Int64
		  // converts a binary string "1001101" into an Int64
		  // if revert is true it starts from the end (LSB first) otherwise at the front (MSB first)
		  
		  Dim n,CurrAsc as integer
		  Dim Result as Int64 = 0
		  
		  if len(S)>0 then
		    if Reverse then
		      for n=S.Len downto 1
		        CurrAsc=Asc(S.Mid(n,1))
		        Select case CurrAsc
		        case 48
		          Result=Result*2
		        case 49
		          Result=Result*2+1
		        else
		        end
		      next
		    else
		      for n=1 to S.Len
		        CurrAsc=Asc(S.Mid(n,1))
		        Select case CurrAsc
		        case 48
		          Result=Result*2
		        case 49
		          Result=Result*2+1
		        else
		        end
		      next
		    end
		  end
		  
		  return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValHex(S as string) As Int64
		  // interprets the string as a hex number and converts it into a Int64
		  // MSB first (left)
		  // it will ignore all other characters like ":", spaces or "h", "0x",  within the string S
		  
		  Dim n as integer
		  Dim CurrAsc as integer
		  Dim Result as Int64 = 0
		  
		  if len(S)>0 then
		    
		    for n=1 to S.len
		      CurrAsc = Asc(S.Mid(n,1))
		      if (Ascii_Hex_Table(CurrAsc)>0) or (CurrAsc=48) then
		        Result=(Result*16)+Ascii_Hex_Table(CurrAsc)
		      end
		    next
		  end
		  
		  return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValHexByteInverse(S as string) As Int64
		  Dim n as integer
		  Dim i as Int64 = 0
		  DIm DS as string = ""
		  if S.Len mod 2 >0 then
		    S="0"+S
		  end
		  for n=0 to S.len/2-1
		    DS=S.Mid(n*2+1,2)+DS
		  next
		  i=ValHex(DS)
		  
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WaitMicroSecs(WaitingTime as double)
		  Dim StopTime as double = Microseconds+WaitingTime
		  Dim i as Int64 = 10000000
		  while (Microseconds<StopTime ) and (i>0)
		    i=i-1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WaitSecs(WaitingTime as double)
		  Dim StartTime,ActTime as double
		  
		  StartTime=GetActTime_sec
		  ActTime=GetActTime_sec-StartTime
		  while (ActTime>0 ) and (ActTime<WaitingTime)
		    ActTime=GetActTime_sec-StartTime
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WaitTicks(vNumTicks as integer)
		  Dim start as integer = Ticks+vNumTicks
		  Dim i as integer = 0
		  while (Ticks<start) and (i<1000000)
		    i=i+1
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WorkspaceSettings() As SettingsClass
		  Return MainSettings.Instance.WorkspaceSettings
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected ActStartTime As double
	#tag EndProperty

	#tag Property, Flags = &h0
		ActualTestcasePath As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Ascii_Hex_Table() As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		CR As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DebugInfo As MemBlockString = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EOL As string
	#tag EndProperty

	#tag Property, Flags = &h0
		GlobalDebugField As TextArea = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Global_SYNC_ID As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Global_SYNC_Time As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			inWIndo
		#tag EndNote
		Private mAppFolder As string
	#tag EndProperty

	#tag Property, Flags = &h0
		NL As string
	#tag EndProperty

	#tag Property, Flags = &h0
		QM As string
	#tag EndProperty

	#tag Property, Flags = &h0
		SAMReport As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		SumDiffTime As Double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		TAB As string
	#tag EndProperty

	#tag Property, Flags = &h0
		TESSA_DarkMode As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private WarningInfo As MemBlockString = nil
	#tag EndProperty


	#tag Constant, Name = ArrayMode_Dynamic, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ArrayMode_Fixed, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AT_Boolean, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AT_Buffer, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AT_DateTime, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AT_Double, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AT_Enum, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AT_Integer, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = AT_String, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DebugDirect, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorCodeEnum, Type = String, Dynamic = False, Default = \"1 Pass Off NotDone InProgress AcceptedFail Skipped Fail", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorCode_AcceptedFail, Type = Double, Dynamic = False, Default = \"4", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorCode_Fail, Type = Double, Dynamic = False, Default = \"6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorCode_InProgress, Type = Double, Dynamic = False, Default = \"3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorCode_NotDone, Type = Double, Dynamic = False, Default = \"2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorCode_Off, Type = Double, Dynamic = False, Default = \"1", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorCode_Pass, Type = Double, Dynamic = False, Default = \"0", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ErrorCode_Skipped, Type = Double, Dynamic = False, Default = \"5", Scope = Public
	#tag EndConstant

	#tag Constant, Name = ObjectRawData, Type = String, Dynamic = False, Default = \"Object", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PathSeparator, Type = String, Dynamic = False, Default = \"", Scope = Public, Attributes = \""
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \":"
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"\\"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"/"
	#tag EndConstant

	#tag Constant, Name = pi, Type = Double, Dynamic = False, Default = \"3.1415926535897932384626433832795", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SYNC_Feature, Type = Boolean, Dynamic = False, Default = \"false", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TestComp, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant

	#tag Constant, Name = TFSModeEnum, Type = String, Dynamic = False, Default = \"1 CheckIn CheckOut Add Get", Scope = Public
	#tag EndConstant


	#tag Enum, Name = AttributeGroups, Flags = &h0
		System = 0
		  Settings
		  Appearance
		  Parameters
		  Dynamic
		Collective
	#tag EndEnum

	#tag Enum, Name = RunSequenceModeEnum, Flags = &h0
		Normal = 0
		  StepByStep
		ElementByElement
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActualTestcasePath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CR"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EOL"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Global_SYNC_ID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Global_SYNC_Time"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NL"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="QM"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SAMReport"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SumDiffTime"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Double"
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
			Name="TAB"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="TESSA_DarkMode"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
