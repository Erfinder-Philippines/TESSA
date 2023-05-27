#tag Class
Protected Class ResourceClass
Inherits BasicClass
	#tag Method, Flags = &h0
		Sub AddRemarkToComLog(S as string)
		  // this routine is being called by the sub class TCPClass in order to bring the incoming result
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRemarkToComLogCR(S as string)
		  // this routine is being called by the sub class TCPClass in order to bring the incoming result
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  
		  Super.Constructor(ConfigText)
		  
		  CheckAfterStart = IAB("CheckAfterStart",false,false)
		  connected = Me.IAB("connected", false, false, AttributeGroups.System)
		  connected.ReadOnly = True
		  ImmediateConnection=IAB("ImmediateConnection",true,false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  Dim TOT as integer
		  
		  TOT=0
		  if TimeOutValue>0 then
		    TOT=TimeOutValue
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
		Sub InitialState()
		  // in this routine the resource shall pull itself in it's initial state
		  // outputs will be set at there initial value
		  // inputs will measure and check there initial state
		  // this routine has to be overriden by the actual initial setup process
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  // Virtual methode at least one has to be overriden
		  
		  return ""
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim RV as integer = 0
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      RV= ResourceClass(Me.UpperStep).Poll(Result,AttributeLink)
		      return RV
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessAll()
		  // in this routine the resource shall pull itself in it's initial state
		  // outputs will be set at there initial value
		  // inputs will measure and check there initial state
		  // this routine has to be extended by the actual initial setup process
		  Dim LA as BasicClass
		  
		  Me.ProcessResult("")
		  
		  LA=Me.FirstSubStep
		  while LA<>nil
		    if LA IsA ResourceClass then
		      ResourceClass(LA).ProcessAll
		    end
		    LA=LA.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessResult(Result as string)
		  // in this routine the resource will process the specific result of the element
		  // this routine has to be overriden by the actual result calculation process
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ResourceConnected() As boolean
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      return ResourceClass(Me.UpperStep).ResourceConnected
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RetrieveValue(Result as string, KeyW as string, ResSeparator as string = ",", valSeparator as string = "=") As double
		  // this routine will pick out the number of a reply string:
		  // Result="avg=1.02,max=1.50,min=0.89"
		  
		  Dim RV as double = 0
		  Dim n as integer = 1
		  Dim notDone as boolean=true
		  Dim Line as string = NthField(Result,resSeparator,n)
		  while notDone and (Line<>"")
		    if NthField(Line,valSeparator,1)=KeyW then
		      Result = NthField(Line,valSeparator,2)
		      RV=Val(Result)
		      notDone=false
		    else
		      n=n+1
		      Line = NthField(Result,resSeparator,n)
		    end
		  wend
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  // should be implemented by the final class
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      return ResourceClass(Me.UpperStep).Run(Parameter, AttributeLink, vPrompt)
		    end
		  end
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		CheckAfterStart As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		connected As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ImmediateConnection As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeOutValue As Integer = 0
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
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
