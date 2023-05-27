#tag Class
Protected Class ReportFilterClass
Inherits BasicClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Type = IAS("Type", "", False)
		  Revision = IAS("Revision", "", False)
		  ArticleNumber = IAS("ArticleNumber", "", False)
		  Result = IAS("Result", "", False)
		  TestType = IAS("TestType", "", False)
		  DateFrom = IAS("DateFrom", "", False)
		  DateTo = IAS("DateTo", "", False)
		  
		  ReportTemplate=IAS("ReportTemplate","",false)
		  
		  Include_TemporaryFiles=IAB("Include_TemporaryFiles",false,false)
		  Include_Repetitions=IAB("Include_Repetitions",false,false)
		  Include_FYP=IAB("Include_FYP",false,false)
		  Folder = IAPath("Folder","Folder",false, True)
		  TotalNumFiles=IAI("TotalNumFiles",5000,false)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteIncluded_ReportFilterItems()
		  Dim BS,FS as BasicClass =FirstSubStep
		  while BS<>nil
		    FS=BS
		    BS=BS.NextStep
		    if FS IsA ReportFilterItemClass then
		      DeleteBasicStepClass(FS, True)
		    end
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RA(vName as string, Value as string) As string
		  // returns a string in the form Name="Value" for storage as TESSA xml element-attribute
		  
		  return " "+vName+"=" + chr(34) + Value  + chr(34)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RFIC(vName as string, vField as string, vFormat as string, vValue as string, vSearch as string = "=", vCombine as string = "AND")
		  //add a ReportFilterItem to the ReportFilter via xml-parsing
		  if vValue<>"" then
		    Dim XML_Text_Pointer as integer = 1
		    Dim S as string = "<ReportFilterItem"+RA("Name",vName)+RA("OnOff" ,"on" )+RA("Field",vField)+RA("FieldFormat",vFormat)+RA("Value",vValue)+RA("CombineOperation",vCombine)+RA("SearchOperation",vSearch)+ "  />"
		    Parse_XML(self,S,XML_Text_Pointer)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TransferToNewForm()
		  //Transfers all old attribute settings of a ReportFilter into new ReportFilterItems
		  
		  DeleteIncluded_ReportFilterItems
		  
		  RFIC("Type","Type","string",Type.GIAS)
		  RFIC("TestType","TestType","string",TestType.GIAS)
		  RFIC("ArticleNumber","ArticleNumber","string",ArticleNumber.GIAS)
		  RFIC("Revision","Revision","string",Revision.GIAS)
		  RFIC("Result","Result","string",Result.GIAS)
		  
		  RFIC("DateFrom","DateFrom","Date",DateFrom.GIAS)
		  RFIC("DateTo","DateTo","Date",DateTo.GIAS)
		  
		  
		  
		  if Include_FYP.GIAB then
		    RFIC("Include_FYP","Run","string","R1,S1,F1","contains","and")
		  end
		  
		  if Include_Repetitions.GIAB then
		    RFIC("Include_Repetitions","Run","string","R,S,","or")
		  end
		  
		  if Include_TemporaryFiles.GIAB then
		    RFIC("Include_TemporaryFiles","Run","string","U","or")
		  end
		  
		  // now transform all included filters
		  Dim BS as BasicClass = FirstSubStep
		  while BS<>nil
		    if BS IsA ReportFilterClass then
		      ReportFilterClass(BS).TransferToNewForm
		    end
		    BS=BS.NextStep
		  wend
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ArticleNumber As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		DateFrom As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DateTo As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Folder As Path_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Include_FYP As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Include_Repetitions As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Include_TemporaryFiles As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		ReportTemplate As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Result As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Revision As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TestType As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TotalNumFiles As Integer_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As String_AttributeClass = nil
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
