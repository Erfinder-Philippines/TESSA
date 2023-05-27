#tag Class
Protected Class Buffer_AttributeClass
Inherits AttributeClass
	#tag Method, Flags = &h0
		Sub Add(byRef SetValue as String)
		  // Set Local Value as String, does not take the Linked value but the one attached to the Attribute
		  if mBuffer<>nil then
		    mBuffer.AppendString(SetValue)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckDoublePromptCommand(byRef vPrompt1 as string, byRef vPrompt2 as string,StartMode as integer = 0, SearchPosition as UInt64 = 0, UseRegEx as boolean = false) As boolean
		  #Pragma DisableBackgroundTasks
		  if UseRegEx then
		    #Pragma DisableBackgroundTasks
		    Dim match as RegExMatch 
		    rg.SearchPattern=vPrompt1
		    match = rg.search(GetWholeCommand)
		    return match<>nil
		  else
		    Dim i as UInt64 = Instr(vPrompt1,2,0)
		    if i>0 then
		      return Instr(vPrompt2,0,i)>0
		    else
		      return false
		    end
		  end
		  
		  Exception err as RegExSearchPatternException
		    AddDebugText("ERROR: "+err.message)
		    return true
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckRegExSingleCommand(byRef vPrompt as string) As boolean
		  #Pragma DisableBackgroundTasks
		  if mBuffer<>nil then
		    Dim match as RegExMatch 
		    rg.SearchPattern=vPrompt
		    match = rg.search(mBuffer.GetCommandStepReply,0)
		    'AddDebugTextCR("RegEx "+ReplaceAll(mBuffer.GetCommandStepReply,CR,"CR")+"&&"+ReplaceAll(vPrompt,CR,"CR")+"&&")
		    return match<>nil
		  end
		  Exception err as RegExSearchPatternException
		    AddDebugText("ERROR: "+err.message)
		    return true
		    
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckRegExWholeCommand(byRef vPrompt as string) As boolean
		  #Pragma DisableBackgroundTasks
		  if mBuffer<>nil then
		    Dim match as RegExMatch 
		    rg.SearchPattern=vPrompt
		    match = rg.search(mBuffer.GetCommandReply)
		    return match<>nil
		  end
		  Exception err as RegExSearchPatternException
		    AddDebugText("ERROR: "+err.message)
		    return true
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckSinglePromptCommand(byRef vPrompt as string, StartMode as integer = 0, SearchPosition as UInt64 = 0, UseRegEx as boolean = false) As boolean
		  #Pragma DisableBackgroundTasks
		  if mBuffer<>nil then
		    if UseRegEx then
		      #Pragma DisableBackgroundTasks
		      Dim match as RegExMatch 
		      rg.SearchPattern=vPrompt
		      match = rg.search(mBuffer.GetCommandStepReply,0)
		      return match<>nil
		    else
		      return mBuffer.Instr(vPrompt,StartMode,SearchPosition)>0
		    end
		  end
		  
		  Exception err as RegExSearchPatternException
		    AddDebugText("ERROR: "+err.message)
		    return true
		    
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(Attr As AttributeClass)
		  Super.Constructor(Attr)
		  
		  rg = new RegEx
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(UpperStep as BasicClass, vName as string, vValue as string, vLink as AttributeClass, vLinkName as string, vGroup as AttributeGroups, AttrIsDynamic as boolean = false)
		  Super.Constructor(UpperStep,  vName, vLink, vLinkName, vGroup, AttrIsDynamic)
		  
		  rg = new RegEx
		  ResizeBuffer(vValue)
		  
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
		Function GetCommandStartPosition() As integer
		  if mBuffer<>nil then
		    return mBuffer.GetCommandStartPos
		  else
		    return -1
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDebug() As string
		  if mBuffer<>nil then
		    return mBuffer.DebugString
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMemBlock() As MemBlockString
		  return mBuffer
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWholeCommand() As string
		  if mBuffer<>nil then
		    return mBuffer.GetCommandReply
		  else
		    return "buffer is nil"
		  end
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
		  if mBuffer<>nil then
		    Return mBuffer.GetString
		  else
		    Return ""
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Instr(SearchString as string, StartMode as integer = 0, StartSearchPosition as UInt64 = 0) As UInt64
		  return mBuffer.Instr(SearchString, StartMode, StartSearchPosition)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InstrB(SearchString as string, StartMode as integer = 0, StartSearchPosition as UInt64, UseRegEx as boolean) As boolean
		  #Pragma DisableBackgroundTasks
		  if mBuffer<>nil then 
		    if UseRegEx then
		      Dim match as RegExMatch = nil
		      rg.SearchPattern=SearchString
		      Select Case StartMode
		      case 1
		        match = rg.search(mBuffer.GetCommandStepReply)
		      case 2
		        match = rg.search(mBuffer.GetCommandReply)
		      else
		        match = rg.search(mBuffer.GetString(StartSearchPosition))
		      end
		      return match<>nil
		    else
		      return Instr(SearchString, StartMode, StartSearchPosition)>0
		    end
		  else
		    return false
		  end
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IsDefault() As Boolean
		  Return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetDefault()
		  // resets the default value to the actual value
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizeBuffer(ResizeParameters as string)
		  
		  
		  Dim b1 as UInt64 = val(NthField(ResizeParameters," ",2))
		  Dim b2 as UInt64 = val(NthField(ResizeParameters," ",3))
		  if b1<100 then b1=1000
		  if b2>b1 then b2=b1/2
		  mBuffer = new MemBlockString(self, b1,b2)
		  mBuffer.AppendString("Buffersize "+str(b1)+" "+str(b2)+" ")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(byRef S as string)
		  // saves the attribute to a string
		  SaveAttribute(Name, S)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub SaveAttribute(AttrName As String, byRef S as string)
		  // saves the attribute to a string
		  if IsDynamic Then
		    AttrName = AttrName + "%BU"
		  End
		  if mBuffer<>nil then
		    S = S + AttrName + "=" + QM + mBuffer.GetSaveAttribute+QM + " "
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCommandStartPosition()
		  if mBuffer<>nil then
		    mBuffer.SetCommandStartPos
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCommandStepStartPosition()
		  if mBuffer<>nil then
		    mBuffer.SetCommandStepStartPos
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIASAdd(SetValue as String)
		  //add new string to existing
		  
		  mBuffer.AppendString(SetValue)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SIASAdd_CR(SetValue as String)
		  //add new string to existing
		  mBuffer.AppendString(CR+SetValue)
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
		  
		  if SetValue.InStr(1,"Buffersize")>0 then
		    ResizeBuffer(SetValue)
		  else
		    mBuffer.AppendString(SetValue)
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mBuffer As MemBlockString
	#tag EndProperty

	#tag Property, Flags = &h0
		rg As RegEx
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
