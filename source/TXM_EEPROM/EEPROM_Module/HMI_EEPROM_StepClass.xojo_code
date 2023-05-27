#tag Class
Protected Class HMI_EEPROM_StepClass
Inherits ReportStepClass
Implements ElementCall,EEPROM_Offset,UserFunctions
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  Select case ChangedAttribute
		  case is=EEPROMSize
		    Resize(EEPROMSize.GIAI)
		    CanvasUpdate
		  case is=DisplayFormat
		    EEPROM.Format = DisplayFormat.GIAI
		    CanvasUpdate
		  end
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CanvasRect() As REALbasic.Rect
		  // Part of the HMICanvasInterface interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CanvasUpdate()
		  mUIUpdater.UpdateCanvas(0)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  // Part of the HMICanvasInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CompareMaster() As boolean
		  // compares the content of a MasterEEPROM to the current EEPROM according the ReceiveMode rules set
		  // first test the 2 sizes
		  Dim EEPROM_ok as boolean = true
		  Dim M_BS as HMI_EEPROM_StepClass = nil
		  Dim M_EEPROM as EEPROM_Class = nil
		  Dim BS as BasicClass = nil
		  if MasterEEPROM.Link<>nil then
		    BS=MasterEEPROM.Link.MyStep
		    if BS IsA HMI_EEPROM_StepClass then
		      M_BS=HMI_EEPROM_StepClass(BS)
		      M_EEPROM = M_BS.EEPROM
		    end
		  end
		  
		  if M_EEPROM=nil then
		    // error no master eeprom found
		    EEPROM_ok=false
		    
		  elseif M_EEPROM.Size<>EEPROM.Size then
		    // error the eeproms do not have the same size
		    EEPROM_ok=false
		    
		  else
		    Dim i as integer
		    
		    Select case ReceiveMode.GIAI
		    case 0 //all
		      for i=0 to EEPROM.Size
		        if EEPROM.EP(i).BY<>M_EEPROM.EP(i).BY then EEPROM_ok=false
		      next
		      'SetMemoryOUT
		      'return Me.MemoryOut.GIAS=Me.MasterEEPROM.GIAS
		    case 1 //changed_cells
		      Dim IsIncluded as boolean = false
		      i=0 
		      IsIncluded=false
		      while (i<=EEPROM.Size) and not(IsIncluded)
		        BS=M_BS.FirstSubStep
		        while (BS<>nil) and not(IsIncluded) and (i<EEPROM.Size)
		          SetNextAddress_CheckContent(i,true,BS,IsIncluded)
		          BS=BS.NextStep
		        wend
		        if IsIncluded then
		          if EEPROM.EP(i).BY<>M_EEPROM.EP(i).BY then EEPROM_ok=false
		        end
		        i=i+1
		      wend
		    case 2 //cell_not_FF
		      for i=0 to EEPROM.Size
		        if M_EEPROM.EP(i).BY<>255 then
		          if EEPROM.EP(i).BY<>M_EEPROM.EP(i).BY then EEPROM_ok=false
		        end
		      next
		    case 4 //cell_not_0
		      for i=0 to EEPROM.Size
		        if M_EEPROM.EP(i).BY<>0 then
		          if EEPROM.EP(i).BY<>M_EEPROM.EP(i).BY then EEPROM_ok=false
		        end
		      next
		    case 5 //From_To
		      for i=0 to EEPROM.Size
		        if EEPROM.EP(i).BY<>M_EEPROM.EP(i).BY then EEPROM_ok=false
		      next
		    end
		  end
		  
		  
		  return EEPROM_ok
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor(ConfigText)
		  
		  EEPROM=new EEPROM_Class
		  
		  EEPROM_Folder=IAPath("EEPROM_Folder","",false)
		  DoLoad=IAB("Load",false,false)
		  DoLoadName=IAPath("DoLoadName","",false)
		  DoSave=IAB("Save",false,false)
		  DoSaveName=IAPath("DoSaveName","",false)
		  DoReceive=IAB("Receive",false,false)
		  ReceiveMode=IAE("ReceiveMode","0 all changed_cells cell_not_FF cell_not_0 From_To")
		  ReceiveFrom=IAI("ReceiveFrom",0)
		  ReceiveTo=IAI("ReceiveTo",0)
		  
		  DoSend=IAB("Send",false,false)
		  SendMode=IAE("SendMode","0 all changed_cells cell_not_FF cell_not_0 From_To")
		  SendFrom=IAI("SendFrom",0)
		  SendTo=IAI("SendTo",0)
		  ComResource=IAS("ComResource","")
		  ComResource.ReadOnly=true
		  
		  EreaseAtStart=IAB("EreaseAtStart",false,false)
		  CompareToMaster=IAB("CompareToMaster",false,false)
		  MasterEEPROM=IAS("MasterEEPROM","",false)
		  
		  MemoryIN=IAS("MemoryIn","",false)
		  MemoryOUT=IAS("MemoryOut","",false)
		  GlobalOffset=IAI("GlobalOffset",0)
		  EEPROMSize=IAI32("EEPROMSize",256)
		  Cell_StartupValue=IAI("Cell_StartupValue",0,false)
		  DisplayFormat=IAE("DisplayFormat","0 DEF HEX CHAR NUM",false)
		  DoRandomTest=IAB("DoRandomTest",false,false)
		  
		  WaitTime.SIAI(10000)
		  
		  MemoryIN.NoSave=true
		  MemoryOUT.NoSave=true
		  
		  AddUserFunction("save", DoSave)
		  AddUserFunction("load", DoLoad)
		  AddUserFunction("send", DoSend, "send", 0,UF_RunMode_OP_Loop,true)
		  AddUserFunction("receive", DoReceive, "receive", 0,UF_RunMode_OP_Loop,true)
		  AddUserFunction("get", MemoryOut)
		  AddUserFunction("set", MemoryIn)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return new HMI_EEPROM_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Poll(FunctionName as string, Parameter as string) As Integer
		  #Pragma Unused Parameter
		  // Teil des Interfaces von ElementCall
		  Dim RV as integer = 0
		  
		  Select case FunctionName
		  case Is="Save"
		    RV=2
		  case Is="Load"
		    RV=2
		  case Is="Receive"
		    RV=Step_Poll_Receive
		  case Is="Send"
		    RV=Step_Poll_Send
		  end
		  
		  Return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Run(FunctionName as string, Parameter as string) As Boolean
		  // Teil des Interfaces von ElementCall
		  Dim RV as boolean = false
		  
		  Select case FunctionName
		  case Is="Save"
		    Me.SaveEEPROM(Parameter)
		    RV=true
		  case Is="Load"
		    Me.LoadEEPROM(Parameter)
		    RV=true
		  case Is="Receive"
		    RV=Step_Run_Receive
		  case Is="Send"
		    RV=Step_Run_Send
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FunctionCall_Start(FunctionName as string) As boolean
		  // Teil des Interfaces von ElementCall
		  
		  Select case FunctionName
		  case Is="Save"
		  case Is="Load"
		  case Is="receive"
		    if ComPort<>nil then ComPort.Reset
		    Me.SendState=0
		  case Is="send"
		    if ComPort<>nil then ComPort.Reset
		    Me.SendState=0
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetConnection() As string
		  if (ComPort<>nil) then
		    return ComPort.GetConnection
		  else
		    return "no connection"
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDebugInfo() As string
		  if Me.RelatedResource<>nil then
		    Return RelatedResource.GetDebugInfo
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFrom() As integer
		  // Part of the EEPROM_Offset interface.
		  
		  return GlobalOffset.GIAI
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  // Part of the UserFunctions interface.
		  
		  return WaitTime.GIAI
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalInit()
		  'AddDebugTextCR("<HMI_EEPROM.InternalInit>")
		  Resize(EEPROMSize.GIAI, true)
		  
		  if Me.DoLoad.GIAB then
		    if Me.DoLoadName.GIAS<>"" then
		      Me.LoadEEPROM("")
		    end
		  end
		  
		  if ComPort=nil then
		    //find communication element
		    Dim BS as BasicClass = FirstSubStep
		    while (BS<>nil) and not(BS IsA EEPROM_Communication) 
		      BS=BS.NextStep
		    wend
		    
		    if (BS<>nil) and (BS IsA EEPROM_Communication) then
		      ComPort=EEPROM_Communication(BS)
		      ComResource.SIAS(BS.Name.GIAS)
		    end
		  end
		  
		  'AddDebugTextCR("</HMI_EEPROM.InternalInit>")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadEEPROM(FolderPath as string)
		  Dim f As FolderItem
		  Dim t As TextInputStream
		  
		  
		  Dim EEPROM_Content as string
		  Me.MemoryIn.SIAS("")
		  If FolderPath="" then
		    FolderPath=DoLoadName.GIAS
		  End 
		  
		  if File_Load(EEPROM_Content,FolderPath,EEPROM_Folder.GIAS) then
		    Me.MemoryIN.SIAS(EEPROM_Content)
		    EEPROM.Fill_Line(Me.MemoryIN.GIAS)
		    Me.Loaded=true
		    EEPROMSize.SIAI(EEPROM.Size)
		  else
		    Me.MemoryIN.SIAS(EEPROM_Content)
		    Me.Loaded=false
		  end
		  
		  Set_All_EEPROMs_Formats
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // Part of the UserFunctions interface.
		  
		  
		  Select case AttributeLink
		  case is=DoReceive
		    return Step_Poll_Receive
		  case is=DoSend
		    return Step_Poll_Send
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Receive_Poll() As integer
		  Dim RV as integer=0
		  Dim S, nS as string
		  
		  
		  
		  
		  if Me.RelatedResource<>nil then
		    if Me.RelatedResource.NewDataAvailable then
		      nS=RelatedResource.GetReply
		      
		    end
		  else
		    //=> no resource found ??
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Receive_Run() As Boolean
		  Dim S,P as string
		  
		  
		  Select case Me.SendState
		  case 0
		    S="z"
		    P=""
		  case 1
		  end
		  Me.RelatedResource.send(S,P)
		  
		  return true
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resize(NewSize as Int64, Refill as boolean = false)
		  //Resize EEPROM array
		  EEPROM.Resize(NewSize,Cell_StartupValue.GIAI, ReFill)
		  // setthe EEPROMSize  accordingly
		  EEPROMSize.SIAI(NewSize)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceAttribute() As AttributeClass
		  // Part of the UserFunctions interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // Part of the UserFunctions interface.
		  
		  Select case AttributeLink
		  case is=DoReceive
		    return Step_Run_Receive
		  case is=DoSend
		    return Step_Run_Send
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveEEPROM(FolderPath as string)
		  if FolderPath.Mid(FolderPath.Len-2,3)="txt" then
		    
		    Me.MemoryOUT.SIAS(Me.EEPROM.Retrieve)
		    Dim ErrMsg as string =""
		    if File_Save(MemoryOUT.GIAS,ErrMsg,FolderPath,EEPROM_Folder.GIAS) then
		    end
		  else
		    if FolderPath.Mid(FolderPath.Len-2,3)="txt" then
		      // save as xml
		      
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Send_Poll() As integer
		  Dim RV as integer=0
		  Dim S as string
		  
		  if Me.RelatedResource<>nil then
		    if Me.RelatedResource.NewDataAvailable then
		      Dim i as integer
		      S=Me.RelatedResource.GetReply
		      i=Me.SendState
		    else
		      //=> no reply yet
		    end
		    
		  else
		    //=> error no resource found?
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Send_Run() As boolean
		  
		  
		  Select case Me.SendState
		  case 0
		  end
		  
		  if Me.RelatedResource<>nil then
		    'Me.RelatedResource.send(Me.CommandString,"RE600>")
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCoordinates(X as integer, Offset as integer, Y as integer, W as integer, H as integer)
		  // Part of the HMICanvasInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditMode(type As Boolean)
		  // Part of the HMICanvasInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFocus()
		  // Part of the HMICanvasInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHMIClass(HMIClass As HMI_StepClass)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMemoryIn()
		  
		  EEPROM.Fill_Line(MemoryIN.GIAS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetMemoryOUT()
		  // makes the transfer file to the IED
		  
		  MemoryOUT.SIAS(EEPROM.Retrieve)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SetNextAddress(vWrite as boolean, vMode as integer, vFrom as Int64, vTo as Int64) As boolean
		  // this routing will evaluate the next address according the SendMode
		  Dim NextAddress as Int64 = ActAddress+1
		  Dim IsIncluded as boolean = false
		  
		  Select case vMode
		  case 0 // all 
		    IsIncluded =true
		  case 1 // changed_cells by EEPROM_Content_Elements
		    Dim BS as BasicClass
		    IsIncluded = false
		    while not(IsIncluded) and (NextAddress<EEPROM.Size)
		      BS=FirstSubStep
		      while (BS<>nil) and not(IsIncluded) and (NextAddress<EEPROM.Size)
		        SetNextAddress_CheckContent(NextAddress,vWrite,BS,IsINcluded)
		        BS=BS.NextStep
		      wend
		      if not(IsIncluded) then
		        NextAddress=NextAddress+1
		      end
		    wend
		    if IsIncluded then
		      ActAddress=NextAddress
		    else
		      ActAddress=EEPROM.Size
		    end
		  case 2 // cell_not_FF 
		    while (NextAddress<EEPROM.Size) and (EEPROM.EP(NextAddress).BY=255)
		      NextAddress=NextAddress+1
		    wend
		  case 3 // cell_not_0
		    while (NextAddress<EEPROM.Size) and (EEPROM.EP(NextAddress).BY=0)
		      NextAddress=NextAddress+1
		    wend
		  case 4 // from to
		    if ActAddress<0 then
		      NextAddress=vFrom
		    else
		      if NextAddress>vTo then
		        NextAddress=EEPROM.Size
		      end
		    end
		  end
		  
		  if NextAddress>=EEPROM.Size then
		    return false
		  else
		    ActAddress=NextAddress
		    return true
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNextAddress_CheckContent(n as integer, vWrite as boolean, BS as BasicCLass, byRef IsIncluded as boolean)
		  if BS<>nil then
		    if BS IsA EEPROM_Content_StepClass then
		      if EEPROM_Content_StepClass(BS).Format.GIAI=8 then
		        Dim LS as BasicClass = BS.FirstSubStep
		        while (LS<>nil) and not(IsINcluded)
		          SetNextAddress_CheckContent(n,vWrite,LS,IsIncluded)
		          LS=LS.NextStep
		        wend
		      else
		        if vWrite then
		          if EEPROM_Content_StepClass(BS).Write.GIAB then
		            if (n>=EEPROM_Content_StepClass(BS).GetFrom) then
		              if (n<=(EEPROM_Content_StepClass(BS).GetTo)) then
		                IsIncluded = true
		              end
		            end
		          end
		        else
		          if EEPROM_Content_StepClass(BS).Read.GIAB then
		            if (n>=EEPROM_Content_StepClass(BS).GetFrom) then
		              if (n<=(EEPROM_Content_StepClass(BS).GetTo)) then
		                IsIncluded = true
		              end
		            end
		          end
		        end
		      end
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, vFrom as integer, vTo as integer)
		  // Part of the HMICanvasInterface interface.
		  
		  if PropertyName.Instr(1,"Com")>0 then
		    Dim i as integer
		    for i=vFrom to vTo
		      mUIUpdater.SetProperty("Com",str(i)+TAB+str(EEPROM.EP(i).BY))
		    next
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, SetValue as string)
		  // Part of the HMICanvasInterface interface.
		  
		  if PropertyName.Instr(1,"Com")>0 then
		    mUIUpdater.SetProperty("Com",SetValue)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisible(value As Boolean)
		  // Part of the HMICanvasInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set_All_EEPROMs_Formats()
		  // set the format of a eeprom cell according the definetions in the Content-Elements
		  // 0 = no format
		  // 1 = hex 
		  // 2 = char
		  // 3 = num
		  // 4 = crc16
		  // 5 = counter
		  
		  Dim BS as BasicClass
		  Dim vFormat as integer
		  Dim n,n1,n2 as integer
		  EEPROM.Format = DisplayFormat.GIAI
		  
		  // first reset the eeprom 
		  for n=0 to EEPROM.Size-1
		    EEPROM.EP(n).Count = 0
		    EEPROM.EP(n).Format = 0
		    EEPROM.EP(n).Col = &cFFFFFF
		  next
		  
		  Set_EEPROM_Format(FirstSubStep)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set_EEPROM_Format(BS as BasicClass)
		  // set the format of a eeprom cell according the definetions in the Content-Elements
		  // 0 = no format (=hex) or the defined one by cell
		  // 1 = hex   
		  // 2 = char
		  // 3 = num
		  // 4 = crc16
		  // 5 = counter
		  // 6 = LBS_Word
		  // 7 = MSB_Word
		  // 8 = MemoryBlock
		  
		  
		  Dim vFormat as integer
		  Dim n,n1,n2 as integer
		  Dim ChangedColor as Boolean = false
		  
		  while (BS<>nil) 
		    if BS IsA EEPROM_Content_StepClass then
		      n1 = EEPROM_Content_StepClass(BS).Byte_Offset.GIAI
		      n2 = n1+EEPROM_Content_StepClass(BS).Size.GIAI-1
		      vFormat = EEPROM_Content_StepClass(BS).Format.GIAI
		      // format all cells within the region of that EEPROM content element
		      if vFormat = 8 then
		        for n=n1 to n2
		          if (n>=0) and (n<EEPROM.Size) then
		            if EEPROM.EP(n).Format = 0 then 
		              EEPROM.EP(n).Col = &cA0A0A0
		              EEPROM.EP(n).Format = vFormat
		            end
		          end
		        next
		      else
		        for n=n1 to n2
		          if (n>=0) and (n<EEPROM.Size) then
		            EEPROM.EP(n).Format = vFormat
		            EEPROM.EP(n).Count = EEPROM.EP(n).Count+1
		            if EEPROM.EP(n).Count>1 then
		              EEPROM.EP(n).Col = &cFFA0A0
		            else
		              if ChangedColor then
		                EEPROM.EP(n).Col =  &c4ACFFF
		              else
		                EEPROM.EP(n).Col = &cD2BCF1
		              end
		            end
		          end
		        next 
		        //  produce a changing color effect
		        ChangedColor = not(ChangedColor)
		      end
		    end
		    // format included elements
		    Set_EEPROM_Format(BS.FirstSubStep)
		    // take next element
		    BS=BS.NextStep
		  wend
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_End() As boolean
		  
		  
		  if DoSave.GIAB then
		    SaveEEPROM(DoSaveName.GIAS)
		  end
		  
		  if CompareToMaster.GIAB then
		    if CompareMaster then
		      SetErrorMessage(ErrorCode_Pass,"EEPROM "+Name.GIAS+" checked ok","checks if send and receive EEPROMs are the same","EEPROM checked ok","")
		    else
		      SetErrorMessage(ErrorCode_Fail,"EEPROM "+Name.GIAS+" is not the same as Master: "+CR+MasterEEPROM.GIAS,"checks if send and receive EEPROMs are the same","compare EEPROMs","")
		    end
		  else
		    if InternalError="" then
		      SetErrorMessage(ErrorCode_Pass,"EEPROM was received/send","Load/Receives/Sends/Saves EEPROM content","","")
		    else
		      SetErrorMessage(ErrorCode_Fail,InternalError,"Load/Receives/Sends/Saves EEPROM content","","")
		    end
		  end
		  
		  return Super.Step_End
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  AddDebugTextCR("<HMI_EEPROM.Step_Init>")
		  Super.Step_Init
		  InternalInit
		  Set_All_EEPROMs_Formats
		  RunLoopNumber=0
		  AddDebugTextCR("</HMI_EEPROM.Step_Init>")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  'AddDebugTextCR("<HMI_EEPROM.Step_Init_AfterLoad>")
		  Super.Step_Init_AfterLoad
		  InternalInit
		  'AddDebugTextCR("</HMI_EEPROM.Step_Init_AfterLoad>")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  // Polls for new tcpip messages, gives back 0 when there is more to be read, 1 when there are new messages, 2 when communication is finished
		  Dim RV as integer = 0
		  AddDebugTextCR("<HMI_EEPROM.Step_Poll>")
		  Select case RunLoopNumber
		  case 0
		    if DoReceive.GIAB then
		      // receiving EEPROM content from device
		      RV=Step_Poll_Receive
		    else
		      RV=2 //receiving is not activated move directly to the next stage
		      SendState=0
		    end
		  case 1
		    // sending EEPROM content to device
		    if DoSend.GIAB then
		      RV=Step_Poll_Send
		    else
		      RV=2 // sending is not activated, move directly to next stage
		      SendState=0
		    end
		  end
		  AddDebugTextCR("</HMI_EEPROM.Step_Poll>")
		  return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll_Receive() As integer
		  AddDebugTextCR("<HMI_EEPROM.Step_Poll_Receive>")
		  Dim RV as integer = 2
		  'AddDebugTextCR("Step Poll Receive")
		  Dim d as integer = 0
		  Dim BlockSize as integer = 0
		  if ComPort<>nil then
		    Select case ComPort.GetReturnComProcedure(ReceiveMode.GIAI,false,BlockSize)
		    case 0 // ByteWise
		      RV=ComPort.poll(d)
		      if RV=2 then
		        'AddDebugTextCR("Received: "+str(ActAddress)+"/"+str(d))
		        EEPROM.EP(ActAddress).BY=d
		        SetProperty("Com",str(ActAddress)+TAB+str(d))
		        if SetNextAddress(false,ReceiveMode.GIAI,ReceiveFrom.GIAI,ReceiveTo.GIAI) then
		          RV=1
		        else
		          RV=2
		          ActAddress=-1
		          Set_All_EEPROMs_Formats
		        end
		      end
		    case 1 // BlockWise
		      RV=Comport.poll(EEPROM,ActAddress,BlockSize)
		      if RV=2 then
		        'AddDebugTextCR("Received: "+str(ActAddress)+"/"+str(d))
		        SetProperty("Com",ActAddress,ActAddress+BlockSize-1)
		        ActAddress=ActAddress+BlockSize-1
		        if SetNextAddress(false,ReceiveMode.GIAI,ReceiveFrom.GIAI,ReceiveTo.GIAI) then
		          RV=1
		        else
		          RV=2
		          ActAddress=-1
		          Set_All_EEPROMs_Formats
		        end
		      end
		    case 2 // FileWise
		      Dim S as string =""
		      RV=ComPort.poll(S)
		      if RV=2 then // fill the string into the EEPROM
		        MemoryIN.SIAS(S)
		        SetMemoryIn
		      end
		    end
		  else
		    RV=0
		  end
		  AddDebugTextCR("</HMI_EEPROM.Step_Poll_Receive>")
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll_Send() As integer
		  Dim RV as integer = 2
		  
		  Dim d as integer = 0
		  Dim BlockSize as integer = 0
		  AddDebugTextCR("<HMI_EEPROM.Step_Poll_Send>")
		  if (ComPort<>nil)then
		    Select case ComPort.GetReturnComProcedure(SendMode.GIAI,true,BlockSize)
		    case 0 // ByteWise
		      RV=ComPort.poll(d)
		      if RV=2 then
		        'AddDebugTextCR("Received: "+str(d))
		        SetProperty("Com",str(ActAddress))
		        if SetNextAddress(true,SendMode.GIAI,SendFrom.GIAI,SendTo.GIAI) then
		          RV=1
		        else
		          RV=2
		          ActAddress=-1
		        end
		      end
		    case 1 // BlockWise
		      RV=Comport.poll(EEPROM,ActAddress,BlockSize)
		      if RV=2 then
		        'AddDebugTextCR("Received: "+str(ActAddress)+"/"+str(d))
		        SetProperty("Com",ActAddress,ActAddress+BlockSize-1)
		        ActAddress=ActAddress+BlockSize-1
		        if SetNextAddress(true,ReceiveMode.GIAI,ReceiveFrom.GIAI,ReceiveTo.GIAI) then
		          RV=1
		        else
		          RV=2
		          ActAddress=-1
		          Set_All_EEPROMs_Formats
		        end
		      end
		    case 2 // FileWise
		      AddDebugTextCR("Send File Step_Poll_Send")
		      Dim S as string =""
		      RV=ComPort.poll(S)
		      if RV=2 then // fill the string into the EEPROM
		        
		      end
		    end
		  else
		    RV=2
		    if InternalError="" then InternalError="No ComPort connection"
		  end
		  AddDebugTextCR("</HMI_EEPROM.Step_Poll_Send>")
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Repeat() As Boolean
		  // virtual method if used for looping
		  Dim i as integer
		  i=RunLoopNumber
		  AddDebugTextCR("<HMI_EEPROM.Step_Repeat>")
		  Select case RunLoopNumber
		  case 0
		    // repeat this step without calling subordinate steps
		    DoSubSteps.SIAB(false)
		    AddDebugTextCR("</HMI_EEPROM.Step_Repeat>")
		    return true
		  case 1
		    // finish
		    DoSubSteps.SIAB(true)
		    AddDebugTextCR("</HMI_EEPROM.Step_Repeat>")
		    return true
		  else
		    DoSubSteps.SIAB(false)
		    // do not repeat and reset subordinate steps execution
		    AddDebugTextCR("</HMI_EEPROM.Step_Repeat>")
		    return false
		  end
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Dim RV as boolean = true
		  AddDebugTextCR("<HMI_EEPROM.Step_Run>")
		  Select case Me.RunLoopNumber
		  case 0
		    // receiving EEPROM content from device
		    if Me.DoReceive.GIAB then
		      RV=Step_Run_Receive
		    end
		  case 1
		    // sending EEPROM content to device
		    if Me.DoSend.GIAB then
		      RV=Step_Run_Send
		    end
		  case 2
		    
		  end
		  AddDebugTextCR("</HMI_EEPROM.Step_Run>")
		  return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run_Receive() As boolean
		  Dim RV as boolean=false
		  Dim BlockSize as integer = 0
		  Dim SM as integer = ComPort.GetReturnComProcedure(SendMode.GIAI,true,BlockSize)
		  
		  AddDebugTextCR("<HMI_EEPROM.Step_Run_Receive>")
		  
		  if (SM<2) and (ActAddress<0)  then
		    AddDebugTextCR("Start new receiving for "+Name.GIAS+" *********************")
		    if SetNextAddress(false,ReceiveMode.GIAI,ReceiveFrom.GIAI,ReceiveTo.GIAI) then
		      InternalError=""
		    else
		      InternalError="No Cell to Update"
		    end
		  end
		  
		  if (ComPort<>nil) then
		    Select case SM
		    case 0 // ByteWise
		      if (ActAddress<EEPROM.Size) then
		        RV=ComPort.Send(ActAddress,EEPROM.EP(ActAddress+GlobalOffset.GIAI).BY,false)
		      else
		        InternalError="Actual cell to update is exceeding size"
		      end
		    case 1 // BlockWise
		      if (ActAddress<EEPROM.Size) then
		        if ActAddress+BlockSize>EEPROM.Size then BlockSize=EEPROM.Size-ActAddress
		        RV=ComPort.Send(ActAddress,BlockSize, EEPROM,false)
		        'AddDebugTextCR("Send Block "+str(ActAddress)+"/"+str(BlockSize))
		      else
		        InternalError="Act cell to update is exceeding size"
		      end
		    case 2 // FileWise
		      RV=ComPort.Send("",false)
		    end
		    
		  else
		    InternalError="No ComPort connection"
		  end
		  AddDebugTextCR("</HMI_EEPROM.Step_Run_Receive>")
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run_Send() As boolean
		  Dim RV as boolean=false
		  Dim BlockSize as integer = 0
		  Dim SM as integer = ComPort.GetReturnComProcedure(SendMode.GIAI,true,BlockSize)
		  AddDebugTextCR("<HMI_EEPROM.Step_Run_Send>")
		  if (SM<2) and (ActAddress<0)  then
		    AddDebugTextCR("Start new sending for "+Name.GIAS+" >>>>>>>>>>>>>>>>>>>")
		    if SetNextAddress(true,SendMode.GIAI,SendFrom.GIAI,SendTo.GIAI) then
		      InternalError=""
		    else
		      InternalError="No Cell to Update"
		    end
		  end
		  
		  if (ComPort<>nil) and (InternalError="") then
		    Select case SM
		    case 0 // ByteWise
		      if (ActAddress<EEPROM.Size) then
		        RV=ComPort.Send(ActAddress,EEPROM.EP(ActAddress+GlobalOffset.GIAI).BY,true)
		        'AddDebugTextCR("Send Byte "+str(ActAddress)+"/"+str(EEPROM.EP(ActAddress+GlobalOffset.GIAI).BY))
		      else
		        InternalError="Act cell to update is exceeding size"
		      end
		    case 1 // BlockWise
		      if (ActAddress<EEPROM.Size) then
		        if ActAddress+BlockSize>EEPROM.Size then BlockSize=EEPROM.Size-ActAddress
		        RV=ComPort.Send(ActAddress,BlockSize, EEPROM,true)
		        'AddDebugTextCR("Send Block "+str(ActAddress)+"/"+str(BlockSize))
		      else
		        InternalError="Act cell to update is exceeding size"
		      end
		    case 2 // FileWise
		      AddDebugTextCR("Send File Step_Run_Send")
		      SetMemoryOUT
		      RV=ComPort.Send(MemoryOut.GIAS,true)
		    end
		  else
		    if InternalError="" then InternalError="No ComPort connection"
		  end
		  AddDebugTextCR("</HMI_EEPROM.Step_Run_Send>")
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  // reset the run state
		  dim RV as boolean
		  AddDebugTextCR("<HMI_EEPROM.Step_Start>")
		  RV=Super.Step_Start
		  RunLoopNumber=0
		  
		  ActAddress=-1
		  
		  SendState=0
		  DoSubSteps.SIAB(true)
		  
		  if EreaseAtStart.GIAB then
		    EEPROM.Erease(0)
		  end
		  
		  if DoLoad.GIAB then
		    if DoLoadName.GIAS<>"" then
		      LoadEEPROM(DoLoadName.GIAS)
		    end
		  end
		  
		  'ResetWaitTime(EEPROMSize.GIAI*1000)
		  if ComPort<>nil then
		    ComPort.Reset
		    ComPort.SetEEPROMSize(EEPROMSize.GIAI)
		  end
		  AddDebugTextCR("</HMI_EEPROM.Step_Start>")
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TestRND() As boolean
		  // Part of the EEPROM_Offset interface.
		  
		  return DoRandomTest.GIAB
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvas(mode As Integer)
		  // Part of the HMICanvasInterface interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  case is = "save"
		    SaveEEPROM("")
		  case is = "load"
		    LoadEEPROM("")
		  case is ="get"
		    SetMemoryOUT
		  case is="set"
		    SetMemoryIn
		  case is="send"
		    
		  case is="receive"
		    
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunctionFinished()
		  // Part of the UserFunctions interface.
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WaitBeforeStart() As Integer
		  // Part of the UserFunctions interface.
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub xxDoGenericResultTreatment(vSendState as integer, S as string, ByRef RV as integer, TriggerPromt as integer)
		  // override this routing in order to have a specific result handling at the end of the transmission of all commands
		  
		  Select case Me.RunLoopNumber
		  case 0
		    // receiving EEPROM content from IED
		    if Me.DoReceive.GIAB then
		      Dim LocalState as integer = vSendState
		      
		      Select case LocalState
		      case 1
		        MemoryIN.SIAS(S)
		      case 2
		        MemoryIN.SIASAdd(CR+S)
		      case 3
		        MemoryIN.SIASAdd(CR+S)
		        if S.InStr(1,"continue!")>0 then
		          SendState=vSendState
		          RV=1
		        else
		          EEPROM.Fill_Line(Me.MemoryIN.GIAS)
		          'SetErrorMessage(ErrorCode_Pass,S,Me.Name.GIAS,"EEPROM ok","")
		        end
		      end
		    end
		  case 1
		    // sending EEPROM content to IED
		    if Me.DoSend.GIAB then
		      Dim LocalState as integer = vSendState
		      Select case LocalState
		      case 3
		        'SetErrorMessage(ErrorCode_Pass,S,Me.Name.GIAS,"EEPROM ok","")
		      end
		    end
		  case 2
		    
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ActAddress As Int64 = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Cell_StartupValue As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CompareToMaster As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ComPort As EEPROM_Communication = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ComResource As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DisplayFormat As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoLoad As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoLoadName As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoRandomTest As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoReceive As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoSave As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoSaveName As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoSend As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EEPROM As EEPROM_Class = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EEPROMSize As UInt32_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EEPROM_Folder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EreaseAtStart As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ExecuteMode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		GlobalOffset As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected InternalError As string
	#tag EndProperty

	#tag Property, Flags = &h0
		loaded As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		MasterEEPROM As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MemoryIN As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MemoryOUT As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReceiveFrom As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReceiveMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReceiveTo As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SendFrom As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SendMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SendSequence As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		SendTo As Integer_AttributeClass = nil
	#tag EndProperty


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
			Name="ActAddress"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Int64"
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
			Name="ExecuteMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
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
			Name="loaded"
			Visible=false
			Group="Behavior"
			InitialValue="false"
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
			Name="SendSequence"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
