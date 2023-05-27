#tag Module
Protected Module MathematicInterpretator
	#tag Method, Flags = &h0
		Function ABSOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return Abs(values(0).DoubleValue)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function AndOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0).BooleanValue And values(1).BooleanValue
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BITANDOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Dim a As Integer = values(0)
		    Dim b As Integer = values(1)
		    Return a And b
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BITNANDOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Dim a As Integer = values(0)
		    Dim b As Integer = values(1)
		    a = OnesComplement(a And b)
		    Return a
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BITNOROperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Dim a As Integer = values(0)
		    Dim b As Integer = values(1)
		    a = OnesComplement(a Or b)
		    Return a
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BITNOTOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Dim i As Integer = values(0)
		    i = OnesComplement(i)
		    Return i
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BITOROperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Dim a As Integer = values(0)
		    Dim b As Integer = values(1)
		    Return (a Or b)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function COSOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return Cos(values(0).DoubleValue)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DivOperation(values() As Variant) As Variant
		  If values.Ubound = 1 And values(1) <> 0.0 Then
		    Return values(0) / values(1)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EqualOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return (values(0) = values(1))
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EXPOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return Exp(values(0).DoubleValue)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GreaterEqualOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0) >= values(1)
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GreaterOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0) > values(1)
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IntegerDivOperation(values() As Variant) As Variant
		  If values.Ubound = 1 And values(1) <> 0.0 Then
		    Return values(0) \ values(1)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LessEqualOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0) <= values(1)
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LessOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0) < values(1)
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LNOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return Log(values(0).DoubleValue)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LOG10Operation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return Log(values(0).DoubleValue) / Log(10)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function LOGOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return Log(values(0).DoubleValue) / Log(values(1).DoubleValue)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MinusOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0) - values(1)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ModOperation(values() As Variant) As Variant
		  If values.Ubound = 1 And values(1) <> 0.0 Then
		    Return values(0) Mod values(1)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MultiOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0) * values(1)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotAndOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return Not(values(0).BooleanValue And values(1).BooleanValue)
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotEqualOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return (values(0) <> values(1))
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return Not values(0).BooleanValue
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function NotOrOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return Not(values(0).BooleanValue Or values(1).BooleanValue)
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag DelegateDeclaration, Flags = &h0
		Delegate Function OperationCalculator(values() As Variant) As Variant
	#tag EndDelegateDeclaration

	#tag Method, Flags = &h0
		Function OrOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0).BooleanValue Or values(1).BooleanValue
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PlusOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0) + values(1)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PowOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return Pow(values(0), values(1))
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RNDOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return (values(0) + (values(1) - values(0)) * Rnd)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RoundOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return Round(values(0))
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SINOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return Sin(values(0).DoubleValue)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQROperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return (values(0).DoubleValue) ^ 2
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQRTOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return (values(0).DoubleValue) ^ 0.5
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TANOperation(values() As Variant) As Variant
		  If values.Ubound = 0 Then
		    Return Tan(values(0).DoubleValue)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function XorOperation(values() As Variant) As Variant
		  If values.Ubound = 1 Then
		    Return values(0).BooleanValue Xor values(1).BooleanValue
		  End
		  Return False
		End Function
	#tag EndMethod


	#tag ViewBehavior
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
End Module
#tag EndModule
