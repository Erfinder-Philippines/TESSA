#tag Class
Protected Class TestReportCollection
	#tag Method, Flags = &h0
		Sub ClearAll()
		  Dim i as integer
		  for i=0 to Ubound(TRL())
		    TRL(i).Clear
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetErrorMessage(ByRef RM as string, ByRef EM as string, ByRef ErrState as integer)
		  Dim i as integer
		  Dim NoRound as boolean = true
		  
		  // collects error messages from Report Lines stored values
		  for i=0 to Ubound(TRL())
		    TRL(i).Collect(RM,EM,ErrState)
		    NoRound=false
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetReportLines() As string
		  // gets all the reportlines in the list if they are not empy
		  Dim i as integer
		  Dim S as string = ""
		  Dim NoRound as boolean = true
		  
		  for i=0 to Ubound(TRL())
		    S=S+TRL(i).Get
		    NoRound=false
		  next
		  
		  if NoRound then
		    S=S
		  end
		  
		  Return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Refresh_Teststep_ReportList(byref ix as integer)
		  Dim i as integer
		  // collects error messages from Report Lines stored values
		  for i=0 to Ubound(TRL())
		    TRL(i).Refresh_Teststep_ReportList(ix)
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLine(i as integer, vName as string, Descr as string, Crit as string, Meas as string, ErrMess as string, ErrCode as integer)
		  if i > -1 then
		    if i>Ubound(TRL()) then
		      Dim k as integer
		      Redim TRL(i)
		      for k=0 to Ubound(TRL())
		        if TRL(k)=nil then
		          TRL(k)=new TestReportLine
		        end
		      next
		      //end
		      //new delete already existing reportlines
		    else
		      if i=Ubound(TRL()) then
		      else
		        redim TRL(i)
		      end
		    end
		    
		    TRL(i).Name=vName
		    TRL(i).Description=Descr
		    TRL(i).Criteria=Crit
		    TRL(i).Measurement=Meas
		    TRL(i).Description=Descr
		    TRL(i).Message=ErrMess
		    TRL(i).Result=ErrCode
		    TRL(i).Used=true
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		TRL() As TestreportLine
	#tag EndProperty


	#tag ViewBehavior
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
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
