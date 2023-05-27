#tag Class
Protected Class Agilent_34907A
Inherits ResourceClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From Resource_StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  
		  Super.Constructor(ConfigText)
		  
		  Me.Slot=Me.IAI("Slot",100,false)
		  Me.Parameter=Me.IAS("Parameter","SOUR:DIG:DATA:BYTE (@101)",false)
		  
		  Me.Byte1=Me.IAI8("Byte1",0,false)
		  Me.Byte2=Me.IAI8("Byte2",0,false)
		  
		  Me.Byte1_IsOutput=Me.IAB("Byte1_IsOutput",false,false)
		  Me.Byte2_IsOutput=Me.IAB("Byte2_IsOutput",false,false)
		  
		  Me.AO_CH1=Me.IAD("AO_CH1",0,false)
		  Me.AO_CH2=Me.IAD("AO_CH2",0,false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  
		  
		  return "Agilent 34907A ok, Byte1="+Byte1.GIAS+", Byte2="+Byte2.GIAS
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim RV as integer
		  
		  RV=0
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      RV= ResourceClass(Me.UpperStep).Poll(Result, AttributeLink)
		      if RV=2 then
		        Select Case AttributeLink
		        case is=Me.Byte1
		          if Me.Byte1_IsOutput.GIAB then
		          else
		            Dim S as string = Result
		            Me.Byte1.SIAI(val(Result))
		          end
		        case is=Me.Byte2
		          if Me.Byte2_IsOutput.GIAB then
		          else
		            Dim S as string = Result
		            Me.Byte2.SIAI(val(Result))
		          end
		        case is=Me.AO_CH1
		          
		        case is=Me.AO_CH2
		          
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
		  
		  RV=false
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      Select Case AttributeLink
		      case is=Me.Byte1
		        if Me.Byte1_IsOutput.GIAB then
		          Parameter="SOUR:DIG:DATA:BYTE "+str(Me.Byte1.GIAI)+" ,(@"+str(Me.Slot.GIAI+1)+")"
		        else
		          Parameter="MEAS:DIG:BYTE? (@"+str(Me.Slot.GIAI+1)+")"
		        end
		      case is=Me.Byte2
		        if Me.Byte2_IsOutput.GIAB then
		          Parameter="SOUR:DIG:DATA:BYTE "+str(Me.Byte2.GIAI)+" ,(@"+str(Me.Slot.GIAI+2)+")"
		        else
		          Parameter="MEAS:DIG:BYTE? (@"+str(Me.Slot.GIAI+2)+")"
		        end
		      case is=Me.AO_CH1
		        Parameter="SOURCE:VOLT "+Me.AO_CH1.GIAS+",(@"+str(Me.Slot.GIAI+4)+")"
		      case is=Me.AO_CH2
		        Parameter="SOURCE:VOLT "+Me.AO_CH2.GIAS+",(@"+str(Me.Slot.GIAI+5)+")"
		      end
		      RV= ResourceClass(Me.UpperStep).Run(Parameter, AttributeLink)
		    end
		  end
		  
		  Return RV
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AO_CH1 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		AO_CH2 As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Byte1 As UInt8_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Byte1_IsOutput As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Byte2 As UInt8_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Byte2_IsOutput As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		LastByte1 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LastByte2 As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameter As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Slot As Integer_AttributeClass = nil
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastByte1"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastByte2"
			Visible=false
			Group="Behavior"
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
