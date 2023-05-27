#tag Class
Protected Class AI_Channel
Inherits ResourceFunctionClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as string) -- From Resource_StepClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  
		  Super.Constructor(ConfigText)
		  
		  Parameter=IAS("Parameter","",false)
		  TimeOut=IAI("TimeOut",1000,false)
		  Gain=IAD("Gain",1,false)
		  Offset=IAD("Offset",0,false)
		  Formatting=IAS("Formatting","",false)
		  MultipleValues=IAB("MultipleValues",false,false)
		  
		  AddUserFunction("Measure",Value, "", 0, UF_RunMode_OP_Loop,true )
		  
		  AddUserFunction("Add Attribute",MultipleValues )
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  Dim TOT as integer
		  
		  TOT=0
		  if Me.TimeOut.GIAI>0 then
		    TOT=Me.TimeOut.GIAI
		  else
		    if Me.UpperStep<>nil then
		      if Me.UpperStep IsA ResourceClass then
		        TOT= ResourceClass(Me.UpperStep).GetTimeouttime
		      end
		    end
		  end
		  
		  return TOT
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Init_Resource() As string
		  
		  
		  return "Anaglog-Input ok"
		  
		  SetDynamicAttributeNumbers
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim RV as integer = 0
		  Dim ResD as double = 0
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      RV= ResourceClass(Me.UpperStep).Poll(Result, AttributeLink)
		      if RV=2 then
		        if Parameter.IsArray then
		          if SendState=Parameter.GIAN then
		            SendState=0
		            if MultipleValues.GIAI>1 then
		              Value.SIAS(Result)
		            else
		              ResD=Val(Result)
		              ResD=(Me.Gain.GIAD*ResD)+Me.Offset.GIAD
		              if Me.Formatting.GIAS="" then
		                Me.Value.SIAD(ResD)
		              else
		                Me.Value.SIAS(Format(ResD,Me.Formatting.GIAS))
		              end
		            end
		          end
		          // set dedicated attributes
		          SetDedicatedAttributes(Result)
		          
		          if SendState>0 then
		            RV=0
		            Dim vParameter as string = Parameter.GIAS(SendState)
		            ReplaceAttributeValues(vParameter)
		            if ResourceClass(UpperStep).Run(vParameter, AttributeLink) then
		              LastSendState=SendState
		              SendState=SendState+1
		            end
		          end
		        else
		          if MultipleValues.GIAI=1 then
		            Value.SIAS(Result)
		            SetDedicatedAttributes(Result)
		          else
		            ResD=Val(Result)
		            ResD=(Me.Gain.GIAD*ResD)+Me.Offset.GIAD
		            if Me.Formatting.GIAS="" then
		              Me.Value.SIAD(ResD)
		            else
		              Me.Value.SIAS(Format(ResD,Me.Formatting.GIAS))
		            end
		          end
		        end
		      end
		    end
		  end
		  
		  return RV
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReplaceAttributeValues(ByRef vParameter as string)
		  if NumberofDynamicAttributes>0 then
		    Dim Attr As AttributeClass 
		    Dim p_replacement as string
		    for j as integer = 0 to NumberofDynamicAttributes
		      Attr = GetAttribute(FirstDynamicAttribute+j)
		      if Attr <>nil then
		        if Attr.GetAsMultipleValuesAttributeClass.IsArray then
		          p_replacement = Attr.GIAS(SendState) //attr.GetAsMultipleValuesAttributeClass.GIAS(1)
		        else
		          p_replacement = Attr.GIAS
		        end
		        vParameter = vParameter.ReplaceAll("=>"+Attr.Name,"") // replace first the attributes that are for replies
		        vParameter = vParameter.ReplaceAll(Attr.Name,p_replacement) // now set in the attributes that are for variables
		      end
		    next
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Run(vParameter as string, AttributeLink as AttributeClass, vPrompt as string = "") As boolean
		  
		  // starts a resource comand/query
		  // return true if ok
		  // false if not done
		  // should be implemented by the final class
		  
		  if Me.UpperStep<>nil then
		    if Me.UpperStep IsA ResourceClass then
		      AttributeLink=Attribute.Link
		      SetDynamicAttributeNumbers
		      if (vParameter="") or (vParameter="Measure") then 
		        if Parameter.IsArray then
		          SendState=0
		          vParameter=Parameter.GIAS(SendState)
		        else
		          vParameter=Parameter.GIAS
		        end
		      end
		      // replace values of possible external 
		      ReplaceAttributeValues(vParameter)
		      
		      // send now
		      if ResourceClass(Me.UpperStep).Run(vParameter, AttributeLink) then
		        LastSendState=SendState
		        if Parameter.IsArray then SendState=SendState+1
		        return true
		      else
		        return false
		      end
		    end
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDedicatedAttributes(vResult as string)
		  
		  if NumberofDynamicAttributes>0 then
		    Dim Attr As AttributeClass 
		    Dim p_replacement as string
		    Dim vParameter as string = Parameter.GIAS(LastSendState)
		    for j as integer = 0 to NumberofDynamicAttributes
		      Attr = GetAttribute(FirstDynamicAttribute+j)
		      if Attr <>nil then
		        if vParameter.Instr(1, "=>"+Attr.Name)>0 then
		          Attr.SIAS(vResult)
		        end
		      end
		    next
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDynamicAttributeNumbers()
		  FirstDynamicAttribute = GetAttributeNumber(MultipleValues.Name)+1
		  LastDynamicAttribute = AttributesUbound
		  NumberofDynamicAttributes = AttributesUbound - FirstDynamicAttribute+1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  Select case FuncName
		  Case is = "Add Attribute"
		    Dim d As new CreateAttributeWindow(nil,0,"")
		    d.ShowModalWithin(MainWindow)
		    Dim vAttr As AttributeClass = d.createdAttribute
		    If vAttr <> Nil Then
		      vAttr.MyStep = self
		      AddAttributetoList(vAttr)
		      MainWindow.RedrawAttributeList
		    End
		  else
		  end
		  SetDynamicAttributeNumbers
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected FirstDynamicAttribute As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Formatting As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Gain As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected LastDynamicAttribute As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LastSendState As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		MultipleValues As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected NumberofDynamicAttributes As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Offset As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameter As string_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeOut As Integer_AttributeClass = nil
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
			Name="LastSendState"
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
