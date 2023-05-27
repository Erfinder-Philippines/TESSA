#tag Class
Protected Class DateTime_AttributeClass
Inherits Integer_AttributeClass
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
		  StepType = StrToStepType(NthField(Values,Sep,n+1))
		  S=NthField(Values,Sep,n+2)
		  while S<>""
		    if n>GOAN then
		      NumValues=NumValues+1
		      redim Me.Values(NumValues)
		    end
		    Me.Values(n-1)=val(S)
		    Me.ActiveValue=n-1
		    n=n+1
		    S=NthField(Values,Sep,n+2)
		  wend
		  
		  IsArray = n > 1
		  
		  Me.ActiveValue= GOAN-1
		  
		  If Size > 0 Then
		    Me.Changed = True
		  Else
		    Me.Changed = Me.DefaultValue <> Values
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CalculateDateTime(index As Integer = 0)
		  Dim stepVal As int64 = GOAI(index)
		  'stepVal to seconds
		  mMilliseconds = 0
		  if mStepType = eTime.Hour Then
		    stepVal = stepVal * 60 * 60
		  ElseIf mStepType = eTime.Minute Then
		    stepVal = stepVal * 60
		  ElseIf mStepType = eTime.Second Then
		    stepVal = stepVal
		  ElseIf mStepType = eTime.Millisecond Then
		    Dim mSecs As Integer = mMillisecondsBase + stepVal Mod 1000
		    Dim incSec As Integer = 0
		    if mSecs >= 1000 Then
		      incSec = 1
		      mSecs = mSecs - 1
		    End
		    mMilliseconds = mSecs
		    stepVal = incSec + stepVal / 1000
		  End
		  
		  mDateTime = new Date(mDateTimeBase)
		  mDateTime.TotalSeconds = mDateTime.TotalSeconds + stepVal
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(UpperStep As BasicClass, name As string, value As string, vLink As AttributeClass, LinkName As string, vArraySize As integer, vArrayMode As integer, AttGroup As AttributeGroups)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(UpperStep, name, "", vLink, LinkName, vArraySize, vArrayMode, AttGroup)
		  Me.SetDateTime(value)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function DateToStr(date As Date, msec As Integer) As string
		  Dim MSecondsStr As String = If (msec > 0, "." + Str(msec, "000"), "")
		  return Str(date.Year) + "." + Str(date.Month, "00") + "." + Str(date.Day, "00") + "/" + Str(date.Hour, "00") + ":" + Str(date.Minute, "00") + ":" + Str(date.Second, "00") + MSecondsStr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAB() As Boolean
		  return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAD() As Double
		  'return the value as double in sec starting with the first value
		  Dim decreaseSec As Integer = 0
		  If mMillisecondsBase > mMilliseconds Then
		    decreaseSec = 1
		  End
		  return mDateTime.TotalSeconds - mDateTimeBase.TotalSeconds - decreaseSec
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAS(Index as integer) As String
		  //'return the value in absolute notation "2018.05.29/17:14:34.561" 
		  CalculateDateTime(Index)
		  return DateToStr(mDateTime, mMilliseconds)
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOASave(Index as integer) As string
		  //return str(GOAI)
		  Dim S As string = ""
		  If Index = 0 Then
		    S = DateToStr(mDateTimeBase, mMillisecondsBase) + " " + StepTypeToStr(mStepType) + " "
		  End
		  S = S + str(GOAI(index))
		  return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveAttribute(AttrName As String, byRef S as string)
		  // saves the attribute to a string
		  if IsDynamic Then
		    AttrName = AttrName+"%T"
		  End
		  Super.SaveAttribute(AttrName, S)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDateTime(fullString As string, index As Integer = 0)
		  'return the value in absolute notation "2018.05.29/17:14:34.561" 
		  '2018.05.29/17:15:30 00:00:01.000 3
		  //Dim fullString As String = Super.GOAS
		  
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  'rg.SearchPattern = "^(\d\d\d\d)\.(\d\d)\.(\d\d)\/(\d\d):(\d\d):(\d\d)(\.(\d\d\d))? ?(\d{0,2}):?(\d{0,2}):?(\d{0,2})(\.(\d\d\d))? ?(\d*)"
		  rg.SearchPattern = "^(\d\d\d\d)\.(\d\d)\.(\d\d)\/(\d\d):(\d\d):(\d\d)(\.(\d\d\d))? ?((\d{0,2}):?(\d{0,2}):?(\d{0,2})(\.(\d\d\d))?) ?(\d*)"
		  myMatch = rg.Search(fullString)
		  
		  If myMatch = Nil Then
		    return
		  End
		  
		  mDateTimeBase = new Date
		  mDateTimeBase.Year = Val(myMatch.SubExpressionString(1))
		  
		  mDateTimeBase.Month = Val(myMatch.SubExpressionString(2))
		  mDateTimeBase.Day = Val(myMatch.SubExpressionString(3))
		  mDateTimeBase.Hour = Val(myMatch.SubExpressionString(4))
		  mDateTimeBase.Minute = Val(myMatch.SubExpressionString(5))
		  mDateTimeBase.Second = Val(myMatch.SubExpressionString(6))
		  mMillisecondsBase = Val(myMatch.SubExpressionString(8))
		  
		  mStepType = StrToStepType(myMatch.SubExpressionString(9))
		  
		  SOAI(Val(myMatch.SubExpressionString(15)), index)'14
		  
		  CalculateDateTime
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as string, Index as integer)
		  If InStr(SetValue, " ") > 0 Then
		    SetDateTime(SetValue, Index)
		  Else
		    SOAI(ValueFromDateString(SetValue), Index)
		    CalculateDateTime
		    Changed = True
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StepTypeToStr(type As DateTime_AttributeClass.eTime) As string
		  Dim S As string
		  if type = eTime.Hour Then
		    S = "01:00:00"
		  ElseIf type = eTime.Minute Then
		    S = "00:01:00"
		  ElseIf type = eTime.Second Then
		    S = "00:00:01"
		  ElseIf type = eTime.Millisecond Then
		    S = "00:00:00.001"
		  End
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function StrToStepType(s As String) As eTime
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  rg.SearchPattern = "^(\d\d):(\d\d):(\d\d)(\.(\d\d\d))?"
		  myMatch = rg.Search(s)
		  
		  If myMatch = Nil Then
		    return eTime.Second
		  End
		  
		  Dim res As eTime = eTime.Second
		  If Val(myMatch.SubExpressionString(1)) > 0 Then
		    res = eTime.Hour
		  ElseIf Val(myMatch.SubExpressionString(2)) > 0 Then
		    res = eTime.Minute
		  ElseIf Val(myMatch.SubExpressionString(3)) > 0 Then
		    res = eTime.Second
		  ElseIf Val(myMatch.SubExpressionString(5)) > 0 Then
		    res = eTime.Millisecond
		  End
		  return res
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValueFromDateString(dateStr As string) As int64
		  Dim rg As New RegEx
		  Dim myMatch As RegExMatch
		  
		  rg.SearchPattern = "^(\d\d\d\d)\.(\d\d)\.(\d\d)\/(\d\d):(\d\d):(\d\d)(\.(\d\d\d))?"
		  myMatch = rg.Search(dateStr)
		  
		  If myMatch = Nil Then
		    return 0
		  End
		  
		  Dim date As Date = new Date(mDateTimeBase)
		  date.Year = Val(myMatch.SubExpressionString(1))
		  
		  date.Month = Val(myMatch.SubExpressionString(2))
		  date.Day = Val(myMatch.SubExpressionString(3))
		  date.Hour = Val(myMatch.SubExpressionString(4))
		  date.Minute = Val(myMatch.SubExpressionString(5))
		  date.Second = Val(myMatch.SubExpressionString(6))
		  Dim strMSec As Integer = If (myMatch.SubExpressionCount >= 9, Val(myMatch.SubExpressionString(8)), 0)
		  
		  Dim val As int64 = 0
		  Dim valMsec As Double = (date.TotalSeconds*1000 + strMSec) - (mDateTimeBase.TotalSeconds * 1000 + mMillisecondsBase)
		  If mStepType = eTime.Millisecond Then
		    val = valMsec
		  ElseIf mStepType = eTime.Second Then
		    val = valMsec / 1000
		  ElseIf mStepType = eTime.Minute Then
		    val = valMsec / 1000 / 60
		  ElseIf mStepType = eTime.Hour Then
		    val = valMsec / 1000 / 60 / 60
		  End
		  return val
		  
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDateTimeBase
			End Get
		#tag EndGetter
		BaseDate As Date
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDateTime
			End Get
		#tag EndGetter
		Date As Date
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDateTime.Day
			End Get
		#tag EndGetter
		Day As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDateTime.Hour
			End Get
		#tag EndGetter
		Hour As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mDateTime As Date = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDateTimeBase As Date = nil
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mMilliseconds
			End Get
		#tag EndGetter
		Millisecond As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDateTime.Minute
			End Get
		#tag EndGetter
		Minute As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mMilliseconds As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMillisecondsBase As Integer = 0
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDateTime.Month
			End Get
		#tag EndGetter
		Month As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mStepType As DateTime_AttributeClass.eTime = DateTime_AttributeClass.eTime.Second
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mStepVal1 As Integer = 0
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDateTime.Second
			End Get
		#tag EndGetter
		Second As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mStepType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mStepType = value
			End Set
		#tag EndSetter
		StepType As DateTime_AttributeClass.eTime
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mStepVal1
			  
			End Get
		#tag EndGetter
		StepValue1 As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDateTime.Year
			End Get
		#tag EndGetter
		Year As Integer
	#tag EndComputedProperty


	#tag Enum, Name = eTime, Type = Integer, Flags = &h0
		Hour
		  Minute
		  Second
		Millisecond
	#tag EndEnum


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
			Name="Day"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="Hour"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
			Name="Millisecond"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Minute"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
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
			Name="Month"
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
			Name="Second"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StepType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="DateTime_AttributeClass.eTime"
			EditorType="Enum"
			#tag EnumValues
				"0 - Hour"
				"1 - Minute"
				"2 - Second"
				"3 - Millisecond"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="StepValue1"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="Year"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
