#tag Class
Protected Class Complex
	#tag Method, Flags = &h0
		Function Abs() As double
		  // Absolute Value of a complex number
		  
		  // abs(z)  =  sqrt(norm(z))
		  
		  return sqrt(me.Norm)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Acos() As complex
		  // Principal arc cosine of a complex number
		  
		  // acos(z)  =  -i * log( z + i * sqrt(1 - z*z) )
		  
		  dim cp as new Complex
		  dim i as new Complex(0,1)
		  
		  cp = -i * Complex(me + i * Complex(1 - me*me).Sqrt).Log
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Acosh() As complex
		  // Principal inverse hyperbolic cosine of a complex number
		  
		  // acosh(z)  =  log(z + sqrt(z*z - 1))
		  
		  dim cp as new Complex
		  
		  cp = Complex(me + Complex(me*me - 1).sqrt).log
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Arg() As double
		  // Argument Value (Angle) of a complex number
		  
		  if mReal = 0 and mImag = 0 then return 0 // special case
		  
		  // find out which quadrant the number is in
		  if mReal >= 0 then
		    Return ATan(mImag / mReal) // quadrant 1 and 4
		  else
		    if mImag >= 0 then
		      Return ATan(mImag / mReal) + Pi // quadrant 2
		    else
		      Return ATan(mImag / mReal) - Pi
		    end if
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Asin() As complex
		  // Principal arc sine of a complex number
		  
		  // asin(z)  =  -i * log(i*z + sqrt(1 - z*z))
		  
		  dim cp as new Complex
		  dim i as new Complex(0,1)
		  
		  cp = -i * Complex(i*me + Complex(1 - me*me).Sqrt).Log
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Asinh() As complex
		  // Principal inverse hyperbolic sine of a complex number
		  
		  // asinh(z)  =  log(z + sqrt(z*z + 1))
		  
		  dim cp as new Complex
		  
		  cp = Complex(me + Complex(me*me + 1).sqrt).log
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Atan() As complex
		  // Principal arc tangent of a complex number
		  
		  // atan(z)  =  -i/2 * log( (i-z)/(i+z) )
		  
		  dim cp as new Complex
		  dim i as new Complex(0,1)
		  
		  cp = -i /2 * Complex( (i - me) / (i + me) ).Log
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Atanh() As complex
		  // Principal inverse hyperbolic  tangent of a complex number
		  
		  // atanh(z)  =  1/2 * log( (1+z)/(1-z) )
		  
		  dim cp as new Complex
		  dim i as new Complex(0,1)
		  
		  cp = 1/2 * Complex( (1 + me) / (1 - me) ).Log
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Conj() As complex
		  // Complex Conjugate of a complex number
		  
		  // conj(x + i*y)  =  x - i*y
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal
		  cp.Imag = - mImag
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  mImag = 0
		  mReal = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Real as double, Imag as double)
		  mImag = Imag
		  mReal = Real
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ComplexStr as String)
		  mReal = 0
		  mImag = 0
		  
		  // parse ComplexStr
		  dim i as integer
		  dim s as string
		  dim signs() as integer
		  dim signspos() as integer
		  
		  // find the positions of the signs
		  signs.Append 1
		  signspos.Append 0
		  ComplexStr = Trim(ComplexStr)
		  for i = 1 to len(ComplexStr)
		    s = mid(ComplexStr, i, 1)
		    if s = "+" then
		      signs.Append 1
		      signspos.Append i
		    ElseIf s = "-" then
		      signs.Append 1
		      signspos.Append i
		    end if
		  next
		  signs.Append 1
		  signspos.Append len(ComplexStr)+1
		  
		  // find the numbers between the signs
		  dim d as Double
		  for i = 0 to UBound(signs)-1
		    s = trim(mid(ComplexStr, signspos(i), signspos(i+1)-signspos(i)))
		    d = CDbl(s) * signs(i)
		    if right(s, 1) = "j" or right(s, 1) = "J" or right(s, 1) = "i" or right(s, 1) = "I" then
		      mImag = mImag + d
		    else
		      mReal = mReal + d
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cos() As complex
		  // Cosine of a complex number
		  
		  // cos(z)  =  ( exp(i*z) + exp(-i*z) ) / 2
		  
		  dim cp as new Complex
		  
		  dim i as new Complex(0,1)
		  
		  cp = ( me.Operator_Multiply(i).Exp + me.Operator_Multiply(-i).exp ) / 2
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cosec() As complex
		  // Cosecant of a complex number
		  
		  // cosec(z)  =  1 / sin(z)
		  
		  dim cp as new Complex
		  
		  cp = 1 / me.sin
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cosh() As complex
		  // Hyperbolic cosine of a complex number
		  
		  // cosh(z) = ( exp(z) + exp(-z)) / 2
		  
		  dim cp as new Complex
		  
		  cp = (me.exp + me.Operator_Negate.Exp) / 2
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Cot() As Complex
		  // Cotangent of a complex number
		  
		  // cot(z)  =  1 / tan(z)
		  
		  dim cp as new Complex
		  
		  cp = 1 / me.tan
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Exp() As complex
		  // complex exponential
		  
		  // exp(x + i*y)  =  exp(x) * ( cos(y) + i * sin(y) )
		  
		  dim cp as new Complex
		  
		  cp.Real = exp(mReal) * cos(mImag)
		  cp.Imag = exp(mReal) * sin(mImag)
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Format(FormatSpec as String) As String
		  // converts a complex number to a formatted string
		  
		  dim s as String
		  
		  if mImag < 0 then
		    s =  format(mReal, FormatSpec) +  format(mImag, FormatSpec) + "j"
		  else
		    s = format(mReal, FormatSpec) + "+" +  format(mImag, FormatSpec) + "j"
		  end if
		  
		  if InStr(s,"NaN") > 0 then s = "NaN"
		  
		  Return s
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Imag() As double
		  Return mImag
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Imag(assigns im as double)
		  mImag = im
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Inv() As Complex
		  // Inverse of a complex number
		  
		  // inv(z)  =  1 / z
		  
		  dim cp as new Complex
		  
		  cp = 1 / me
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Log() As complex
		  // Natural logarithm of a complex number
		  
		  // log(z)  =  log(abs(z)) + i * arg(z)
		  
		  dim cp as new Complex
		  
		  cp.Real = log(me.Abs)
		  cp.Imag = me.Arg
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Norm() As double
		  // Square of the "length" of a complex number
		  
		  // norm(x + i*y)  =  x*x + y*y
		  
		  return mReal^2 + mImag^2
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(c as complex) As complex
		  // Sum of two Complex numbers
		  
		  // (a + i*b) + (c + i*d)  =  ((a+c) + i*(b+d))
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal + c.Real
		  cp.Imag = mImag + c.Imag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Add(d as double) As complex
		  // Sum of a complex number and a real number
		  
		  // (a + i*b) + d  =  ((a+d) + i*b)
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal + d
		  cp.Imag = mImag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_AddRight(d as double) As complex
		  // Sum of a complex number and a real number
		  
		  // (a + i*b) + d  =  ((a+d) + i*b)
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal + d
		  cp.Imag = mImag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Convert() As String
		  if mImag < 0 then return Cstr(mReal) + CStr(mImag) + "j"
		  return Cstr(mReal) + "+" + CStr(mImag) + "j"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Divide(c as complex) As complex
		  // Division of two Complex numbers
		  
		  // (a + i*b) / (c + i*d)  =  ( (a*c) + (b*d) + i*((b*c) - (a*d)) ) / norm(c + i*d)
		  
		  dim cp as new Complex
		  
		  cp.Real = (mReal * c.Real + mImag * c.Imag) / (c.Real^2 + c.Imag^2)
		  cp.Imag = (mImag * c.Real - mReal * c.Imag) / (c.Real^2 + c.Imag^2)
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Divide(d as double) As complex
		  // Product of a complex number and a real number
		  
		  // (a + i*b) / d  =  ( (a/d) + i*(b/d) )
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal / d
		  cp.Imag = mImag / d
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_DivideRight(c as complex) As complex
		  // Division of two Complex numbers
		  
		  // (a + i*b) / (c + i*d)  =  ( (a*c) + (b*d) + i*((b*c) - (a*d)) ) / norm(c + i*d)
		  
		  dim cp as new Complex
		  
		  cp.Real = (c.Real * mReal + c.Imag * mImag) / (mReal^2 + mImag^2)
		  cp.Imag = (c.Imag * mReal - c.Real * mImag) / (mReal^2 + mImag^2)
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_DivideRight(d as double) As complex
		  // Division of two Complex numbers
		  
		  // (a + i*b) / d  =  ( (a/d) + i*(a/d) )
		  
		  dim cp as new Complex
		  
		  cp.Real = (d * mReal) / (mReal^2 + mImag^2)
		  cp.Imag = ( - d * mImag) / (mReal^2 + mImag^2)
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Multiply(c as complex) As complex
		  // Product of two Complex numbers
		  
		  // (a + i*b) * (c + i*d)  =  ( (a*c) - (b*d) + i*((a*d) + (b*c)) )
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal * c.Real - mImag * c.Imag
		  cp.Imag = mReal * c.Imag + mImag * c.Real
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Multiply(d as double) As complex
		  // Product of a complex number and a real number
		  
		  // (a + i*b) * d  =  ( (a*d) + i*(b*d) )
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal * d
		  cp.Imag = mImag * d
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_MultiplyRight(d as double) As complex
		  // Product of a complex number and a real number
		  
		  // (a + i*b) * d  =  ( (a*d) + i*(b*d) )
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal * d
		  cp.Imag = mImag * d
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Negate() As complex
		  // Negate a complex number
		  
		  // neg(a + i*b)  =  -a - i*b
		  
		  dim cp as new Complex
		  
		  cp.Real = - mReal
		  cp.Imag = - mImag
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Power(c as complex) As complex
		  // Raising a complex number to a complex power
		  
		  // z ^ y = ( abs(z)^Re(y) * exp(-Im(y) * arg(z)) ) * ( cos(Re(y) * arg(z) +d * log(abs(z))) + i * sin(Re(y) * arg(z) +d * log(abs(z)))
		  
		  dim cp as new Complex
		  
		  cp.Real = me.Abs^c.Real * exp(-c.Imag*me.Arg) * cos(c.Real*me.arg + c.Imag*log(me.Abs))
		  cp.Imag = me.Abs^c.Real * exp(-c.Imag*me.Arg) * sin(c.Real*me.arg + c.Imag*log(me.Abs))
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Power(d as double) As complex
		  // Exponential with a Complex base and a real exponent
		  
		  // z^d  =  abs(z)^d * ( cos(d * arg(z)) + i * sin(d * arg(z)) )
		  
		  dim cp as new Complex
		  
		  cp.Real =  me.Abs^d * cos(d * me.arg)
		  cp.Imag =  me.Abs^d * sin(d * me.arg)
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_PowerRight(d as double) As complex
		  // Raising a real number to a complex power
		  
		  // d^(a + i*b) = d^a * (cos(log(d) * b) + i * sin(log(d) * b))
		  
		  dim cp as new Complex
		  
		  cp.Real = d^mReal * cos(log(d) * mImag)
		  cp.Imag = d^mReal * sin(log(d) * mImag)
		  
		  return cp
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subtract(c as complex) As complex
		  // Difference of two Complex numbers
		  
		  // (a + i*b) - (c + i*d)  =  ((a-c) + i*(b-d))
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal - c.Real
		  cp.Imag = mImag - c.Imag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_Subtract(d as double) As complex
		  // Difference of a complex number and a real number
		  
		  // (a + i*b) - d  =  ((a-d) + i*b)
		  
		  dim cp as new Complex
		  
		  cp.Real = mReal - d
		  cp.Imag = mImag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Operator_SubtractRight(d as double) As complex
		  // Difference of a complex number and a real number
		  
		  // d - (a + i*b)  =  ((d-a) - i*b)
		  
		  dim cp as new Complex
		  
		  cp.Real = d - mReal
		  cp.Imag = - mImag
		  
		  Return cp
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Pol2Rect(abs as double, arg as double)
		  // Converts polar to rectangular coordinates
		  
		  mReal = abs * cos(arg)
		  mImag = abs * sin(arg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Real() As double
		  Return mReal
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Real(assigns re as double)
		  mReal = re
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sec() As complex
		  // Secant of a complex number
		  
		  // sec(z)  =  1 / cos(z)
		  
		  dim cp as new Complex
		  
		  cp = 1 / me.cos
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sin() As complex
		  // Sin of a complex number
		  
		  // sin(z)  =  ( exp(i*z) - exp(-i*z) ) / (2*i)
		  
		  dim cp as new Complex
		  
		  dim i as new Complex(0,1)
		  
		  cp = ( me.Operator_Multiply(i).Exp - me.Operator_Multiply(-i).exp ) / (2 * i)
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sinh() As complex
		  // Hyperbolic sine of a complex number
		  
		  // sinh(z) = ( exp(z) - exp(-z)) / 2
		  
		  dim cp as new Complex
		  
		  cp = (me.exp - me.Operator_Negate.Exp) / 2
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Sqrt() As complex
		  // Square Root of a complex number
		  
		  // sqrt(z)  =  sqrt(abs(z)) * ( cos(arg(z)/2) + i * sin(arg(z)/2) )
		  
		  dim cp as new Complex
		  
		  if mImag = 0 then // number is real
		    if mReal >= 0 then
		      cp.Real = sqrt(mReal)
		      cp.Imag = 0
		    else
		      cp.Real = 0
		      cp.Imag = sqrt(abs(mReal))
		    end if
		  else // number is Complex
		    cp.Real = Sqrt(me.Abs) * cos(me.Arg/2)
		    cp.Imag = Sqrt(me.Abs) * sin(me.Arg/2)
		  end if
		  
		  Return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tan() As complex
		  // Tangent of a complex number
		  
		  // tan(z)  =  sin(z) / cos(z)
		  
		  dim cp as new Complex
		  
		  cp = me.sin / me.cos
		  
		  return cp
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Tanh() As complex
		  // Hyperbolic tangens of a complex number
		  
		  // tanh(z)  =  sinh(z) / cosh(z)
		  
		  dim cp as new Complex
		  
		  cp = me.sinh / me.cosh
		  
		  return cp
		End Function
	#tag EndMethod


	#tag Note, Name = Contributors
		CONTRIBUTIONS
		
		The following people have contributed to the development of ComplexUtils:
		
		Roger Meier, roger.meier@pobox.com (administrative contact)
		
		
		Anyone who can think of features that should be implemented is kindly invited
		make a contribution and send them to the administrative contact.
		
		
		
		ACKNOWLEDGEMENTS:
		
		The idea for the Unit Test Harness was "borrowed" from Joe Strout, the
		administrative contact and major contributor for OpenSource projects
		such as "StringUtils" and "ArrayUtils", currently available at this URL:
		
		http://www.verex.com/opensource/
		
	#tag EndNote

	#tag Note, Name = Documentation
		WHAT IS THIS?
		
		The ComplexUtils class implements support for complex numbers with Double precision.
		The ComplexWrappers Module consists mainly of wrappers for the ComplexUtils class for
		convenience, as well as a few functions for conversions. The class can be used without the module.
		
		
		
		CREATING A NEW COMPLEX VARIABLE
		
		The Constructor accepts optional arguments of type double or string to assign a value to the
		complex number when it is first initialized:
		
		E.g.
		
		dim c1 as new Complex // Real and Imaginary parts are initialized to 0
		dim c2 as new Complex(1,-3) // Real part = 1 and Imaginary part = -3
		dim c3 as new Complex("3+5j") // Real part = 3 and Imaginary part = 5
		
		The string for the latter case must be formatted like one of theses examples:
		"3+5j", "-2.56+3.72j", "4-1.1j", "4", "2j", "-2.41", "-1.23j", " -3j+2", "1j-5.41"
		
		The imaginary part identifier "j" must be accompanied by a number, i.e. "1+j" is not a
		valid string. The identifier can be "j", "J", "i", or "I".
		
		
		If the ComplexWrappers module is installed, complex numbers can also be created
		with one of the following functions:
		
		Cmpl(r, i) // returns a new Complex number with real part r and imaginary part i
		Re(d) // returns a new "real" Complex with real part d, i.e. it converts a real number to it's complex equivalent
		Im(d) // creates a complex number with imaginary part d, the real part is 0
		Pol2Rect(abs, arg) // creates a complex number with absolute value abs and argument arg
		
		These functions can be used in expressions as follows:
		
		dim c as Complex
		dim a as Double = 1.234
		dim b as Double = -5.678
		
		c = a + b * Im(1) // c = a + bj
		
		
		
		RECTANGULAR AND POLAR COORDINATES
		
		The value of a complex number can be assigned and obtained in both rectangular or polar coordinates
		in one of these ways:
		
		// Assigning value in rectangular coordinates, e.g. 3-4j
		c = new Complex(3,-4)
		
		c = new Complex
		c = Cmpl(3,-4) // requires ComplexWrappers module
		
		c = new Complex
		c.Real = 3
		c.Imag = -4
		
		// Obtaining value in rectangular coordinates
		r = c.Real
		i = c.Imag
		
		r = Real(c) // requires ComplexWrappers module
		i = Imag(c) // requires ComplexWrappers module
		
		// Assigning value in polar coordinates
		c = new Complex
		c.Pol2Rect(1, 1.414)
		
		c = Pol2Rect(1, 1.414) // requires ComplexWrappers module
		
		// Obtaining value in polar coordinates
		ab = c.Abs
		ar = c.Arg
		
		ab = Abs(c) // requires ComplexWrappers module
		ar = Arg(c) // requires ComplexWrappers module
		
		
		
		// STANDARD OPERATORS
		
		The standard operators +, -, *, /, and ^ are overloaded with the appropriate functions to allow the use
		of these operators with complex numbers. Each of these operators accepts either complex numbers
		or built-in numerical data types (Integer, Double, etc.) on one or both sides.
		
		E.g. using the + operator, two complex numbers can be added, or a double can be added to a complex number:
		
		dim c1 as new Complex(2,5)
		dim c2 as new Complex(4,-6)
		dim c3, c4 as Complex
		dim d as double = 1.234
		
		c3 = c1 + c2
		c4 = d + c3
		
		The same syntax also applies to the other standard operators.
		
		
		
		// STRING CONVERSIONS
		
		Complex numbers can be converted to strings in the following ways:
		
		s = Str(c)
		s = CStr(c)
		s = c.Format(FormatSpec) // See RB Language Reference for information on FormatSpec
		s = Format(c, FormatSpec)  // requires ComplexWrappers module
		
		
		
		// ADVANCED FUNCTIONS
		
		The following advanced functions have been implemented:
		
		Conj        // returns the complex conjugate of a complex number
		Inv         // returns the inverse of a complex number
		Norm        // returns the norm (square "length") of a complex number
		Sqrt        // returns the square root of a complex number
		Exp         // returns the exponential of a complex number
		Log         // returns the natural logarithm of a complex number
		Sin         // returns the sine of a complex number
		Cos         // returns the cosine of a complex number
		Tan         // returns the tangent of a complex number
		Cot         // returns the cotangent of a complex number
		Sec         // returns the secant of a complex number
		Cosec       // returns the cosecant of a complex number
		Asin        // returns the arc sine of a complex number
		Acos        // returns the arc cosine of a complex number
		Atan        // returns the arc tangent of a complex number
		Sinh        // returns the hyperbolic sine of a complex number
		Cosh        // returns the hyperbolic cosine of a complex number
		Tanh        // returns the hyperbolic tangent of a complex number
		Asinh       // returns the inverse hyperbolic sine of a complex number
		Acosh       // returns the inverse hyperbolic cosine of a complex number
		Atanh       // returns the inverse hyperbolic tangent of a complex number
		
		All these functions are part of the ComplexUtils class, and they are also implemented
		as convenient wrappers in the ComplexWrappers module.
		
		
		
	#tag EndNote

	#tag Note, Name = Home Page
		
		This ComplexUtils module is currently maintained by
		Roger Meier (roger.meier@pobox.com).
		
		You should be able to find the latest version at:
		
		    http://www.the-meiers.org/opensource/
		
		
	#tag EndNote

	#tag Note, Name = License
		
		This ComplexUtils Class and module are in the public domain.  You may use them for any purpose
		whatsoever, but it comes with no express or implied warranty of correctness or fitness for any purpose.
	#tag EndNote

	#tag Note, Name = Version History
		
		07/08/06: v1.0
		- initial release
		
		
	#tag EndNote


	#tag Property, Flags = &h21
		Private mImag As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mReal As Double
	#tag EndProperty


	#tag Constant, Name = Pi, Type = Double, Dynamic = False, Default = \"3.141592653589793238462643383279502884197169399375105820974944592", Scope = Public
	#tag EndConstant


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
End Class
#tag EndClass
