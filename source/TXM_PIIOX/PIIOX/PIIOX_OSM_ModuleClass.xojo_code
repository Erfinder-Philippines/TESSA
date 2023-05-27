#tag Class
Protected Class PIIOX_OSM_ModuleClass
Inherits PIIOX_BasicModuleClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From Resource_StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  
		  Super.Constructor(ConfigText)
		  
		  B = array(0,0,0,0)
		  
		  Connect_A = IAE("Connect_A","0 open pair cross From_Bus To_Bus From_To_Bus"  ) 
		  Connect_B = IAE("Connect_B","0 open pair cross From_Bus To_Bus From_To_Bus" ) 
		  
		  ModuleType.SIAS("PIIOX_OSM")
		  
		  AddUserFunction("set", Connect_B, "",  0, UF_RunMode_OP_Loop,true )
		  AddUserFunction("set", Connect_A, "",  0, UF_RunMode_OP_Loop,true )
		  
		  
		  
		  
		  
		  
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
		      if RV>0 then
		        SendState=SendState+1
		        if SendState>3 then
		          SendState=0
		          RV=2
		        else
		          RV=1
		        end
		      end
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
		  Parameter=Value.GIAS
		  if Parameter<>"" then
		    Dim Parm1 as string = NthField(Parameter,",",1)
		    Dim Parm2 as string = NthField(Parameter,",",2)
		    Connect_A.SIAS(Parm1)
		    Connect_B.SIAS(Parm2)
		  end
		  
		  Parameter = SetSPI
		  
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

	#tag Method, Flags = &h0
		Function SetSPI() As string
		  Dim RV as string
		  Dim CommandByte, DataByte as byte = 0
		  Redim B(4)
		  
		  Select case SendState
		  case 0
		    Select case Connect_A.GIAI
		    case 0 // open
		      B(0)=0
		      B(1)=0
		    case 1 // pair
		      B(0)=1
		      B(1)=1
		    case 2 // cross
		      B(0)=8
		      B(1)=4
		    case 3 // From Bus
		      B(0)=0
		      B(1)=2
		    case 4 // To_Bus
		      B(0)=2
		      B(1)=0
		    case 5 // From_To_Bus
		      B(0)=2
		      B(1)=2
		    end
		    
		    Select case Connect_B.GIAI
		    case 0 // open
		      B(2)=0
		      B(3)=0
		    case 1 // pair
		      B(2)=1
		      B(3)=1
		    case 2 // cross
		      B(2)=4
		      B(3)=8
		    case 3 // From Bus
		      B(2)=0
		      B(3)=2
		    case 4 // To_Bus
		      B(2)=2
		      B(3)=0
		    case 5 // From_To_Bus
		      B(2)=2
		      B(3)=2
		    end
		    
		    CommandByte = 1
		  case 1
		    CommandByte = 2
		  case 2
		    CommandByte = 4
		  case 3
		    CommandByte = 8
		  end
		  
		  DataByte = B(SendState)
		  
		  RV="S000,0,h"+StrHex(CommandByte,2)+",h"+StrHex(DataByte,2)
		  
		  return RV
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		B(-1) As integer = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Connect_A As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Connect_B As Enum_AttributeClass = nil
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
