#tag Class
Protected Class Interpreter
	#tag Method, Flags = &h0
		Sub AddBooleanOperator(name As String, priority As Integer, calculator As OperationCalculator, numberOfArguments As Integer = 2)
		  mOperations.Append(new Operation(name, priority, calculator, numberOfArguments, Operation.OperationType.BooleanType))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddFunction(name As String, calculator As OperationCalculator, numberOfArguments As Integer = 1)
		  mOperations.Append(new Operation(name, 0, calculator, numberOfArguments, Operation.OperationType.FunctionType))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddOperator(name As String, priority As Integer, calculator As OperationCalculator, numberOfArguments As Integer = 2)
		  mOperations.Append(new Operation(name, priority, calculator, numberOfArguments, Operation.OperationType.NumericType))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Calculate() As Variant
		  If mError = ParsingError.NoError And mRPNRecord <> "" Then
		    Dim items(-1) As String = mRPNRecord.Split(mRPNSeparator)
		    Dim stack(-1) As Variant
		    
		    For Each item As String In items
		      If IsNumeric(item) Then
		        stack.Append(Val(item))
		      ElseIf IsOperator(item) Or IsFunction(item) Then
		        Dim operationItem As MathematicInterpretator.Operation = GetOperation(item)
		        If operationItem <> Nil Then
		          Dim n As Integer = operationItem.NumberOfArguments
		          If (stack.Ubound + 1) < n Then
		            mError = ParsingError.MissedFunctionParameter
		            Return 0
		          Else
		            Dim parameters(-1) As Variant
		            For i As Integer = 1 To n
		              parameters.Insert(0, stack.Pop)
		            Next
		            stack.Append(operationItem.Calculate(parameters))
		          End
		        Else
		          mError = ParsingError.MissedOperator
		          Return 0
		        End
		      ElseIf IsCharacter(item) Then
		        If mVariables.HasKey(item) Then
		          stack.Append(mVariables.Value(item))
		        Else
		          mError = ParsingError.TooManyValues
		          Return 0
		        End
		      End
		    Next
		    If stack.Ubound = 0 Then
		      mError = ParsingError.NoError
		      Return stack(0)
		    Else
		      mError = ParsingError.TooManyValues
		    End
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ClearVariables()
		  mVariables.Clear
		  mVariables.Value(UnaryMinusVariable) = -1.0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(inputFormula As String = "")
		  mVariables = New Dictionary
		  mError = ParsingError.NoError
		  PopulateOperations
		  Formula = inputFormula
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsBooleanOperators() As Boolean
		  Return mContainsBooleanOperators
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function GenerateRPN(inputFormula As String) As String
		  mError = ParsingError.NoError
		  If FunctionArgumentsSeparator <> "" Then
		    Dim result(-1) As String
		    inputFormula = ParseResultVariable(inputFormula)
		    If mResultVariable = "" Then
		      mError = ParsingError.MissedResultVariable
		      Return ""
		    Else
		      Dim literals(-1) As String = PrepareStringForRPN(inputFormula)
		      ClearVariables
		      If literals.Ubound <> -1 Then
		        Dim stack(-1) As String
		        Dim item As String = ""
		        For Each item in literals
		          If IsBooleanOperator(item) Then
		            mContainsBooleanOperators = True
		          End
		          
		          If (Not IsFunction(item) And IsCharacter(item)) Then
		            result.Append(item)
		            If Not mVariables.HasKey(item) Then
		              mVariables.Value(item) = 0
		            End
		          ElseIf IsNumeric(item) Then
		            result.Append(item)
		          ElseIf IsFunction(item) Then
		            stack.Append(item)
		          ElseIf item = FunctionArgumentsSeparator Then
		            If stack.Ubound = -1 Then
		              mError = ParsingError.MissedFunctionParameterSeparator
		              Return ""
		            End
		            While stack(stack.Ubound) <> "("
		              result.Append(stack.Pop)
		              If stack.Ubound = -1 Then
		                mError = ParsingError.MissedFunctionParameterSeparator
		                Return ""
		              End
		            Wend
		          ElseIf item = ")" Then
		            If stack.Ubound = -1 Then
		              mError = ParsingError.MissedParenthesis
		              Return ""
		            End
		            While stack(stack.Ubound) <> "("
		              result.Append(stack.Pop)
		              If stack.Ubound = -1 Then
		                mError = ParsingError.MissedParenthesis
		                Return ""
		              End
		            Wend
		            Call stack.Pop
		            If stack.Ubound <> -1 And IsFunction(stack(stack.Ubound)) Then
		              result.Append(stack.Pop)
		            End
		          Elseif item = "(" Then
		            stack.Append(item)
		          ElseIf IsOperator(item) Then
		            If stack.Ubound = -1 Then
		              stack.Append(item)
		            ElseIf GetPriority(stack(stack.Ubound)) < GetPriority(item) Then
		              stack.Append(item)
		            Else
		              While (stack.Ubound <> -1 And GetPriority(stack(stack.Ubound)) >= GetPriority(item))
		                result.Append(stack.Pop)
		              Wend
		              stack.Append(item)
		            End
		          End
		        Next
		        
		        While stack.Ubound <> -1
		          item = stack.Pop
		          If IsOperator(item) Then
		            result.Append(item)
		          Else
		            mError = ParsingError.MissedOperator
		            Return ""
		          End
		        Wend
		      End
		      If result.Ubound <> -1 Then
		        Return Join(result, mRPNSeparator)
		      Else
		        mError = ParsingError.FormulaIsEmpty
		      End
		    End
		  Else
		    mError = ParsingError.MissedFunctionParameterSeparator
		  End
		  Return ""
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetAllPossibleOperatorNames() As String()
		  Dim names(-1) As String = Array("(", ")")
		  names.Append(FunctionArgumentsSeparator)
		  
		  For Each item As String in GetOperatorNames(MathematicInterpretator.Operation.OperationType.NumericType)
		    If item <> "" Then
		      names.Append(item)
		    End
		  Next
		  
		  For Each item As String in GetOperatorNames(MathematicInterpretator.Operation.OperationType.BooleanType)
		    If item <> "" Then
		      names.Append(item)
		    End
		  Next
		  
		  Dim wasSwapped As Boolean = True
		  Dim  i As Integer = 1
		  Dim size As Integer = names.Ubound + 1
		  While i <= size And wasSwapped
		    wasSwapped = False
		    For j As Integer = 0 To size - i - 1
		      If names(j).Len > names(j + 1).Len Then
		        Dim tmp As String = names(j)
		        names(j) = names(j + 1)
		        names(j + 1) = tmp
		        wasSwapped = True
		      End
		    Next
		    i = i + 1
		  Wend
		  Return names
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetError() As ParsingError
		  Return mError
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetOperation(operator As String) As Operation
		  For Each item As MathematicInterpretator.Operation In mOperations
		    If item <> Nil And item.Name = operator Then
		      Return item
		    End
		  Next
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetOperations(type As Operation.OperationType) As Operation()
		  'type
		  'BooleanType - boolean operators
		  'NumericType - number operators
		  'FunctionType - functions
		  Dim operations(-1) As Operation
		  For Each item As Operation in mOperations
		    If item <> Nil And item.Type = type Then
		      operations.Append(item)
		    End
		  Next
		  Return operations
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetOperatorNames(type As Operation.OperationType) As String()
		  'type
		  'BooleanType - boolean operators
		  'NumericType - number operators
		  'FunctionType - functions
		  Dim names(-1) As String
		  For Each item As Operation in GetOperations(type)
		    If item <> Nil Then
		      names.Append(item.Name)
		    End
		  Next
		  Return names
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetPriority(operator As String) As Integer
		  If operator = "(" Or operator = ")" Then
		    Return 0
		  Else
		    Dim operations(-1) As MathematicInterpretator.Operation = GetOperations(Operation.OperationType.NumericType)
		    For Each item As Operation In GetOperations(Operation.OperationType.BooleanType)
		      operations.Append(item)
		    Next
		    For Each item As Operation In operations
		      If item <> Nil And item.Name = operator Then
		        Return item.Priority
		      End
		    Next
		  End
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetResultVariable() As String
		  Return mResultVariable
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVariables() As String()
		  Dim names(-1) As String
		  For Each item As Variant in mVariables.Keys
		    If item <> UnaryMinusVariable Then
		      names.Append(item.StringValue)
		    End
		  Next
		  Return names
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsAllPossibleOperators(str As String) As Boolean
		  str = str.Lowercase
		  Return (str = "(" Or str = ")" Or str = FunctionArgumentsSeparator Or IsOperator(str))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsBooleanOperator(str As String) As Boolean
		  Return (GetOperatorNames(Operation.OperationType.BooleanType).IndexOf(str.Lowercase) <> -1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsCharacter(str As String) As Boolean
		  Return (Not IsAllPossibleOperators(str) And Not IsNumeric(str))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsFunction(str As String) As Boolean
		  Return (GetOperatorNames(Operation.OperationType.FunctionType).IndexOf(str.Lowercase) <> -1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsOperator(str As String) As Boolean
		  Return (GetOperatorNames(Operation.OperationType.NumericType).IndexOf(str.Lowercase) <> -1) Or IsBooleanOperator(str)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ParseResultVariable(input As String) As String
		  Dim assignOperatorIndex As Integer = input.InStr(AssignOperator)
		  Dim newOutput As String = input
		  If assignOperatorIndex > 1 Then
		    mResultVariable = input.Left(assignOperatorIndex - 1)
		    newOutput = input.Right(input.Len - assignOperatorIndex)
		  End
		  Return newOutput
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub PopulateOperations()
		  If mOperations.Ubound = -1 Then
		    AddOperator("+", 4, AddressOf PlusOperation)
		    AddOperator("-", 4, AddressOf MinusOperation)
		    AddOperator("*", 5, AddressOf MultiOperation)
		    AddOperator("/", 5, AddressOf DivOperation)
		    AddOperator("\", 5, AddressOf IntegerDivOperation)
		    AddOperator("mod", 5, AddressOf ModOperation)
		    AddOperator("^", 6, AddressOf PowOperation)
		    
		    AddFunction("abs", AddressOf AbsOperation)
		    AddFunction("round", AddressOf RoundOperation)
		    AddFunction("rnd", AddressOf RNDOperation, 2)
		    AddFunction("sqr", AddressOf SQROperation)
		    AddFunction("sqrt", AddressOf SQRTOperation)
		    
		    AddFunction("sin", AddressOf SINOperation)
		    AddFunction("cos", AddressOf COSOperation)
		    AddFunction("tan", AddressOf TANOperation)
		    
		    AddFunction("exp", AddressOf EXPOperation)
		    AddFunction("pow", AddressOf PowOperation, 2)
		    
		    AddFunction("log", AddressOf LOGOperation, 2)
		    AddFunction("log10", AddressOf LOG10Operation)
		    AddFunction("ln", AddressOf LNOperation)
		    
		    AddFunction("bitnot", AddressOf BITNOTOperation)
		    AddFunction("bitor", AddressOf BITOROperation, 2)
		    AddFunction("bitnor", AddressOf BITNOROperation, 2)
		    AddFunction("bitand", AddressOf BITANDOperation, 2)
		    AddFunction("bitnand", AddressOf BITNANDOperation, 2)
		    
		    AddBooleanOperator("<", 3, AddressOf LessOperation)
		    AddBooleanOperator(">", 3, AddressOf GreaterOperation)
		    AddBooleanOperator("<=", 3, AddressOf LessEqualOperation)
		    AddBooleanOperator(">=", 3, AddressOf GreaterEqualOperation)
		    
		    AddBooleanOperator("==", 1, AddressOf EqualOperation)
		    AddBooleanOperator("<>", 1, AddressOf NotEqualOperation)
		    
		    AddBooleanOperator("and", 1, AddressOf AndOperation)
		    AddBooleanOperator("nand", 1, AddressOf NotAndOperation)
		    AddBooleanOperator("or", 2, AddressOf OrOperation)
		    AddBooleanOperator("nor", 2, AddressOf NotOrOperation)
		    AddBooleanOperator("xor", 2, AddressOf XorOperation)
		    
		    AddBooleanOperator("not", 6, AddressOf NotOperation, 1)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PrepareStringForRPN(inputString As String) As String()
		  inputString = inputString.Trim.ReplaceAll(Chr(13), "").ReplaceAll(Chr(9), "").ReplaceAll(" ", "").ReplaceAll(EndOfLine, "")
		  Dim str As String = ""
		  'replace unary minus operator by UnaryMinusVariable
		  For i As Integer = 1 To inputString.Len
		    Dim item As String = inputString.Mid(i, 1)
		    If (item = "-" And i < inputString.Len And (IsCharacter(inputString.Mid(i + 1, 1)) Or IsNumeric(inputString.Mid(i + 1, 1)))) _
		      And (i = 1 Or (i > 1 And (IsOperator(inputString.Mid(i - 1, 1)) Or str.Mid(i - 1, 1) = "("))) Then
		      str = str + UnaryMinusVariable + "*"
		    Else
		      str = str + item
		    End
		  Next
		  
		  'remove unary plus operator as it is not needed
		  inputString = str
		  str = ""
		  For i As Integer = 1 To inputString.Len
		    Dim item As String = inputString.Mid(i, 1)
		    If (item = "+" And i < inputString.Len And (IsCharacter(inputString.Mid(i + 1, 1)) Or IsNumeric(inputString.Mid(i + 1, 1)))) _
		      And (i = 1 Or (i > 1 And (IsOperator(inputString.Mid(i - 1, 1)) Or str.Mid(i - 1, 1) = "("))) Then
		    Else
		      str = str + item
		    End
		  Next
		  
		  Return SplitInputString(str, GetAllPossibleOperatorNames)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVariableValue(name As String, value As Variant)
		  If mVariables.HasKey(name) Then
		    mVariables.Value(name) = value
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function SplitInputString(inputString As String, operatorNames() As String) As String()
		  Dim results(-1) As String
		  If inputString <> "" And operatorNames.Ubound >= 0 Then
		    Dim operatorName As String = operatorNames(operatorNames.Ubound)
		    operatorNames.Remove(operatorNames.Ubound)
		    If operatorName <> "" Then
		      Dim splitStrings(-1) As String = inputString.Split(operatorName)
		      Dim i As Integer = 0
		      For Each item As String In splitStrings
		        If item <> "" Then
		          
		          Dim names(-1) As String
		          For Each str As String In operatorNames
		            names.Append(str)
		          Next
		          
		          Dim subStrings(-1) As String = SplitInputString(item, names)
		          If subStrings.Ubound >= 0 Then
		            For Each str As String In subStrings
		              If str <> "" Then
		                results.Append(str)
		              End
		            Next
		          ElseIf item <> "" Then
		            results.Append(item)
		          End
		        End
		        If i <> splitStrings.Ubound Then
		          results.Append(operatorName)
		        End
		        i = i + 1
		      Next
		      
		    End
		  End
		  Return results
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mAssignOperator
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mAssignOperator = value
			End Set
		#tag EndSetter
		AssignOperator As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFormula
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If value <> mFormula Then
			    mContainsBooleanOperators = False
			    mFormula = value
			    mResultVariable = ""
			    mRPNRecord = GenerateRPN(mFormula)
			  End
			End Set
		#tag EndSetter
		Formula As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mFunctionArgumentsSeparator
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mFunctionArgumentsSeparator = value
			End Set
		#tag EndSetter
		FunctionArgumentsSeparator As String
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mAssignOperator As String = "="
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mContainsBooleanOperators As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mError As ParsingError = ParsingError.NoError
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFormula As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFunctionArgumentsSeparator As String = ","
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected Shared mOperations() As Operation
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResultVariable As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mRPNRecord As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mRPNSeparator As String = ";"
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mVariables As Dictionary = nil
	#tag EndProperty


	#tag Constant, Name = UnaryMinusVariable, Type = String, Dynamic = False, Default = \"umo", Scope = Protected
	#tag EndConstant


	#tag Enum, Name = ParsingError, Type = Integer, Flags = &h0
		NoError = 0
		  FormulaIsEmpty
		  MissedOperator
		  MissedParenthesis
		  MissedFunctionParameter
		  MissedFunctionParameterSeparator
		  TooManyValues
		MissedResultVariable
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="AssignOperator"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Formula"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FunctionArgumentsSeparator"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
	#tag EndViewBehavior
End Class
#tag EndClass
