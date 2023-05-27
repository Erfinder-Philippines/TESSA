#tag Class
Protected Class SelectValue_StepClass
Inherits StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  Me.Mode=Me.IAE("Mode","0 Value_x ArrayValues",false)
		  Me.Direction=Me.IAE("Direction","0 FromCommon ToCommon",false)
		  Me.Selection_Value=Me.IAS("Selection_Value","",false)
		  Me.Common=Me.IAS("Common","",false)
		  Me.Value_0=Me.IAS("Value_0", "",false)
		  Me.Value_1=Me.IAS("Value_1", "",false)
		  Me.Value_2=Me.IAS("Value_2", "",false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As Boolean
		  //
		  if Me.Direction.GIAI=0 then // FromCommon
		    Select case Me.Selection_Value.GIAI
		    case 0
		      Me.Value_0.SIAS(Me.Common.GIAS)
		    case 1
		      Me.Value_1.SIAS(Me.Common.GIAS)
		    case 2
		      Me.Value_2.SIAS(Me.Common.GIAS)
		    else
		      Me.SIAS("Value_"+Me.Selection_Value.GIAS,Me.Common.GIAS)
		    end
		  else // To Common
		    Select case Me.Selection_Value.GIAI
		    case 0
		      Me.Common.SIAS(Me.Value_0.GIAS)
		    case 1
		      Me.Common.SIAS(Me.Value_1.GIAS)
		    case 2
		      Me.Common.SIAS(Me.Value_2.GIAS)
		    else
		      Me.Common.SIAS(Me.GIAS("Value_"+Me.Selection_Value.GIAS))
		    end
		  end
		  
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		ArrayValues As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Common As String_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		Direction As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Mode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Selection_Value As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Value_0 As String_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		Value_1 As String_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		Value_2 As String_AttributeClass = NIL
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
			Name="DebugOn"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="MaxRetries"
			Visible=false
			Group="Behavior"
			InitialValue="5"
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
			Name="NextTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="double"
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
			Name="RetryWait"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RetryWaitTime"
			Visible=false
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RunMode"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
		#tag ViewProperty
			Name="Untitled"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
