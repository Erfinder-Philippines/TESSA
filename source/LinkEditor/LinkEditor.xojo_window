#tag Window
Begin ContainerControl LinkEditor
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF00
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   582
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   356
   Begin PushButton DelLinkButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "X"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Erase link"
      Top             =   86
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   52
   End
   Begin PushButton InLinkButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "In<"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Make incoming Link"
      Top             =   130
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   52
   End
   Begin PushButton OutLinkButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Out>"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   10.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Make outgoing Link"
      Top             =   172
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   52
   End
   Begin Basic_TreeClass LinksList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   True
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   True
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   3
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   20
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   1
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   573
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Hierarchical Test List	Values	 "
      Italic          =   False
      Left            =   59
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   9
      Transparent     =   True
      TypeDisplayAttr =   0
      Underline       =   False
      Visible         =   True
      Width           =   297
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub ClearHighlight()
		  LinksList.ClearHighlight
		  If Not OutLinkButton.Visible Then
		    OutLinkButton.Visible = True
		  End
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rebuild()
		  LinksList.Cleanup
		  
		  Dim it As BasicIteratorInterface  = mRootBasic.Iterator
		  While it.HasNext
		    Dim BS As BasicClass = it.NextItem
		    LinksList.AddNode(BS.Name.GIAS, BS, ElementTypeFactory.instance.getBasicStepIcon(BS), BS.Indent, true)
		  Wend
		  LinksList.UpdateRowNumbers
		  LinksList.ColumnWidths="2*,*,25"
		  
		  Dim count As Integer = LinksList.ListCount - 1
		  For i As Integer = 0 To  count
		    If LinksList.Cell(i, 2) = "<" or LinksList.Cell(i, 2) = ">" Then
		      LinksList.ScrollPosition = i
		      Exit
		    End
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditorVisible(Enabled As Boolean)
		  Visible = Enabled
		  OutLinkButton.Visible = Not(Enabled And DisplayType = 5)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event InLinked(attr As AttributeClass)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event LinkDeleted(attr As AttributeClass)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event OutLinked(inAttr As AttributeClass, outAttr As AttributeClass)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event ResourceLinked(attr As AttributeClass)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return LinksList.TypeDisplayAttr
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  LinksList.TypeDisplayAttr = value
			End Set
		#tag EndSetter
		DisplayType As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return LinksList.SelectedVarlistAttribute
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  LinksList.SelectedVarlistAttribute = value
			  If value <> Nil And value.Name = "Resource" Then
			    DisplayType = 5
			  End
			End Set
		#tag EndSetter
		LinkAttribute As AttributeClass
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private mRootBasic As BasicClass = nil
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return mRootBasic
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  If mRootBasic <> value Then
			    mRootBasic = value
			    Rebuild
			  End
			End Set
		#tag EndSetter
		RootBasic As BasicClass
	#tag EndComputedProperty


#tag EndWindowCode

#tag Events DelLinkButton
	#tag Event
		Sub Action()
		  If LinkAttribute <> Nil Then
		    if DisplayType = 5 Then
		      Dim attrObj As AttributeClass = LinkAttribute
		      If attrObj <> Nil And attrObj.Name = "Resource" And attrObj.MyStep IsA StepClass Then
		        If attrObj IsA AttributeClass And AttributeClass(attrObj).LinkName = "" Then
		          Return
		        End
		        StepClass(attrObj.MyStep).RelatedResource = Nil
		        attrObj.SIAS("")
		        if attrObj IsA AttributeClass Then
		          AttributeClass(attrObj).LinkName = ""
		        End
		        attrObj.AttributeChanged
		        RaiseEvent LinkDeleted(attrObj)
		        LinksList.UpdateLinkRow(LinksList.ListIndex, attrObj.MyStep, Nil, attrObj)
		      End
		    Else
		      Dim VarlistSelectedAttribute As AttributeClass = AttributeClass(LinkAttribute)
		      If VarlistSelectedAttribute <> Nil Then
		        If DisplayType = 3 Then
		          If VarlistSelectedAttribute.Link = Nil Then
		            return
		          End
		          VarlistSelectedAttribute.DisconnectLink
		          LinkDeleted(VarlistSelectedAttribute)
		          LinksList.UpdateLinkRow(LinksList.ListIndex, Nil, Nil, VarlistSelectedAttribute)
		          VarlistSelectedAttribute.AttributeChanged
		        ElseIf DisplayType = 4 Then
		          If LinksList.ListIndex < 0 Or LinksList.ListIndex > LinksList.LastIndex Or LinksList.CellTag(LinksList.ListIndex, 0) <> Nil Then
		            Return
		          End
		          // we need a link to the real object -> update cell tag
		          // of the right list with the id of the parent entry
		          Dim HTLExSelectedAttribute As AttributeClass = Nil
		          Dim bStep As BasicClass = Nil
		          For i As Integer = LinksList.ListIndex DownTo 0
		            bStep = LinksList.CellTag(i, 0)
		            If bStep <> Nil Then
		              Dim attr As AttributeClass = bStep.GetAttribute(LinksList.Cell(LinksList.ListIndex, 0))
		              If attr IsA AttributeClass Then
		                HTLExSelectedAttribute = AttributeClass(attr)
		                If HTLExSelectedAttribute <> Nil Then
		                  Dim AttrName As String = VarlistSelectedAttribute.Name
		                  If HTLExSelectedAttribute.Link <> Nil And HTLExSelectedAttribute.Link.MyStep.GetUniqueID = VarlistSelectedAttribute.MyStep.GetUniqueID And HTLExSelectedAttribute.Link.Name = AttrName Then
		                    HTLExSelectedAttribute.DisconnectLink
		                    HTLExSelectedAttribute.AttributeChanged
		                    RaiseEvent LinkDeleted(HTLExSelectedAttribute)
		                    LinksList.UpdateLinkRow(LinksList.ListIndex, bStep, HTLExSelectedAttribute, VarlistSelectedAttribute)
		                  End
		                End
		              End
		            End
		          Next
		        End
		      End
		    End
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events InLinkButton
	#tag Event
		Sub Action()
		  // no links for missing selection or step class nodes
		  If LinksList.ListIndex >= 0 And LinksList.ListIndex < LinksList.ListCount And LinkAttribute IsA AttributeClass Then
		    Dim attrObj As AttributeClass = AttributeClass(LinkAttribute)
		    If attrObj <> Nil Then
		      If DisplayType = 5 Then
		        If attrObj.Name = "Resource" And attrObj.MyStep IsA StepClass Then
		          Dim BS As BasicClass = LinksList.CellTag(LinksList.ListIndex, 0)
		          If BS IsA Resource_StepClass Then
		            StepClass(attrObj.MyStep).RelatedResource = Resource_StepClass(BS)
		            attrObj.LinkName = BS.Name.GIAS + ".Resource"
		            attrObj.AttributeChanged
		            RaiseEvent ResourceLinked(attrObj)
		            LinksList.UpdateLinkRow(LinksList.ListIndex, BS, Nil, attrObj)
		          End
		        End
		      Else
		        // we need a link to the real object -> update cell tag
		        // of the right list with the id of the parent entry
		        For i As Integer = LinksList.ListIndex DownTo 0
		          Dim bStep As BasicClass = LinksList.CellTag(i, 0)
		          If bStep <> Nil Then
		            // set linked attribute
		            // attrObj is the attribute of the middle table
		            // attrLink is the attribute of the right table
		            // iterLinkObj used to check for circular links
		            Dim attrLink As AttributeClass = bStep.GetAttribute(LinksList.Cell(LinksList.ListIndex, 0))
		            if attrLink <> Nil then
		              Dim iterLinkObj As AttributeClass = attrLink.GetAsLinkableAttributeClass
		              Dim foundMatch As Boolean = false
		              While iterLinkObj <> nil 
		                if attrObj = iterLinkObj then 
		                  foundMatch = true
		                  exit
		                end
		                iterLinkObj = AttributeClass(iterLinkObj.Link)
		              wend
		              If (not foundMatch) And attrObj.Link <> attrLink then
		                attrObj.ConnectLink(attrLink)
		                attrObj.AttributeChanged
		                RaiseEvent InLinked(attrObj)
		                LinksList.UpdateLinkRow(LinksList.ListIndex, attrLink.MyStep, attrLink, attrObj)
		              End
		              Exit
		            End
		          End
		        Next
		      End
		    End
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events OutLinkButton
	#tag Event
		Sub Action()
		  // no links for missing selection or step class nodes
		  If LinksList.ListIndex < 0 Or LinksList.CellTag(LinksList.ListIndex,0) <> Nil Or LinkAttribute = Nil Then
		    Return
		  End
		  Dim attrObj As AttributeClass = LinkAttribute
		  If attrObj <> Nil Then
		    // we need a link to the real object -> update cell tag
		    // of the right list with the id of the parent entry
		    For i As Integer = LinksList.ListIndex DownTo 0
		      // first entry with a valid object -> parent found
		      Dim bStep As BasicClass = LinksList.CellTag(i, 0)
		      If bStep <> Nil Then
		        // set linked attribute
		        // attrObj is the attribute of the middle table
		        // attrLink is the attribute of the right table
		        // iterLinkObj used to check for circular links
		        Dim attrLink As AttributeClass = AttributeClass(bStep.GetAttribute(LinksList.Cell(LinksList.ListIndex, 0)))
		        If attrLink <> Nil Then
		          Dim iterLinkObj As AttributeClass = attrObj.GetAsLinkableAttributeClass
		          Dim foundMatch As Boolean = false
		          While iterLinkObj <> nil 
		            if attrLink = iterLinkObj then 
		              foundMatch = true
		              exit
		            end
		            iterLinkObj = AttributeClass(iterLinkObj.Link)
		          wend
		          if (not foundMatch) And attrLink.Link <> attrObj then
		            attrLink.ConnectLink(attrObj)
		            attrLink.AttributeChanged
		            RaiseEvent OutLinked(attrLink, attrObj)
		            LinksList.UpdateLinkRow(LinksList.ListIndex, attrLink.MyStep, attrLink, attrObj)
		          End
		          Exit
		        End
		      End//
		    Next
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
		Type="Color"
		EditorType="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DisplayType"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue=""
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
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
