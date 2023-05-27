#tag Class
Protected Class PIIOX_AIN14_Module
Inherits PIIOX_BasicModuleClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From Resource_StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  
		  Super.Constructor(ConfigText)
		  
		  Command_In = IAE("Command", "0 meas", False, AttributeGroups.Parameters)
		  Mode_In = IAE("Mode", "0 pos neg diff", False, AttributeGroups.Parameters)
		  Channel_In = IAI8("Channel", 1)
		  Sample_In = IAI8("Sample", 100)
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
		  
		  if Parameter<>"" then
		    Parameter="M000,?,AIN14,"+Parameter
		  end
		  // replace the module number (x) by the right one S0x0,0,h00 
		  Parameter = Parameter.Mid(1,2) + ModuleNr.GIAS +  Parameter.Mid(4,Parameter.Len)
		  
		  // add additional parameters to specify what to do
		  
		  'if ModuleType.GIAS = "AIN14" then
		  'Parameter = Parameter + ModuleType.GIAS + ",Command=" + Command_In.GIAS + _
		  '",Mode=" + Mode_In.GIAS + _
		  '",channel=" + Channel_In.GIAS + _
		  '",samples=" + Sample_In.GIAS
		  'end if
		  
		  
		  
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
		Channel_In As UInt8_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Command_In As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode_In As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Sample_In As UInt8_AttributeClass = nil
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
