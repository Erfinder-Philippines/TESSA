#tag Class
Protected Class Formula_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  If ChangedAttribute = Formula Then
		    UpdateFormulaAttributes(ChangedAttribute.GIAS)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Calculate()
		  For Each interpreterItem As MathematicInterpretator.Interpreter In mInterpreters
		    If interpreterItem <> Nil Then
		      Dim resultAttribute As AttributeClass = GetAttribute(interpreterItem.GetResultVariable)
		      If resultAttribute <> Nil Then
		        Dim n As Integer = 0
		        If IsIntputAttrsAsArray Then
		          Select Case Mode.GIAI
		          Case 0
		            Dim result As Variant
		            If CalculateValue(interpreterItem, GetIntputAttrsActiveValue, result) Then
		              If result.Type = Variant.TypeBoolean Then
		                resultAttribute.SIAB(result.BooleanValue)
		              Else
		                resultAttribute.SIAD(result)
		              End
		            Else
		              'Formula is wrong
		            End
		            Return
		          Case 1
		            n  = GetIntputAttrsActiveValue
		          Case 2
		            n  = GetIntputAttrsActiveValue + 1
		          Case 3
		            n  = GetIntputAttrsValuesCount
		          End
		          Dim multipleResultAttribute As MultipleValuesAttributeClass = MultipleValuesAttributeClass(resultAttribute)
		          If multipleResultAttribute <> Nil Then
		            multipleResultAttribute.DeleteAllValues
		            multipleResultAttribute.IsArray = True
		            For i As Integer = 0 To n - 1
		              multipleResultAttribute.AddValue("0")
		              Dim result As Variant
		              If CalculateValue(interpreterItem, i, result) Then
		                If result.Type = Variant.TypeBoolean Then
		                  resultAttribute.SIAB(result.BooleanValue)
		                Else
		                  resultAttribute.SIAD(result)
		                End
		              Else
		                'formula is wrong
		              End
		            Next
		          End
		        Else
		          Dim result As Variant
		          If CalculateValue(interpreterItem, -1, result) Then
		            If result.Type = Variant.TypeBoolean Then
		              resultAttribute.SIAB(result.BooleanValue)
		            Else
		              resultAttribute.SIAD(result)
		            End
		          Else
		            'formula is wrong
		          End
		        End
		      End
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CalculateValue(interpreterItem As MathematicInterpretator.Interpreter, index As Integer, ByRef result As Variant) As Boolean
		  If interpreterItem <> Nil Then
		    For i As Integer = FormulaAttributeStart + 1 To AttributesUbound
		      Dim attr As AttributeClass = GetAttribute(i)
		      If attr <> Nil Then
		        interpreterItem.SetVariableValue(attr.Name, attr.GIAD(index))
		      End
		    Next
		    result = interpreterItem.Calculate
		    Return interpreterItem.GetError = MathematicInterpretator.Interpreter.ParsingError.NoError
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  Mode = IAE("Mode", "0 Off ActiveValue-1 ActiveValue AllValues", False)
		  Formula = IAS("Formula", "", False)
		  Y = IAD("Y", 0, False)
		  Y.ReadOnly = True
		  X = IAD("X", 0, False)
		  
		  AddUserFunction("Calculate", Formula )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetIntputAttrsActiveValue() As Integer
		  Dim result As Integer = 0
		  For i As Integer = FormulaAttributeStart + 1 To AttributesUbound
		    Dim attr As AttributeClass = GetAttribute(i)
		    If attr <> Nil And attr.GIAA  > result Then
		      result = attr.GIAA
		    End
		  Next
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GetIntputAttrsValuesCount() As Integer
		  Dim result As Integer = 0
		  For i As Integer = FormulaAttributeStart + 1 To AttributesUbound
		    Dim attr As AttributeClass = GetAttribute(i)
		    If attr <> Nil And attr.GIAN  > result Then
		      result = attr.GIAN
		    End
		  Next
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function IsIntputAttrsAsArray() As Boolean
		  Dim result As Boolean = False
		  For i As Integer = FormulaAttributeStart + 1 To AttributesUbound
		    Dim attr As AttributeClass = GetAttribute(i)
		    If attr IsA MultipleValuesAttributeClass And MultipleValuesAttributeClass(attr).IsArray Then
		      result = True
		      Exit For
		    End
		  Next
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  UpdateFormulaAttributes(Formula.GIAS)
		  Super.Step_Init_AfterLoad
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Calculate
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As Boolean
		  UpdateFormulaAttributes(Formula.GIAS)
		  Return Super.Step_Start
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateFormulaAttributes(newValue As String)
		  newValue = newValue.Trim.ReplaceAll(Chr(13), "").ReplaceAll(Chr(9), "").ReplaceAll(" ", "").ReplaceAll(EndOfLine, "")
		  If newValue <> mFormulaOldValue Then
		    mFormulaOldValue = newValue
		    ReDim mInterpreters(-1)
		    
		    FormulaAttributeStart =GetAttributeNumber(Formula.Name) 
		    
		    Dim needToRemove(-1) As String
		    Dim k As Integer = GetAttributeNumber(X.Name) + 1
		    For i As Integer = FormulaAttributeStart + 1 To AttributesUbound
		      Dim attr As AttributeClass = GetAttribute(i)
		      If attr <> Nil Then
		        needToRemove.Append(attr.Name)
		      End
		    Next
		    
		    For Each item As String In newValue.Split(FormulaSeparator)
		      If item <> "" Then
		        Dim interpreterItem As new MathematicInterpretator.Interpreter
		        interpreterItem.Formula = item
		        if interpreterItem.GetError = MathematicInterpretator.Interpreter.ParsingError.NoError Then
		          
		          If GetAttribute(interpreterItem.GetResultVariable) = Nil Then
		            If interpreterItem.ContainsBooleanOperators Then
		              AddAttribute(interpreterItem.GetResultVariable, Str(0), "", AT_Boolean, 0, 0, AttributeGroups.Dynamic, True)
		            Else
		              AddAttribute(interpreterItem.GetResultVariable, Str(0), "", AT_Double, 0, 0, AttributeGroups.Dynamic, True)
		            End
		            Dim attr As AttributeClass = GetAttribute(interpreterItem.GetResultVariable)
		            if attr <> Nil Then
		              attr.ReadOnly = True
		            End
		          Else
		            Dim index As Integer = needToRemove.IndexOf(interpreterItem.GetResultVariable)
		            If index >= 0 Then
		              needToRemove.Remove(index)
		            End
		          End
		          
		          For Each variable As String In interpreterItem.GetVariables
		            If variable <> "" Then
		              If GetAttribute(variable) = Nil Then
		                AddAttribute(variable, Str(0), "", AT_Double, 0, 0, AttributeGroups.Dynamic, True)
		              Else
		                Dim index As Integer = needToRemove.IndexOf(variable)
		                If index >= 0 Then
		                  needToRemove.Remove(index)
		                End
		              End
		            End
		          Next
		        End
		        mInterpreters.Append(interpreterItem)
		      End
		    Next
		    
		    For Each item As String in needToRemove
		      If item <> "" Then
		        Call RemoveAttribute(item)
		      End
		    Next
		  End
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  Select Case FuncName
		  Case Is = "Calculate"
		    Call Step_Run
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Formula As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected FormulaAttributeStart As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFormulaOldValue As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mInterpreters() As MathematicInterpretator.Interpreter
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		X As double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Y As double_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = FormulaSeparator, Type = String, Dynamic = False, Default = \";", Scope = Protected
	#tag EndConstant


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
