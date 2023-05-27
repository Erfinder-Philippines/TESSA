#tag Class
Protected Class MemBlockString
Inherits MemoryBlock
	#tag Method, Flags = &h0
		Sub AppendString(s as string)
		  #Pragma DisableBackgroundTasks
		  
		  s = s.ConvertEncoding (Encodings.UTF8)
		  
		  Dim i As Uint64 = Len(s)
		  if Length+i>BufferSize then
		    if i>(BufferSize-BufferOverlap) then
		      if i>BufferSize then
		        i=0
		        if UpperAttribute<>nil then
		          AddWarningTextCR("Buffer overflow in "+UpperAttribute.Name)    
		        else
		          AddWarningTextCR("Buffer overflow no reference??")    
		        end
		      else
		        BufferOverlap=i
		      end
		    end
		    // shift  buffer content by size of overlap
		    StringValue(0,BufferSize-BufferOverlap)=StringValue(BufferOverlap,BufferSize-BufferOverlap)
		    Length = Length-BufferOverlap
		    CommandStepStartPos=CommandStepStartPos-BufferOverlap
		    CommandStartPos=CommandStartPos-BufferOverlap
		  end
		  
		  if (i>0) and ((Length+i)<BufferSize) then
		    // add the string to the 
		    StringValue(Length, i) = s
		    Length = Length + i
		  end
		  
		  Exception // If we write of the end of the memoryBlock we need to replace it with a newer bigger one
		    TotalLength = TotalLength + bufferSize
		    size = TotalLength
		    StringValue(Length, i) = s
		    Length = Length + i
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Attr as Buffer_AttributeClass, vBufferSize as UInt64, vBufferoverlap as UInt64)
		  // This is a class to use a memoryBlock as a temporary buffer
		  // while creating long strings by appending to already existing
		  // strings.  It can be a lot quicker than s = s + "more text" if
		  // you have very long strings
		  
		  // This is both the size of the original memoryBlock
		  // but also how much it increases by each time if needed
		  
		  super.constructor(vBufferSize )
		  BufferSize = vBufferSize 
		  
		  UpperAttribute = Attr
		  
		  TotalLength = BufferSize
		  BufferOverlap = vBufferOverlap
		  if BufferOverlap<BufferSize/5 then 
		    BufferOverlap=BufferSize/5
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCommandReply() As string
		  #Pragma DisableBackgroundTasks
		  if Length>BufferSize then
		    Length=BufferSize
		  end
		  if CommandStartPos>Length then
		    CommandStartPos=Length
		  end
		  Return StringValue(CommandStartPos, Length-CommandStartPos).DefineEncoding(Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCommandStartPos() As UInt64
		  return CommandStartPos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCommandStepReply() As string
		  #Pragma DisableBackgroundTasks
		  if Length>BufferSize then
		    Length=BufferSize
		  end
		  if CommandStepStartPos>Length then
		    CommandStepStartPos=Length
		  end
		  Return StringValue(CommandStepStartPos, Length-CommandStepStartPos).DefineEncoding(Encodings.UTF8)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCommandStepStartPos() As UInt64
		  #Pragma DisableBackgroundTasks
		  return CommandStepStartPos
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSaveAttribute() As string
		  return "Buffersize "+str(BufferSize)+" "+str(BufferOverlap)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetString(StringPosition as UInt64 = 0) As String
		  #Pragma DisableBackgroundTasks
		  if StringPosition<Length then
		    Return StringValue(StringPosition, Length-StringPosition).DefineEncoding(Encodings.UTF8)
		  else
		    return ""
		  end 
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Instr(SearchString as string, StartMode as integer = 0, StartSearchPosition as UInt64 = 0) As UInt64
		  #Pragma DisableBackgroundTasks
		  // looks for the searchstring in the buffer
		  // StartMode = 0 => use the SearchPosition
		  // StartMode = 1 => start the search from the CommandStartPos
		  // StartMode = 2 => start the search from the CommandStepStartPos
		  
		  Dim p as UInt64 = 0 // will hold the end result of the search 0 = not found
		  Dim n as integer = 0 // counter for the search loop inside the SearchString
		  Dim EndCheck as UInt64 =0 
		  Dim M as MemoryBlock = SearchString
		  //++DebugString="+++"
		  
		  Dim i as UInt64   // counter that holds the searchposition
		  Select case StartMode
		  case 1
		    i=CommandStartPos
		  case 2
		    i=CommandStepStartPos
		  else
		    i= StartSearchPosition
		  end
		  // start search
		  if Length>=M.Size then
		    EndCheck=Length-M.Size+1
		    while (p=0) and (i<EndCheck) 
		      n=0
		      while (n<M.Size) and (M.byte(n)=Byte(i+n)) // check one character after the other in the MemoryBlock
		        //++if (n>1) then
		        //++if n=2 then
		        //++DebugString=DebugString+chr(m.byte(0))+chr(m.byte(1))+chr(m.byte(2))
		        //++else
		        //++DebugString=DebugString+chr(m.byte(n))
		        //++end
		        //++end
		        n=n+1
		      wend
		      i=i+1
		      if n>=M.Size-1 then // the string has been found
		        p=i
		      end
		    wend
		  end
		  
		  return p
		  
		  Exception
		    DebugString="Error "+",i="+str(i)+",Length="+str(Length)+",n="+str(n)+",M.Size="+str(M.Size)+"EndCheck="+str(EndCheck)+",SearchString=**"+Searchstring+"**"
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetBuffer()
		  Length=0
		  CommandStartPos=0
		  CommandStepStartPos=0
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCommandStartPos()
		  #Pragma DisableBackgroundTasks
		  CommandStartPos=Length
		  CommandStepStartPos=Length
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCommandStepStartPos()
		  #Pragma DisableBackgroundTasks
		  CommandStepStartPos=Length
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BufferOverlap As Integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected BufferSize As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CommandStartPos As UInt64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private CommandStepStartPos As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		DebugString As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Length As Uint64
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TotalLength As UInt64
	#tag EndProperty

	#tag Property, Flags = &h0
		UpperAttribute As Buffer_AttributeClass = nil
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BufferOverlap"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DebugString"
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
			InitialValue="2147483648"
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
			Name="LittleEndian"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Boolean"
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
	#tag EndViewBehavior
End Class
#tag EndClass
