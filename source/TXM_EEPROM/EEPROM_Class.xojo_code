#tag Class
Protected Class EEPROM_Class
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
		    b=Me.EP(i).BY
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

	#tag Method, Flags = &h0
		Function Compare(EEPROM2 as EEPROM_Class, ReplaceFF as boolean, FromCell as integer = 0, ToCell as integer = 0) As boolean
		  
		  AddDebugTextCR("Compare EEPROMs......")
		  Dim RV as boolean = true
		  if EEPROM2<>nil then
		    Dim fC as integer = FromCell
		    Dim tC as integer = ToCell
		    if tC=0 then tC=Size
		    if (EEPROM2.Size=Size) and (fC>0) and (fC<Size) and (tC>fC) and (tC<=Size) then
		      Dim i as integer
		      Dim E1,E2 as Byte 
		      for i=fC to tC
		        E1=EP(i).BY
		        E2=EEPROM2.EP(i).BY
		        if ReplaceFF then
		          if E1=255 then E1=0
		          if E2=255 then E2=0
		        end
		        if E1<>E2 then
		          AddDebugTextCR(" cell "+str(i)+" ("+str(E1)+"<>"+str(E2)+")")
		          RV=false
		        end
		      next
		    end
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  Redim EP(Size)
		  for n as integer = 0 to Size-1
		    EP(n).BY=255
		    EP(n).Format = 0
		    EP(n).Count = 0
		    EP(n).Col = &cFFFFFF
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Erease(FillWith as byte)
		  Dim n as integer
		  
		  for n=0 to UBound(Me.EP())-1
		    EP(n).BY=FillWith
		    EP(n).Format = 0
		    EP(n).Count = 0
		    EP(n).Col = &cFFFFFF
		  next
		  
		  Size=UBound(Me.EP())
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Fill_Line(S as string)
		  'AddDebugTextCR("before EEPROM:"+CR+S)
		  S=TESSAGlobalFunctions.ConvertEPROM(S)
		  'AddDebugTextCR("converted EEPROM:"+CR+S)
		  
		  Dim L,KL as string
		  Dim n,i,k,b as integer
		  n=0
		  i=0
		  L=TESSAGlobalFunctions.GetStringValue(S,i,chr(13))
		  while L<>""
		    for k=0 to 15
		      KL=Mid(L,k*2+1,2)
		      b=ValHex(KL)
		      if n>Size then
		        Resize(n,255)
		      end
		      Me.EP(n).BY=b
		      n=n+1
		    next
		    i=i+1
		    L=TESSAGlobalFunctions.GetStringValue(S,i,chr(13))
		  wend
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFormatedContent(n as Int64, vFormat as integer = 0) As string
		  Dim S as string =""
		  if (n>=0) and (n<size) then
		    
		    if (vFormat<1) then
		      vFormat=EP(n).Format
		    end
		    
		    Select case vFormat
		    case 0,1 // none = hex
		      S = StrHex(EP(n).BY, 2)
		    case 2 // char
		      S = chr(EP(n).BY)
		    case 3 // num 
		      S = Str(EP(n).BY)
		    case 4 // crc16
		      S = StrHex(EP(n).BY, 2)
		    case 5 // counter
		      S = chr(EP(n).BY)
		    else // overlaping usage!
		      S = StrHex(EP(n).BY, 2)
		    end
		  end
		  
		  return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Load(FolderPath as string)
		  Dim L as string
		  Dim f as FolderItem
		  Dim t as TextInputStream
		  
		  
		  if FolderPath<>"" then
		    f = GetFolderItem(FolderPath)
		    if f<>nil then
		      t = TextInputStream.open(f)
		      if t<>nil then
		        // save
		        L=t.ReadAll(Encodings.UTF8)
		        t.close
		        if L<>"" then
		          Me.Fill_Line(L)
		        end
		      end
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Resize(NewSize as Int64, FillChar as byte = 255, ReFill as boolean = false)
		  Dim OldSize as integer = Size
		  Redim EP(NewSize)
		  Size=NewSize
		  if ReFill then OldSize = 1
		  if OldSize<NewSize then
		    for n as integer = OldSize-1 to NewSize-1
		      EP(n).BY=FillChar
		      EP(n).Format = 0
		      EP(n).Count = 0
		      EP(n).Col = &cFFFFFF
		    next
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Retrieve() As string
		  Dim n,i as integer
		  Dim S as string
		  
		  
		  S="  "+TAB+"+0    +2    +4    +6    +8    +a    +c    +e    "+CR
		  
		  for n=0 to Size/16-1
		    if n<16 then
		      S=S+StrHex(n*16,2)+TAB
		    else
		      S=S+StrHex(n*16,3)+TAB
		    end
		    for i=0 to 15
		      S=S+StrHex(Me.EP(n*16+i).BY,2)+" "
		    next
		    S=S+CR
		  next
		  
		  return S
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(FolderPath as string)
		  Dim L as string = Me.Retrieve
		  if L<>"" then
		    Call OpenMeasFileForSave(L + EndOfLine, FolderPath)
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetFormatedContent(vValue as string, n as Int64, vFormat as integer = 0)
		  
		  if (n>=0) and (n<size) then
		    
		    if (vFormat<1) then
		      vFormat=EP(n).Format
		    end
		    
		    Select case vFormat
		    case 0,1 // none = hex
		      EP(n).BY=ValHex(vValue)
		    case 2 // char
		      EP(n).BY=asc(vValue)
		    case 3 // num 
		      EP(n).BY=Val(vValue)
		    case 4 // crc16
		      EP(n).BY=Val(vValue)
		    case 5 // counter
		      EP(n).BY=Val(vValue)
		    else // overlaping usage!
		      EP(n).BY=ValHex(vValue)
		    end
		  end
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function xCalcCRC16(S as string, Poly as Uint16, crc as Uint16) As Uint16
		  
		  
		  Dim i, n as integer
		  Dim b as Byte
		  
		  for i=1 to S.Len
		    b=asc(S.MidB(i,1))
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


	#tag Property, Flags = &h0
		EP() As EEPROM_Def
	#tag EndProperty

	#tag Property, Flags = &h0
		Format As Integer = 3
	#tag EndProperty

	#tag Property, Flags = &h0
		Size As Int64 = 256
	#tag EndProperty


	#tag Structure, Name = EEPROM_Def, Flags = &h0
		BY as byte
		  Format as byte
		  Count as byte
		Col as color
	#tag EndStructure


	#tag ViewBehavior
		#tag ViewProperty
			Name="Format"
			Visible=false
			Group="Behavior"
			InitialValue="3"
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
			Name="Size"
			Visible=false
			Group="Behavior"
			InitialValue="2048"
			Type="Int64"
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
