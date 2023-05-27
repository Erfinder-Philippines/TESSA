#tag Class
Protected Class TabManager
	#tag Method, Flags = &h0
		Shared Sub AddElements(BCF as BasicClassFactory)
		  // #44 - why can some be missig here (e.g. TableTabClass), but if we do not declare these, we see no tabs?
		  BCF.AddNewElement("BasicTab", GetTypeInfo(TabClass), "BasicTab", 1)
		  BCF.AddNewElement("AttributesTab", GetTypeInfo(AttributesTabClass), "AttributesTab", 1)
		  BCF.AddNewElement("SourceTab", GetTypeInfo(SourceTabClass), "SourceTab", 1)
		  BCF.AddNewElement("LogTab", GetTypeInfo(LogTabClass), "LogTab", 1)
		  BCF.AddNewElement("StartupTab", GetTypeInfo(StartupTabClass), "StartupTab", 1)
		  BCF.AddNewElement("SchematicTab", GetTypeInfo(SchematicTabClass), "SchematicTab", 1)
		  BCF.AddNewElement("ElementsTab", GetTypeInfo(ElementsTabClass), "ElementsTab", 1)
		  BCF.AddNewElement("HelpTab", GetTypeInfo(HelpTabClass), "HelpTab", 1)
		  BCF.AddNewElement("GraphTab", GetTypeInfo(GraphTabClass), "GraphTab", 1)
		  BCF.AddNewElement("ReportTab", GetTypeInfo(ReportTabClass), "ReportTab", 1)
		  BCF.AddNewElement("SyncTab", GetTypeInfo(SyncTabClass), "SyncTab", 1)
		  BCF.AddNewElement("COMTab", GetTypeInfo(COMTabClass), "COMTab", 1)
		  BCF.AddNewElement("EthernetComTab", GetTypeInfo(EthernetCOMTabClass), "EthernetComTab", 1)
		  BCF.AddNewElement("PIIOXComTab", GetTypeInfo(PIIOXCOMTabClass), "PIIOXComTab", 1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetAllTabClasses() As TabClass()
		  Dim Result() As TabClass
		  If App <> Nil And App.GlobalTopmostElement <> Nil Then
		    GetTabClasses (App.GlobalTopmostElement, Result)
		  End
		  Return Result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetAttributesTabClass() As AttributesTabClass
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(GetTypeInfo(AttributesTabClass))
		  If BC <> Nil And BC IsA AttributesTabClass Then
		    Return AttributesTabClass(BC)
		  End
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function GetBasicClassByTypeInfo(ti As Introspection.TypeInfo) As BasicClass
		  If App <> Nil And App.GlobalTopmostElement <> Nil And ti <> Nil Then
		    Return App.GlobalTopmostElement.FindElement(ti)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetEEPROMTabClass() As EEPROMTabClass
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(GetTypeInfo(EEPROMTabClass))
		  If BC <> Nil And BC IsA EEPROMTabClass Then
		    Return EEPROMTabClass(BC)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetGraphTabClass() As GraphTabClass
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(GetTypeInfo(GraphTabClass))
		  If BC <> Nil And BC IsA GraphTabClass Then
		    Return GraphTabClass(BC)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetLogTabClass() As LogTabClass
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(GetTypeInfo(LogTabClass))
		  If BC <> Nil And BC IsA LogTabClass Then
		    Return LogTabClass(BC)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetReportTabClass() As ReportTabClass
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(GetTypeInfo(ReportTabClass))
		  If BC <> Nil And BC IsA ReportTabClass Then
		    Return ReportTabClass(BC)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetSchematicTabClass() As SchematicTabClass
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(GetTypeInfo(SchematicTabClass))
		  If BC <> Nil And BC IsA SchematicTabClass Then
		    Return SchematicTabClass(BC)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetSourceTabClass() As SourceTabClass
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(GetTypeInfo(SourceTabClass))
		  If BC <> Nil And BC IsA SourceTabClass Then
		    Return SourceTabClass(BC)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetStartupTabClass() As StartupTabClass
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(GetTypeInfo(StartupTabClass))
		  If BC <> Nil And BC IsA StartupTabClass Then
		    Return StartupTabClass(BC)
		  else
		    Return Nil
		  End
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub GetTabClasses(BC As BasicClass, Result() As TabClass)
		  If BC <> Nil Then
		    If BC IsA TabClass Then
		      result.Append(TabClass(BC))
		    End
		    
		    BC = BC.FirstSubStep
		    While BC <> Nil
		      GetTabClasses(BC, Result)
		      BC = BC.NextStep
		    Wend
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function GetTableTabClass() As TableTabClass
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(GetTypeInfo(TableTabClass))
		  If BC <> Nil And BC IsA TableTabClass Then
		    Return TableTabClass(BC)
		  End
		  Return Nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Sub RegisterAllTabs(intoRoot as BasicClass)
		  // #44 - This is where we add all TabClass subclasses statically now, instead of reading them from the Config file (though they can still appear there, too).
		  
		  registerTabClass (new StartupTabClass(""), "StartupTab", "Startup", true)
		  registerTabClass (New AttributesTabClass(""), "AttributesTab", "Attributes")
		  registerTabClass (new ElementsTabClass(""), "ElementsTab", "Elements")
		  registerTabClass (new TableTabClass(""), "TableTab", "Table")
		  registerTabClass (New GraphTabClass(""), "GraphTab", "Graph")
		  registerTabClass (New SourceTabClass(""), "SourceTab", "Source")
		  registerTabClass (New ReportTabClass(""), "ReportTab", "Report")
		  registerTabClass (new LogTabClass(""), "LogTab", "Log")
		  registerTabClass (new SchematicTabClass(""), "SchematicTab", "Schematic")
		  registerTabClass (new PIIOXCOMTabClass(""), "PIIOXTab", "PIIOX")
		  registerTabClass (New EEPROMTabClass(""), "EEPROMTab", "EEPROM")
		  
		  // Now register them with the MainWindow's CustomTabPanel
		  Dim allTabs() As TabClass = GetAllTabClasses()
		  //sort the tabs so that StartupTab is the defaultTab
		  allTabs = SortStartupTab(allTabs)
		  For Each tab As TabClass In allTabs
		    
		    // Not include Help Tab
		    If tab IsA HelpTabClass Then
		      Continue
		    End If
		    
		    If tab.GetContainer <> Nil Then
		      // This is a tab with a GUI
		      MainWindow.MainTab.AddTab tab, tab.GetContainer
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Sub registerTabClass(instance as TabClass, className as String, visibleName as String, atFront as Boolean = false)
		  Dim BC As BasicClass = GetBasicClassByTypeInfo(Introspection.GetType(instance))
		  if BC <> nil then
		    // already registered
		    return
		  end if
		  
		  dim tab as TabClass = TabClass (SNMS (instance, className, 1, ""))
		  tab.SetTabName visibleName
		  
		  // Link into the tree at the Config node
		  dim root as BasicClass = App.GlobalTopmostElement
		  dim config as BasicClass = root.FindElement (GetTypeInfo (TESSA_Config))
		  config.AddSubElement tab, atFront
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Shared Function SortStartupTab(Tabs() as TabClass) As TabClass()
		  dim startupTabTemp as TabClass
		  For i as Integer = 0 to Tabs.LastRowIndex
		    If Tabs(i) isA StartupTabClass Then
		      startupTabTemp = Tabs(i)
		      Tabs.RemoveRowAt(i)
		      //insert startup tab at the beginning
		      Tabs.AddRowAt(0,startupTabTemp)
		      Exit
		    End If
		  Next
		  Return Tabs
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Shared mTabsAndContainers() As Pair
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
