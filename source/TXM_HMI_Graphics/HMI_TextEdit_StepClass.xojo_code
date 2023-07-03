#tag Class
Protected Class HMI_TextEdit_StepClass
Inherits HMI_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Measure = IAS("Measure", "",false, AttributeGroups.Appearance)
		  Format = IAS("Format", "",false, AttributeGroups.Appearance)
		  Value = IAS("Value", "",false)
		  AutoFill = IAE("AutoFill", "0 none date time date&time user computer",false)
		  DateFormat = IAE("DateFormat","0 YYYY.MM.DD YY.MM.DD DD.MM.YYYY DD.MM.YY",false)
		  DateSeparator = IAS("DateSeparator",".",false)
		  TitlePlacement = IAE("TitlePlacement", "0 default top none",false)
		  TimeFormat = IAE("TimeFormat","0 hh:mm:ss hh:mm",false)
		  TimeSeparator = IAS("TimeSeparator",":",false)
		  
		  mMinimalWidth = 80
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateCanvas() As ContainerControl
		  Return new HMI_TextEdit_Canvas
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init_Teststep_Start()
		  // this routne is being called from an upper Test_StepClass when it proceeds it's start procedure
		  mUIUpdater.UpdateCanvas(0)
		  mUIUpdater.SetFocus
		  Super.Init_Teststep_Start
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  // title and measure
		  Super.Paint(g, mode)
		  
		  Dim y as Integer = 18
		  Select case TitlePlacement.GIAI
		  Case 0 // default 
		    DrawString(g, Title.GIAS, 5, y)
		  Case 1 // top
		    DrawString(g, Title.GIAS, 5, y)
		    y = y + 20
		  Case 2 // none
		    y = y + 20
		  End Select
		  
		  DrawString(g, Measure.GIAS, Coordinates.Width + Coordinates.Offset + 2, y)
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
		Function Step_Start() As boolean
		  if AutoFill.GIAI>0 then
		    Dim ActDate as Date = New Date
		    Dim SDate as string
		    Dim STime as string
		    Select case DateFormat.GIAI
		    case 0 // YYYY.MM.DD 
		      SDate = str(ActDate.Year)+"."+strInt(ActDate.Month,2)+"."+strInt(ActDate.Day,2)
		    case 1 // YY.MM.DD 
		      SDate = Mid(str(ActDate.Year),3,2)+"."+strInt(ActDate.Month,2)+"."+strInt(ActDate.Day,2)
		    case 2 // DD.MM.YYYY 
		      SDate = strInt(ActDate.Day,2)+"."+strInt(ActDate.Month,2)+"."+str(ActDate.Year)
		    case 3 // DD.MM.YY 
		      SDate = strInt(ActDate.Day,2)+"."+strInt(ActDate.Month,2)+"."+Mid(str(ActDate.Year),3,2)
		    end
		    SDate=ReplaceAll(SDate,".",DateSeparator.GIAS)
		    
		    Select case TimeFormat.GIAI
		    case 0 // hh:mm:ss 
		      STime = str(ActDate.hour)+":"+strInt(ActDate.Minute,2)+":"+strInt(ActDate.Second,2)
		    case 1 // hh:mm
		      STime = str(ActDate.hour)+":"+strInt(ActDate.Minute,2)
		    end
		    STime=ReplaceAll(STime,":",TimeSeparator.GIAS)
		    
		    Select case AutoFill.GIAI
		    case 1 //date
		      Value.SIAS(SDate)
		    case 2 // time
		      Value.SIAS(STime)
		    case 3 // daten and time
		      Value.SIAS(SDate+" "+STime)
		    case 4 // user
		      Value.SIAS(App.GlobalResources.GIAS("User"))
		    case 5 // computer
		      Value.SIAS(App.GlobalResources.GIAS("Name"))
		    end
		  end
		  
		  mUIUpdater.UpdateCanvas(0)
		  
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AutoFill As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DateFormat As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		DateSeparator As String_AttributeClass = nil
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
		TimeFormat As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TimeSeparator As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TitlePlacement As Enum_AttributeClass
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
