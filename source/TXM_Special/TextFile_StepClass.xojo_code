#tag Class
Protected Class TextFile_StepClass
Inherits HMI_TextArea_StepClass
Implements ReportIF,UserFunctions
	#tag Method, Flags = &h0
		Sub Add_TeststepReportList(byref ix as integer)
		  // Part of the ReportIF interface.
		  if ShowError.GIAB then
		    
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  
		  Select case ChangedAttribute
		  case Is = SaveFolder
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckError(ByRef S as string, ByRef ErrState as integer)
		  // Part of the ReportIF interface.
		  
		  if ShowError.GIAB then
		    if ErrorOccured.GIAB then
		      ErrState=ErrorCode_Fail
		      S=S+ErrorMessage.GIAS+CR
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckErrorOn() As boolean
		  // Part of the ReportIF interface.
		  return ShowError.GIAB
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor(ConfigText)
		  
		  'FileContent = IAS("FileContent","",false)
		  FileContent = Value
		  Value.Name = "FileContent"
		  
		  DoLoad = IAB("DoLoad",false,false)
		  LoadFile = IAPath("LoadFile","",false,false)
		  LoadFolder = IAPath("LoadFolder","",false,true)
		  
		  DoSave = IAB("DoSave",false,false)
		  SaveFile = IAPath("SaveFile","",false,false)
		  SaveFolder = IAPath("SaveFolder","",false,true)
		  SaveMode = IAE("SaveMode","0 Overwrite Append Autoindex",false)
		  
		  ShowDialog = IAB("ShowDialog",false,false)
		  ShowError = IAB("ShowError",false,false)
		  ErrorOccured = IAB("ErrorOccured",false,false)
		  ErrorMessage = IAS("ErrorMessage","",false)
		  
		  AddUserFunction("Save", FileContent)
		  AddUserFunction("Load", FileContent)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorMessage(ByRef RM as string, ByRef EM as string, ByRef ErrState as integer)
		  // Part of the ReportIF interface.
		  if  ShowError.GIAB then
		    if ErrorOccured.GIAB then
		      ErrState=ErrorCode_Fail
		      RM=RM+"Teststep"+TAB+Me.Name.GIAS+TAB+"Loading Textfile"+TAB+"Textfile loaded"+TAB+""+TAB+"Fail"+CR
		      RM=RM+"------------------------------------------"+CR+Me.ErrorMessage.GIAS+CR+"------------------------------------------"+CR
		      EM=EM+Me.ErrorMessage.GIAS+CR
		    else
		      RM=RM+"Teststep"+TAB+Me.Name.GIAS+TAB+"Loading Textfile"+TAB+"Textfile loaded"+TAB+""+TAB+"Pass"+CR
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  // Part of the UserFunctions interface.
		  
		  return 1000
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load()
		  // load file
		  Dim S as string
		  
		  Dim Result as boolean = File_Load( S, LoadFile.GIAS, LoadFolder.GIAS, ShowError.GIAB, ShowDialog.GIAB)
		  ErrorOccured.SIAB(not(Result))
		  if Result then
		    FileContent.SIAS(S)
		  else
		    FileContent.SIAS("")
		    ErrorMessage.SIAS(S)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // Part of the UserFunctions interface.
		  
		  Return 3
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetError(ResetState as integer)
		  // Part of the ReportIF interface.
		  
		  ErrorOccured.SIAB(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceAttribute() As AttributeClass
		  // Part of the UserFunctions interface.
		  
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case "Load"
		      return Me.FileContent
		    Case "Save"
		      return Me.FileContent
		    end
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // Part of the UserFunctions interface.
		  If mCurrentUserFunction <> Nil Then
		    Select case mCurrentUserFunction.FunctionName
		    Case is="Load"
		      Load
		    Case is="Save"
		      Save
		    End
		  End
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save()
		  // save file
		  Dim ErrorS as string
		  Dim Result as boolean = File_Save( FileContent.GIAS, ErrorS, SaveFile.GIAS, SaveFolder.GIAS, SaveMode.GIAI, ShowError.GIAB, ShowDialog.GIAB)
		  ErrorOccured.SIAB(not(Result))
		  if Result then
		  else
		    ErrorMessage.SIAS(ErrorS)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_End() As Boolean
		  
		  if DoSave.GIAB then
		    Save
		  end
		  
		  Return Super.Step_End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  
		  if DoLoad.GIAB then
		    Load
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  
		  if DoSave.GIAB then
		    'Save
		  end
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As Boolean
		  
		  if DoLoad.GIAB then
		    Load
		  end
		  
		  Return super.Step_Start
		End Function
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


	#tag Property, Flags = &h0
		DoLoad As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DoSave As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorMessage As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ErrorOccured As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FileContent As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LoadFile As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LoadFolder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SaveFile As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SaveFolder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SaveMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowDialog As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowError As Boolean_AttributeClass = nil
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
