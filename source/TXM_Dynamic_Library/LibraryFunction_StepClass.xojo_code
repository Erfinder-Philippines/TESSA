#tag Class
Protected Class LibraryFunction_StepClass
Inherits StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  Super.AttributeChanged(ChangedAttribute)
		  
		  If ChangedAttribute = Nil Then
		    Return
		  End If
		  
		  If (ChangedAttribute Is ReturnType) Or (ChangedAttribute Is Parameters) Then
		    UpdateArgumentAttributes
		    UpdateResultAttr
		  End If
		  
		  MainWindow.RedrawAttributeList
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as String) -- From StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  FunctionName = IAE("FunctionName", "", False)
		  Parameters = IAE("Parameters", GetParamTypesEnum, True)
		  ReturnType = IAE("ReturnType", GetReturnTypesEnum, False)
		  
		  UpdateArgumentAttributes
		  UpdateResultAttr
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function functionExists(dLib as DeclareLibraryMBS, functionName as String) As Boolean
		  Dim lines() As String
		  If dLib <> Nil Then
		    lines  = dLib.SymbolNames
		    
		    If lines.LastRowIndex = -1 Or functionName.IsEmpty Then
		      // no function
		      Return False
		    End If
		    
		    For Each f As String In lines
		      If functionName = f Then
		        Return True
		      End If
		    Next
		    
		  End If
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FunctionInvoke()
		  If mFunction = Nil Then
		    Break
		    Return
		  End If
		  
		  SetArguments
		  
		  If mArguments.LastRowIndex > -1 Then
		    mResult = mFunction.Invoke(mArguments)
		  Else
		    mResult = mFunction.Invoke
		  End If
		  
		  Dim ac As AttributeClass = Self.GetAttribute("ResultValue")
		  If ac Is Nil Then
		    Return
		  End If
		  
		  If ReturnType.GOAS = "Integer" Then
		    ac.SIAI(mResult.Int64Value)
		  Elseif ReturnType.GOAS = "Double" Then
		    ac.SIAD(mResult.DoubleValue)
		  Elseif ReturnType.GOAS = "String" Then
		    ac.SIAS(mResult.StringValue)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetArguments() As AttributeClass()
		  Dim count As Integer = Self.AttributesUbound
		  
		  Dim resultAttributes() As AttributeClass
		  
		  If count <= 0 Then
		    Return resultAttributes
		  End If
		  
		  For i As Integer = 0 To count
		    Dim ac As AttributeClass = Self.GetAttribute(i)
		    
		    If ac Is Nil Then
		      Continue
		    End If
		    
		    Dim attrName As String = ac.Name
		    
		    If attrName.IndexOf("Argument_") <> - 1 Then
		      resultAttributes.AddRow(ac)
		    End If
		  Next
		  
		  Return resultAttributes
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFunctionResult() As Variant
		  Return mResult
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetParamTypesEnum() As String
		  Dim s As String
		  s = "0 String Integer Double Boolean"
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetReturnTypesEnum() As String
		  Dim s As String
		  s = "0 String Integer Double Boolean Void"
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetValMemoryBlock(mvac as MultipleValuesAttributeClass) As Memoryblock
		  If Not mvac.IsArray Then
		    Return Nil
		  End If
		  
		  Const doubleSize As Integer = 8
		  Const int32Size As Integer = 4
		  Const int64Size As Integer = 8
		  
		  Dim mem As MemoryBlock
		  
		  If mvac IsA Integer_AttributeClass Then
		    
		    Dim iac As Integer_AttributeClass = Integer_AttributeClass(mvac)
		    Dim values() As Int64 = iac.Values
		    Dim arrSize As Integer = values.Count
		    
		    Dim limit As Integer = arrSize * int64Size
		    Dim itr As Integer = 0
		    mem = New MemoryBlock(arrSize * int64Size)
		    
		    For j As Integer = 0 To limit -1 Step int64Size
		      
		      Dim x As Int64 = values(itr)
		      mem.Int64Value(j) = x
		      
		      itr = itr + 1
		    Next
		    
		  Elseif mvac IsA Double_AttributeClass Then
		    
		    Dim dac As Double_AttributeClass = Double_AttributeClass(mvac)
		    Dim values() As Double = dac.Values
		    Dim arrSize As Integer = values.Count
		    Dim limit As Integer = arrSize * doubleSize
		    Dim itr As Integer = 0
		    mem = New MemoryBlock(arrSize * doubleSize)
		    
		    For j As Integer = 0 To limit -1 Step doubleSize
		      
		      Dim d As Double = values(itr)
		      mem.DoubleValue(j) = d
		      
		      itr = itr + 1
		    Next
		    
		  Elseif mvac IsA String_AttributeClass Then
		    
		    Dim sac As String_AttributeClass = String_AttributeClass(mvac)
		    Dim values() As String = sac.Values
		    Dim arrayByteSize As Integer
		    For Each s As String In values
		      arrayByteSize = arrayByteSize + s.Bytes + 1
		    Next
		    
		    mem = New MemoryBlock(arrayByteSize)
		    Dim offset As Integer = 0
		    For Each s As String In values
		      mem.CString(offset) = s
		      mem.Byte(offset + s.Bytes) = 0
		      offset = offset + s.Bytes + 1
		    Next
		    
		  End If
		  
		  Return mem
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub initFunction()
		  If myDll = Nil Then
		    // "Library does not exist."
		    Return
		  End If
		  
		  If mFunctionSignature.IsEmpty Then
		    // "Function signature invalid"
		    Return
		  End If
		  
		  If Self.UpperStep Is Nil Then
		    Return
		  End If
		  
		  Dim funcName As String = FunctionName.GOAS
		  
		  If funcName.IsEmpty Then
		    Return
		  End If
		  
		  Dim p As ptr = myDll.Symbol(funcName)
		  mFunction  = New DeclareFunctionMBS(mFunctionSignature, p)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveArgumentAttr()
		  // Removes all argument attributes
		  
		  Dim count As Integer = Self.AttributesUbound
		  
		  If count <= 0 Then
		    Return
		  End If
		  
		  Dim attrToRemove() As AttributeClass = GetArguments
		  
		  For i As Integer = 0 To attrToRemove.LastRowIndex
		    Call Self.RemoveAttribute(attrToRemove(i).Name)
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetArguments()
		  // This method stores all the Argument attribute values to mArguments() array
		  
		  mArguments.RemoveAllRows
		  
		  Dim arguments() As AttributeClass = GetArguments
		  
		  If arguments.LastRowIndex = -1 Then
		    Return
		  End If
		  
		  For i As Integer = 0 To arguments.LastRowIndex
		    Dim ac As AttributeClass = arguments(i)
		    Dim mvac As MultipleValuesAttributeClass
		    
		    If ac IsA MultipleValuesAttributeClass Then
		      mvac = MultipleValuesAttributeClass(ac)
		    Else
		      Continue
		    End If
		    
		    If mvac.IsArray Then
		      Dim valVariant As Variant = GetValMemoryBlock(mvac)
		      mArguments.AddRow(valVariant)
		      Continue
		    End If
		    
		    If mvac IsA Integer_AttributeClass And Not mvac.IsArray Then
		      mArguments.AddRow(mvac.GOAI)
		    Elseif mvac IsA Double_AttributeClass And Not mvac.IsArray Then
		      mArguments.AddRow(mvac.GOAD)
		    Elseif mvac IsA String_AttributeClass And Not mvac.IsArray Then
		      Dim mem As MemoryBlock = mvac.GOAS
		      mArguments.AddRow(mem)
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetFunctionSignature()
		  // Get all Arguments attributes
		  Dim count As Integer = Self.AttributesUbound
		  If count <= 0 Then
		    Return
		  End If
		  Dim arguments() As AttributeClass = GetArguments
		  
		  Dim parameterSignature As String = "("
		  // Identify what data type is the argument, and if it is an Array
		  For i As Integer = 0 To arguments.LastRowIndex
		    Dim ac As AttributeClass = arguments(i)
		    If ac Is Nil Then
		      Continue
		    End If
		    
		    If ac IsA MultipleValuesAttributeClass Then
		      Dim mvac As MultipleValuesAttributeClass = MultipleValuesAttributeClass(ac)
		      If mvac.IsArray And Not mvac IsA String_AttributeClass Then
		        parameterSignature = parameterSignature + DeclareFunctionMBS.kTypePtr
		      End If
		      
		      If ac IsA String_AttributeClass Then
		        parameterSignature = parameterSignature + DeclareFunctionMBS.kTypePtr + DeclareFunctionMBS.kTypeString
		      Elseif ac IsA Integer_AttributeClass Then
		        parameterSignature = parameterSignature + DeclareFunctionMBS.kTypeInt
		      Elseif ac IsA Double_AttributeClass Then
		        parameterSignature = parameterSignature + DeclareFunctionMBS.kTypeDouble
		      Elseif ac IsA Boolean_AttributeClass  Then
		        parameterSignature = parameterSignature + DeclareFunctionMBS.kTypeBool
		      End If
		      
		    End If
		  Next
		  
		  Dim funcReturnSignature As String
		  Dim dataType As String = ReturnType.GOAS
		  If dataType = "String" Then
		    funcReturnSignature = DeclareFunctionMBS.kTypeString
		  Elseif dataType = "Integer" Then
		    funcReturnSignature = DeclareFunctionMBS.kTypeInt
		  Elseif dataType = "Double" Then
		    funcReturnSignature = DeclareFunctionMBS.kTypeDouble
		  Elseif dataType = "Boolean"  Then
		    funcReturnSignature = DeclareFunctionMBS.kTypeBool
		  End If
		  
		  parameterSignature = parameterSignature + ")" + funcReturnSignature
		  
		  mFunctionSignature = parameterSignature
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowAvailableFunctions()
		  If Self.UpperStep Is Nil Then
		    Return
		  End If
		  
		  Dim dlStepClass As DynamicLibrary_StepClass
		  If Self.UpperStep IsA DynamicLibrary_StepClass Then
		    dlStepClass = DynamicLibrary_StepClass(Self.UpperStep)
		    
		    myDll = dlStepClass.LibraryInstance
		    If myDll Is Nil Then
		      Return
		    End If
		    
		    Dim func() As String = myDll.SymbolNames
		    Dim list As String = "0"
		    For Each f As String In func
		      list = list + " " + f
		    Next
		    FunctionName = IAE("FunctionName", list, True)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  
		  ShowAvailableFunctions
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Super.Step_Init_AfterLoad
		  
		  ShowAvailableFunctions
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  SetFunctionSignature
		  initFunction
		  FunctionInvoke
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateArgumentAttributes()
		  If Parameters = Nil Then
		    Return
		  End If
		  
		  RemoveArgumentAttr
		  If Parameters.Values.Count <= 0 Then
		    Return
		  End If
		  
		  Dim limit As Integer = Parameters.Values.LastRowIndex - 1
		  
		  For i As Integer = 0 To limit
		    Dim attrName As String = "Argument_" + Str(i+1)
		    Dim dataType As String = Parameters.GOAS(i)
		    
		    If Not dataType.IsEmpty Then
		      If dataType = "String" Then
		        Self.AddAttribute(attrName, "", "",AT_String, 0, 0)
		      Elseif dataType = "Integer" Then
		        Self.AddAttribute(attrName, "", "",AT_Integer, 0, 0)
		      Elseif dataType = "Double" Then
		        Self.AddAttribute(attrName, "", "",AT_Double, 0, 0)
		      Elseif dataType = "Boolean" Then
		        Self.AddAttribute(attrName, "", "",AT_Boolean, 0, 0)
		      End If
		      
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateResultAttr()
		  If ReturnType Is Nil Then
		    Return
		  End If
		  
		  Dim dataType As String = ReturnType.GOAS
		  Dim attrName As String = "ResultValue"
		  If Not dataType.IsEmpty Then
		    
		    Call Self.RemoveAttribute(attrName)
		    
		    If dataType = "String" Then
		      Self.AddAttribute(attrName, "", "",AT_String, 0, 0)
		    Elseif dataType = "Integer" Then
		      Self.AddAttribute(attrName, "", "",AT_Integer, 0, 0)
		    Elseif dataType = "Double" Then
		      Self.AddAttribute(attrName, "", "",AT_Double, 0, 0)
		    Elseif dataType = "Boolean" Then
		      Self.AddAttribute(attrName, "", "",AT_Boolean, 0, 0)
		    End If
		    
		  End If
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		FunctionName As Enum_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mArguments() As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFunction As DeclareFunctionMBS = Nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mFunctionSignature As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mResult As Variant
	#tag EndProperty

	#tag Property, Flags = &h21
		Private myDll As DeclareLibraryMBS = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameters As Enum_AttributeClass = Nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReturnType As Enum_AttributeClass = Nil
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
			Name="Untitled"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
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
			Name="Left"
			Visible=true
			Group="Position"
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
