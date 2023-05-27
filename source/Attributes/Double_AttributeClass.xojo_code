#tag Class
Protected Class Double_AttributeClass
Inherits MultipleValuesAttributeClass
	#tag Method, Flags = &h0
		Sub AddValues(Values as string, Size as integer)
		  // resize the array of Attributes
		  Dim NumValues as integer = GOAN
		  if NumValues<Size then
		    redim Me.Values(Size)
		    NumValues=Size
		  end
		  
		  // adds the values in the string separated by a space to the Attribute
		  Dim S, Sep as string
		  sep = ParseAttributeSeparator(Values)
		  
		  Dim n as integer=1
		  S=NthField(Values,Sep,n)
		  while S<>""
		    if n>GOAN then
		      NumValues=NumValues+1
		      redim Me.Values(NumValues)
		    end
		    Me.Values(n-1)=val(S)
		    Me.ActiveValue=n-1
		    n=n+1
		    S=NthField(Values,Sep,n)
		  wend
		  
		  IsArray = size > 1
		  
		  Me.ActiveValue= GOAN-1
		  
		  If Size > 0 Then
		    Me.Changed = True
		  Else
		    Me.Changed = Me.DefaultValue <> Values
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ChangeArraySize(size As Integer)
		  //vitual method usses to set size of array values(Redim)
		  If  size < -1 Then
		    size = -1
		  End
		  ReDim Values(size)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsValue(value As String) As Boolean
		  Return (Values.IndexOf(val(value)) >= 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyActiveValue()
		  // this routine get the active value and pastes it into the local calue/array
		  If Link <> Nil Then
		    SOAD(Link.GIAD)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyAllLinkValue()
		  If Link <> Nil Then
		    DeleteAllValues
		    For i As Integer = 0 To Link.GIAN
		      AddValue("0.0")
		      SOAD(Link.GIAD(i))
		    Next
		  End
		  Super.CopyAllLinkValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllValues()
		  // clears all values exept the first one
		  Redim Me.Values(0)
		  Super.DeleteAllValues
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllValues1() As string
		  // get all values of this Attribute in one string separated by spaces
		  Dim ResultString as string
		  Dim NumValues,n  as integer
		  Dim Sep as string=" "
		  
		  'if Me.Link = nil or IsArray Then
		  'NumValues=GOAN
		  'ResultString=Me.GOAS(0)
		  'for n=1 to NumValues-1
		  'ResultString=ResultString+Sep+Me.GOAS(n)
		  'next
		  'else
		  'ResultString=Me.Link.GetAllValues
		  'end
		  'return ResultString
		  
		  if Me.Link = nil Then
		    NumValues=GOAN
		    ResultString=Me.GOAS(0)
		    for n=1 to NumValues-1
		      ResultString=ResultString+Sep+Me.GOAS(n)
		    next
		  else
		    ResultString=Me.Link.GetAllValues
		  end
		  return ResultString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFormat() As string
		  
		  
		  Select case Format
		  case 0 
		    return ""
		  case 1 
		    return "m"
		  case 2 
		    return "km"
		  case 3 
		    return "cm"
		  case 4 
		    return "mm"
		  case 5 
		    return "µm"
		  case 6 
		    return "nm"
		  case 7 
		    return "m"
		  case 8 
		    return "m"
		  case 9 
		    return "m"
		    
		  case 10 
		    return "sec"
		  case 11 
		    return "min"
		  case 12 
		    return "h"
		  case 13
		     return "d"
		  case 14 
		    return "w"
		  case 15 
		    return "m"
		  case 16 
		    return "y"
		  case 17
		     return "ms"
		  case 18 
		    return "ns"
		  case 19 
		    return "ps"
		    
		  case 30 
		    return "g"
		  case 31 
		    return "kg"
		  case 32 
		    return "t"
		  case 33 
		    return "kt"
		  case 34 
		    return "mt"
		  case 35 
		    return "mg"
		  case 36 
		    return "ng"
		  case 37 
		    return "pg"
		    
		  case 40 
		    return "°C"
		  case 41 
		    return "°F"
		  case 42 
		    return "%rF"
		  case 43 
		    return "g/kg"
		  case 44 
		    return "kg/m3"
		  case 45 
		    return "mbar"
		  case 46 
		    return "kJ/kg"
		  case 50 
		    return "Pa"
		  case 51 
		    return "kPa"
		  case 52 
		    return "bar"
		  case 53 
		    return "mbar"
		  case 53 
		    return "mmHg"
		  case 53 
		    return "Inches Hg"
		  case 53 
		    return "psi"
		    
		  else
		    return ""
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFormatInfo() As string
		  
		  Select case Format
		  case  0 
		    return ""
		  case 1 
		    return "Meter"
		  case 2 
		    return "Kilometer"
		  case 3 
		    return "Centimeter"
		  case 4 
		    return "Millimeter"
		  case 5 
		    return "Mikometer"
		  case 6 
		    return "Nanometer"
		    
		  case 10 
		    return "Seconds"
		  case 11 
		    return "Minutes"
		  case 12 
		    return "Hours"
		  case 13 
		    return "Days"
		  case 14 
		    return "Weeks"
		  case 15 
		    return "Months"
		  case 16 
		    return "Years"
		  case 17 
		    return "Miliseconds"
		  case 18 
		    return "Nanoseconds"
		  case 19 
		    return "Picoseconds"
		    
		  case 30 
		    return "Gramm"
		  case 31 
		    return "Kilogramm"
		  case 32 
		    return "Ton"
		  case 33
		     return "Kiloton"
		  case 34
		     return "Megaton"
		  case 35 
		    return "Milligramm"
		  case 36
		     return "Nanogramm"
		  case 37 
		    return "Picogramm"
		    
		  case 40
		     return "Celscius"
		  case 41 
		    return "Fahrenheit"
		  case 42
		     return "Relative Humidity"
		  case 43 
		    return "Absolute Humitidy"
		  case 44 
		    return "AirDensity"
		  case 45 
		    return "BarometricPressure"
		  case 46
		     return "Enhalpie"
		    
		  case 50
		     return "Pascal = N/m2 = kg/m*s^2 = J/m3"
		  case 51 
		    return "Kilopascal"
		  case 52 
		    return "Bar"
		  case 53 
		    return "Millibar"
		  case 54 
		    return "mm Hg"
		  case 55 
		    return "Inches Hg"
		  case 56 
		    return "psi"
		    
		  else
		    return ""
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAB(Index as integer) As Boolean
		  // Get Local indexed Value as Boolean, does not take the Linked value but the one attached to the Attribute
		  return  GOAD(Index) > 0.5
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAD(Index as integer) As Double
		  // Get Local Value as double, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    return Me.Values(Index)
		  else
		    return 0
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAI(Index as integer) As Int64
		  // Get Local Value as Integer, does not take the Linked value but the one attached to the Attribute
		  return GOAD(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAN() As integer
		  //returns the number of values
		  Return Ubound(Me.Values())
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAS(Index as integer) As string
		  // Get Local Value as String (from Index)
		  return str(GOAD(Index))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertValue(index As Integer, value As String)
		  if index < 0 Then
		    index = 0
		  ElseIf index > GOAN Then
		    index = GOAN
		  End
		  Me.Values.Insert(index, val(value))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveValue(index As Integer) As Boolean
		  If index >= 0 And index <= Values.Ubound Then
		    Values.Remove(index)
		    if ActiveValue = index Then
		      ActiveValue = 0
		    End
		    Return True
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveAttribute(AttrName As String, byRef S as string)
		  // saves the attribute to a string
		  if IsDynamic Then
		    AttrName = AttrName+"%D"
		  End
		  Super.SaveAttribute(AttrName, S)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAB(SetValue as Boolean, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  if SetValue then
		    SOAD(1, Index)
		  else
		    SOAD(0, Index)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAD(SetValue as double, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    Me.Values(Index) = SetValue
		    If IsArray Then
		      Me.Changed = true
		    Else
		      Me.Changed = Str(SetValue) <> Me.DefaultValue
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOADSum(SetValue as double, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    Values(Index) = Values(Index) + SetValue
		    If IsArray Then
		      Changed = true
		    Else
		      Changed = Str(SetValue) <> DefaultValue
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAI(SetValue as integer, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  SOAD(SetValue, Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as String, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  SOAD(val(SetValue), Index)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Values(-1) As double
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ActiveValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ArrayMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Group"
			Visible=false
			Group="Behavior"
			InitialValue="AttributeGroups.Parameters"
			Type="AttributeGroups"
			EditorType="Enum"
			#tag EnumValues
				"0 - System"
				"1 - Settings"
				"2 - Appearance"
				"3 - Parameters"
				"4 - Dynamic"
				"5 - Collective"
			#tag EndEnumValues
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
			Name="IsArray"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsCollection"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsDynamic"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="LinkName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Mirror"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="boolean"
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
			Name="NoSave"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
