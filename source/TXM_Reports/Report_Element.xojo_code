#tag Class
Protected Class Report_Element
Inherits BasicClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  Super.Constructor(ConfigText)
		  
		  Activate = IAB("Activate",true,false)
		  Format = IAE("Format","0 Header_Line Table EEPROM TXT PDF ",false)
		  Element_Link = IAS("Element_Link","",false)
		  Keyword = IAS("Keyword","", false)
		  Parameter = IAS("Parameter","", false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReportAppendix() As string
		  Dim S as string = ""
		  if Activate.GIAB then
		    Select case Format.GIAS
		    case is = "Header_Line"
		      
		    case is="Table"
		      Dim Attr as AttributeClass = Element_Link.GetLinkAsAttributeClass
		      if (Attr<>nil) then
		        if Attr.MyStep IsA Table_StepClass then
		          S="Table"+TAB+Attr.MyStep.Name.GIAS+TAB+"---------------------------"+CR
		          S=S+Table_StepClass(Attr.MyStep).GetTableAsText(0,0)+CR
		        end
		      end
		    case is="EEPROM"
		      Dim Attr as AttributeClass = Element_Link.GetLinkAsAttributeClass
		      if (Attr<>nil) then
		        if Attr.MyStep IsA EEPROM_Module.HMI_EEPROM_StepClass then
		          S="EEPROM"+TAB+Attr.MyStep.Name.GIAS+TAB+"---------------------------"+CR
		          S=S+EEPROM_Module.HMI_EEPROM_StepClass(Attr.MyStep).EEPROM.Retrieve+CR
		        end
		      end
		    case is="TXT"
		      S=Keyword.GIAS+TAB+"---------------------------"+CR+Parameter.GIAS+CR
		    end
		  end
		  return S
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReportHeader() As string
		  Dim S as string = ""
		  if Activate.GIAB then
		    Select case Format.GIAS
		    case is = "Header_Line"
		      S=Keyword.GIAS+TAB+Parameter.GIAS+CR
		    case is="Table"
		      
		    case is="EEPROM"
		      
		    case is="TXT"
		      
		    end
		  end
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReportTeststep() As string
		  Dim S as string = ""
		  if Activate.GIAB then
		    Select case Format.GIAS
		    case is = "Header_Line"
		      
		    case is="Table"
		      
		    case is="EEPROM"
		      
		    case is="TXT"
		      
		      
		    end
		  end
		  
		  return S
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Activate As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Element_Link As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Format As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Keyword As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Parameter As String_AttributeClass = nil
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
