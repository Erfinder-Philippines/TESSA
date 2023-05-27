#tag Class
Protected Class Siglent_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor(ConfigText)
		  
		  Dim commandArray As String = "0 "
		  For i As Integer = 0 To 4
		    commandArray = commandArray + MakeCommand(i) + " "
		  Next i
		  Me.Command = IAE("Common_Commands",commandArray)
		  
		  Me.CustomCommand = Me.IAS("Custom_Command","",False)
		  Me.UseCustomCommand = Me.IAB("Use_Custom_Commands",True,False)
		  Me.ResultText=Me.IAS("ResultText","",False,AttributeGroups.System)
		  Me.Prompt=Me.IAS("Prompt","",False)
		  Me.WithReply=Me.IAB("Response",True,False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDebugInfo() As string
		  if Me.RelatedResource<>nil then
		    Return RelatedResource.GetDebugInfo
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeCommand() As string
		  
		  Var vCom As String = ""
		  Select case Command.GIAI
		  Case 0  //Measure Voltage DC
		    vCom = "MEAS:VOLT:DC?"
		  Case 1  ///Measure Voltage AC
		    vCom = "MEAS:VOLT:AC?"
		  Case 2  //Measure Current DC
		    vCom = "MEAS:CURR:DC?"
		  Case 3 //Measure Current AC
		    vCom = "MEAS:CURR:AC?"
		  Case 4 // Reset
		    vCom = "*RST"
		  End
		  
		  vCom = vCom + " "
		  
		  return vCom
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MakeCommand(index as Integer) As String
		  
		  Var vCom As String = ""
		  Select Case index
		  Case 0  //Measure Voltage DC
		    vCom = "MEAS:VOLT:DC?"
		  Case 1  ///Measure Voltage AC
		    vCom = "MEAS:VOLT:AC?"
		  Case 2  //Measure Current DC
		    vCom = "MEAS:CURR:DC?"
		  Case 3 //Measure Current AC
		    vCom = "MEAS:CURR:AC?"
		  Case 4 // Reset
		    vCom = "*RST"
		  Case Else
		    Return ""
		  End
		  
		  Return vCom
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_End() As boolean
		  // Calling the overridden superclass method.
		  Var returnValue As Boolean = Super.Step_End()
		  
		  ReplyReceived = True
		  
		  Return returnValue
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  Dim a as Boolean
		  'clean Result and get deviceinfo
		  If Me.RelatedResource<>Nil And Me.RelatedResource IsA Siglent_ResourceClass Then
		    Siglent_ResourceClass(Me.RelatedResource).ResultLine=""
		  End
		  
		  If WithReply.GIAB Then
		    ReplyReceived = True
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  // Calling the overridden superclass method.
		  Var returnValue As Integer = Super.Step_PollTimeout()
		  // Polls for new tcpip messages, gives back true when there are new messages
		  Dim RV as integer = 0
		  Dim S As String
		  
		  If Me.RelatedResource <> Nil And Me.RelatedResource IsA Siglent_ResourceClass Then
		    
		    Dim commandAttribute As AttributeClass
		    If UseCustomCommand.GIAB Then
		      S = Me.CustomCommand.GIAS
		      commandAttribute= Me.CustomCommand
		    Else
		      S = Me.Command.GIAS
		      commandAttribute = Me.Command
		    End If
		    RV = Siglent_ResourceClass(Me.RelatedResource).Poll(S, commandAttribute)
		    
		    Me.ResultText.SIAS(S)
		    
		    If RV > 0 Then
		      ReplyReceived = True
		      'extractresult
		      
		      'if Me.Reply.GIAS.InStr("Error") <> 0 or fail then
		      'Me.SetErrorMessage(ErrorCode_Fail,"An Error occured",Me.Description.GIAS,"","")
		      'elseif Me.Reply.GIAS.InStr("Finished") <> 0 then
		      'Me.SetErrorMessage(ErrorCode_Pass,"LE9-2 stream captured",Me.Description.GIAS,"","")
		      'end
		      'end
		    End
		  End
		  Return RV
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  // copy value into the Link
		  
		  Dim RV as boolean = false
		  If Me.RelatedResource <> Nil And Me.RelatedResource IsA Siglent_ResourceClass Then
		    
		    If ReplyReceived Then
		      Dim commandAttribute As AttributeClass
		      Dim S As String
		      If UseCustomCommand.GIAB Then
		        commandAttribute = Me.CustomCommand
		        S = Me.CustomCommand.GIAS' + Chr(13)
		      Else
		        commandAttribute = Me.Command
		        S = Me.Command.GIAS' + " "
		      End If
		      RV = Siglent_ResourceClass(Me.RelatedResource).Run(S, commandAttribute)
		      
		      If RV Then
		        If WithReply.GIAB Then
		          ReplyReceived = False
		        End If
		        
		        Me.RunMode = 2
		      End If
		      
		    ElseIf WithReply.GIAB Then
		      Me.RunMode = 2
		    End If
		    
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  
		  If Me.RelatedResource<>Nil And Me.RelatedResource IsA ResourceClass Then
		    Siglent_ResourceClass(Me.RelatedResource).SendState=0 //new
		    Siglent_ResourceClass(Me.RelatedResource).ResultLine=""
		    
		    If Me.Command.GIAI = 4 Or CustomCommand.GIAS = "*RST" Then
		      // *RST
		      Me.WithReply.SIAB(False)
		      ReplyReceived = True
		    End If
		  End
		  
		  
		  return super.Step_Start
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Command As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CustomCommand As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Prompt As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReplyReceived As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		ResultText As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		UseCustomCommand As Boolean_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		WithReply As Boolean_AttributeClass = nil
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
		#tag ViewProperty
			Name="ReplyReceived"
			Visible=false
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
