#tag Class
Protected Class TestreportHeader
	#tag Method, Flags = &h0
		Function GetHeadder() As string
		  Dim S as string
		  Dim TAB as string = chr(9)
		  Dim CR as string = chr(13)
		  
		  
		  S="Barcode"+TAB+Me.Barcode+CR
		  
		  S=S+"Teststation"+TAB+Me.Teststation+TAB+Me.Teststation_Version+CR
		  S=S+"Testprogram version"+TAB+App.VersionString+CR
		  S=S+"Testsequence"+TAB+Me.Testprogram+TAB+Me.Testprogram_Version+CR
		  S=S+"TestDate"+TAB+Me.TestDate+CR
		  S=S+"Tester"+TAB+Me.Tester+CR
		  S=S+"ModuleType"+TAB+Me.ModuleType+CR
		  S=S+"SerialNumber"+TAB+Me.SerialNumber+CR
		  S=S+"ArticleNumber"+TAB+Me.ArticleNumber+CR
		  S=S+"ModuleRevision"+TAB+Me.ModuleRevision+CR
		  S=S+"FPGAVersion"+TAB+Me.FPGAVersion+CR
		  S=S+"Testresult"+TAB+Me.TestResult+CR
		  
		  return S
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Set(TR as integer, Keyword as string, Value1 as string, Value2 as string)
		  #Pragma Unused TR
		  
		  Select case Keyword
		  case is="Barcode"
		    Me.Barcode=Value1
		  case is="FileName"
		    Me.FileName=Value1
		  case is="SerialNumber"
		    Me.SerialNumber=Value1
		  case is="Tester"
		    Me.Tester=Value1
		  case is="Operator"
		    Me.Tester=Value1
		  case is="Testprogram"
		    Me.Testprogram=Value1
		    Me.Testprogram_Version=Value2
		  case is="Testprogramm"
		    Me.Testprogram=Value1
		    Me.Testprogram_Version=Value2
		  case is="Testprogram"
		    Me.Testprogram=Value1
		  case is="Teststation"
		    Me.Teststation=Value1
		    Me.Teststation_Version=Value2
		  case is="Name"
		    Me.Name=Value1
		  case is="Testresult"
		    Me.Testresult=Value1
		  case is="TestDate"
		    Me.Testdate=Value1
		  case is="Teststep"
		    
		  end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		ArticleNumber As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Barcode As string
	#tag EndProperty

	#tag Property, Flags = &h0
		FileName As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private FPGAVersion As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ModuleRevision As string
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ModuleType As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As string
	#tag EndProperty

	#tag Property, Flags = &h0
		SerialNumber As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Testdate As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Tester As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Testprogram As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Testprogram_Version As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Testresult As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Teststation As string
	#tag EndProperty

	#tag Property, Flags = &h0
		Teststation_Version As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="ArticleNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Barcode"
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
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="SerialNumber"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
			Name="Testdate"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Tester"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Testprogram"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Testprogram_Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Testresult"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Teststation"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Teststation_Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
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
