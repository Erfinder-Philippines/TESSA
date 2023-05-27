#tag Class
Protected Class External_TESSA_Module
Inherits StepClass
	#tag Method, Flags = &h0
		Function ChooseVersion() As boolean
		  // find latest version on disk and compare to the loaded version , give back the latest version
		  
		  Dim NewVersionFound as boolean = false
		  Dim S as string = FileName.GIAS
		  Dim NewestVersion as string =S
		  Dim Vers as string = GetVersionInfo(S) // VersionInfo
		  Dim F as string = FileName.GIAS
		  Dim i as integer = InstrReverse(F,0,PathSeparator)
		  if i>0 then
		    F=F.Mid(1,i-1)
		  else
		    F=GetWorkingFolder+PathSeparator+"Externals"
		  end
		  
		  Dim VE as string
		  Dim NewVers as string = ""
		  Dim folder as FolderItem = GetFolderItem( F )
		  
		  if CheckFolder(folder) then
		    Dim count As Integer = folder.Count
		    For i = 1 to count
		      Dim item As FolderItem = folder.Item(i)
		      If item <> Nil and item.Exists Then
		        If item.DisplayName.Left(1) <> "." Then
		          If item.Directory Then
		          Else
		            if (item.DisplayName.Instr(1,S)>0) then
		              // now check if it belongs to the default if yes set it into the
		              VE=item.DisplayName
		              NewVers=GetVersionInfo(VE)
		              if val(NewVers)>val(Vers) then
		                Vers=NewVers
		                NewestVersion=item.NativePath
		                NewVersionFound=true
		              end
		            end
		          end
		        end
		      end
		    next
		  end
		  // finally set the found version  and file info back to the attributes
		  Version.SIAS(Vers)
		  FileName.SIAS( NewestVersion)
		  
		  return NewVersionFound
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as string)
		  // Calling the overridden superclass constructor.
		  
		  Super.Constructor(ConfigText)
		  
		  FileName=Me.IAPath("FileName","",false)
		  SaveMode = IAE("SaveMode","0 internal_only external_only internal_&_external",false)
		  LoadMode = IAE("LoadMode","0 manual_only on_prog_load on_init on_run",false)
		  VersionCheck = IAB("VersionCheck",false)
		  Version = IAS("Version","0")
		  
		  AddUserFunction("Load External",FileName)
		  AddUserFunction("Save External",FileName)
		  
		  AddUserFunction("Add Attribute",LoadMode)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetVersionInfo(byRef S as string) As string
		  
		  Dim V as string = ""
		  
		  Dim i,k as integer = InstrReverse(S,0,".xml")
		  if i>0 then
		    // check if there is already a version info
		    k = InstrReverse(S,0,"_v")
		    if k>0 then
		      // found a version info
		      k=k+2
		      V=S.Mid(k,i-k)
		      S=S.Mid(1,k-1)
		    else
		      // no existing version info
		      k=i-1
		      S=S.Mid(1,k)
		    end
		  end
		  
		  k = InstrReverse(S,0,PathSeparator)
		  if k>0 then
		    k=k+1
		    S=S.Mid(k,S.len)
		  end
		  
		  return V
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadExternalPart(vCaller as integer)
		  // loads the external module, after checking version
		  // vCaller defines where is has been called:
		  // 0 = manual
		  // 1 = with program load
		  // 2 = after init
		  // 3 = while running 
		  
		  Dim LoadFile as boolean = false
		  
		  // check if existing or external version is newer
		  if vCaller=0 then
		    LoadFile = true
		  else
		    if vCaller>=LoadMode.GIAI then
		      if VersionCheck.GIAB then
		        LoadFile = ChooseVersion
		      else
		        LoadFile = true
		      end
		    end
		  end
		  
		  if LoadFile then
		    // loads this external part of the testprogamm
		    Dim vFileName as string = FileName.GIAS
		    Dim XML_Text_Pointer1, XML_Text_Pointer2 as integer
		    
		    Dim Content as string = OpenMeasFileForLoad("",vFileName)
		    if Content="" then
		      Content=OpenMeasFileForLoad("Externals",vFileName)
		    end
		    if Content<>"" then
		      // delete content of self first
		      DeleteIncludedElements
		      //set pointer to second line in order not to load the same again
		      XML_Text_Pointer1=InStr(1,Content,"<")
		      XML_Text_Pointer1=InStr(XML_Text_Pointer1+1,Content," ")
		      XML_Text_Pointer2=InStr(XML_Text_Pointer1+1,Content,"<")
		      Dim AttributeString as string  = Content.Mid(XML_Text_Pointer1,XML_Text_Pointer2-XML_Text_Pointer1-1)
		      Parse_Header(AttributeString)
		      
		      Parse_XML(Self,Content,XML_Text_Pointer2)
		      Me.Loaded=true
		      //override existing attibutes from containing element
		      UpperStep.ConnectAllLinks
		      MainWindow.HTL.UpdateTree
		      AddWarningTextCR("External module "+vFileName+" loaded successfully!")
		    else
		      AddWarningTextCR("External module "+vFileName+" not be loaded!")
		    end
		    FileName.SIAS(vFileName)
		  end
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Save(byRef S as string, Level as integer, IncludeSubSteps as boolean = true)
		  // save module as part of upper test program
		  
		  if SaveMode.GIAI=1 then
		    Super.Save(S,Level,false)
		  else
		    Super.Save(S,Level,true)
		  end
		  
		  // save external mnodule also
		  if SaveMode.GIAI>0 then
		    if SaveModule then
		      AddWarningTextCR("External module "+FileName.GIAS+" successfully saved!")
		    else
		      AddWarningTextCR("External module "+FileName.GIAS+" could not be saved!")
		    end
		  end
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SaveModule() As boolean
		  Dim S as string
		  // get file name
		  if FileName.GIAS="" then
		    
		    
		  end
		  
		  // add version info to file name
		  if VersionCheck.GIAB then
		    S=FileName.GIAS
		    Dim i,k as integer = InstrReverse(S,0,".xml")
		    if i>0 then
		      // check if there is already a version info
		      k = InstrReverse(S,0,"_v")
		      if k>0 then
		        // found a version info
		        k=k-1
		      else
		        // no existing version info
		        k=i-1
		      end
		    end
		    S=S.Mid(1,k)+"_v"+Version.GIAS+".xml"
		    FileName.SIAS(S)
		  end
		  
		  S=""
		  Super.Save(S,0)
		  
		  return OpenMeasFileForSave(S,FileName.GIAS)
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Step_Init()
		  if  LoadMode.GIAI=1 then
		    LoadExternalPart(2)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Step_Start() As boolean
		  if  LoadMode.GIAI=2 then
		    LoadExternalPart(3)
		  end
		  return Super.Step_Start
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserFunction(Attr as AttributeClass, FuncName as string)
		  Select case FuncName
		  Case is = "Load External"
		    LoadExternalPart(0)
		    MainWindow.HTL.UpdateTree
		  Case is = "Save External"
		    if SaveModule then
		    else
		    end
		  Case is = "Add Attribute"
		    Dim d As new CreateAttributeWindow(nil,0,"")
		    d.ShowModalWithin(MainWindow)
		    Dim vAttr As AttributeClass = d.createdAttribute
		    If vAttr <> Nil Then
		      vAttr.MyStep = self
		      AddAttributetoList(vAttr)
		      MainWindow.RedrawAttributeList
		    End
		  else
		    
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		FileName As Path_AttributeClass = NIL
	#tag EndProperty

	#tag Property, Flags = &h0
		Loaded As boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		LoadMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SaveMode As Enum_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		Version As String_AttributeClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		VersionCheck As Boolean_AttributeClass = nil
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
			Name="Loaded"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="boolean"
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
