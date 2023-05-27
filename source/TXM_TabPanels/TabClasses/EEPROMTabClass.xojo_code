#tag Class
Protected Class EEPROMTabClass
Inherits TabClass
	#tag Method, Flags = &h0
		Sub Add_EEPROMSelection(Name as string, RowTag As String)
		  If TabContainer <> Nil And TabContainer IsA EEPROMTabContainer Then
		    EEPROMTabContainer(TabContainer).Add_EEPROMSelection(Name, RowTag)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor(ConfigText as String) -- From TabClass
		  // Constructor(ConfigText as String) -- From BasicClass
		  Super.Constructor(ConfigText)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ContainerWillClose()
		  //saving indexes of all control from tab
		  If TabContainer <> Nil And TabContainer IsA EEPROMTabContainer Then
		    Dim EEPROMtab As EEPROMTabContainer = EEPROMTabContainer(TabContainer)
		    EEPROMSectionSelectionIndex = EEPROMtab.EEPROMSectionSelection.ListIndex
		    EEPROMSelectionIndex = EEPROMtab.EEPROMSelection.ListIndex
		    EEPROMViewIndex = EEPROMtab.EPROMView.ListIndex
		    SegmentSelectionIndex = EEPROMtab.SegmentSelection.ListIndex
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateContainer() As ContainerControl
		  Dim container As ContainerControl = Super.CreateContainer
		  If container = Nil Then
		    container = new EEPROMTabContainer(Self)
		  End
		  Return container
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FillEEPROMSelection()
		  
		  'If mGlobalTopmostElement <> Nil Then
		  'Dim AllEEPROMClasses(-1) As BasicClass = mGlobalTopmostElement.FindEveryElement(GetTypeInfo(CP_EEPROM_StepClass))
		  'For Each EEPROMItem As BasicClass in AllEEPROMClasses
		  'If EEPROMItem <> Nil Then
		  'Add_EEPROMSelection(EEPROMItem.Name.GIAS, EEPROMItem.GetUniqueID)
		  'End
		  'Next
		  'End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function FitsForStep(theStep as BasicClass, ByRef isDefaultOut as Boolean) As Boolean
		  // overrides TabClass
		  
		  If theStep IsA EEPROM_Module.HMI_EEPROM_StepClass Or theStep IsA EEPROM_Module.EEPROM_Content_StepClass Then
		    isDefaultOut = true
		    return true
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitTab()
		  FillEEPROMSelection
		  If TabContainer <> Nil And TabContainer IsA EEPROMTabContainer Then
		    Dim EEPROMTab As EEPROMTabContainer = EEPROMTabContainer(TabContainer)
		    EEPROMTab.EEPROMSelection.ListIndex = EEPROMSelectionIndex
		    EEPROMTab.EEPROMSectionSelection.ListIndex = EEPROMSectionSelectionIndex
		    EEPROMTab.SegmentSelection.ListIndex = SegmentSelectionIndex
		    EEPROMTab.EPROMView.ListIndex = EEPROMViewIndex
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Remove_EEPROMSelection(EEPROM As EEPROM_Module.HMI_EEPROM_StepClass)
		  If TabContainer <> Nil And TabContainer IsA EEPROMTabContainer Then
		    EEPROMTabContainer(TabContainer).Remove_EEPROMSelection(EEPROM)
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateEEPROMTab(UpdateAttribute As AttributeClass)
		  If TabContainer <> Nil And TabContainer IsA EEPROMTabContainer Then
		    EEPROMTabContainer(TabContainer).UpdateEEPROMTab(UpdateAttribute)
		  End
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private EEPROMSectionSelectionIndex As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EEPROMSelectionIndex As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private EEPROMViewIndex As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private SegmentSelectionIndex As Integer = 0
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
	#tag EndViewBehavior
End Class
#tag EndClass
