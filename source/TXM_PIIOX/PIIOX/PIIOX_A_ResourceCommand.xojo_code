#tag Class
Protected Class PIIOX_A_ResourceCommand
Inherits ResourceFunctionClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From Resource_StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  
		  Super.Constructor(ConfigText)
		  
		  avg_Value = IAD("avg",0,false)
		  min_Value = IAD("min",0,false)
		  max_Value = IAD("max",0,false)
		  LocalAddress = IAI("LocalAddress",0,false)
		  ComParameter = IAS("ComParameter","A000,?,",false)
		  Write = IAB("Write",false,false)
		  Gain = IAD("Gain",1,false)
		  Offset = IAD("Offset",0,false)
		  Reference = IAD("Reference", 10, false)
		  ComLog = IABuffer("ComLog", "Buffersize 1000 500")
		  TimeOut = IAI("TimeOut", 0, false)
		  
		  AddUserFunction("measure",avg_Value, "", 0, UF_RunMode_OP_Loop,true )
		  AddUserFunction("measure",min_Value, "", 0, UF_RunMode_OP_Loop,true )
		  AddUserFunction("measure",max_Value, "", 0, UF_RunMode_OP_Loop,true )
		  AddUserFunction("zero",Offset)
		  AddUserFunction("Cal",Gain)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  // Part of the UserFunctions interface, timeout time in msec of the underlying call
		  return TimeOut.GIAI
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  return "SPI_Command ok"
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  #Pragma Unused AttributeLink
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim RV as integer = 0
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      RV = ResourceClass(UpperStep).Poll(Result, Attribute.Link)
		      RV = 1
		      
		      if RV = 1 then
		        if APower <> ""  then
		          // get voltage and or current
		          avg_Value.SIAD((RetrieveValue(APower, "avg") + Offset.GIAD) * Gain.GIAD)
		          Value.SIAD(avg_Value.GIAD)
		          min_Value.SIAD((RetrieveValue(APower, "min") + Offset.GIAD) * Gain.GIAD)
		          max_Value.SIAD((RetrieveValue(APower, "max") + Offset.GIAD) * Gain.GIAD)
		          RV = 2
		        else
		          // error
		          RV = 3
		        end if
		      end if
		      
		      if RV = 2 then
		        // add to comlog
		        ComLog.SIASAdd(AComLog + EndOfLine)
		      end if
		      
		      // error, show 0
		      if RV = 3 then
		        avg_Value.SIAD(0)
		        Value.SIAS("ERROR")
		        min_Value.SIAD(0)
		        max_Value.SIAD(0)
		      end if
		    end if
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  #Pragma Unused Parameter
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  Dim S as string
		  Dim RV as boolean
		  Dim ModuleType As String
		  
		  //set the enum to the right selection
		  S = Me.Value.GIAS
		  AttributeLink = Me.Attribute.Link
		  RV = true
		  
		  if ComParameter.GIAS = "" then
		    if Write.GIAB then
		      ComParameter.SIAS("A00"+LocalAddress.GIAS+",0,")
		    else
		      ComParameter.SIAS("A00"+LocalAddress.GIAS+",?,")
		    end
		  end
		  
		  Parameter = ComParameter.GIAS
		  ModuleType = Parameter
		  
		  // Check first letter only
		  Select Case ModuleType.Left(1)
		  Case "M"
		    // M00x,?,
		    Parameter = Parameter.Mid(1, 3) + LocalAddress.GIAS +  Parameter.Mid(5, Parameter.Len)
		  Else
		    // A00x,?,
		    Parameter = Parameter.Mid(1, 3) + LocalAddress.GIAS +  Parameter.Mid(5, Parameter.Len)
		  End Select
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      RV= ResourceClass(Me.UpperStep).Run(Parameter, AttributeLink,">")
		    end
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  Select case FuncName
		  Case is = "zero"
		    Offset.SIAD(Offset.GIAD-(avg_Value.GIAD/Gain.GIAD-Offset.GIAD))
		  case is = "cal"
		    Gain.SIAD(Gain.GIAD*Reference.GIAD/avg_Value.GIAD)
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		avg_Value As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ComLog As Buffer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ComParameter As string_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Gain As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LocalAddress As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		max_Value As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		min_Value As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Offset As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Reference As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		RV As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeOut As Integer_AttributeClass
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
