#tag Class
Protected Class Boolean_AttributeClass
Inherits MultipleValuesAttributeClass
	#tag Method, Flags = &h0
		Sub AddValues(Values as string, Size as integer)
		  // resize the array of Attributes
		  Dim NumValues as integer=GOAN
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
		    SOAS(S,n-1)
		    Me.ActiveValue=n-1
		    n=n+1
		    S=NthField(Values,Sep,n)
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
		  Return (Values.IndexOf(StrBoolean(value))) >= 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyActiveValue()
		  // this routine get the active value and pastes it into the local calue/array
		  If Link <> Nil Then
		    SOAB(Link.GIAB)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyAllLinkValue()
		  If Link <> Nil Then
		    DeleteAllValues
		    For i As Integer = 0 To Link.GIAN
		      AddValue("false")
		      SOAB(Link.GIAB(i))
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
		Function GOAB(Index as integer) As Boolean
		  // Get Local indexed Value as Boolean, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    return Me.Values(Index)
		  else
		    return false
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAD(Index as integer) As double
		  // Get Local Value as Integer, does not take the Linked value but the one attached to the Attribute
		  return GOAI(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAI(Index as integer) As Int64
		  // Get Local Value as double, does not take the Linked value but the one attached to the Attribute
		  if GOAB(Index) then
		    Return 1
		  else
		    return 0
		  end
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
		  Select case mFormat
		  Case 0
		    if GOAB(Index) Then
		      Return "on"
		    Else
		      Return "off"
		    End
		  Case 1
		    if GOAB(Index) Then
		      Return "TRUE"
		    Else
		      Return "FALSE"
		    End
		  Case 2
		    if GOAB(Index) Then
		      Return "1"
		    Else
		      Return "0"
		    End
		  Else
		    if GOAB(Index) Then
		      Return "TRUE"
		    Else
		      Return "FALSE"
		    End
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertValue(index As Integer, value As String)
		  if index < 0 Then
		    index = 0
		  ElseIf index > GOAN Then
		    index = GOAN
		  End
		  Me.Values.Insert(index, StrBoolean(value))
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
		    AttrName = AttrName+"%B"
		  End
		  Super.SaveAttribute(AttrName, S)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAB(SetValue as Boolean, Index as integer)
		  // Set Local Value as Boolean, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    #if DebugBuild
		      'if me = DebugGlobals.FocusOn and SetValue = false and Me.Values(Index) = true then break
		    #endif
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
		Sub SOAD(SetValue as double, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  SOAB(SetValue > 0, Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAI(SetValue as Int64, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  SOAB(SetValue > 0, Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as String, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  Select Case SetValue
		  Case Is = "on"
		    SOAB(true, Index)
		    mFormat = 0
		  Case Is = "off"
		    SOAB(false, Index)
		    mFormat = 0
		  Case Is = "true"
		    SOAB(true, Index)
		    mFormat = 1
		  Case Is = "false"
		    SOAB(false, Index)
		    mFormat = 1
		  Else
		    SOAB(val(SetValue) > 0, Index)
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mFormat As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Values(-1) As boolean
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
