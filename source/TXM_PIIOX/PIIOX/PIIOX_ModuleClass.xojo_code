#tag Class
Protected Class PIIOX_ModuleClass
Inherits PIIOX_BasicModuleClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From Resource_StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  
		  Super.Constructor(ConfigText)
		  
		  Analog_In = IAD("Analog_In",0)
		  Analog_Out = IAD("Analog_Out",0)
		  SPI_Input = IAS("SPI_Input","")
		  SPI_Output = IAS("SPI_Output","")
		  I2C_Input = IAS("I2C_Input","")
		  I2C_Output = IAS("I2C_Output","")
		  Parallel_Input = IAI8("Parallel_Input",0)
		  Parallel_Output = IAI8("Parallel_Output",0)
		  
		  AddUserFunction("measure", Analog_In )
		  AddUserFunction("set", Analog_Out )
		  AddUserFunction("read", SPI_Input )
		  AddUserFunction("write", SPI_Output )
		  AddUserFunction("read",  I2C_Input)
		  AddUserFunction("write", I2C_Output )
		  AddUserFunction("read",  Parallel_Input)
		  AddUserFunction("write",  Parallel_Output)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim RV as integer = 0
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      RV= ResourceClass(Me.UpperStep).Poll(Result, AttributeLink)
		      Analog_In.SIAD(RetrieveValue(Result,"avg"))
		    end
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  // should be implemented by the final class
		  Dim RV as Boolean
		  
		  // replace the module number (x) by ther right one S0x0,0,h00 
		  Parameter = Parameter.Mid(1,2) + ModuleNr.GIAS +  Parameter.Mid(4,Parameter.Len) 
		  
		  RV=false
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      RV= ResourceClass(Me.UpperStep).Run(Parameter, AttributeLink, vPrompt)
		    end
		  end
		  
		  Return RV
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Analog_In As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Analog_Out As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		I2C_Input As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		I2C_Output As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Parallel_Input As UInt8_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Parallel_Output As UInt8_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SPI_Input As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SPI_Output As String_AttributeClass = nil
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
