#tag Class
Protected Class TestCaseList_StepClass
Inherits ReportStepClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  Me.TestCaseName = Me.IAS("TestCaseName", "", true) //set TestCaseName as Array
		  Me.TestCaseNumber = Me.IAS("TestCaseNumber","" , true)  //set TestCaseNumber as Array
		  Me.TestCaseSelection = Me.IAB("TestCaseSelection",true,true)  //set TestCaseSelection as Array
		  Me.TestCaseLogfile = Me.IAS("TestCaseLogfile", "", true) //set TestCaseLogfile as Array
		  
		  AddUserFunction("MakeList", TestCaseName.Name, "Get List", 0,UF_RunMode_Direct) // creates Button "Make List" on  TestCaseName Line
		  AddUserFunction("GetLogfile", TestCaseLogfile.Name, "Get Logfiles", 0,UF_RunMode_Direct) // creates Button "Get Logfile" on TestCaseLogfile Line
		  AddUserFunction("GenerateStructure", TestCaseSelection.Name, "Generate TC Structure", 0,UF_RunMode_Direct) // creates Button "Generate Testcase Structure"
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Generate_Structure()
		  Dim i As Integer
		  Dim S As String
		  
		  For i=0 to TestCaseSelection.GOAN-1
		    if TestCaseSelection.GOAB(i) then
		      
		    end
		  next
		  MsgBox("Testcase Structure completed")
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Get_Logfile()
		  //reads the logfile if existing and selected in TestCaseSelection
		  
		  Dim Input_Logfile As FolderItem
		  Dim i As Integer
		  Dim logtext As String
		  Dim t As TextInputStream
		  
		  
		  TestCaseLogfile.ClearAllValues         // clear all content in fields
		  
		  For i=1 to TestCaseSelection.GOAN
		    if not TestCaseSelection.GOAB(i-1) then
		      Input_Logfile = GetFolderItem(TestCaseFolder.GIAS(i-1)+"TC"+TestCaseNumber.GIAS(i-1)+" "+TestCaseName.GIAS(i-1)+"\TC"+TestCaseNumber.GIAS(i-1)+" "+TestCaseName.GIAS(i-1)+".txt") // Logfilename has to be the same name as the testcase folder name e.g TC01 Harmonic Accuracy.txt
		      if (Input_Logfile<>nil) and Input_Logfile.Exists then
		        Try
		          t = TextInputStream.Open(Input_Logfile)
		          logtext = t.ReadAll(Encodings.UTF16)//UTF8 doesnt work
		        Catch e As IOException
		          t.Close
		          MsgBox("Cannot open file "+ Str(e.ErrorNumber) +" "+e.Message)
		        end try
		        TestCaseLogfile.AddValue(logtext)
		      end
		    else
		      TestCaseLogfile.AddValue("no logfile found or not selected")
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Make_List()
		  // Searches for the Testcase folder "TCxx" within the specified tree
		  // and for a logfile with the same name as the parent folder
		  // sets the boolean value in the TestcaseSelection accordingly
		  
		  Dim Input_Folder As FolderItem
		  Dim Input_File As FolderItem
		  Dim Input_Logfile As FolderItem
		  
		  Dim TCName as string
		  Dim TCNr as string
		  Dim i, j as integer
		  Dim p1, p2 as integer
		  
		  Input_Folder = GetFolderItem(TestCaseFolder.GIAS)
		  
		  if (Input_Folder<>nil) and Input_Folder.Exists and Input_Folder.Directory and (Input_Folder.Count>0) then
		    TestCaseName.ClearAllValues         // clear all content in fields
		    TestCaseNumber.ClearAllValues     // clear all content in fields
		    TestCaseSelection.DeleteAllValues  // clear all content in fields ClearAllValues doesnt work
		    
		    for i=1 to Input_Folder.Count
		      Input_File=Input_Folder.Item(i) // testcase folder in tree
		      if (Input_File<>nil) and (Input_File.exists) and (Input_File.Directory) then
		        p1=InStr(Input_File.DisplayName,"TC") // search for "TC" in each filename entry
		        if p1>0 then
		          TCNr=Mid(Input_File.DisplayName,p1+2,2) // return case number
		          TCName=Mid(Input_File.DisplayName,p1+5) // return case name
		          TestCaseName.AddValue(TCName)
		          TestCaseNumber.AddValue(TCNr)
		          TestCaseSelection.AddValue("")
		          TestCaseSelection.SIAB(true,i)
		          For j=1 to Input_File.Count
		            Input_Logfile=Input_File.item(j)
		            p2=InStr(Input_Logfile.DisplayName, Input_File.DisplayName) // search for the same name as in Testcase Folder defined
		            if p2>0 and not Input_Logfile.Directory then
		              TestCaseSelection.SIAB(false,i) // write boolean entry false
		            end
		          next
		        end
		      end
		    next
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  
		  
		  Select case FuncName
		  Case is = "MakeList"
		    Make_List
		  Case Is = "GetLogfile"
		    Get_Logfile
		  Case Is = "Generate TC Structure"
		    Generate_Structure
		  End
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		TestCaseFolder As Path_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		TestCaseLogfile As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		TestCaseName As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		TestCaseNumber As String_AttributeClass
	#tag EndProperty

	#tag Property, Flags = &h0
		TestCaseSelection As Boolean_AttributeClass
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
			InitialValue=""
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
