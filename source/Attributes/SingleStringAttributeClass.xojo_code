#tag Class
Protected Class SingleStringAttributeClass
Inherits AttributeClass
	#tag Method, Flags = &h0
		Sub Constructor(Attr As AttributeClass)
		  Super.Constructor(Attr)
		  If Attr IsA SingleStringAttributeClass Then
		    mValue = GOAS
		    DefaultValue = SingleStringAttributeClass(Attr).DefaultValue
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(UpperStep As BasicClass, vName As string, vValue As string, vLink As AttributeClass, vLinkName As string, vGroup As AttributeGroups)
		  Super.Constructor(UpperStep,  vName, vLink, vLinkName, vGroup, false)
		  mValue = vValue
		  DefaultValue = vValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyAllLinkValue()
		  If Link <> Nil Then
		    SOAS(Link.GIAS)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAllValues() As String
		  // returns all values as a string from Index 0 to the last value (of the active collection)
		  Return GOAS
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAB(Index as integer) As Boolean
		  // Get Local indexed Value as Boolean, does not take the Linked value but the one attached to the Attribute
		  Dim S As String = GOAS(Index)
		  Return ((S = "on") Or (S = "true") Or (val(S) > 0.000001))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAD(Index as integer) As Double
		  // Get Local Value as double, does not take the Linked value but the one attached to the Attribute
		  Return Val(GOAS(Index))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAI(Index as integer) As Int64
		  // virtual method has to be overriden
		  // Get Local Value as Integer, does not take the Linked value but the one attached to the Attribute
		  Dim i As Integer
		  Dim S As String = GOAS(Index)
		  If Left(S,1) = "h" Then
		    i = ValHex(Mid(S, 2, Len(S) - 1))
		  Else
		    i = Val(S)
		  End
		  Return i
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAN() As integer
		  //returns the number of values
		  Return 1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GOAS(Index as integer) As string
		  // Get Local Value as String (from Index)
		  Return mValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDefault() As Boolean
		  Return GOAS = DefaultValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDefault()
		  // resets the default value to the actual value
		  DefaultValue = GIAS
		  Super.ResetDefault
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
		  SOAS(Str(SetValue), Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAI(SetValue as Int64, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  SOAS(Str(SetValue), Index)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as String, Index as integer)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  If mValue <> SetValue Then
		    mValue = SetValue
		    Changed = SetValue <> DefaultValue
		  End
		End Sub
	#tag EndMethod


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

	#tag Property, Flags = &h21
		Private mDefaultValue As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mValue As String
	#tag EndProperty


	#tag ViewBehavior
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
