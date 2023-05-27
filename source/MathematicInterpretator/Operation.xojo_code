#tag Class
Protected Class Operation
	#tag Method, Flags = &h0
		Function Calculate(values() As Variant) As Variant
		  If Calculator <> Nil Then
		    Return Calculator.Invoke(values)
		  End
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(oName As String, oPriority As Integer, oCalculator As OperationCalculator, oNumberOfArguments As Integer, oType As OperationType)
		  Name = oName
		  Priority = oPriority
		  Calculator = oCalculator
		  NumberOfArguments = oNumberOfArguments
		  Type = oType
		End Sub
	#tag EndMethod


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mCalculator
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mCalculator = value
			End Set
		#tag EndSetter
		Calculator As OperationCalculator
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mCalculator As OperationCalculator = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNumberOfArguments As Integer = 2
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPriority As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mType As OperationType = OperationType.NumericType
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mName
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mName = value.Lowercase
			End Set
		#tag EndSetter
		Name As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mNumberOfArguments
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mNumberOfArguments = value
			End Set
		#tag EndSetter
		NumberOfArguments As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mPriority
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mPriority = value
			End Set
		#tag EndSetter
		Priority As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mType
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mType = value
			End Set
		#tag EndSetter
		Type As OperationType
	#tag EndComputedProperty


	#tag Enum, Name = OperationType, Type = Integer, Flags = &h0
		NumericType=0
		  BooleanType
		FunctionType
	#tag EndEnum


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
			Name="NumberOfArguments"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Priority"
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
			Name="Type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="OperationType"
			EditorType="Enum"
			#tag EnumValues
				"0 - NumericType"
				"1 - BooleanType"
				"2 - FunctionType"
			#tag EndEnumValues
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
