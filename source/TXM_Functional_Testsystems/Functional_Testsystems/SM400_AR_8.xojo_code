#tag Class
Protected Class SM400_AR_8
Inherits TCP_ResourceClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor(ConfigText)
		  
		  Me.Voltage=Me.IAD("Voltage",0,false)
		  Me.MaxVoltage=Me.IAD("MaxVoltage",400,false)
		  Me.Current=Me.IAD("Current",0,false)
		  Me.MaxCurrent=Me.IAD("MaxCurrent",8,false)
		  Me.OutputActive=Me.IAB("OutputActive",false,false)
		  
		  Me.ERROR=Me.IAS("ERROR","",false)
		  
		  AddUserFunction("set",ResourceFunction.Name, "", 0, UF_RunMode_OP_Loop,true )
		  AddUserFunction("get error",ERROR.Name, "", 0, UF_RunMode_OP_Loop,true )
		  AddUserFunction("Init", ComLog.Name, "", 0, UF_RunMode_OP_Loop,true )
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTimeouttime() As integer
		  
		  return 5000
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Poll(byRef Result as string, AttributeLink as AttributeClass) As integer
		  #Pragma Unused Result
		  #Pragma Unused AttributeLink
		  // polls for the function to finish
		  // gives back 1 for not finished, 2 for finished and 3 for error
		  Dim RV as integer = 0
		  if Me.CurrentManualOP="Init" then
		    RV=1
		  else
		    RV=2
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
		  Dim RV as boolean
		  
		  RV=false
		  
		  Select Case AttributeLink
		  case is=Me.Voltage
		    Parameter="SOUR:VOLT "+Me.Voltage.GIAS
		    RV=true
		  case is=Me.Current
		    Parameter="SOUR:CURR "+Me.Current.GIAS
		    RV=true
		  case is=Me.OutputActive
		    Parameter="OUTP "+str(Me.OutputActive.GIAI)
		    RV=true
		  case is=Me.ERROR
		    Parameter="SYST:ERR?"
		    RV=true
		  case is=Me.ERROR
		    Parameter="IDN?"
		    RV=true
		  case is=Me.ComLog
		    if Parameter="Init" then
		      Me.CurrentManualOP=Parameter
		      Select case Me.SendState
		      case 0
		        Me.SendState=1
		        Parameter="SYST:REM:CV REM"
		      case 1
		        Me.SendState=2
		        Parameter="SYST:REM:CC REM"
		      case 2
		        Me.SendState=3
		        Parameter="SOUR:VOLT:MAX "+MaxVoltage.GIAS
		      case 3
		        Me.SendState=4
		        Parameter="SOUR:CURR:MAX "+MaxCurrent.GIAS
		      case 4
		        Parameter="OUTP 1"
		        Me.CurrentManualOP=""
		        Me.SendState=0
		      else
		      end
		      RV=true
		    end
		  case is=Me.Command
		    Parameter=Command.GIAS
		    RV=true
		  end
		  
		  ComLog.SIASAdd_CR(Parameter)
		  
		  Me.Send(Parameter)
		  
		  return RV
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Current As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		CurrentManualOP As string
	#tag EndProperty

	#tag Property, Flags = &h0
		ERROR As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxCurrent As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxVoltage As Double_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		OutputActive As Boolean_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Voltage As Double_AttributeClass = nil
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
			Name="AddCommandtoComLog"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="boolean"
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
			Name="CurrentManualOP"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataAvailable"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastPrmptCheck"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="UInt64"
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
			Name="mPromptCombined"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
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
			Name="PollCounter"
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
			Name="StartCommandPosition"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
