#tag Class
Protected Class Print_Test_StepClass
Inherits Test_StepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  'PrintSettings = IAS("PrintSettings","xyz abc")
		  Orientation = IAE("Orientation","1 Portrait Landscape")
		  
		  PrintRect = IAX("PrintRect", "0 0 0 500 500", false, AttributeGroups.Appearance)
		  
		  PrintRect.EnableOffset = False
		  Title.SIAS("")
		  // AR commented out the next 2 lines
		  'PrintScale = IAD("PrintScale", 0.5, false)
		  'AddUserFunction("Print Settings",PrintSettings)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Paint(g as Graphics, mode As Integer)
		  Super.Paint(g, mode)
		  
		  If g <> Nil Then
		    g.ForeColor = GetColor("black")
		    g.DrawRect(PrintRect.X, PrintRect.Y, PrintRect.Width, PrintRect.Height)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Print()
		  // print now
		  'If Picture_Canvas <> Nil And PrintSettings.GIAS<>"" then
		  If Picture_Canvas <> Nil then
		    Dim pageSetup As New PrinterSetup
		    'pageSetup.SetupString = PrintSettings.GIAS
		    // AR added the following lines
		    pageSetup.Landscape = Orientation.GIAB
		    pageSetup.MaxHorizontalResolution = 144
		    pageSetup.MaxVerticalResolution = 144
		    Dim g As Graphics = OpenPrinter(pageSetup)
		    If g <> Nil Then
		      Dim pic As New Picture(Picture_Canvas.Width, Picture_Canvas.Height, 32)
		      pic.Transparent = 1
		      Picture_Canvas.DrawInto(pic.Graphics, 0, 0)
		      pic = pic.TrimWithMaskMBS(PrintRect.X, PrintRect.Y, PrintRect.Width, PrintRect.Height)
		      'pic  = ScalePicture(pic,PrintRect.Width, PrintRect.Height, 1, Me.Picture_Scale.GIAD)
		      g.DrawPicture(pic, 0, 0)
		    End
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_End() As boolean
		  if Super.Step_End then
		    ThreadSafeMethodCall (AddressOf Self.Print, "Print",0)
		    Return True
		  End
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  Select case FuncName
		  Case is = "Print Settings"
		    Dim settings As String
		    Dim pageSetup As New PrinterSetup
		    If pageSetup.PageSetupDialog Then
		      'PrintSettings.SIAS(pageSetup.SetupString)
		    End
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Orientation As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		PrintRect As Coordinates_AttributeClass = nil
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
			Name="GotoNext"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
			Name="InitFlag"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
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
			Name="Retries_Counter"
			Visible=false
			Group="Behavior"
			InitialValue="0"
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
			Name="TeststepReportNr"
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
