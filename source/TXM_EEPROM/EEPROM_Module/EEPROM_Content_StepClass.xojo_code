#tag Class
Protected Class EEPROM_Content_StepClass
Inherits StepClass
Implements EEPROM_Offset
	#tag Method, Flags = &h0
		Sub AttributeChanged(ChangedAttribute as AttributeClass)
		  
		  
		  Select case ChangedAttribute
		  case is=Byte_Offset
		    Byte_To.SIAI(Byte_Offset.GIAI+Size.GIAI-1)
		  case is=Size
		    Byte_To.SIAI(Byte_Offset.GIAI+Size.GIAI-1)
		  case is=Byte_To
		    Size.SIAI(Byte_To.GIAI-Byte_Offset.GIAI+1)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  
		  Read=IAB("Read",false,false)
		  Write=IAB("Write",false,false)
		  
		  Byte_Offset=IAI("Byte_Offset",0,false)
		  Size=IAI("Size",2,false)
		  Byte_To=IAI("Byte_To",2,false)
		  Array_Offset=IAI("Array_Offset",2,false)
		  Array_Index=IAI("Array_Index",0,false)
		  Array_AutoIndex=IAI("Array_AutoIndex",0,false) // used to automatically index through the given array and send all data
		  
		  FillChar=IAI("FillChar",-1,false)
		  
		  Format=IAE("Format","1 none hex char num crc16 counter LBS_Word MSB_Word MemoryBlock",false)
		  
		  CRC_Start=IAI("CRC_Start",0,false)
		  CRC_Size=IAI("CRC_Size",0,false)
		  
		  
		  Value=IAS("Value","",false)
		  Value.Format=1
		  SetValue=IAS("SetValue","",false)
		  SetValue.Format=1
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFrom() As integer
		  // Part of the EEPROM_Offset interface.
		  Dim RV as integer = 0
		  if (UpperStep<>nil) and (UpperStep IsA EEPROM_Offset) then
		    RV=EEPROM_Offset(UpperStep).GetFrom
		  end
		  RV=RV+Byte_Offset.GIAI
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTo() As integer
		  
		  if Array_AutoIndex.GIAI=0 then
		    return GetFrom+Size.GIAI-1
		  else
		    return GetFrom+Array_Offset.GIAI*Array_AutoIndex.GIAI+Size.GIAI-1
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InternalInit()
		  Dim BS as BasicClass = UpperStep
		  EEPROM=nil
		  
		  while (EEPROM=nil) and (BS.UpperStep<>nil)
		    if BS isA HMI_EEPROM_StepClass then
		      EEPROM=HMI_EEPROM_StepClass(BS).EEPROM
		    else
		      BS=BS.UpperStep
		    end
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  Super.Step_Init
		  InternalInit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Super.Step_Init_AfterLoad
		  InternalInit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  // manipulates the content of the upper Class that has a container
		  
		  Dim n,k,j as integer
		  Dim i as integer
		  Dim c as Uint16
		  Dim ProceedLoop as boolean = true
		  
		  while ProceedLoop
		    if EEPROM<>nil then
		      Offset_Sum=Byte_Offset.GIAI+(Array_Offset.GIAI*Array_Index.GIAI)
		      if Read.GIAB then
		        Value.SIAS("")
		        if (Offset_Sum>=0) and ((Offset_Sum+Size.GIAI)<EEPROM.Size) then
		          Select Case Format.GIAS
		          case is="char"
		            Dim S as string
		            S=""
		            for n=0 to Size.GIAI-1
		              j = Offset_Sum+n
		              if (j>=0) and (j<=EEPROM.Size) then S=S+chr(EEPROM.EP(j).BY)
		            next
		            S=TrimString(S,chr(0))
		            S=TrimString(S,chr(255))
		            Value.SIAS(S)
		          case is="hex"
		            i=0
		            for n=0 to Size.GIAI-1
		              j = Offset_Sum+n
		              if (j>=0) and (j<=EEPROM.Size) then 
		                i=i*256+EEPROM.EP(j).BY
		                Value.SIAS(Value.GIAS+StrHex(EEPROM.EP(j).BY,2))
		              end
		            next
		          case is="num"
		            i=0
		            for n=0 to Size.GIAI-1
		              j = Offset_Sum+n
		              if (j>=0) and (j<=EEPROM.Size) then i=i*256+EEPROM.EP(j).BY
		            next
		            Value.SIAS(str(i))
		          case is="counter"
		            i=0
		            for n=0 to Size.GIAI-1
		              j = Offset_Sum+n
		              if (j>=0) and (j<=EEPROM.Size) then i=i*256+EEPROM.EP(j).BY
		            next
		            Value.SIAS(str(i+1)) // count one up
		          end
		        end
		      end
		      
		      
		      // transfer the content of SetValue to the Value attribute, then to the EEPROM
		      if Write.GIAB then
		        Dim S as string
		        
		        if TestRND then
		          Select case Format.GIAS
		          case is="char" 
		            for n=0 to Size.GIAI-1
		              i=32+94*RND()
		              S=S+chr(i)
		            next
		          case is="hex"
		            for n=0 to Size.GIAI-1
		              i=255*RND()
		              S=S+StrHex(i,2)
		            next
		          case is="num"
		            
		            for n=0 to Size.GIAI-1
		              i=255*RND()
		              S=S+Str(i)
		            next
		          else
		            
		          end
		          Value.SIAS(S)
		        else
		          Value.SIAS(SetValue.GIAS)
		          S=Value.GIAS
		        end
		        
		        Select Case Format.GIAS
		        case is="char" // ----------------------------------
		          k=Size.GIAI-1
		          for n=0 to k
		            i=ASC(Mid(S,n+1,1))
		            j = Offset_Sum+n
		            if (j>=0) and (j<=EEPROM.Size) then EEPROM.EP(j).BY=i
		          next
		          if FillChar.GIAI<>-1 then
		            for k=n to Size.GIAI-1
		              j = Offset_Sum+k
		              if (j>=0) and (j<=EEPROM.Size) then EEPROM.EP(j).BY=FillChar.GIAI
		            next
		          end
		        case is="hex" // ----------------------------------
		          i=0
		          dim length as integer = Size.GIAI-1
		          S=S.Replace("h","")
		          S=S.Replace("0x","")
		          if S.Instr(1,":")>0 then
		            for n=0 to Size.GIAI-1
		              j = Offset_Sum+n
		              if (j>=0) and (j<=EEPROM.Size) then EEPROM.EP(j).BY=ValHex(Mid(S,n*3+1,2))          // since Mid is 1-based, and we need to skip the ":"
		            next
		          else
		            for n=0 to Size.GIAI-1
		              j = Offset_Sum+n
		              if (j>=0) and (j<=EEPROM.Size) then EEPROM.EP(j).BY=ValHex(Mid(S,n*2+1,2))
		            next
		          end
		        case is="num"// ----------------------------------
		          i=Val(S)
		          k=Size.GIAI-1
		          for n=0 to k
		            j = Offset_Sum+n
		            if (j>=0) and (j<=EEPROM.Size) then EEPROM.EP(j).BY=i mod 256
		            i=i/256
		          next
		        case is="counter" // ----------------------------------
		          i=Val(S)
		          k=Size.GIAI-1
		          for n=0 to k
		            j = Offset_Sum+k-n
		            if (j>=0) and (j<=EEPROM.Size) then EEPROM.EP(j).BY=i mod 256
		            i=i/256
		          next
		        case is="crc16" // ----------------------------------
		          c=EEPROM.CalcCRC16(CRC_Start.GIAI,CRC_Size.GIAI)
		          S=StrHex(c,4)
		          'MainWindow.DebugWindow.AppendText("Making CRC from "+str(CRC_Start.GIAI)+" to "+str(CRC_Size.GIAI)+chr(13))
		          for n=0 to 1
		            j = Offset_Sum+n
		            if (j>=0) and (j<=EEPROM.Size) then EEPROM.EP(j).BY=ValHex(S.Mid(n*2+1,2))
		          next
		        case is="LSB_Word" // ----------------------------------
		          
		          
		        case is="MSB_Word" // ----------------------------------
		          
		          
		        case is="MemoryBlock" // ----------------------------------
		          
		        end
		      end
		    end
		    if Array_AutoIndex.GIAI=0 then
		      ProceedLoop=false
		    else
		      if Array_Index.GIAI>=Array_AutoIndex.GIAI then
		        ProceedLoop=false
		      else
		        Array_Index.SIAI(Array_Index.GIAI+1)
		      end
		    end
		  wend
		  
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  
		  
		  if Array_AutoIndex.GIAI>0 then
		    Array_Index.SIAI(0)
		  end
		  
		  return Super.Step_Start
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TestRND() As Boolean
		  // Part of the EEPROM_Offset interface.
		  Dim RV as boolean =false
		  if (UpperStep<>nil) and (UpperStep IsA EEPROM_Offset) then
		    RV=EEPROM_Offset(UpperStep).TestRND
		  end
		  
		  return RV
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Array_AutoIndex As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Array_Index As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Array_Offset As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Byte_Offset As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Byte_To As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CRC_Size As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CRC_Start As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		EEPROM As EEPROM_Class = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		FillChar As Integer_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		Format As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Offset_Sum As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Read As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SetValue As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Size As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Write As Boolean_AttributeClass = nil
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="mUpdateCanvasMode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BasicTypeName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Changed"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugOn"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoSYNC"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=false
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
			Name="Expanded"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
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
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Local_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaxRetries"
			Visible=false
			Group="Behavior"
			InitialValue="5"
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
			Name="Name_Error"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NextTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Included_Elements"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Num_Links"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Offset_Sum"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWait"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWaitTime"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SAMStepID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SendState"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Sub_Link_Errors"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			Name="Untitled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
