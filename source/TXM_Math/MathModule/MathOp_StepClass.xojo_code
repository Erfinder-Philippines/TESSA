#tag Class
Protected Class MathOp_StepClass
Inherits StepClass
	#tag Method, Flags = &h21
		Private Sub ArrayValues(numel as integer)
		  
		  dim i as integer
		  
		  output.DeleteAllValues
		  for i = 0 to numel-1
		    Me.Output.addvalue("0")
		  next
		  
		  Select case Me.Operation.GIAI
		    
		  case is = 0 '+
		    for i = 0 to numel-1
		      Me.Output.SIAD(Me.Input1.GIAD(i)+Me.Input2.GIAD(i),i)
		    next
		    
		  case is = 1 '-
		    for i = 0 to numel-1
		      Me.Output.SIAD(Me.Input1.GIAD(i)-Me.Input2.GIAD(i),i)
		    next
		    
		  case is = 2 '*
		    for i = 0 to numel-1
		      Me.Output.SIAD(Me.Input1.GIAD(i)*Me.Input2.GIAD(i),i)
		    next
		    
		  case is = 3 '/
		    for i = 0 to numel-1
		      if abs(Me.Input2.GIAD(i))>0 then
		        Me.Output.SIAD(Me.Input1.GIAD(i)/Me.Input2.GIAD(i),i)
		      else
		        Me.Output.SOAS("inf",i)
		      end
		    next
		    
		  case is = 4 'RND
		    for i = 0 to numel-1
		      Me.Output.SIAD(Me.Input1.GIAD(i)+(Me.Input2.GIAD(i)-Me.Input1.GIAD(i))*RND,i)
		    next
		    
		  case is = 5 'ABS
		    for i = 0 to numel-1
		      Me.Output.SIAD(abs(Me.Input1.GIAD(i)-Me.Input2.GIAD(i)),i)
		    next
		    
		  case is = 6 'SIN
		    for i = 0 to numel-1
		      Me.Output.SIAD(Me.Input2.GIAD(i)*SIN(Me.Input1.GIAD(i)),i)
		    next
		    
		  case is = 7 'COS
		    for i = 0 to numel-1
		      Me.Output.SIAD(Me.Input2.GIAD(i)*COS(Me.Input1.GIAD(i)),i)
		    next
		    
		  case is = 8 'TAN
		    for i = 0 to numel-1
		      Me.Output.SIAD(Me.Input2.GIAD(i)*TAN(Me.Input1.GIAD(i)),i)
		    next
		    
		  case is = 9 'EXP
		    for i = 0 to numel-1
		      Me.Output.SIAD(Me.Input2.GIAD(i)*EXP(Me.Input1.GIAD(i)),i)
		    next
		    
		  case is = 10 'LOG10
		    for i = 0 to numel-1
		      if input1.GIAD(i) <= 0 then
		        Me.Output.SIAS("error",i)
		      else
		        Me.Output.SIAD(Me.Input2.GIAD(i)*(LOG(Me.Input1.GIAD(i))/LOG(10)),i)
		      end
		    next
		    
		  case is = 11 'LN
		    for i = 0 to numel-1
		      if input1.GIAD(i) <= 0 then
		        Me.Output.SIAS("error",i)
		      else
		        Me.Output.SIAD(Me.Input2.GIAD(i)*LOG(Me.Input1.GIAD(i)),i)
		      end
		    next
		    
		  case is = 12
		    for i = 0 to numel-1
		      if Me.Input1.GIAD(i)>0 then
		        Me.Output.SIAD(Me.Input2.GIAD(i)*Me.Input1.GIAD(i),i)
		      else
		        Me.Output.SIAD(0,i)
		      end
		    next
		    
		  case is = 13
		    for i = 0 to numel-1
		      if Me.Input1.GIAD(i)<0 then
		        Me.Output.SIAD(Me.Input2.GIAD(i)*Me.Input1.GIAD(i),i)
		      else
		        Me.Output.SIAD(0,i)
		      end
		    next
		    
		  case is = 14 'NOT
		    for i = 0 to numel-1
		      Me.Output.SIAB(NOT(Me.Input1.GIAB(i)),i)
		    next
		    
		  case is = 15'AND
		    for i = 0 to numel-1
		      Me.Output.SIAB(Me.Input1.GIAB(i) and Me.Input2.GIAB(i),i)
		    next
		    
		  case is = 16 'OR
		    for i = 0 to numel-1
		      Me.Output.SIAB(Me.Input1.GIAB(i) or Me.Input2.GIAB(i),i)
		    next
		    
		  case is = 17 'NAND
		    for i = 0 to numel-1
		      Me.Output.SIAB(not(Me.Input1.GIAB(i) and Me.Input2.GIAB(i)),i)
		    next
		    
		  case is = 18 'NOR
		    for i = 0 to numel-1
		      Me.Output.SIAB(not(Me.Input1.GIAB(i) or Me.Input2.GIAB(i)),i)
		    next
		    
		  case is = 19 'BITWISENOT
		    for i = 0 to numel-1
		      Me.Output.SIAI(OnesComplement(Me.Input1.GIAI(i)),i)
		    next
		    
		  case is = 20 'BITWISEAND
		    for i = 0 to numel-1
		      Me.Output.SIAI(Me.Input1.GIAI(i) and Me.Input2.GIAI(i),i)
		    next
		    
		  case is = 21 'BITWISEOR
		    for i = 0 to numel-1
		      Me.Output.SIAI(Me.Input1.GIAI(i) or Me.Input2.GIAI(i),i)
		    next
		    
		  case is = 22 'BITWISENAND
		    for i = 0 to numel-1
		      Me.Output.SIAI(OnesComplement(Me.Input1.GIAI(i) and Me.Input2.GIAI(i)),i)
		    next
		    
		  case is = 23 'BITWISENOR
		    for i = 0 to numel-1
		      Me.Output.SIAI(OnesComplement(Me.Input1.GIAI(i) or Me.Input2.GIAI(i)),i)
		    next
		    
		  case is = 24 'COPY
		    for i = 0 to numel-1
		      Me.Output.SIAD(Me.Input1.GIAD(i),i)
		    next
		    
		  case is = 25 'SUM
		    Dim S as double
		    for i = 0 to numel-1
		      S=S+Me.Input1.GIAD(i)
		    next
		    Me.Output.SIAD(S)
		    
		  case is = 26 'RMS
		    Dim S as double
		    for i = 0 to numel-1
		      S=S+(Me.Input1.GIAD(i)*Me.Input1.GIAD(i))
		    next
		    S=Sqrt(S/numel)
		    Me.Output.SIAD(S)
		    
		  case is = 27 'Numel
		    me.Output.siad(numel)
		    
		  case is = 28 'Hex to Dec
		    for i = 0 to numel-1
		      Me.Output.SIAD(val("&h"+Me.Input1.GIAS(i)),i)
		    next
		  case is = 29 'Dec to Hex
		    for i = 0 to numel-1
		      Me.Output.SIAS(Hex(Me.Input1.GIAD(i)),i)
		    next
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.Mode=Me.IAE("Mode","0 Off ActiveValue-1 ActiveValue AllValues",false)
		  Me.Input1=Me.IAS("Input1","0",false)
		  Me.Operation=Me.IAE("Operation","0 + - * / RND ABS SIN COS TAN EXP LOG LN PLUS NEG NOT AND OR NAND NOR BITNOT BITAND BITOR BITNAND BITNOR COPY SUM RMS NUMEL HexToDec DecToHex MOD",false)
		  Me.Input2=Me.IAS("Input2","0",false)
		  Me.Output=Me.IAS("Output","0",false)
		  Me.Operation1=Me.IAE("Operation1","0 + - * / RND ABS SIN COS TAN EXP LOG LN PLUS NEG NOT AND OR NAND NOR BITNOT BITAND BITOR BITNAND BITNOR COPY SUM RMS NUMEL HexToDec DecToHex MOD",false)
		  Me.Input3=Me.IAS("Input3","0",false)
		  Me.Output1=Me.IAS("Output1","0",false)
		  Me.Operation2=Me.IAE("Operation2","0 + - * / RND ABS SIN COS TAN EXP LOG LN PLUS NEG NOT AND OR NAND NOR BITNOT BITAND BITOR BITNAND BITNOR COPY SUM RMS NUMEL HexToDec DecToHex MOD",false)
		  Me.Input4=Me.IAS("Input4","0",false)
		  Me.Output2=Me.IAS("Output2","0",false)
		  
		  
		  'Me.Output=Me.IAD("Output",0,false, AttributeGroups.System)
		  'Me.Output.ReadOnly = True
		  
		  
		  
		  Me.Output.ReadOnly = false
		  
		  AddUserFunction(Calculate, Output.Name, "Calculate", 0,UF_RunMode_Direct)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SingleValue0()
		  Me.Output.SIAD(0)
		  Dim numel as integer
		  
		  Select case Me.Operation.GIAI
		    
		  case is = 0
		    Me.Output.SIAD(Me.Input1.GIAD+Me.Input2.GIAD)
		  case is = 1
		    Me.Output.SIAD(Me.Input1.GIAD-Me.Input2.GIAD)
		    
		  case is = 2
		    Me.Output.SIAD(Me.Input1.GIAD*Me.Input2.GIAD)
		    
		  case is = 3
		    if abs(Me.Input2.GIAD)>0 then
		      Me.Output.SIAD(Me.Input1.GIAD/Me.Input2.GIAD)
		    end
		    
		  case is = 4
		    Me.Output.SIAD(Me.Input1.GIAD+(Me.Input2.GIAD-Me.Input1.GIAD)*RND)
		    
		  case is = 5
		    Me.Output.SIAD(abs(Me.Input1.GIAD-Me.Input2.GIAD))
		    
		  case is = 6
		    Me.Output.SIAD(Me.Input2.GIAD*SIN(Me.Input1.GIAD))
		    
		  case is = 7
		    Me.Output.SIAD(Me.Input2.GIAD*COS(Me.Input1.GIAD))
		    
		  case is = 8
		    Me.Output.SIAD(Me.Input2.GIAD*TAN(Me.Input1.GIAD))
		    
		  case is = 9
		    Me.Output.SIAD(Me.Input2.GIAD*EXP(Me.Input1.GIAD))
		    
		  case is = 10
		    if input1.GIAD <= 0 then
		      Me.Output.SIAS("error")//doesnt work-> out = 0
		    else
		      Me.Output.SIAD(Me.Input2.GIAD*(LOG(Me.Input1.GIAD)/LOG(10)))
		    end
		    
		  case is = 11
		    if input1.GIAD <= 0 then
		      Me.Output.SIAS("error") //doesnt work-> out = 0
		    else
		      Me.Output.SIAD(Me.Input2.GIAD*(LOG(Me.Input1.GIAD)))
		    end
		    
		  case is = 12
		    if Me.Input1.GIAD>0 then
		      Me.Output.SIAD(Me.Input2.GIAD*Me.Input1.GIAD)
		    else
		      Me.Output.SIAD(0)
		    end
		    
		  case is = 13
		    if Me.Input1.GIAD<0 then
		      Me.Output.SIAD(Me.Input2.GIAD*Me.Input1.GIAD)
		    else
		      Me.Output.SIAD(0)
		    end
		  case is = 14
		    Me.Output.SIAB(NOT(Me.Input1.GIAB))
		    
		  case is = 15
		    Me.Output.SIAB(Me.Input1.GIAB and Me.Input2.GIAB)
		    
		  case is = 16
		    Me.Output.SIAB(Me.Input1.GIAB or Me.Input2.GIAB)
		    
		  case is = 17
		    Me.Output.SIAB(NOT(Me.Input1.GIAB and Me.Input2.GIAB))
		    
		  case is = 18
		    Me.Output.SIAB(NOT(Me.Input1.GIAB or Me.Input2.GIAB))
		    
		  case is = 19 'BITWISENOT
		    Me.Output.SIAI(OnesComplement(Me.Input1.GIAI))
		    
		  case is = 20 'BITWISEAND
		    Me.Output.SIAI(Me.Input1.GIAI and Me.Input2.GIAI)
		    
		  case is = 21 'BITWISEOR
		    Me.Output.SIAI(Me.Input1.GIAI or Me.Input2.GIAI)
		    
		  case is = 22 'BITWISENAND
		    Me.Output.SIAI(OnesComplement(Me.Input1.GIAI and Me.Input2.GIAI))
		    
		  case is = 23 'BITWISENOR
		    Me.Output.SIAI(OnesComplement(Me.Input1.GIAI or Me.Input2.GIAI))
		    
		  case is = 24 'COPY
		    Me.Output.SIAD(Me.Input1.GIAD)
		    
		  case is = 25 'SUM
		    'only applies to arrays
		    
		  case is = 26 'RMS
		    'only applies to arrays
		    
		  case is = 27 'NUMEL
		    numel =max( Input1.GIAN, Input2.GIAN)
		    Me.Output.SIAD(numel)
		    
		  case is = 28 'Hex to Dec
		    Me.Output.SIAD(val("&h"+Me.Input1.GIAS))
		    
		  case is = 29 'Dec to Hex
		    Me.Output.SIAS(Hex(Me.Input1.GIAD))
		    
		  case is = 30 'MOD
		    Me.Output.SIAI(Me.Input1.GIAD mod Me.Input2.GIAD)
		  end
		  
		  Dim res as String_AttributeClass = me.output
		  //end //single values operation
		  SingleValue1(me.Operation1.GIAI,res,me.Input3,me.Output1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SingleValue1(operator as Integer, in1 as String_AttributeClass, in2 as String_AttributeClass, out as String_AttributeClass)
		  out.SIAD(0)
		  Dim numel as integer
		  
		  Select case operator
		    
		  case is = 0
		    out.SIAD(in1.GIAD+in2.GIAD)
		  case is = 1
		    out.SIAD(in1.GIAD-in2.GIAD)
		    
		  case is = 2
		    out.SIAD(in1.GIAD*in2.GIAD)
		    
		  case is = 3
		    if abs(in2.GIAD)>0 then
		      out.SIAD(in1.GIAD/in2.GIAD)
		    end
		    
		  case is = 4
		    out.SIAD(in1.GIAD+(in2.GIAD-in1.GIAD)*RND)
		    
		  case is = 5
		    out.SIAD(abs(in1.GIAD-in2.GIAD))
		    
		  case is = 6
		    out.SIAD(in2.GIAD*SIN(in1.GIAD))
		    
		  case is = 7
		    out.SIAD(in2.GIAD*COS(in1.GIAD))
		    
		  case is = 8
		    out.SIAD(in2.GIAD*TAN(in1.GIAD))
		    
		  case is = 9
		    out.SIAD(in2.GIAD*EXP(in1.GIAD))
		    
		  case is = 10
		    if in1.GIAD <= 0 then
		      out.SIAS("error")//doesnt work-> out = 0
		    else
		      out.SIAD(in2.GIAD*(LOG(in1.GIAD)/LOG(10)))
		    end
		    
		  case is = 11
		    if in1.GIAD <= 0 then
		      out.SIAS("error") //doesnt work-> out = 0
		    else
		      out.SIAD(in2.GIAD*(LOG(in1.GIAD)))
		    end
		    
		  case is = 12
		    if in1.GIAD>0 then
		      out.SIAD(in2.GIAD*in1.GIAD)
		    else
		      out.SIAD(0)
		    end
		    
		  case is = 13
		    if in1.GIAD<0 then
		      out.SIAD(in2.GIAD*in1.GIAD)
		    else
		      out.SIAD(0)
		    end
		  case is = 14
		    out.SIAB(NOT(in1.GIAB))
		    
		  case is = 15
		    out.SIAB(in1.GIAB and in2.GIAB)
		    
		  case is = 16
		    out.SIAB(in1.GIAB or in2.GIAB)
		    
		  case is = 17
		    out.SIAB(NOT(in1.GIAB and in2.GIAB))
		    
		  case is = 18
		    out.SIAB(NOT(in1.GIAB or in2.GIAB))
		    
		  case is = 19 'BITWISENOT
		    out.SIAI(OnesComplement(in1.GIAI))
		    
		  case is = 20 'BITWISEAND
		    out.SIAI(in1.GIAI and in2.GIAI)
		    
		  case is = 21 'BITWISEOR
		    out.SIAI(Input1.GIAI or in2.GIAI)
		    
		  case is = 22 'BITWISENAND
		    out.SIAI(OnesComplement(in1.GIAI and in2.GIAI))
		    
		  case is = 23 'BITWISENOR
		    out.SIAI(OnesComplement(in1.GIAI or in2.GIAI))
		    
		  case is = 24 'COPY
		    out.SIAD(in1.GIAD)
		    
		  case is = 25 'SUM
		    'only applies to arrays
		    
		  case is = 26 'RMS
		    'only applies to arrays
		    
		  case is = 27 'NUMEL
		    numel =max( in1.GIAN, in2.GIAN)
		    out.SIAD(numel)
		    
		  case is = 28 'Hex to Dec
		    out.SIAD(val("&h"+in1.GIAS))
		    
		  case is = 29 'Dec to Hex
		    out.SIAS(Hex(in1.GIAD))
		    
		  case is = 30 'MOD
		    out.SIAI(in1.GIAD Mod in2.GIAD)
		  end
		  //end //single values operation
		  
		  SingleValue2(Operation2.GIAI,out,Input4,output2)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SingleValue2(operator as Integer, in1 as String_AttributeClass, in2 as String_AttributeClass, out as String_AttributeClass)
		  out.SIAD(0)
		  Dim numel as integer
		  
		  Select case operator
		    
		  case is = 0
		    out.SIAD(in1.GIAD+in2.GIAD)
		  case is = 1
		    out.SIAD(in1.GIAD-in2.GIAD)
		    
		  case is = 2
		    out.SIAD(in1.GIAD*in2.GIAD)
		    
		  case is = 3
		    if abs(in2.GIAD)>0 then
		      out.SIAD(in1.GIAD/in2.GIAD)
		    end
		    
		  case is = 4
		    out.SIAD(in1.GIAD+(in2.GIAD-in1.GIAD)*RND)
		    
		  case is = 5
		    out.SIAD(abs(in1.GIAD-in2.GIAD))
		    
		  case is = 6
		    out.SIAD(in2.GIAD*SIN(in1.GIAD))
		    
		  case is = 7
		    out.SIAD(in2.GIAD*COS(in1.GIAD))
		    
		  case is = 8
		    out.SIAD(in2.GIAD*TAN(in1.GIAD))
		    
		  case is = 9
		    out.SIAD(in2.GIAD*EXP(in1.GIAD))
		    
		  case is = 10
		    if in1.GIAD <= 0 then
		      out.SIAS("error")//doesnt work-> out = 0
		    else
		      out.SIAD(in2.GIAD*(LOG(in1.GIAD)/LOG(10)))
		    end
		    
		  case is = 11
		    if in1.GIAD <= 0 then
		      out.SIAS("error") //doesnt work-> out = 0
		    else
		      out.SIAD(in2.GIAD*(LOG(in1.GIAD)))
		    end
		    
		  case is = 12
		    if in1.GIAD>0 then
		      out.SIAD(in2.GIAD*in1.GIAD)
		    else
		      out.SIAD(0)
		    end
		    
		  case is = 13
		    if in1.GIAD<0 then
		      out.SIAD(in2.GIAD*in1.GIAD)
		    else
		      out.SIAD(0)
		    end
		  case is = 14
		    out.SIAB(NOT(in1.GIAB))
		    
		  case is = 15
		    out.SIAB(in1.GIAB and in2.GIAB)
		    
		  case is = 16
		    out.SIAB(in1.GIAB or in2.GIAB)
		    
		  case is = 17
		    out.SIAB(NOT(in1.GIAB and in2.GIAB))
		    
		  case is = 18
		    out.SIAB(NOT(in1.GIAB or in2.GIAB))
		    
		  case is = 19 'BITWISENOT
		    out.SIAI(OnesComplement(in1.GIAI))
		    
		  case is = 20 'BITWISEAND
		    out.SIAI(in1.GIAI and in2.GIAI)
		    
		  case is = 21 'BITWISEOR
		    out.SIAI(Input1.GIAI or in2.GIAI)
		    
		  case is = 22 'BITWISENAND
		    out.SIAI(OnesComplement(in1.GIAI and in2.GIAI))
		    
		  case is = 23 'BITWISENOR
		    out.SIAI(OnesComplement(in1.GIAI or in2.GIAI))
		    
		  case is = 24 'COPY
		    out.SIAD(in1.GIAD)
		    
		  case is = 25 'SUM
		    'only applies to arrays
		    
		  case is = 26 'RMS
		    'only applies to arrays
		    
		  case is = 27 'NUMEL
		    numel =max( in1.GIAN, in2.GIAN)
		    out.SIAD(numel)
		    
		  case is = 28 'Hex to Dec
		    out.SIAD(val("&h"+in1.GIAS))
		    
		  case is = 29 'Dec to Hex
		    out.SIAS(Hex(in1.GIAD))
		    
		  case is = 30 'MOD
		    out.SIAI(in1.GIAD mod in2.GIAD)
		  end
		  //end //single values operation
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  Dim FA1,FA2 as AttributeClass
		  Dim n, numel as integer
		  
		  FA1 = me.Input1.GIA
		  FA2 = me.Input2.GIA
		  
		  If (FA1 IsA MultipleValuesAttributeClass And MultipleValuesAttributeClass(FA1).IsArray) _
		    Or (FA2 IsA MultipleValuesAttributeClass And MultipleValuesAttributeClass(FA2).IsArray) Then
		    //numel =max( FA1.GIAN, FA2.GIAN)
		    
		    Select case Me.Mode.GIAI
		    case 0
		      SingleValue0  // only active values are beeing processed
		    case 1
		      n=max(FA1.GOAA,FA2.GOAA) 'Activevalue -1
		      ArrayValues(n)
		    case 2
		      n=max(FA1.GOAA+1,FA2.GOAA+1) 'ActiveValue
		      ArrayValues(n)
		    case 3
		      n=max(FA1.GIAN, FA2.GIAN) ' Allvalues
		      ArrayValues(n)
		    else
		      n=0
		    end
		  else
		    SingleValue0
		  end
		  
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  Case is = "Calculate"
		    Dim B as boolean = Step_Run
		  End
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Input1 As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input2 As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input3 As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Input4 As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Operation As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Operation1 As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Operation2 As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Output As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Output1 As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Output2 As String_AttributeClass = nil
	#tag EndProperty


	#tag Constant, Name = Calculate, Type = String, Dynamic = False, Default = \"Calculate", Scope = Protected
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
