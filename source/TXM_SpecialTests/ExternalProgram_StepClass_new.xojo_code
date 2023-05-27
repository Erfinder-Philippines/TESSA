#tag Class
Protected Class ExternalProgram_StepClass_new
Inherits ReportStepClass
Implements UserFunctions
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor(ConfigText)
		  
		  Me.Mode=Me.IAE("Mode","0 Application Shell_Command Shell_Interactive",false)
		  Me.Folder=Me.IAS("Folder","",false)
		  Me.ProgramName=Me.IAS("ProgramName","Shell",false)
		  Me.Parameter1=Me.IAS("Parameter1","",false)
		  Me.Parameter2=Me.IAS("Parameter2","",false)
		  Me.Parameter3=Me.IAS("Parameter3","",false)
		  Me.ResultText=Me.IAS("ResultText","",false)
		  Me.EndOfPoll=Me.IAS("EndOfPoll","",false)
		  Me.ErrorDetect=Me.IAS("ErrorDetect","",false)
		  Me.ErrorPresetMessage=Me.IAS("ErrorPresetMessage","",false)
		  
		  MaxRetries=1
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return new HMI_ExternalProgram_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  // Part of the UserFunctions interface.
		  '#pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // this routine is called when ever the upper test step is starting or repeating it's function
		  // this routine is not called by the teststep itself
		  mUIUpdater.UpdateCanvas(0)
		  Super.Init_Teststep_Start
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalInit()
		  if Parameter1.GetAsLinkableAttributeClass<>nil then
		    Parameter1.IsArray=false
		  end
		  if Parameter2.GetAsLinkableAttributeClass<>nil then
		    Parameter2.IsArray=false
		  end
		  if Parameter2.GetAsLinkableAttributeClass<>nil then
		    Parameter2.IsArray=false
		  end
		  if Parameter3.GetAsLinkableAttributeClass<>nil then
		    Parameter3.IsArray=false
		  end
		  
		  
		  Select case Me.Mode.GIAI
		  case 0 // start application
		  case 1 // do one shell command
		    if SH = nil then
		      SH = new TESSA_Shell(ResultText)
		    end
		  case 2 // do interactive shell commands
		    if SH = nil then
		      SH = new TESSA_Shell(ResultText)
		    end
		    SH.Mode = 2
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  Super.Paint(g, mode)
		  // title and measure
		  DrawString(g, Name.GIAS+" Textoutput", 10, 18)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // Part of the UserFunctions interface.
		  '#pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceAttribute() As AttributeClass
		  // Part of the UserFunctions interface.
		  '#pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // Part of the UserFunctions interface.
		  '#pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunShell() As boolean
		  Select case Me.Mode.GIAI
		  case 1 // do one shell command
		    Dim S as string
		    SH.execute Me.Parameter1.GIAS
		    S=SH.result
		    If SH.errorCode = 0 then
		      Me.ResultText.SIAS(S)
		      if  (Me.EndOfPoll.GIAS.Len>4) and (S.Instr(1,Me.EndOfPoll.GIAS)>0) then
		        Me.SendState=0
		        SH.TimeOut=Me.WaitTime.GIAI
		        Me.TestResult.SIAI(ErrorCode_Pass)
		      else
		        if  (Me.ErrorDetect.GIAS.len>4) and (S.Instr(1,Me.ErrorDetect.GIAS)>0) then
		          Me.SendState=0
		          SH.TimeOut=Me.WaitTime.GIAI
		          if Me.ErrorPresetMessage.GIAS="" then
		            Me.SetErrorMessage(ErrorCode_Fail,"The following error occured:",S,"","")
		          else
		            Me.SetErrorMessage(ErrorCode_Fail,Me.ErrorPresetMessage.GIAS,S,"","")
		          end
		        end
		      end
		    else
		      Me.ResultText.SIAS(S)
		      'MsgBox "Error opening shell command code: " + Str(SH.errorCode)
		      Me.SetErrorMessage(ErrorCode_Fail,"Error opening shell command code: " + Str(SH.errorCode),S,"","")
		    end if
		    
		  case 2 // do interactive shell commands
		    'AddDebugTextCR("Run CommandlIneNr "+str(CommandLineNr))
		    if CommandLineNr=-1 then
		      'AddDebugTextCR("started cmd.exe")
		    else
		      Dim S as string = Me.Parameter1.GIAS
		      if Me.Parameter2.GIAS<>"" then
		        S=S+" "+Me.Parameter2.GIAS
		        if Me.Parameter3.GIAS<>"" then
		          S=S+" "+Me.Parameter3.GIAS
		        end
		      end
		      
		      ActResultText=""
		      
		      if Me.SH<>nil then
		        Me.SH.TimeOut=Me.WaitTime.GIAI
		        Me.SH.WriteLine( S)
		        'AddDebugTextCR("Send command: "+S)
		      end
		    end
		  end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetActiveStep(Index as integer)
		  if Index>=0 then
		    if Parameter1.IsArray then
		      Me.Parameter1.SIAA(Index)
		    end
		    Me.Parameter1.SIAA(Index)
		    if Parameter2.IsArray then
		      Me.Parameter2.SIAA(Index)
		    end
		    if Me.Parameter3.IsArray then
		      Me.Parameter3.SIAA(Index)
		    end
		    if Me.EndOfPoll.IsArray then
		      Me.EndOfPoll.SIAA(Index)
		    end
		    if Me.ErrorDetect.IsArray then
		      Me.ErrorDetect.SIAA(Index)
		    end
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartProg() As Boolean
		  Dim OpenOk as boolean = false
		  Dim n as integer = 0
		  
		  while n<4
		    Dim f As FolderItem = GetWorkingFolderItem //file type defined in File Type Sets Editor
		    If CheckFolder(f) then
		      if Me.Folder.GIAS<>"" then
		        f=f.Child(Me.Folder.GIAS)
		      end
		      
		      if CheckFolder(f) then
		        f=f.Child(Me.ProgramName.GIAS)
		        if f<>nil And f.exists then
		          f.Launch(Me.Parameter1.GIAS+" "+Me.Parameter2.GIAS,true)
		          OpenOk=true
		        end
		      end
		    end
		    n=n+1
		  wend
		  
		  if not OpenOk then
		    'MsgBox("No external program "+Me.ProgramName.GIAS+" found")
		    OpenOk=true
		  end
		  
		  Return OpenOk
		End Function
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
		Function Step_Poll() As integer
		  Dim RV as integer = 0
		  Dim S as string =""
		  
		  Select case Me.Mode.GIAI
		  case 0 // start application -----------------------------------------------
		    
		  case 1 // do one shell command -----------------------------------------
		    If Me.SH <> Nil Then
		      if SH.GetNewData then
		        'AddDebugTextCR(S)
		        UpdateCanvas
		        S=Me.ResultText.GIAS
		        Me.SendState=Me.SendState+1
		        if  (Me.EndOfPoll.GIAS.Len>0) and (S.Instr(1,Me.EndOfPoll.GIAS)>0) then
		          SH.TimeOut=Me.WaitTime.GIAI
		          Me.SetErrorMessage(ErrorCode_Pass,Me.Name.GIAS+" has finished","","","")
		          Me.SendState=0
		          RV=2
		          'AddDebugTextCR("Poll1 ok => "+S)
		        else
		          if  (Me.ErrorDetect.GIAS.len>4) and (S.Instr(1,Me.ErrorDetect.GIAS)>0) then
		            'AddDebugTextCR("Poll1 error => "+S)
		            SH.TimeOut=Me.WaitTime.GIAI
		            if Me.ErrorPresetMessage.GIAS="" then
		              Me.SetErrorMessage(ErrorCode_Fail,"The following error occured:",S,"","")
		            else
		              Me.SetErrorMessage(ErrorCode_Fail,Me.ErrorPresetMessage.GIAS,S,"","")
		            end
		            Me.SendState=0
		            RV=2
		          else
		            RV=0
		          end
		        end
		      else
		        'AddDebugTextCR(".")
		      end
		    else
		      'AddDebugTextCR("No Shell active?")
		    end
		    return RV
		  case 2 // do interactive shell commands -----------------------------------------
		    // read what comes back from the shell
		    If Me.SH <> Nil Then
		      'Me.SH.Poll
		      'S=SH.ReadAll
		      if SH.GetNewData then
		        'AddDebugTextCR("received text: "+S)
		        UpdateCanvas
		        S=ResultText.GIAS
		        // analyse what has come back
		        if CommandLineNr=-1 then
		          if InstrReverse(S,0,">")>max(S.Len-3,0) then
		            CommandLineNr=0
		            RV=1
		          end
		        else
		          Dim k as integer=InstrReverse(S,0,Me.EndOfPoll.GIAS)
		          if  (Me.EndOfPoll.GIAS.Len>0) and (S.Len>0) and (k>max(S.Len-Me.EndOfPoll.GIAS.Len*10 ,0))  then
		            Me.SetErrorMessage(ErrorCode_Pass,Me.Name.GIAS+" has finished","","","")
		            RV=1
		          else
		            if Me.SH.errorCode <> 0 then
		              Me.SetErrorMessage(ErrorCode_Fail,"error "+str(Me.SH.errorCode)+" occured:",Me.SH.result,"","")
		              RV=1
		            else
		              if  (Me.ErrorDetect.GIAS.len>4) and (S.Instr(1,Me.ErrorDetect.GIAS)>0) then
		                SH.TimeOut=Me.WaitTime.GIAI
		                if Me.ErrorPresetMessage.GIAS="" then
		                  Me.SetErrorMessage(ErrorCode_Fail,"The following error occured:",S,"","")
		                else
		                  Me.SetErrorMessage(ErrorCode_Fail,Me.ErrorPresetMessage.GIAS,S,"","")
		                end
		                RV=2
		              else
		                RV=0
		              end
		            end
		          end
		          // increase state counter
		          if RV=1 then // handle multiline replies
		            Me.SendState=Me.SendState+1
		            if Me.Parameter1.IsArray then
		              Me.CommandLineNr=Me.CommandLineNr+1
		              'AddDebugTextCR("NextLine: "+Str(CommandLineNr))
		              if  (Me.CommandLineNr>=Me.Parameter1.GOAN) then
		                Me.CommandLineNr=0
		                Me.SendState=0
		                RV=2
		              else
		                Me.SetActiveStep(Me.CommandLineNr)
		              end
		            else
		              Me.SendState=0
		              RV=2
		            end
		          end
		        end
		      end
		    end
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_PollTimeout() As integer
		  
		  
		  Me.TestResult.SIAI(ErrorCode_Fail)
		  Me.ErrorMessage.SIAS("A timeout occured for command: "+chr(13)+Me.Name.GIAS+" at SendState "+str(Me.SendState)+" (more than "+str(Me.WaitTime.GIAI/1000)+" sec)")
		  
		  return 6
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Repeat() As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  
		  Select case Me.Mode.GIAI
		  case 0 // start application
		    Me.ResultText.SIAS("")
		    return Me.StartProg
		  case 1 // do one shell command
		    return Me.RunShell
		  case 2 // do interactive shell commands
		    return Me.RunShell
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  Me.ResultText.SIAS("") //clear text
		  
		  if SH = nil then
		    SH = new TESSA_Shell(ResultText)
		  end
		  if SH<>nil then
		    Select case Me.Mode.GIAI
		    case 0 // start application
		      Me.RunMode=1
		      SH.TimeOut=Me.WaitTime.GIAI
		    case 1 // do one shell command
		      SH.TimeOut=Me.WaitTime.GIAI
		      Me.RunState=0
		      Me.RunMode=1
		    case 2 // do interactive shell commands
		      Me.RunMode=2
		      ActResultText=""
		      Me.SendState=0
		      if Parameter1.IsArray then
		        Me.CommandLineNr=-1
		        Me.SetActiveStep(0)
		      else
		        Me.CommandLineNr=1
		      end
		      
		      SH.Mode = 2
		      SH.TimeOut = Me.WaitTime.GIAI
		      #If TargetWin32 Then
		        SH.Execute("cmd.exe /q")
		        'AddDebugTextCR("started cmd.exe")
		      #Elseif TargetMacOS Or TargetLinux Then
		        SH.Execute("sh")
		      #Endif
		    end
		  end
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextChange(NewText As String)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvas()
		  if Visible.GIAB then
		    mUIUpdater.UpdateCanvas(0)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunctionFinished()
		  // Part of the UserFunctions interface.
		  '#pragma error  "Don't forget to implement this method!"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WaitBeforeStart() As Integer
		  // Part of the UserFunctions interface.
		  '#pragma error  "Don't forget to implement this method!"
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ActResultText As string
	#tag EndProperty

	#tag Property, Flags = &h0
		CommandLineNr As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		EndOfPoll As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorDetect As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorPresetMessage As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Folder As String_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NextUpdate As double = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameter1 As String_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameter2 As String_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameter3 As String_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		ProgramName As String_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		ResultText As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SH As TESSA_Shell = nil
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
			Name="ActResultText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="CommandLineNr"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
