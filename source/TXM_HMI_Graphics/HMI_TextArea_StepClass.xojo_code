#tag Class
Protected Class HMI_TextArea_StepClass
Inherits HMI_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.Measure=Me.IAS("Measure", "",false, AttributeGroups.Appearance)
		  Me.Format=Me.IAS("Format", "",false, AttributeGroups.Appearance)
		  Me.Value=Me.IAS("Value", "",false)
		  Me.AutoFill=Me.IAE("AutoFill", "0 none date time date_time user computer",false)
		  
		  mMinimalHeight = 40
		  mMinimalWidth = 120
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return new HMI_TextArea_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // this routne is being called from an upper Test_StepClass when it proceeds it's start procedure
		  mUIUpdater.UpdateCanvas(0)
		  Super.Init_Teststep_Start
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  Super.Paint(g, mode)
		  // title and measure
		  DrawString(g, Title.GIAS, 5, 18)
		  DrawString(g, Measure.GIAS, Coordinates.Width + Coordinates.Offset + 2, 18)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  if Value.GIAS = "" then
		    Dim ActDate as Date = New Date
		    Select case Me.AutoFill.GIAI
		    case 0//none
		      
		    case 1 //date
		      Value.SIAS(ActDate.ShortDate)
		    case 2 // time
		      Value.SIAS(ActDate.LongTime)
		    case 3 // daten and time
		      Value.SIAS(ActDate.ShortDate + " " + ActDate.LongTime)
		    case 4 // user
		      Value.SIAS(App.GlobalResources.GIAS("User"))
		    case 5 // computer
		      Value.SIAS(App.GlobalResources.GIAS("Name"))
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init_AfterLoad()
		  Me.Step_Init
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Run() As boolean
		  if Visible.GIAB then mUIUpdater.UpdateCanvas(0)
		  return true
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub TextChange(NewText As String)
		  Value.SIAS(NewText)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AutoFill As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Format As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Measure As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Output As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As String_AttributeClass = nil
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
