#tag Class
Protected Class Enum_AttributeClass
Inherits String_AttributeClass
	#tag Method, Flags = &h1000
		Sub Constructor(UpperStep As BasicClass, name As string, value As string, vLink As AttributeClass, LinkName As string, vArraySize As integer, vArrayMode As integer, AttGroup As AttributeGroups)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(UpperStep, name, value, vLink, LinkName, vArraySize, vArrayMode, AttGroup)
		  Me.SetEnum(Value, vArraySize)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetEnum(Index as integer) As string
		  Return NthField(Me.Enumeration, EnumSep, Index + 1)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAI() As Int64
		  // Get active value as integer, takes the Linked value if there is one
		  // this is a standard routine and should not be overriden
		  
		  if Me.Link=nil then
		    return GOAI(ActiveValue)
		  else
		    Dim S as string
		    S=Me.Link.GOAS
		    // find in what number the input is refering to within Enumeration
		    Dim i,n as integer
		    i=0
		    n=0
		    while (n=0) and (i<(len(Me.Enumeration)/2))
		      if NthField(Me.Enumeration,EnumSep,i+1)=S then
		        n=i
		      end
		      i=i+1
		    wend
		    return n
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GIAS() As string
		  // Get active value as string, takes the Linked value if there is one
		  // this is a standard routine and should not be overriden
		  if Me.Link=nil then
		    return Me.GOAS(Me.ActiveValue)
		  else
		    Dim S as string
		    S=Me.Link.GOAS
		    Me.SOAS(S)
		    return S
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAB(Index as integer) As Boolean
		  // virtual method has to be overriden
		  // Get Local Value as Integer, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    Return (val(Values(Index)) > 0)
		  else
		    return false
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAI(Index as integer) As Int64
		  // virtual method has to be overriden
		  // Get Local Value as Integer, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    Return Val(Values(Index))
		  else
		    return 0
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAS(Index as integer) As string
		  // Get Local Value as String (from Index)
		  if CorrectValueIndex(Index) then
		    return NthField(Enumeration, EnumSep, val(Me.Values(Index)) + 1)
		  else
		    return ""
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOASave(Index as integer) As string
		  if IsDynamic then
		    Dim S as string
		    if IsArray then
		      if index<(GOAN-1) then
		        S = str(GIAI(index))
		      else
		        S = str(GIAI(index))+" ENUM "+Enumeration
		      end
		    else
		      S = str(GIAI)+" "+Enumeration
		    end
		    return S
		  End
		  Return Super.GOASave(Index)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOEnumCount() As integer
		  // get the number of enums if it is a enum variable
		  return Me.EnumCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDefault() As Boolean
		  Return NthField(Me.Enumeration, EnumSep, val(Me.DefaultValue) + 1) = GOAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ParseValuesSeparator(value As String) As String
		  Dim sep As String = " "
		  Select case  value.Mid(2,1)
		  Case Is = " "
		    sep = " "
		  Case Is = chr(9)
		    sep = chr(9)
		  Case Is = ","
		    sep = ","
		  Else
		    Select Case value.Mid(3,1)
		    Case Is =" "
		      sep=" "
		    Case Is = chr(9)
		      sep = chr(9)
		    Case Is = ","
		      sep = ","
		    End
		  End
		  Return sep
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveAttribute(AttrName As String, byRef S as string)
		  // saves the attribute to a string
		  if IsDynamic Then
		    AttrName = AttrName+"%E"
		  End
		  Super.SaveAttribute(AttrName, S)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEnum(Values as String, vArraySize as integer = - 1)
		  Dim S, EnumS as string
		  Dim SetValueNr, i as integer = 0
		  
		  PrepStringFromXMLLoading(Values)
		  Dim ValueSep As String = ParseValuesSeparator(Values)
		  
		  if IsDynamic then
		    i = Values.InStr(1, "ENUM ")
		  end
		  
		  if vArraySize > 0 then
		    IsArray = True
		    SIAN(vArraySize)
		  end
		  
		  if i>0 then
		    EnumS=Values.Mid(i+5,Values.Len-i)
		    EnumSep=Values.Mid(i+4,1)
		    Values=Values.Mid(1,i-1)
		  else
		    i=Values.InStr(1,ValueSep)
		    EnumS=Values.Mid(i+1,Values.Len-2)
		    Values=Values.Mid(1,i-1)
		    EnumSep=ValueSep
		  end
		  
		  i=0
		  S=NthField(Values,ValueSep,i+1)
		  while (S<>"") and (i<10000)
		    SOAI(val(S))
		    i=i+1
		    S=NthField(Values,ValueSep,i+1)
		  wend
		  
		  SetValueNr=val(NthField(Values,ValueSep,1))
		  Me.DefaultValue = Str(SetValueNr)
		  
		  Me.EnumCount=1
		  Me.Enumeration=""
		  S=NthField(EnumS,EnumSep,Me.EnumCount)
		  while S>""
		    Me.Enumeration=Me.Enumeration+S+EnumSep
		    Me.EnumCount=Me.EnumCount+1
		    S=NthField(EnumS,EnumSep,Me.EnumCount)
		  wend
		  Me.EnumCount=Me.EnumCount-1
		  Me.Enumeration=Trim(Me.Enumeration)
		  
		  Me.SOAI(SetValueNr)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAB(SetValue as Boolean, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    if SetValue then
		      If Me.Values(Index) <> "0" Then
		        Me.Values(Index) = "0"
		        Me.Changed = "0" <> Me.DefaultValue
		      End
		    else
		      If Me.Values(Index) <> "1" Then
		        Me.Values(Index) = "1"
		        Me.Changed = "1" <> Me.DefaultValue
		      End
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAD(SetValue as double, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    If Me.Values(Index) <> Str(SetValue) Then
		      Me.Values(Index) = Str(SetValue)
		      Me.Changed = Str(SetValue) <> Me.DefaultValue
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAI(SetValue as Int64, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    If Me.Values(Index) <> Str(SetValue) Then
		      Me.Values(Index) = Str(SetValue)
		      Me.Changed = Str(SetValue) <> Me.DefaultValue
		    End
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as String, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  if CorrectValueIndex(Index) then
		    //first check if the value is a number if so then just set the active value to that index
		    if (SetValue.len<4) and val(SetValue)>0 then
		      If Me.Values(Index) <> Str(SetValue) Then
		        Me.Values(Index) = Str(SetValue)
		        Me.Changed = Str(SetValue) <> Me.DefaultValue
		      End
		    else
		      
		      // find in what number the input is refering to within Enumeration
		      Dim i,n as integer
		      i=1
		      n=0
		      
		      if Me.MyStep.Name.GIAS="ChannelSelection" then
		        i=i
		      end
		      
		      while (n=0) and (i<(len(Me.Enumeration)/2))
		        if NthField(Me.Enumeration,EnumSep,i)=SetValue then
		          n=i
		        end
		        i=i+1
		      wend
		      if n=0 then
		        n=1
		      end
		      
		      If Me.Values(Index) <> Str(n - 1) Then
		        Me.Values(Index) = Str(n - 1)
		        Me.Changed = Str(n - 1) <> Me.DefaultValue
		      End
		    end
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected EnumCount As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Enumeration As string
	#tag EndProperty

	#tag Property, Flags = &h0
		EnumSep As string
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
			Name="ActiveValue"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			Name="Enumeration"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnumSep"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
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
