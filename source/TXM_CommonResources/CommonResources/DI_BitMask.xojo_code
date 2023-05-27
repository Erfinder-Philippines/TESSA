#tag Class
Protected Class DI_BitMask
Inherits ResourceFunctionClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From Resource_StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		  
		  Me.ValueEnum=Me.IAS("ValueEnum","",true)
		  Me.BitEnum=Me.IAS("BitEnum","",true)
		  Me.Mask=Me.IAS("Mask","00000000",false)
		  Me.Parameter=Me.IAS("Parameter","",false)
		  
		  AddUserFunction("read",ValueEnum.Name, "", 0, UF_RunMode_OP_Loop,true )
		  AddUserFunction("read",Value.Name, "", 0, UF_RunMode_OP_Loop,true )
		  AddUserFunction("read",Attribute.Name, "", 0, UF_RunMode_OP_Loop,true )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitialState()
		  
		  Me.ProcessResult("")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  
		  
		  return "Digital-Input ok"
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  #Pragma Unused AttributeLink
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim RV as integer = 0
		  Result=""
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      RV= ResourceClass(Me.UpperStep).Poll(Result, Me.Attribute.Link)
		      if RV=2 then
		        Me.ProcessResult(Result)
		      end
		    end
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ProcessResult(Result as string)
		  
		  Dim b0, BitMask as byte
		  Dim S,S2 as string
		  Dim n as integer
		  
		  //mask and set the main byte
		  b0=Me.Attribute.GIAI
		  BitMask=ValBin(Me.Mask.GIAS)
		  b0=BitAnd(BitMask,b0)
		  Me.Value.SIAI(b0)
		  
		  //set the enum to the right selection
		  n=0
		  S=Bin(b0)
		  while (ValBin(Me.BitEnum.GIAS(n))<>b0) and (n<Me.BitEnum.GIAN-1)
		    S2=Me.BitEnum.GIAS(n)
		    n=n+1
		  wend
		  
		  if n<255 then
		    Me.ValueEnum.SIAA(n)
		    Me.BitEnum.SIAA(n)
		  end
		  S=Me.ValueEnum.GIAS
		  Me.Value.SIAS(Me.ValueEnum.GIAS)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  #Pragma Unused Parameter
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      AttributeLink=Me.Attribute.Link
		      return ResourceClass(Me.UpperStep).Run(Me.Parameter.GIAS, AttributeLink)
		    end
		  end
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		BitEnum As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mask As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameter As string_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ValueEnum As String_AttributeClass = nil
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
			Name="TimeOutValue"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
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
