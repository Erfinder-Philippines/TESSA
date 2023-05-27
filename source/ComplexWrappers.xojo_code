#tag Module
Protected Module ComplexWrappers
	#tag Method, Flags = &h0
		Function Abs(c as complex) As double
		  // Absolute Value of a complex number
		  Return c.Abs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Acos(c as complex) As complex
		  // Arc cosine of a complex number
		  Return c.Acos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Acosh(c as complex) As complex
		  // Inverse hyperbolical cosine of a complex number
		  Return c.Acosh
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Arg(c as complex) As double
		  // Argument (angle) of a complex number
		  Return c.Arg
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Asin(c as complex) As complex
		  // Arc sine of a complex number
		  Return c.Asin
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Asinh(c as complex) As complex
		  // Inverse hyperbolical sine of a complex number
		  Return c.Asinh
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Atan(c as complex) As complex
		  // Arc tangent of a complex number
		  Return c.Atan
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Atanh(c as complex) As complex
		  // Inverse hyperbolical tangent of a complex number
		  Return c.Atanh
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cmpl(r as double, i as double) As complex
		  // Creates a complex number with Real part r and imaginary part i
		  dim cp as new Complex(r, i)
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Conj(c as complex) As complex
		  // Complex Conjucate of a complex number
		  return c.Conj
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cos(c as complex) As complex
		  // Cosine of a complex number
		  return c.cos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cosec(c as complex) As complex
		  // Cosecant of a complex number
		  Return c.Cosec
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cosh(c as complex) As complex
		  // Hyperbolical cosine of a complex number
		  Return c.cosh
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cot(c as Complex) As complex
		  // Cotangent of a complex number
		  Return c.Cot
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Exp(c as complex) As complex
		  // Expnential of a complex number
		  return c.Exp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(c as complex, FormatSpec as String) As String
		  // Complex number as formatted string
		  return c.Format(FormatSpec)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Im(d as double) As complex
		  // Creates a complex number with imaginary part d
		  dim cp as new Complex(0, d)
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Imag(c as complex) As double
		  // Imaginary part of a complex number
		  Return c.Imag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Inv(c as complex) As complex
		  // Inverse of a complex number
		  Return c.Inv
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Log(c as complex) As complex
		  // Natural logarithm of a complex number
		  Return c.log
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Norm(c as complex) As double
		  // Norm ("square length") of a complex number
		  Return c.Norm
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Pol2Rect(abs as double, arg as double) As complex
		  // Converts polar to rectangular coordinates
		  
		  dim cp as new Complex
		  
		  cp.Pol2Rect(abs, arg)
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Re(d as double) As Complex
		  // Creates a complex number with Real part d
		  dim cp as new Complex(d, 0)
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Real(c as complex) As double
		  // Real part of a complex number
		  Return c.Real
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sec(c as complex) As complex
		  // Secant of a complex number
		  Return c.Sec
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sin(c as Complex) As complex
		  // Sine of a complex number
		  Return c.sin
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sinh(c as Complex) As Complex
		  // Hyperbolical sine of a complex number
		  Return c.Sinh
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sqrt(c as complex) As Complex
		  // Square root of a complex number
		  return c.Sqrt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tan(c as complex) As complex
		  // Tangent of a complex number
		  return c.tan
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tanh(c as Complex) As Complex
		  // Hyperbolical Tangent of a complex number
		  Return c.tanh
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
