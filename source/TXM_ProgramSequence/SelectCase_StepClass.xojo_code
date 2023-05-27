#tag Class
Protected Class SelectCase_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  
		  Select case ChangedAttribute
		  case Is =Cases
		    SetEnclosedCases
		    MainWindow.HTL.UpdateTree
		  end
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Input=IAS("Input","",false)
		  Cases=IAS("Cases","",true)
		  Selection=IAI("Selection")
		  
		  Cases.SIAS("Case0",0)
		  Cases.SIAS("CaseELSE",1)
		  
		  AddUserFunction("Add case", Cases)
		  'AddUserFunction("Delete case", Cases)
		  'AddUserFunction("Add Else", Cases)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteCase()
		  Dim BS,DS as BasicClass = FirstSubStep
		  Dim i as integer = 0
		  Selection.SIAI(-1)
		  Dim IntegerSelection as boolean = (Input.GIAS="0") or (Input.GIAI>0)
		  
		  while BS<>nil
		    if BS IsA Case_StepClass then
		      if BS.Name.GIAS=Cases.GIAS  then
		        DS=BS
		        BS=BS.NextStep
		        DeleteBasicStepClass(DS)
		      else
		        BS=BS.NextStep
		      end
		    end
		  wend
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub MoveElse()
		  Dim BS,DS as BasicClass = FirstSubStep
		  
		  while BS<>nil
		    if BS IsA Case_StepClass then
		      if BS.Name.GIAS="CaseELSE" then
		        while BS.NextStep<>nil
		          DS=BS.NextStep
		          BS.NextStep=DS.NextStep
		          if BS.PreviousStep<>nil then
		            BS.PreviousStep.NextStep=DS
		          end
		          DS.PreviousStep=BS.PreviousStep
		          BS.PreviousStep=DS
		          DS.NextStep=BS
		        wend
		      end
		    end
		    BS=BS.NextStep
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCaseName(BC as Case_StepClass, NewName as string)
		  Dim BS as BasicClass = FirstSubStep
		  Dim i as integer = 0
		  if BC<>nil then
		    while BS<>nil
		      if BS IsA Case_StepClass then
		        if BS=BC then
		          Cases.SIAS(NewName,i)
		        end
		        i=i+1
		      end
		      BS=BS.NextStep
		    wend
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEnclosedCases()
		  Dim BS as BasicClass = FirstSubStep
		  Dim i as integer = 0
		  Selection.SIAI(-1)
		  Dim IntegerSelection as boolean = (Input.GIAS="0") or (Input.GIAI>0)
		  
		  while BS<>nil
		    if BS IsA Case_StepClass then
		      if BS.Name.GIAS<>Cases.GIAS(i) then
		        BS.Name.SIAS(Cases.GIAS(i))
		      end
		      if (not(IntegerSelection) and(Input.GIAS=Cases.GIAS(i))) or (IntegerSelection and (i=Input.GIAI))  then
		        Case_StepClass(BS).DoSubSteps.SIAB(true)
		        Selection.SIAI(i)
		        Cases.SIAA(i)
		      else
		        Case_StepClass(BS).DoSubSteps.SIAB(false)
		      end
		      i=i+1
		    end
		    BS=BS.NextStep
		  wend
		  
		  if Selection.GIAI = -1 then
		    BS = FirstSubStep
		    while BS<>nil
		      if BS IsA Case_StepClass then
		        if BS.Name.GIAS="CaseELSE" then
		          Case_StepClass(BS).DoSubSteps.SIAB(true)
		        end
		      end
		      BS=BS.NextStep
		    wend
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  SetEnclosedCases
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  Select case FuncName
		  Case is = "Add case"
		    Dim Na as string = "Case"+str(Cases.GIAN-1)
		    Cases.SIAS(Na,Cases.GIAN-1)
		    Cases.AddValue("CaseELSE")
		    Dim XML_Text_Pointer as integer = 1
		    Dim S as string = "<Case Name=" + chr(34) + Na  + chr(34) + "  />"
		    Parse_XML(self,S,XML_Text_Pointer)
		    MoveElse
		  case is ="Delete case"
		    
		    
		  case is="Add Else"
		    Dim XML_Text_Pointer as integer = 1
		    Dim S as string = "<Case Name=" + chr(34) + "CaseELSE"  + chr(34) + "  />"
		    Parse_XML(self,S,XML_Text_Pointer)
		  end
		  
		  MainWindow.HTL.UpdateTree
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Cases As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Selection As Integer_AttributeClass = nil
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
