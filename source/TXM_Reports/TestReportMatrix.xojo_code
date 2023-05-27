#tag Class
Protected Class TestReportMatrix
	#tag Method, Flags = &h0
		Function CheckSize(byref vTR as integer) As boolean
		  Dim n as integer
		  
		  if vTR>-1 then
		    if (vTR+1)>UBound(Me.TRH()) then
		      ReDim Me.TRH(vTR+1)
		      Me.TRH(vTR)=new TestreportHeader
		      for n=0 to (Ubound(Me.TS()))
		        if Me.TS(n).CheckSize(vTR) then
		        end
		      next
		    end
		    return true
		  else
		    return  false
		  end
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckSizeTeststep(byref vTR as integer, byref vTS as integer)
		  Dim n as integer
		  
		  if CheckSize(vTR) then
		    if (vTS+1)>Ubound(Me.TS()) then
		      ReDim Me.TS(vTS)
		      for n=0 to Ubound(Me.TS())
		        if Me.TS(n)=nil then
		          Me.TS(n)=new TestStep("")
		          if Me.TS(n).CheckSize(vTR) then
		          end
		        end
		      next
		    end
		    if CheckSize(vTR) then
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  
		  
		  Me.FileName=ConfigText
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteContent()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub open(f as folderitem)
		  
		  if (F<>nil) and F.exists and not(f.Directory) then
		    Dim t As TextInputStream = TextInputStream.Open(F)
		    if t <> nil then
		      FileContent = t.ReadAll(Encodings.UTF8)
		      FileName=F.DisplayName
		      FileType=""
		      ParsedOk=false
		      NumTRH=0
		      
		      t.Close
		      if FileContent<>"" then
		        // define type of file
		        if FileContent.InStr(1,"{@BATCH")>0 then
		          FileType="ICT"
		          File_Identifier="1YF"
		        else
		          if FileContent.InStr(1,"Teststep"+chr(9))>0 then
		            FileType="TAB"
		            File_Identifier=FileName
		          else
		            if FileContent.InStr(1,"/>"+chr(13))>0 then
		              FileType="XML"
		              File_Identifier=FileName
		            else
		            end
		          end
		        end
		        if FileType<>"" then
		          Dim TR as integer=0
		          Parse(TR)  // 0 is the definition file of the test report
		          Loaded=true
		        end
		      end
		    end
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Parse(byref TR_Number as integer)
		  
		  
		  if TR_Number=-1 then
		    // find Teststep
		  end
		  
		  if TR_Number=-1 then
		    TR_Number=UBound(TRH())+1
		  end
		  
		  if TR_Number=0 then
		    
		  end
		  
		  if Me.CheckSize(TR_Number) then
		    
		    
		    Select case Me.FileType
		    case is="ICT"
		      Me.ParseICT(TR_Number)
		    case is="TAB"
		      Me.ParseTAB(TR_Number)
		    case is="XML"
		      
		    else
		      
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseICT(byref TR as integer)
		  Dim P_Batch, P_Test, Block_Start, Block_End,  Inner_Start1, Inner_Start2, FileLength as integer
		  Dim Line1, Line2, S as string
		  Dim BlockHeader, InnerHeader1, InnerHeader2, TeststepName , KW1, KW2,SerNum, Desc,Crit,Meas, Res as string
		  Dim NotEndofFile as boolean
		  Dim TS_nr as integer // this will be used as the number for the teststep
		  
		  FileLength=Me.FileContent.Len
		  
		  P_Batch=Me.FileContent.Instr(1,"{@BATCH")
		  P_Test=Me.FileContent.Instr(P_Batch,"{@BTEST")
		  
		  Line1=NthField(Me.FileContent,"{",2)
		  Line2=NthField(Me.FileContent,"{",3)
		  
		  if P_Batch>0 then
		    S=UpperCase(NthField(Line1,chr(124),2))
		    
		    Me.TRH(TR).Set(TR,"Testprogram",Uppercase(NthField(Line1,chr(124),11))+"_ICT",UpperCase(NthField(Line1,chr(124),12))+"_ICT")
		    Me.TRH(TR).Set(TR,"Teststation",NthField(Line1,chr(124),10),"")
		    
		    SerNum=NthField(Line2,chr(124),2)
		    
		    Me.Set_Headder(TR,SerNum,Line1,FileName)
		    
		    
		    if NthField(Line2,chr(124),3)="00" then
		      Me.TRH(TR).Set(TR,"Testresult","Pass","")
		    else
		      Me.TRH(TR).Set(TR,"Testresult","Fail","")
		    end
		    
		    S=NthField(Line2,chr(124),4)
		    S=S.Mid(5,2)+"."+S.Mid(3,2)+"."+S.Mid(1,2)+" "+S.Mid(7,2)+":"+S.Mid(9,2)+":"+S.Mid(11,2)
		    Me.TRH(TR).Set(TR,"Testdate",S,"")
		    
		    
		    Block_End=P_Test
		    NotEndofFile=true
		    TS_nr=1
		    
		    While NotEndofFile
		      
		      Crit=""
		      // find Blockstart
		      Block_Start=Me.FileContent.InStr(Block_End,"{@BLOCK")
		      if Block_Start>0 then
		        // find start of content
		        Inner_Start1=Me.FileContent.InStr(Block_Start+6,"{")
		        Inner_Start2=Me.FileContent.InStr(Inner_Start1+6,"{")
		        Block_End=Me.FileContent.InStr(Inner_Start1+6,"}")
		        BlockHeader=Me.FileContent.Mid(Block_Start,Inner_Start1-Block_Start)
		        InnerHeader1=Me.FileContent.Mid(Inner_Start1,Inner_Start2-Inner_Start1)
		        InnerHeader2=Me.FileContent.Mid(Inner_Start2,Block_End-Inner_Start2)
		        // addd new Teststep to Testreport
		        TeststepName=NthField(BlockHeader,chr(124),2)
		        
		        S=NthField(BlockHeader,chr(124),3)
		        if S.Instr(1,"00")>0 then
		          Res="Pass"
		        else
		          Res="Fail"
		        end
		        KW1=NthField(InnerHeader1,chr(124),1)
		        KW2=NthField(InnerHeader2,chr(124),1)
		        
		        Select case KW1
		        case is="{@A-Res"
		          Desc="resistance"
		          Meas=NthField(InnerHeader1,chr(124),3)
		        case is="{@A-JUM"
		          Desc="connection"
		          Meas=NthField(InnerHeader1,chr(124),3)
		        case is="{@A-IND"
		          Desc="inductivity"
		          Meas=NthField(InnerHeader1,chr(124),3)
		        case is="{@A-CAP"
		          Desc="capacity"
		          Meas=NthField(InnerHeader1,chr(124),3)
		        case is="{@A-MEA"
		          Desc="voltage"
		          Meas=NthField(InnerHeader1,chr(124),3)
		        case is="{@A-DIO"
		          Desc="diode"
		          Meas=NthField(InnerHeader1,chr(124),3)
		          S=NthField(InnerHeader1,chr(124),4)
		          //if BlockHeader.Instr(1,"t")>0 then
		          //S=S
		          //end
		          if (S="B-E") or (S="B-C") then
		            Desc="transistor"
		            Crit=S+":"+NthField(InnerHeader2,chr(124),3)+"/"+NthField(InnerHeader2,chr(124),2)
		            Meas=NthField(InnerHeader1,chr(124),3)
		            Inner_Start1=Me.FileContent.InStr(Inner_Start2+6,"{")
		            Inner_Start2=Me.FileContent.InStr(Inner_Start1+6,"{")
		            Block_End=Me.FileContent.InStr(Inner_Start1+6,"}")
		            InnerHeader1=Me.FileContent.Mid(Inner_Start1,Inner_Start2-Inner_Start1)
		            InnerHeader2=Me.FileContent.Mid(Inner_Start2,Block_End-Inner_Start2)
		            //S=NthField(InnerHeader1,chr(124),3)
		            if (S="B-E") then
		              Crit=Crit+"/B-C:"+NthField(InnerHeader2,chr(124),3)+"/"+NthField(InnerHeader2,chr(124),2)
		              
		            else
		              Crit=Crit+"/B-E:"+NthField(InnerHeader2,chr(124),3)+"/"+NthField(InnerHeader2,chr(124),2)
		            end
		            Meas=Meas+"/"+NthField(InnerHeader1,chr(124),3)
		          end
		        else
		          Desc=KW1
		        end
		        if Crit="" then
		          Select case KW2
		          case is="{@LIM2"
		            Crit=NthField(InnerHeader2,chr(124),3)+"/"+NthField(InnerHeader2,chr(124),2)
		          case is="{@LIM3"
		            Crit=NthField(InnerHeader2,chr(124),4)+"/"+NthField(InnerHeader2,chr(124),2)+"/"+NthField(InnerHeader2,chr(124),3)
		          else
		            Crit=KW2
		          end
		        end
		        
		        Meas=TrimString(Meas,chr(125)+chr(10))
		        
		        Me.Set(TR,"Teststep",TeststepName,desc,Crit,Meas,Res)
		        
		        //
		        Block_End=Block_End
		        Block_Start=Me.FileContent.InStr(Block_End,"{@BLOCK")
		      else
		        NotEndofFile=False
		      end
		      TS_nr=TS_nr+1
		    wend
		    Me.ParsedOk=true
		    TR=TR+1
		  else
		    Me.ParsedOk=false
		  end
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ParseTAB(byref TR as integer)
		  Dim n as integer
		  Dim Bcd, SerNum,Line, keyword, S2, S3, S4, S5, S6 as string
		  
		  if Me.FileContent.InStr(1,"Teststation")>0 then
		    Bcd=NthField(Me.FileContent,chr(13),1)
		    SerNum=Bcd.Mid(1,12)
		    Me.Set_Headder(TR,SerNum,Bcd,FileName)
		    n=2
		    Line=NthField(Me.FileContent,chr(13),n)
		    while (n<10) or (Line<>"")
		      keyword=NthField(Line,chr(9),1)
		      S2=NthField(Line,chr(9),2)
		      S3=NthField(Line,chr(9),3)
		      S4=NthField(Line,chr(9),4)
		      S5=NthField(Line,chr(9),5)
		      S6=NthField(Line,chr(9),6)
		      
		      Me.Set(TR,keyword,S2,S3,S4,S5,S6)
		      n=n+1
		      Line=NthField(Me.FileContent,chr(13),n)
		    wend
		    Me.ParsedOk=true
		    TR=TR+1
		  else
		    Me.ParsedOk=false
		  end
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set(byref TR as integer, Keyword as string, vName as string, Value2 as string, Value3 as string, Value4 as string, Value5 as string)
		  // set a teststep if TR is 0 then add a new teststep, else find the right stepnumber according the teststep name
		  // if the keyword is not Teststep then set unique teststep values like article number, date ....
		  
		  Dim n as integer
		  
		  if Keyword="Teststep" then
		    if TR=0 then
		      // add a new teststep
		      
		      n=Ubound(Me.TS())+1
		      
		      Me.CheckSizeTeststep(TR,n)
		      
		      Me.TS(n).Set_ICT_Criteria(TR,vName,Value2,Value3,Value4,Value5)
		      
		    else
		      // find the right step number according the test step name, if not found, a new teststep is being created
		      n=0
		      while (n<UBound(Me.TS())) and (Me.TS(n).Name<>vName)
		        n=n+1
		      wend
		      Me.CheckSizeTeststep(TR,n)
		      if Me.TS(n).Name=vName then
		        Me.TS(n).Set_ICT_Criteria(TR,vName,Value2,Value3,Value4,Value5)
		      end
		    end
		    
		    
		    //fill the unique values into this step
		  else
		    Me.TRH(TR).Set(TR,Keyword,vName,Value2)
		  end
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set_Headder(byref TR as integer, vSerNum as string, vBarcode as string, vFilNam as string)
		  if Me.CheckSize(TR) then
		    Me.TRH(TR).SerialNumber=vSerNum
		    Me.TRH(TR).FileName=vFilNam
		    Me.TRH(TR).Barcode=vBarcode
		  end
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = ICT Keywords
		
		@BATCH
		@BTEST
		@BLOCK
		@A-JUM
		@LIM2
		@TS
		@TJET
		@A-CAP
		@LIM3
		@A-IND
		@A-RES
		@A-DIO
		@A-MEA
		@D-T
	#tag EndNote

	#tag Note, Name = TAB Keywords
		
		
		
		Teststep
	#tag EndNote


	#tag Property, Flags = &h0
		FileContent As string
	#tag EndProperty

	#tag Property, Flags = &h0
		FileName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FileType As string
	#tag EndProperty

	#tag Property, Flags = &h0
		File_Identifier As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Loaded As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		NumTRH As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		ParsedOk As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		TRH(-1) As TestreportHeader
	#tag EndProperty

	#tag Property, Flags = &h0
		TS(-1) As Teststep
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="FileContent"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileName"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FileType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="File_Identifier"
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
			Name="Loaded"
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
			Name="NumTRH"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="ParsedOk"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
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
