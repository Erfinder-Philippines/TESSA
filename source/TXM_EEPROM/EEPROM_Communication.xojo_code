#tag Interface
Protected Interface EEPROM_Communication
	#tag Method, Flags = &h0
		Function GetConnection() As string
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReturnComProcedure(Mode as integer, WR as boolean, ByRef BlockSize as integer) As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function poll(ByRef vData as integer) As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function poll(byRef vData as string) As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function poll(vEEPROM as EEPROM_Class, ByRef vAddress as Int64, vSize as integer) As integer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send(vAddress as Int64, vSize as Int64, vEEPROM as EEPROM_Class, vWrite as boolean) As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send(vAddress as Int64, vData as integer, vWrite as boolean) As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function send(vData as String, vWrite as boolean) As boolean
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEEPROMSize(NewSize as Int64)
		  
		End Sub
	#tag EndMethod


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
End Interface
#tag EndInterface
