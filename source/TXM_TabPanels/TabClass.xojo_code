#tag Class
Protected Class TabClass
Inherits BasicClass
	#tag Method, Flags = &h1000
		Sub Constructor(ConfigText as String)
		  // Calling the overridden superclass constructor.
		  Super.Constructor(ConfigText)
		  
		  TabName = IAS("TabName", "Module Tab", false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub ContainerWillClose()
		  //virtual method need overide in sub classes
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function CreateContainer() As ContainerControl
		  //virtual method must be overidden in inherited classes
		  
		  Dim container As ContainerControl = Nil
		  If TabContainer <> Nil And TabContainer IsA TabInterface Then
		    container = TabInterface(TabContainer).CloneTab
		  End
		  
		  Return container
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateWindow_unused(ParentWindow As Window)
		  'If ParentWindow <> Nil Then
		  '
		  'TabContainer = CreateContainer
		  '
		  'If TabContainer <> Nil Then
		  'ParentWindow.Title = TabName.GIAS
		  '
		  'TabContainer.Left = 0
		  'TabContainer.Top = 0
		  'TabContainer.Width = ParentWindow.Width
		  'TabContainer.Height = ParentWindow.Height
		  'TabContainer.LockBottom = true
		  'TabContainer.LockLeft = true
		  'TabContainer.LockRight = true
		  'TabContainer.LockTop = true
		  'TabContainer.EmbedWithin(ParentWindow)
		  '
		  'End
		  'End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnterTab()
		  'virtual method
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExitTab()
		  'virtual method
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FitsForStep(theStep as BasicClass, ByRef isDefaultOut as Boolean) As Boolean
		  // Virtual - return true if this TabClass can provide an editor or viewer for the given Step
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetContainer() As ContainerControl
		  return self.TabContainer
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetGlobalTopmostElement() As BasicClass
		  Return mGlobalTopmostElement
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub InitAfterLoad()
		  self.TabContainer = CreateContainer()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub InitTab()
		  //Virtual method
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RefreshShownValues(fullRedraw as Boolean = false)
		  // Needs overwriting - used when a program runs and a Step requests UI update after changing values
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetGlobalTopmostElement(BS As BasicClass)
		  mGlobalTopmostElement = BS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetTabName(NewName As String)
		  If NewName <> "" Then
		    TabName.SIAS(NewName)
		    UpdateTabName
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepSelected(BS as BasicClass)
		  // Pass this to our container
		  if TabContainer IsA TabInterface then
		    TabInterface(self.TabContainer).StepSelected (BS)
		  end 
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateTabName()
		  MainWindow.MainTab.UpdateTabs
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mGlobalTopmostElement As BasicClass = nil
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected TabContainer As ContainerControl = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		TabName As String_AttributeClass = Nil
	#tag EndProperty


	#tag Constant, Name = Attach, Type = String, Dynamic = False, Default = \"Attach", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Detach, Type = String, Dynamic = False, Default = \"Detach", Scope = Public
	#tag EndConstant


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
