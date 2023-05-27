#tag Class
Protected Class MultipleValuesAttributeClass
Inherits AttributeClass
	#tag Method, Flags = &h0
		Sub AddValue(Value as string)
		  // this is a virtual method and has to be definied by the enherited class
		  // should add a value right behind the actual active value
		  #Pragma Unused Value
		  
		  if IsArray then
		    If ActiveValue < 0 Then
		      ActiveValue = 0
		    Else
		      ActiveValue = ActiveValue + 1
		    End
		  end
		  // resize the array of Attributes
		  Dim NumValues As Integer = GOAN
		  
		  If NumValues <= ActiveValue Then
		    NumValues = ActiveValue + 1
		  End
		  
		  ChangeArraySize(NumValues)
		  SOAS(Value, ActiveValue)
		  
		  If IsArray Then
		    Changed = True
		  Else
		    Changed = Value <> DefaultValue
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddValues(Values as string)
		  // adds the values in the string separated by a space to the Attribute
		  if IsArray Then
		    // this is an array with serveral values, add the values separated by a space
		    For Each item As String in Values.Split
		      AddValue(item)
		    Next
		  Else
		    // this is a single value
		    AddValue(Values)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddValues(Values as string, Size as integer)
		  // adds the values in the string separated by a space to the Attribute
		  // should add a value must be overided in sub classes
		  #Pragma Unused Size
		  AddValues(Values)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ChangeArraySize(size As Integer)
		  //vitual method usses to set size of array values(Redim)
		  //must be overided in sub classes
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearAllValues()
		  // empties all values
		  // this routine should be overridden for efficency reasons
		  For i As Integer = 0 To GOAN
		    SIAS("", i)
		  Next
		  ActiveValue = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Attr As AttributeClass)
		  Super.Constructor(Attr)
		  If Attr IsA MultipleValuesAttributeClass Then
		    ClearAllValues
		    AddValues(Attr.GetAllValues, Attr.GOAN)
		    ActiveValue = MultipleValuesAttributeClass(Attr).ActiveValue
		    ArrayMode = MultipleValuesAttributeClass(Attr).ArrayMode
		    DefaultValue = MultipleValuesAttributeClass(Attr).DefaultValue
		    IsArray = MultipleValuesAttributeClass(Attr).IsArray
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(UpperStep as BasicClass, vName as string, vValue as string, vLink as AttributeClass, vLinkName as string, vArraySize as integer, vArrayMode as integer, vGroup as AttributeGroups, AttrIsDynamic as boolean = false, vFormat as Uint16 = 0)
		  Super.Constructor(UpperStep,  vName, vLink, vLinkName, vGroup, AttrIsDynamic, vFormat)
		  
		  ArrayMode = vArrayMode
		  IsArray = (vArraySize > 0) or (ArrayMode>0)
		  if IsArray Then
		    DefaultValue = ""
		    AddValues(vValue, vArraySize)
		  Else
		    DefaultValue = vValue
		    AddValues(vValue)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyActiveValue()
		  // this routine should be overridden
		  
		  If Link <> Nil Then
		    'SOAA(Link.GIAA)
		  End
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyAllLinkValue()
		  // 
		  If Link <> Nil Then
		    if IsArray then
		      if Link IsA MultipleValuesAttributeClass Then
		        
		      End
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CorrectValueIndex(ByRef Index As Integer) As boolean
		  Dim RV as boolean = true
		  If Not IsArray Then
		    if GOAN<0 then
		      Index = GOAN - 1
		      RV=false
		    else
		      Index=0
		    end
		  else
		    If Index >= GOAN Then
		      Index = GOAN - 1
		    End
		    If Index < 0 Then
		      if (GOAA>=0) and (GOAA<GOAN) then
		        Index = GOAA
		      else
		        Index=0
		      End
		    end
		  End
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteAllValues()
		  // this routine clears all values exept the last one
		  // as every Attribute type has to implement it's own value-list this routine has to be overriden
		  ActiveValue = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllValues() As string
		  // returns all values as a string from Index 0 to the last value (of the active collection)
		  Return GetAllValues(0)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllValues(FromIndex as integer, ToIndex as integer = - 2, CollectionIndex as integer = - 1) As string
		  // returns all values FromIndex to ToIndex of the selected collection -1 will return the active collection
		  // FromIndex = 0 (first values), -1 (ActiveValue)
		  // ToIndex = -1 (ActiveValue) -2 (LastValue)
		  // this routine is virtual => please override for correct implementation
		  Dim ResultString As String
		  Dim NumValues  As Integer
		  If Link = nil Then
		    If FromIndex = -1 Then
		      FromIndex = ActiveValue
		    End
		    If ToIndex = -1 Then
		      NumValues = ActiveValue
		    ElseIf ToIndex <= -2 Then
		      NumValues = GOAN - 1
		    End
		    if FromIndex < 0 Or FromIndex > NumValues Then
		      FromIndex = 0
		    End
		    Dim Sep as string = " "
		    ResultString = GOAS(FromIndex)
		    For i As Integer = FromIndex + 1 To NumValues
		      ResultString = ResultString + Sep + Me.GOAS(i)
		    Next
		  Else
		    ResultString = Link.GetAllValues
		  End
		  Return ResultString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAA() As integer
		  //returns the number of the active value of the linked Attribute (or local if not linked)
		  if mIsArray Then
		    return Me.GOAA
		  End
		  Return Super.GIAA
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAB(Index as integer, first as boolean = false) As Boolean
		  // Get value of Index as boolean, takes the Linked value if there is one
		  If (Link<>Nil) and not((self IsA MultipleValuesAttributeClass) and MultipleValuesAttributeClass(self).IsArray and not(first)) Then
		    'if index=-1 then Index=ActiveValue
		    Dim B As boolean = Link.GIAB(index)
		    SOAB(B,index)
		    return B
		  Else
		    'if index=-1 then Index=ActiveValue
		    Return GOAB(index)
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAD(Index as integer, first as boolean = false) As Double
		  // Get value of Index as double, takes the Linked value if there is one
		  If (Link<>Nil) and not((self IsA MultipleValuesAttributeClass) and MultipleValuesAttributeClass(self).IsArray and not(first)) Then
		    'if index=-1 then Index=ActiveValue
		    Dim D As double = Link.GIAD(index)
		    SOAD(D,index)
		    return D
		  Else
		    'if index=-1 then Index=ActiveValue
		    Return GOAD(index)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAI(Index as integer, first as boolean = false) As Int64
		  // Get value of Index as integer, takes the Linked value if there is one
		  If (Link<>Nil) and not((self IsA MultipleValuesAttributeClass) and MultipleValuesAttributeClass(self).IsArray and not(first)) Then
		    'if index=-1 then Index=ActiveValue
		    Dim I As Int64 = Link.GIAI(index)
		    SOAI(I,index)
		    return I
		  Else
		    'if index=-1 then Index=ActiveValue
		    Return GOAI(index)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAS(Index as integer, first as boolean = false) As string
		  // Get value of Index as string, takes the Linked value if there is one
		  Return GIA.GOAS(index)
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAA() As integer
		  //returns the number of the active value
		  return ActiveValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAB() As Boolean
		  Return GOAB(ActiveValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAD() As Double
		  Return GOAD(ActiveValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAI() As Int64
		  Return GOAI(ActiveValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAS() As string
		  Return GOAS(ActiveValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOASave() As string
		  // Get Local Value as string, replace reserved letters, does not take the Linked value but the one attached to the Attribute
		  // this is a standard routine and should not be overriden
		  return GOASave(ActiveValue)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InsertValue(index As Integer, value As String)
		  #Pragma Unused index
		  #Pragma Unused value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDefault() As Boolean
		  Return (GOAS = DefaultValue and not IsArray)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function ParseAttributeSeparator(values As String) As String
		  Dim Sep As String = " "
		  //check for the right separater first the sequence is TAB ; , space
		  If values.Instr(1, chr(9)) > 0 Then
		    Sep = chr(9)
		  ElseIf values.Instr(1, ";") > 0 Then
		    Sep = ";"
		  ElseIf values.Instr(1, ",") > 0 Then
		    Sep = ","
		  End
		  Return Sep
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RemoveValue(index As Integer) As Boolean
		  // this routine remove value by index
		  // as every Attribute type has to implement it's own value-list this routine has to be overriden
		  #Pragma Unused index
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDefault()
		  // resets the default value to the actual value
		  DefaultValue = GIAS
		  Super.ResetDefault
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveAttribute(AttrName As String, byRef S as string)
		  // saves the attribute to a string
		  Dim Sep as string =" "
		  if Self IsA String_AttributeClass then
		    Sep=chr(9)
		  end
		  if IsArray Then
		    If Link <> Nil Then
		      S = S + AttrName + "=" + chr(34) + "LinkedArray"+ Str(Me.GOAN)+ " " + Me.Link.GetLinkAddress(Self) + " "
		    ElseIf LinkName <> "" Then
		      S = S + AttrName + "=" + chr(34) + "LinkedArray"+ Str(Me.GOAN)+ " " + Me.LinkName + " "
		    else
		      S = S + AttrName + "=" + chr(34) + "Array"+ Str(Me.GOAN)+ " "
		    end
		    
		    // save values now
		    if not NoSave then
		      For i As Integer = 0 to (Me.GOAN - 1)
		        S = S + Me.GOASave(i) + Sep
		      Next
		      S = Mid(S, 1, len(S) - len(Sep)) // remove last separator
		      If S.Right(5) = "&#013" Then
		        S = Mid(S, 1, len(S) - 5)
		      End
		    end
		    S = S + chr(34) + " "
		  Else
		    Super.SaveAttribute(AttrName, S)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAA(Index as integer)
		  // sets the active value to the given index
		  If IsArray Then
		    SOAA(Index)
		  else
		    // nothing to be set
		  End
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIADSum(SetValue as double)
		  SIADSum(SetValue, ActiveValue)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIAN(Index as integer)
		  // sets the active value to the given index
		  SIA.SOAN(Index)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAA(Index as integer)
		  // sets the active value (starting 0,1,..)  to the given index starting with 0,1,2, ....
		  // add values if there are not enough
		  If Index > (GOAN-1) Then
		    ChangeArraySize(Index + 1)
		    IsArray = Index > 0
		  End
		  If ActiveValue <> Index Then
		    ActiveValue = Index
		    If IsArray Then
		      Changed = true
		    Else
		      Changed = Index <> Val(DefaultValue)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAB(SetValue as Boolean)
		  SOAB(SetValue, ActiveValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAD(SetValue as double)
		  SOAD(SetValue, ActiveValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAI(SetValue as Int64)
		  SOAI(SetValue, ActiveValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAN(Index as integer)
		  // sets the number of values to the Index
		  // add values if there are not enough, delete if there are too much
		  If Index <> GOAN Or Index = 1 Then
		    ChangeArraySize(Index)
		    IsArray = Index > 0
		  End
		  If ActiveValue > Index Then
		    ActiveValue = Index
		  End
		  If IsArray Then
		    Changed = True
		  Else
		    Changed = Index <> Val(DefaultValue)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as string)
		  SOAS(SetValue, ActiveValue)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAttribute(Value as string, vLinkName as string, vArraySize as integer, vArrayMode as integer)
		  // seaches for the Attribute with that name and sets it's value to Value
		  LinkName = vLinkName
		  ArrayMode = vArrayMode
		  
		  IsArray = vArraySize > 0
		  if IsArray then
		    AddValues(Value, vArraySize)
		  Else
		    
		    if Self IsA String_AttributeClass then
		      // restore <,/,>
		      PrepStringFromXMLLoading(Value)
		    End
		    
		    SOAS(Value)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function xGIAN() As integer
		  // Get value of Index as double, takes the Linked value if there is one
		  If (Link<>Nil) and not((self IsA MultipleValuesAttributeClass) and MultipleValuesAttributeClass(self).IsArray) Then
		    return Link.GIAN
		  Else
		    Return GOAN
		  End
		End Function
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mActiveValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mActiveValue = value
			End Set
		#tag EndSetter
		ActiveValue As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mArrayMode
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mArrayMode = value
			End Set
		#tag EndSetter
		ArrayMode As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mDefaultValue
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mDefaultValue = value
			End Set
		#tag EndSetter
		DefaultValue As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mIsArray
			  'If mIsArray Then
			  'Return True
			  'ElseIf Link IsA MultipleValuesAttributeClass Then
			  'Return MultipleValuesAttributeClass(Link).IsArray
			  'End
			  'Return False
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mIsArray = value
			End Set
		#tag EndSetter
		IsArray As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mActiveValue As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mArrayMode As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mDefaultValue As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Note
			// mirror defines how the attribute reacts when it is an array and linked to an array
			// if mirror is true then the attibute that isd linked will be an exact copy of the other one
			// in the other case only the active value will be linked, all other values will be accessed locally
		#tag EndNote
		#tag Getter
			Get
			  return mMirror
			  
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mMirror=value
			  
			End Set
		#tag EndSetter
		Mirror As boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mIsArray As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMirror As boolean = false
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			InitialValue=""
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
			InitialValue=""
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
