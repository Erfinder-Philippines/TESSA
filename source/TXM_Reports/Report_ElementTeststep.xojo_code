#tag Class
Protected Class Report_ElementTeststep
Inherits Report_Element
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  Super.Constructor(ConfigText)
		  
		  Criteria = IAS("Criteria","",false)
		  Measurement = IAS("Measurement","",false)
		  TestResult = IAE("TestResult",ErrorCodeEnum,false)
		  
		  Format.SetENUM("ENUM Header_Line Table EEPROM TXT PDF Teststep")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReportAppendix() As string
		  Dim S as string = ""
		  if Activate.GIAB then
		    S=Super.GetReportAppendix
		    Select case Format.GIAS
		    case is="Teststep"
		      
		    else
		      S= Super.GetReportAppendix
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
		    case is="Teststep"
		    else
		      S= Super.GetReportHeader
		    end
		  end
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReportTeststep() As string
		  Dim S as string =""
		  if Activate.GIAB then
		    S = Super.GetReportTeststep
		    Select case Format.GIAS
		    case is="Teststep"
		      S="Teststep"+TAB+Parameter.GIAS+TAB+Criteria.GIAS+TAB+Measurement.GIAS+TAB+Testresult.GIAS+CR
		    else
		      
		    end
		  end
		  return S
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Criteria As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Measurement As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Testresult As Enum_AttributeClass = nil
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
