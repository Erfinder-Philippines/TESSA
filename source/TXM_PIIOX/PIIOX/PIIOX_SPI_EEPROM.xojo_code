#tag Class
Protected Class PIIOX_SPI_EEPROM
Inherits PIIOX_SPI_Command_StepClass
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  Select case ChangedAttribute
		  case is=Address
		    
		  case is=EEPROM_Data
		    
		  case is=mode
		    Select case Mode.GIAI
		    case 0 //  EEPROM_Read
		      CommandData.IsArray=false
		      CommandData.SIAN(1)
		      CommandData.SIAS("h03")
		      ReplyType.SIAI(0)
		    case 1 // EEPROM_Write
		      CommandData.IsArray=true
		      CommandData.SIAN(2)
		      CommandData.SIAS("h06",0)
		      CommandData.SIAS("h02",1)
		      ReplyType.SIAI(1)
		    case 2 // EEPROM_Write & READ
		      CommandData.IsArray=true
		      CommandData.SIAN(3)
		      CommandData.SIAS("h06",0)
		      CommandData.SIAS("h02",1)
		      CommandData.SIAS("h03",2)
		      ReplyType.SIAI(0)
		    end
		  end
		  
		  SetCommand
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as String) -- From StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  Mode = IAE("ReadWrite","0 Read Write WriteRead")
		  Address = IAS("Address","")
		  EEPROM_Data = IAS("EEPROM_Data","")
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCommand()
		  
		  
		  Select case Mode.GIAI
		  case 0 //  EEPROM_Read
		    CommandData.SIAS("h03")
		    CommandData.SIASAdd(StrHex(Address.GIAS,4,0))
		    Dim S as string = ""
		    if EEPROM_Data.GIAS.Mid(1,1)="n" then
		      for i as integer=1 to Val(EEPROM_Data.GIAS.Mid(2,EEPROM_Data.GIAS.Len-1))
		        S=S+",h00"
		      next
		    else
		      S=StrHex(EEPROM_Data.GIAS,4,0)
		    end
		    CommandData.SIASAdd(S)
		  case 1 // EEPROM_Write
		    CommandData.SIAS("h06",0)
		    Dim S as string = "h02"
		    S=S+StrHex(Address.GIAS,4,0)
		    S=S+StrHex(EEPROM_Data.GIAS,4,0)
		    CommandData.SIAS(S,1)
		  case 2 // EEPROM_Write & READ
		    CommandData.SIAS("h06",0)
		    Dim S as string = "h02"
		    S=S+StrHex(Address.GIAS,4,0)
		    S=S+StrHex(EEPROM_Data.GIAS,4,0)
		    CommandData.SIAS(S,1)
		    S="h03"+StrHex(Address.GIAS,4,0)
		    for i as integer=1 to EEPROM_Data.GIAS.Len-1
		      S=S+",h00"
		    next
		    CommandData.SIAS(S,2)
		  end
		  
		  Super.SetCommand
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Poll() As integer
		  // Polls for new tcpip messages, gives back true when there are new messages
		  
		  Dim RV as integer = Super.Step_Poll
		  
		  if RV=2 then
		    Dim S as string = Reply.GIAS
		    Dim i as integer
		    Dim R,T as string = ""
		    for i=6 to 5+EEPROM_Data.GIAS.len
		      T=NthField(S,",",i)
		      T=T.Mid(2,2)
		      R=R+chr(ValHex(T))
		    next
		    EEPROM_Data.SIAS(R)
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  Dim dummy as boolean = super.Step_Start
		  
		  Select case Mode.GIAI
		  case 0 //  EEPROM_Read
		    CommandData.IsArray=false
		    CommandData.SIAN(1)
		    CommandData.SIAS("h03")
		    ReplyType.SIAI(0)
		  case 1 // EEPROM_Write
		    CommandData.IsArray=true
		    CommandData.SIAN(2)
		    CommandData.SIAS("h06",0)
		    CommandData.SIAS("h02",1)
		    ReplyType.SIAI(1)
		  case 2 // EEPROM_Write & READ
		    CommandData.IsArray=true
		    CommandData.SIAN(3)
		    CommandData.SIAS("h06",0)
		    CommandData.SIAS("h02",1)
		    CommandData.SIAS("h03",2)
		    ReplyType.SIAI(0)
		  end
		  
		  return true
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Address As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EEPROM_Data As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty


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
End Class
#tag EndClass
