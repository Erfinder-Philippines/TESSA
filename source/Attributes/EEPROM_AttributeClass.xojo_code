#tag Class
Protected Class EEPROM_AttributeClass
Inherits String_AttributeClass
	#tag Method, Flags = &h0
		Sub AddValue(Value as string)
		  // restore <,/,>
		  PrepStringFromXMLLoading(Value)
		  Super.AddValue(Value)
		End Sub
	#tag EndMethod

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
		    PrepStringFromXMLLoading(S)
		    Me.Values(n-1)=S
		    Me.ActiveValue=n-1
		    n=n+1
		    S=NthField(Values,Sep,n)
		  wend
		  
		  IsArray = Size > 1
		  
		  Me.ActiveValue= GOAN-1
		  
		  If Size > 0 Then
		    Me.Changed = True
		  Else
		    Me.Changed = Me.DefaultValue <> Values
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcCRC16(StartPos as integer, CRC_Size as integer) As Uint16
		  
		  return Me.CalcCRC16_Array(StartPos,StartPos+CRC_Size-1,&hA001,&h0000)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcCRC16_Array(StartPos as integer, EndPos as integer, Poly as Uint16, crc as Uint16) As Uint16
		  
		  
		  Dim i, n as integer
		  Dim b as Byte
		  
		  for i=StartPos to EndPos
		    b=Me.EP(i)
		    crc=Bitwise.Bitxor(crc, b)
		    for n=1 to 8
		      if (crc and 1)=0 then
		        crc=Bitwise.ShiftRight(crc,1)
		      else
		        crc=Bitwise.ShiftRight(crc,1)
		        crc=Bitwise.Bitxor(crc, Poly)
		      end
		    next
		  next
		  return crc
		End Function
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
		Sub Constructor()
		  for i as integer = 0 to 2048
		    EP(i)=0
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ContainsValue(value As String) As Boolean
		  Return (Values.IndexOf(value) >= 0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyAllLinkValue()
		  If Link <> Nil Then
		    DeleteAllValues
		    For i As Integer = 0 To Link.GIAN
		      AddValue("")
		      SOAS(Link.GIAS(i))
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
		  Dim S as string = Me.GOAS(Index)
		  return ((S="on") or (S="true") or (val(S)>0.000001))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAD(Index as integer) As Double
		  // Get Local Value as double, does not take the Linked value but the one attached to the Attribute
		  return val(Me.GOAS(Index))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAI(Index as integer) As Int64
		  // virtual method has to be overriden
		  // Get Local Value as Integer, does not take the Linked value but the one attached to the Attribute
		  Dim i as Int64
		  Dim S as string = Me.GOAS(Index)
		  if Left(S,1) = "h" then
		    i = ValHex(Mid(S, 2, Len(S) - 1))
		  else
		    i = val(S)
		  end
		  return i
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
		  if CorrectValueIndex(Index) then
		    Return Me.Values(Index)
		  else
		    return ""
		  end 
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOASave(Index as integer) As string
		  // Get Local Value as String (from Index)
		  Dim S As String = Super.GOASave(Index)
		  PrepStringForXMLSaving(S)
		  Return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertValue(index As Integer, value As String)
		  if index < 0 Then
		    index = 0
		  ElseIf index > GOAN Then
		    index = GOAN
		  End
		  Me.Values.Insert(index, value)
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
		    AttrName = AttrName + "%S"
		  End
		  Super.SaveAttribute(AttrName, S)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIASAdd(SetValue as String)
		  //add new string to existing
		  Me.SIAS(Me.GIAS + SetValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIASAdd_CR(SetValue as String)
		  //add new string to existing
		  Me.SIAS(Me.GIAS + chr(13) + SetValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAB(SetValue as Boolean, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  Dim stringValue As String = "false"
		  If SetValue Then
		    stringValue = "true"
		  End
		  SOAS(stringValue, Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAD(SetValue as double, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  SOAS(str(SetValue), Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAI(SetValue as integer, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  SOAS(str(SetValue), Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as String, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    If Me.Values(Index) <> SetValue Then
		      Me.Values(Index) = SetValue
		      If IsArray Then
		        Me.Changed = true
		      Else
		        Me.Changed = SetValue <> Me.DefaultValue
		      End
		    End
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		EP(2048) As byte
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="FirstValue"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
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
