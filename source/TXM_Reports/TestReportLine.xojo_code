#tag Class
Protected Class TestReportLine
	#tag Method, Flags = &h0
		Sub Clear()
		  Name=""
		  Criteria=""
		  Description=""
		  Measurement=""
		  Message=""
		  Result=ErrorCode_Off
		  Used=false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Collect(ByRef RM as string, ByRef EM as string, ByRef ErrState as integer)
		  
		  
		  RM=RM+Me.Get
		  
		  Select case Me.Result
		  case ErrorCode_Pass
		    ErrState=ErrState
		  case ErrorCode_NotDone, ErrorCode_InProgress, ErrorCode_Skipped
		    EM=EM+"Test step "+Me.Description+" has been skipped"+chr(13)
		    //Me.ErrorMessage.SIAS(EM)
		  case ErrorCode_Fail
		    Dim ErS as string
		    ErS=Me.Message+chr(13)
		    if ErS.len>4 then
		      EM=EM+Me.Message+chr(13)
		      RM=RM+"------------------------------------------"+chr(13)+ErS+"------------------------------------------"+chr(13)
		    end
		  end
		  
		  
		  if ErrState<Me.Result then
		    ErrState=Me.Result
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Get() As string
		  Dim S as string
		  
		  S="Teststep"+chr(9)+Name+chr(9)+Description+chr(9)+Criteria+chr(9)+Measurement+chr(9)+GetError(Result)+chr(13)
		  
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh_Teststep_ReportList(byref ix as integer)
		  
		  if Used then
		    HMI_Window.Add_ReportLine(ix,Name,Description,Criteria,Measurement,Message,Result)
		    ix=ix+1
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Criteria As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Description As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Measurement As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Message As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Result As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		Used As boolean = false
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Criteria"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="Measurement"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Message"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="Result"
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
			Name="Used"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
