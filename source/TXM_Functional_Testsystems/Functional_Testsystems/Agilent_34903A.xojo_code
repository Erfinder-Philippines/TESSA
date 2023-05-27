#tag Class
Protected Class Agilent_34903A
Inherits ResourceClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From Resource_StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Dim n as integer
		  
		  Super.Constructor(ConfigText)
		  
		  
		  Me.Slot=Me.IAI("Slot",100,false)
		  Me.Parameter=Me.IAS("Parameter","SOUR:DIG:DATA:BYTE (@101)",false)
		  
		  for n=1 to 20
		    Me.Relay(n)=Me.IAB("Relay_"+str(n),false,false)
		  next
		  
		  
		  
		End Sub
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
		    end
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(Parameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  // should be implemented by the final class
		  Dim RV as Boolean
		  Dim n as integer
		  
		  Parameter=""
		  RV=false
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      for n=1 to 20
		        if AttributeLink=Me.Relay(n) then
		          if Me.Relay(n).GIAB then
		            Parameter="ROUT:CLOSE (@"+str(Me.Slot.GIAI+n)+")"
		          else
		            Parameter="ROUT:OPEN (@"+str(Me.Slot.GIAI+n)+")"
		          end
		        end
		      next
		      if Parameter<>"" then
		        RV= ResourceClass(Me.UpperStep).Run(Parameter, AttributeLink)
		      end
		    end
		  end
		  
		  Return RV
		End Function
	#tag EndMethod


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
		Relay(20) As Boolean_AttributeClass
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
