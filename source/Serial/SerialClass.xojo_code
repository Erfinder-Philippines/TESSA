#tag Class
Protected Class SerialClass
Inherits Serial
	#tag Event
		Sub DataAvailable()
		  me.resource.AddToComLog(me.ReadAll(Encodings.UTF8))
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  
		  Me.ErrorText=Me.ErrorText+"Error "+str(Me.LastErrorCode)+" occured"+chr(13)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1000
		Sub Constructor(FS as Resource_StepClass)
		  
		  if FS<>nil then
		    if FS isA SerialPort_ResourceClass then
		      me.Resource = SerialPort_ResourceClass(FS)
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDebugInfo() As string
		  if Me.ErrorText<>"" then
		    return "e>"+Me.ErrorText+CR
		    Me.ErrorText=""
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPortSettings(vBaudRate as integer, vParity as integer, vStopBits as integer, vBits as integer, vXon as boolean)
		  // set the port parameters
		  // vBaudRate : 0=300, 1=600, 2=1200, 3=1800, 4=2400, 5=3600, 6=4800, 7=7200, 8=9600, 9=14400, 10=19200, 11=28800, 12=38400, 13=57600, 14=115200, 15=230400
		  // vParity: 0=none, 1=Odd, 2=Even
		  // vStopBits: 0=1, 1=1.5, 2=2
		  // vBits: 0=5, 1=6, 2=7, 3=8
		  // vXon on=true, off=false
		  
		  
		  Baud=vBaudRate
		  
		  Select case vParity
		  case 0
		    Parity=ParityNone
		  case 1
		    Parity=ParityOdd
		  case 2
		    Parity=ParityEven
		  end
		  
		  Select case vStopBits
		  case 0
		    Stop=StopBits1
		  case 1
		    Stop=StopBits15
		  case 2
		    Stop=StopBits2
		  end
		  
		  Select case vBits
		  case 0
		    Bits=Bits5
		  case 1
		    Bits=Bits6
		  case 2
		    Bits=Bits7
		  case 3
		    Bits=Bits8
		  end
		  
		  XON=vXon
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(S as string)
		  'MainWindow.DebugWindow.AppendText("s-"+S+"-s")
		  
		  Super.Write(S)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ErrorText As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Resource As SerialPort_ResourceClass = nil
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Baud"
			Visible=true
			Group="Behavior"
			InitialValue="13"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - 300"
				"1 - 600"
				"2 - 1200"
				"3 - 1800"
				"4 - 2400"
				"5 - 3600"
				"6 - 4800"
				"7 - 7200"
				"8 - 9600"
				"9 - 14400"
				"10 - 19200"
				"11 - 28800"
				"12 - 38400"
				"13 - 57600"
				"14 - 115200"
				"15 - 230400"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bits"
			Visible=true
			Group="Behavior"
			InitialValue="3"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - 5 Data Bits"
				"1 - 6 Data Bits"
				"2 - 7 Data Bits"
				"3 - 8 Data bits"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="CTS"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DTR"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ErrorText"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
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
			Name="Parity"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - No Parity"
				"1 - Odd Parity"
				"2 - EvenParity"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Stop"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - 1 Stop Bit"
				"1 - 1.5 Stop Bits"
				"2 - 2 Stop Bits"
			#tag EndEnumValues
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
			Name="XON"
			Visible=true
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
