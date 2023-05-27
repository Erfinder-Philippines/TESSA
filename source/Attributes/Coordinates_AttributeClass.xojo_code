#tag Class
Protected Class Coordinates_AttributeClass
Inherits String_AttributeClass
	#tag Method, Flags = &h0
		Function Bottom() As Integer
		  Return Y + Height
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetAllCoordinateValues(ByRef X_V As Integer, ByRef Offset_V As Integer, ByRef Y_V As Integer, ByRef Width_V As Integer, ByRef Height_V As Integer)
		  X_V = Me.X
		  Offset_V = Me.Offset
		  Y_V = Me.Y
		  Width_V = Me.Width
		  Height_V = Me.Height
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Right() As Integer
		  Return X + Width
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCoordinateValues(NewX As Integer, NewOffset As Integer, NewY As Integer, NewWidth As Integer, NewHeight As Integer)
		  SIAS(Str(NewX) + " " + Str(NewOffset) + " " + Str(NewY) + " " + Str(NewWidth) + " " + Str(NewHeight))
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetNewSize(NewOffset As Integer, NewWidth As Integer, NewHeight As Integer)
		  SetCoordinateValues(X, NewOffset, Y, NewWidth, NewHeight)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SOAS(SetValue as String, Index as integer)
		  If mCanBeNegative Then
		    Super.SOAS(SetValue, Index)
		  Else
		    Dim NewX As Integer = GetStringValueI(SetValue, 0, " ")
		    Dim NewOffset As Integer = GetStringValueI(SetValue, 1, " ")
		    Dim NewY As Integer = GetStringValueI(SetValue, 2, " ")
		    Dim NewWidth As Integer = GetStringValueI(SetValue, 3, " ")
		    Dim NewHeight As Integer = GetStringValueI(SetValue, 4, " ")
		    
		    If NewX < 0 Then
		      NewX = X
		    End
		    If NewY < 0 Then
		      NewY = Y
		    End
		    If NewWidth < 0 Then
		      NewWidth = Width
		    End
		    If NewHeight < 0 Then
		      NewHeight = Height
		    End
		    
		    Super.SOAS(Str(NewX) + " " + Str(NewOffset) + " " + Str(NewY) + " " + Str(NewWidth) + " " + Str(NewHeight), Index)
		  End
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCanBeNegative
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mCanBeNegative <> value Then
			    mCanBeNegative = value
			    SetCoordinateValues(Max(X, 0), Offset, Max(Y, 0), Max(Width, 0), Max(Height, 0))
			  End
			End Set
		#tag EndSetter
		CanBeNegative As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mEnableOffset
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mEnableOffset = value
			End Set
		#tag EndSetter
		EnableOffset As Boolean
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetStringValueI(GIAS, 4, " ")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetCoordinateValues(X, Offset, Y, Width, value)
			End Set
		#tag EndSetter
		Height As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCanBeNegative As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mEnableOffset As Boolean = true
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetStringValueI(GIAS, 1, " ")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetCoordinateValues(X, value, Y, Width, Height)
			End Set
		#tag EndSetter
		Offset As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetStringValueI(GIAS, 3, " ")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetCoordinateValues(X, Offset, Y, value, Height)
			End Set
		#tag EndSetter
		Width As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetStringValueI(GIAS, 0, " ")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetCoordinateValues(value, Offset, Y, Width, Height)
			End Set
		#tag EndSetter
		X As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return GetStringValueI(GIAS, 2, " ")
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  SetCoordinateValues(X, Offset, value, Width, Height)
			End Set
		#tag EndSetter
		Y As Integer
	#tag EndComputedProperty


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
			Name="CanBeNegative"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="EnableOffset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
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
			Name="Height"
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
			InitialValue="false"
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
			Name="Offset"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
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
		#tag ViewProperty
			Name="Width"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="X"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Y"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
