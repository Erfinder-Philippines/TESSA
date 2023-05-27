#tag Class
Protected Class IfThen_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Input1=IAS("Input1","0",false)
		  Input2=IAS("Input2","0",false)
		  Operation=IAS("Operation","",false)
		  
		  OutputTrue=IAS("OutputTrue","",false)
		  OutputFalse=IAS("OutputFalse","",false)
		  Output=IAS("Output","",false, AttributeGroups.System)
		  Output.ReadOnly = True
		  
		  ActionMode = IAE("ActionMode","0 none Step_out Goto")
		  
		  AddUserFunction("Add if-then-else", Output)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEnclosedElements(State as boolean)
		  Dim BS as BasicClass = FirstSubStep
		  Dim WithElseElement as boolean = false
		  
		  while BS<>nil
		    if BS IsA If_TRUE_StepClass then
		      WithElseElement=true
		      If_TRUE_StepClass(BS).DoSubSteps.SIAB(State)
		    end
		    if BS IsA If_FALSE_StepClass then
		      WithElseElement=true
		      If_FALSE_StepClass(BS).DoSubSteps.SIAB(not(State))
		    end
		    if not(WithElseElement) then
		      DoSubSteps.SIAB(State)
		    end
		    BS=BS.NextStep
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Dim r as boolean
		  Dim SetValue as string
		  Dim ST as BasicClass
		  Dim n,k as integer
		  Dim i1 as double =Me.Input1.GIAD
		  Dim i2 as double =Me.Input2.GIAD
		  
		  Select case Me.Operation.GIAS
		  case is="g",">"
		    r=Me.Input1.GIAD>Me.Input2.GIAD
		  case is="ge",">="
		    r=Me.Input1.GIAD>=Me.Input2.GIAD
		  case is="e","="
		    r=Me.Input1.GIAD=Me.Input2.GIAD
		  case is="s","<"
		    r=Me.Input1.GIAD<Me.Input2.GIAD
		  case is="se","<="
		    r=Me.Input1.GIAD<=Me.Input2.GIAD
		  case is="c"
		    r=Me.Input1.GIAS=Me.Input2.GIAS
		  case is = "contains"
		    r=Me.Input1.GIAS.InStr(Me.Input2.GIAS)<>0
		  end
		  
		  if r then
		    SetValue=Me.OutputTrue.GIAS
		    SetEnclosedElements(true)
		  else
		    SetValue=Me.OutputFalse.GIAS
		    SetEnclosedElements(false)
		  end
		  
		  
		  // if output is connected to a table set the table to the appropriate line
		  ST=Output.GIUS
		  if (ST <> Nil AND ST isA Table_StepClass) then
		    n=0
		    k=Table_StepClass(ST).NumberOfRows.GIAI
		    Table_StepClass(ST).SetTableRow(n)
		    'AddDebugTextCR("Check table entry "+str(n)+"  "+Me.Output.GIAS(n)+" to "+SetValue)
		    while  not(Me.Output.GIAS(n)=SetValue) and (n<(k-1))
		      n=n+1
		      Table_StepClass(ST).SetTableRow(n)
		      'AddDebugTextCR("Check table entry "+str(n)+"  "+Me.Output.GIAS(n)+" to "+SetValue)
		    wend
		    'AddDebugTextCR("Testreport found , set table to "+str(n))
		  else
		    Me.Output.SIAS(SetValue)
		  end
		  
		  Select case ActionMode.GIAI
		  case 1
		    if r then
		      SetExecutionFlag
		    end
		  case 2
		    Dim BS as BasicClass = UpperStep
		    while (BS<>nil) and not(BS IsA Test_StepClass)
		      BS=BS.UpperStep
		    wend
		    if r then
		      // try to get a link to a teststep on outputtrue
		      if OutputTrue.Link<>nil then
		        if (OutputTrue.Link.MyStep<>nil) and (OutputTrue.Link.MyStep IsA Test_StepClass) then
		          Test_StepClass(BS).SetGotoStep(Test_StepClass(OutputTrue.Link.MyStep),false)
		        end
		      else
		        // try to find teststep with outputtrue string
		        Dim GS as BasicClass = FindElement(OutputTrue.GIAS)
		        if GS<>nil then
		          if GS IsA Test_StepClass then
		            Test_StepClass(BS).SetGotoStep(Test_StepClass(GS),false)
		          end
		        end
		      end
		    else
		      // try to get a link to a teststep on outputfalse
		      if OutputFalse.Link<>nil then
		        if (OutputFalse.Link.MyStep<>nil) and (OutputFalse.Link.MyStep IsA Test_StepClass) then
		          Test_StepClass(BS).SetGotoStep(Test_StepClass(OutputFalse.Link.MyStep),false)
		        end
		      else
		        // try to find teststep with outputtrue string
		        Dim GS as BasicClass = FindElement(OutputFalse.GIAS)
		        if GS<>nil then
		          if GS IsA Test_StepClass then
		            Test_StepClass(BS).SetGotoStep(Test_StepClass(GS),false)
		          end
		        end
		      end
		    end
		  end
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  Case is = "Add if-then-else"
		    Dim No_TRUE_Found,No_FALSE_Found as boolean = true
		    Dim XML_Text_Pointer as integer = 1
		    Dim BS as BasicClass = FirstSubStep
		    while BS<>nil
		      if BS isA If_TRUE_StepClass then
		        No_TRUE_Found = false
		      end
		      if BS isA If_FALSE_StepClass then
		        No_FALSE_Found = false
		      end
		      BS=BS.NextStep
		    wend
		    if No_TRUE_Found then
		      Dim S as string =  "<if_TRUE Name=" + chr(34) + "if_TRUE"  + chr(34) + "  />"
		      Parse_XML(self,S,XML_Text_Pointer)
		    end
		    XML_Text_Pointer  = 1
		    if No_FALSE_Found then
		      Dim S as string = "<if_FALSE Name=" + chr(34) + "if_FALSE"  + chr(34) + "  />"
		      Parse_XML(self,S,XML_Text_Pointer)
		    end
		  else
		    
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ActionMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input1 As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input2 As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Operation As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Output As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		OutputFalse As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		OutputTrue As String_AttributeClass = nil
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
