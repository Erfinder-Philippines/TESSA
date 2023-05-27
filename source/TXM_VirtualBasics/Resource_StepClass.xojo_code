#tag Class
Protected Class Resource_StepClass
Inherits ComResourceClass
	#tag Method, Flags = &h0
		Sub AddToComLog(S as string)
		  // this routine is being called by the sub class TCPClass in order to bring the incoming result
		  AddToAComLog(S)
		  
		  Dim i as UInt64=0
		  NextState=0
		  
		  if NumPrmts=0 then
		    DataAvailable=true
		  else
		    while (NextState=0) and (i<NumPrmts)
		      if ComPrmpt(i) then
		        Dim n as UInt64 = ComLog.Instr(Prmpt1(i),2)
		        if n>0 then
		          if ComLog.Instr(Prmpt2(i),0,n)>0 then
		            DataAvailable=true
		            NextState=NxtState(i)
		          end
		        end
		      else
		        if ComLog.Instr(Prmpt1(i),2)>0 then
		          DataAvailable=true
		          NextState=NxtState(i)
		        end
		      end
		      i=i+1
		    wend
		  end
		  
		  if DataAvailable then
		    Reply.SIAS(ComLog.GetWholeCommand)
		    //++AddDebugTextCR("Promt "+Prmpt1(0)+" found in ***"+ComLog.GetWholeCommand+"+++"+ComLog.GetDebug+"***")
		  else
		    //++AddDebugTextCR("Promt "+Prmpt1(0)+" not found in ***"+ComLog.GetWholeCommand+"+++"+ComLog.GetDebug+"***")
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Connect()
		  // virtual method to be overriden
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  Super.Constructor(ConfigText)
		  
		  
		  debug = Me.IAB("debug", false, false)
		  
		  WithReply = Me.IAB("WithReply", false, false)
		  TimeOut=Me.IAI("TimeOut",0,false)
		  Reply=IAS("Reply","",false)
		  Reply.NoSave=true
		  
		  redim Prmpt1(5)
		  redim Prmpt2(5)
		  redim NxtState(5)
		  redim ComPrmpt(5)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Disconnect()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetNextState() As integer
		  return NextState
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReply() As string
		  return ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  Dim TOT as integer
		  
		  TOT=0
		  if Me.TimeOut.GIAI>0 then
		    TOT=Me.TimeOut.GIAI
		  else
		    if Me.UpperStep<>nil then
		      if Me.UpperStep IsA ResourceClass then
		        TOT= ResourceClass(Me.UpperStep).GetTimeouttime
		      end
		    end
		  end
		  
		  return TOT
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  // initialises connection also for all included elements
		  
		  return "no init defined"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadBasicAttributeDesc()
		  ParseAttributesDescription("%WORKINGFOLDER%" + PathSeparator + "BasicDescription", "Resource_StepClass_desc.xml")
		  Super.LoadBasicAttributeDesc
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NewDataAvailable() As boolean
		  
		  return DataAvailable
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  // resets the connection state of that resource
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub send(CommandString as string, vPrompt as string = "")
		  #Pragma Unused CommandString
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPrompt(Index as integer, Prompt as string, State as integer)
		  //++AddDebugTextCR("Add prompt "+str(index)+"  "+Prompt+" state "+str(State))
		  if Prompt.Instr(1,"&&")>0 then
		    Prmpt1(Index)=NthField(Prompt,"&&",1)
		    Prmpt2(Index)=NthField(Prompt,"&&",2)
		    ComPrmpt(Index)=true
		  else
		    Prmpt1(Index)=Prompt
		    ComPrmpt(Index)=false
		  end
		  NxtState(Index)=State
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPrompts(Prompt1 as string)
		  if not(Prompt1="preset") then
		    Dim vPrompt1, vPrompt2, vPrompt3 as string =""
		    vPrompt1=NthField(Prompt1,TAB,1)
		    vPrompt2=NthField(Prompt1,TAB,2)
		    vPrompt3=NthField(Prompt1,TAB,3)
		    
		    if vPrompt3<>"" then
		      SetPrompts(vPrompt1,2,vPrompt2,3,vPrompt3,3)
		    elseif vPrompt2<>"" then
		      SetPrompts(vPrompt1,2,vPrompt2,3)
		    else
		      SetPrompts(vPrompt1,2)
		    end
		  end
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPrompts(Prompt1 as string, State1 as integer)
		  if Prompt1="" then
		    NumPrmts=0
		  else
		    NumPrmts=1
		    SetPrompt(0,Prompt1,State1)
		  end
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPrompts(Prompt1 as string, State1 as integer ,Prompt2 as string, State2 as integer)
		  NumPrmts=2
		  
		  SetPrompt(0,Prompt1,State1)
		  SetPrompt(1,Prompt2,State2)
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPrompts(Prompt1 as string, State1 as integer ,Prompt2 as string, State2 as integer ,Prompt3 as string, State3 as integer)
		  NumPrmts=3
		  
		  SetPrompt(0,Prompt1,State1)
		  SetPrompt(1,Prompt2,State2)
		  SetPrompt(2,Prompt3,State3)
		  
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPrompts(Prompt1 as string, State1 as integer ,Prompt2 as string, State2 as integer ,Prompt3 as string, State3 as integer ,Prompt4 as string, State4 as integer)
		  NumPrmts=4
		  SetPrompt(0,Prompt1,State1)
		  SetPrompt(1,Prompt2,State2)
		  SetPrompt(2,Prompt3,State3)
		  SetPrompt(3,Prompt4,State4)
		  
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPrompts(Prompt1 as string, State1 as integer ,Prompt2 as string, State2 as integer ,Prompt3 as string, State3 as integer ,Prompt4 as string, State4 as integer ,Prompt5 as string, State5 as integer)
		  NumPrmts=5
		  SetPrompt(0,Prompt1,State1)
		  SetPrompt(1,Prompt2,State2)
		  SetPrompt(2,Prompt3,State3)
		  SetPrompt(3,Prompt4,State4)
		  SetPrompt(4,Prompt5,State5)
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ComPrmpt() As boolean
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDataAvailable
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDataAvailable = value
			End Set
		#tag EndSetter
		DataAvailable As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		debug As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastPrmptCheck As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDataAvailable As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NextState As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NumPrmts As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private NxtState() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Prmpt1() As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Prmpt2() As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Reply As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeOut As Integer_AttributeClass = nil
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
