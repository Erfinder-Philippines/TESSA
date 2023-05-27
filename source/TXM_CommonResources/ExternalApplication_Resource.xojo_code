#tag Class
Protected Class ExternalApplication_Resource
Inherits Resource_StepClass
	#tag Method, Flags = &h0
		Sub Connect()
		  // virtual method to be overriden
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  Super.Constructor(ConfigText)
		  
		  Me.ApplicationPath = IAPath("ApplicationPath", "", false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReply() As string
		  return ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  return 10000
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  // initialises connection also for all included elements
		  
		  return "External Program oks"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewDataAvailable() As boolean
		  
		  return false
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  // resets the connection state of that resource
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RunShell() As boolean
		  'Select case Me.Mode.GIAI
		  'case 1 // do one shell command
		  'Dim S as string
		  'SH.execute Me.Parameter1.GIAS
		  'S=SH.result
		  'If SH.errorCode = 0 then
		  'Me.ResultText.SIAS(S)
		  'if  (Me.EndOfPoll.GIAS.Len>4) and (S.Instr(1,Me.EndOfPoll.GIAS)>0) then
		  'Me.SendState=0
		  'SH.TimeOut=Me.WaitTime.GIAI
		  'Me.TestResult.SIAI(ErrorCode_Pass)
		  'else
		  'if  (Me.ErrorDetect.GIAS.len>4) and (S.Instr(1,Me.ErrorDetect.GIAS)>0) then
		  'Me.SendState=0
		  'SH.TimeOut=Me.WaitTime.GIAI
		  'if Me.ErrorPresetMessage.GIAS="" then
		  'Me.SetErrorMessage(ErrorCode_Fail,"The following error occured:",S,"","")
		  'else
		  'Me.SetErrorMessage(ErrorCode_Fail,Me.ErrorPresetMessage.GIAS,S,"","")
		  'end
		  'end
		  'end
		  'else
		  'Me.ResultText.SIAS(S)
		  ''MsgBox "Error opening shell command code: " + Str(SH.errorCode)
		  'Me.SetErrorMessage(ErrorCode_Fail,"Error opening shell command code: " + Str(SH.errorCode),S,"","")
		  'end if
		  '
		  'case 2 // do interactive shell commands
		  'AddDebugTextCR("Run CommandlIneNr "+str(CommandLineNr))
		  'if CommandLineNr=-1 then
		  'AddDebugTextCR("started cmd.exe")
		  'else
		  'Dim S as string = Me.Parameter1.GIAS
		  'if Me.Parameter2.GIAS<>"" then
		  'S=S+" "+Me.Parameter2.GIAS
		  'if Me.Parameter3.GIAS<>"" then
		  'S=S+" "+Me.Parameter3.GIAS
		  'end
		  'end
		  '
		  'ActResultText=""
		  '
		  'if Me.SH<>nil then
		  'Me.SH.TimeOut=Me.WaitTime.GIAI
		  'Me.SH.WriteLine( S)
		  'AddDebugTextCR("Send command: "+S)
		  'end
		  'end
		  'end
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send(vCommandString as string, vPrompt as string = "")
		  #Pragma Unused vCommandString
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetActiveStep(Index as integer)
		  'if Index>=0 then
		  'if Parameter1.IsArray then
		  'Me.Parameter1.SIAA(Index)
		  'end
		  'Me.Parameter1.SIAA(Index)
		  'if Parameter2.IsArray then
		  'Me.Parameter2.SIAA(Index)
		  'end
		  'if Me.Parameter3.IsArray then
		  'Me.Parameter3.SIAA(Index)
		  'end
		  'if Me.EndOfPoll.IsArray then
		  'Me.EndOfPoll.SIAA(Index)
		  'end
		  'if Me.ErrorDetect.IsArray then
		  'Me.ErrorDetect.SIAA(Index)
		  'end
		  'end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StartProg() As Boolean
		  Dim OpenOk as boolean = false
		  Dim n as integer = 0
		  
		  while n<4
		    Dim f As FolderItem = ApplicationPath.GIAF
		    if f<>nil And f.exists then
		      'f.Launch(Me.Parameter1.GIAS+" "+Me.Parameter2.GIAS,true)
		      OpenOk=true
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


	#tag Property, Flags = &h0
		ApplicationPath As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SH As Shell = nil
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
			Name="DataAvailable"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastPrmptCheck"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue=""
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
			Name="TimeOutValue"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
