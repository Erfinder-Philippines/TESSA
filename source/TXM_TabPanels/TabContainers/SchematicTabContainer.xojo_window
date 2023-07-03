#tag Window
Begin GraphicalTabContainer SchematicTabContainer Implements TabInterface
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cF5F6F700
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   True
   Height          =   692
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   True
   LockRight       =   False
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   1035
   Begin Label CurrentTestStep
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   19.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   5
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   394
   End
   Begin TestStepContainer OutgoingStep
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      Bottom          =   0
      darkModeEnabled =   False
      defaultHeight   =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      HasBackgroundColor=   False
      Height          =   164
      Index           =   -2147483648
      InitialParent   =   ""
      isExpanded      =   False
      Left            =   882
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   33
      Transparent     =   True
      Visible         =   True
      Width           =   142
   End
   Begin SchematicCanvasContainer SchemCanvasContainer
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
      Height          =   638
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      pageIndex       =   0
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   33
      Transparent     =   True
      Visible         =   True
      Width           =   861
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub DarkModeTabElements(value as Boolean)
		  SchemCanvas.darkModeEnabled = value
		  OutgoingStep.darkModeEnabled = value
		  If value Then
		    Self.BackgroundColor = &c2D3137 '&c23282D
		    CurrentTestStep.TextColor = Color.White
		  Else
		    Self.BackgroundColor = &cF5F6F7 'RGB(240,240,240)'&cF0F0F0
		    CurrentTestStep.TextColor = Color.Black
		  End If
		  
		  Self.Invalidate(False)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return New SchematicTabContainer(Self.mSchematicTabClass)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mSchematicTabClass = SchematicTabClass(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawElements(bc as BasicClass)
		  If bc.FirstSubStep <> Nil Then
		    bc = bc.FirstSubStep
		    Dim eNumber,x,y,width,height As Integer
		    eNumber = 1
		    dim pic as Picture
		    Do
		      If Not elementExists(bc.GetUniqueID) Then
		        drawElements(bc, eNumber, bc.UpperStep.GetUniqueID)
		      End If
		      
		      If Not (bc isa TESSA_Prog_StepClass or bc isa Test_StepClass) Then
		        // For direct child elements. E.g. XY_Curve under Graph
		        If bc.FirstSubStep <> Nil Then
		          Dim childBs as BasicClass = bc.FirstSubStep
		          While childBs <> Nil
		            drawElements(childBs, eNumber, bc.UpperStep.GetUniqueID)
		            childBs = childBs.NextStep
		          Wend
		          
		        End If
		      End If
		      
		      bc = bc.NextStep
		    Loop Until bc = Nil
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawElements(bc as BasicClass, ByRef elementNum as Integer, parentID as String)
		  Dim eNumber,x,y,width,height As Integer
		  dim pic as Picture
		  
		  pic = ElementTypeFactory.instance.GetBasicStepBigIcon(bc)
		  x = bc.ELT.X
		  y = bc.ELT.Y
		  width = bc.ELT.Width
		  height = bc.ELT.Height
		  //(element name, elementnum, attributes, parentTestStep, ID, icon)
		  dim ec as new ElementContainer(bc.Name.GIAS, elementNum, getAttributeList(bc),_
		  parentID, bc.GetUniqueID, pic)
		  ec.Visible = False
		  ec.EmbedWithin(SchemCanvas, x, y)
		  If (width >= ec.minWidth and width <= ec.maxWidth) And _
		    (height >= ec.minHeight and height <= ec.maxHeight) Then
		    ec.Width = width
		    ec.Height = height
		  Else
		    resetElementContainerSize(bc,width,height,ec)
		  End If
		  ec.Parent = SchemCanvas
		  SchemCanvas.Container.Append(ec)
		  elementNum  = elementNum  + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub drawLinks(bc as BasicClass)
		  If (bc<>Nil) And (bc.FirstSubStep<>Nil) Then
		    bc = bc.FirstSubStep
		    Do
		      Dim attrUbound As Integer = bc.AttributesUbound
		      If attrUbound <> -1 Then
		        For i as Integer = 0 to attrUbound
		          If (bc.GetAttribute(i)<>Nil) And (bc.GetAttribute(i).Link <> Nil) Then
		            dim sourceAC as AttributeClass = bc.GetAttribute(i).Link
		            dim sourceBC as BasicClass = sourceAC.MyStep
		            If sourceAC <> Nil and sourceBC <> Nil Then
		              dim toEC as ElementContainer = findElementContainer(bc.GetUniqueID)
		              dim fromEC as ElementContainer = findElementContainer(sourceBC.GetUniqueID)
		              dim sourceIndex as Integer = sourceBC.GetAttributeNumber(sourceAC.Name)
		              If toEC <> Nil and fromEC <> Nil then
		                dim newLink as new LinkInfo(toEC, fromEC, i, sourceIndex, 3, fromEC.parentTeststep)
		                MainWindow.Links.Append(newLink)
		              End If
		            End If
		          End If
		        Next
		      End if
		      bc = bc.NextStep
		    Loop Until bc = Nil
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function elementExists(uID as String) As Boolean
		  If SchemCanvas.Container <> Nil then
		    For each ec as ElementContainer in SchemCanvas.Container
		      If ec.uniqueID = uID then
		        return true
		      End If
		    Next
		  End If
		  return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EnterTab()
		  If SchemCanvas is Nil then Return
		  
		  startingTestStep(startBC)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExitTab()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function findElementContainer(ecID as String) As ElementContainer
		  If SchemCanvas.Container.Ubound <> - 1 Then
		    For each ec as ElementContainer in SchemCanvas.Container
		      If ec.uniqueID = ecID Then
		        Return ec
		      End If
		    Next
		  End If
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getAttributeList(bc as BasicClass) As String()
		  dim arr() as String
		  For i as integer = 0 to bc.AttributesUbound
		    dim s as string = ""
		    s = s + bc.GetAttribute(i).Name + ": " + bc.GetAttribute(i).GOAS
		    arr.Append(s)
		  Next
		  Return arr
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub initCanvasTestSteps()
		  resetCanvasPages
		  SchemCanvas.outStepContainer = OutgoingStep
		  Dim stack() as BasicClass
		  
		  If App.GlobalTestSequence = Nil Or App.GlobalTestSequence.FirstSubStep = Nil then
		    Return
		  End If
		  
		  Dim testProg as BasicClass = App.GlobalTestSequence //Testprogram
		  
		  Dim bc As BasicClass = testProg.FirstSubStep
		  stack.Add(bc)
		  
		  //Iteration traversing through Tree instead of recursion
		  While (stack.Count > 0)
		    
		    bc = stack.Pop
		    
		    If bc IsA Test_StepClass Then
		      SchemCanvasContainer.testStepNames.Append(bc.Name.GIAS)
		      SchemCanvasContainer.testStepIDs.Append(bc.GetUniqueID)
		    End If
		    drawElements(bc)
		    
		    if bc.NextStep <> Nil then
		      stack.Add(bc.NextStep)
		    end if
		    if bc.FirstSubStep <> Nil then
		      stack.Add(bc.FirstSubStep)
		    end if
		  Wend
		  
		  //a separate loop for drawing links, since you cannot draw links
		  //until the all the ElementContainers have been embedded into the Canvas
		  
		  bc = testProg.FirstSubStep
		  stack.RemoveAll
		  stack.Add(bc)
		  
		  While (stack.Count > 0)
		    
		    bc = stack.Pop
		    
		    If bc IsA Test_StepClass or bc.FirstSubStep <> Nil Then
		      drawLinks(bc)
		    End If
		    
		    if bc.NextStep <> Nil then
		      stack.Add(bc.NextStep)
		    end if
		    if bc.FirstSubStep <> Nil then
		      stack.Add(bc.FirstSubStep)
		    end if
		  Wend
		  
		  OutgoingStep.loadSteps(SchemCanvasContainer.testStepIDs)
		  //Display first TestStep
		  CurrentTestStep.Text = SchemCanvasContainer.testStepNames(0)
		  SchemCanvas.canvasPage = SchemCanvasContainer.testStepIDs(0)
		  SchemCanvasContainer.pageIndex = 0
		  SchemCanvas.darkModeEC(SchemCanvas.darkModeEnabled)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Iterate(BS as BasicClass)
		  Dim stack() as BasicClass
		  Dim curr as BasicClass = BS
		  if bs = Nil then
		    Return
		  end if
		  stack.Add(curr)
		  While (stack.Count > 0)
		    curr = stack.Pop
		    System.DebugLog curr.Name.GIAS
		    if curr.NextStep <> Nil then
		      stack.Add(curr.NextStep)
		    end if
		    if curr.FirstSubStep <> Nil then
		      stack.Add(curr.FirstSubStep)
		    end if
		  Wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub resetCanvasPages()
		  SchemCanvasContainer.pageIndex = 0
		  SchemCanvas.emptyCanvas
		  Redim SchemCanvasContainer.testStepNames(-1)
		  Redim SchemCanvasContainer.testStepIDs(-1)
		  MainWindow.resetLinks
		  CurrentTestStep.Value = ""
		  'NextBtn.Enabled = False
		  'PrevBtn.Enabled = False
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub resetElementContainerSize(bc as BasicClass, width as integer, height as integer, ec as ElementContainer)
		  If bc <> Nil and ec <> Nil Then
		    If width > ec.maxWidth Then
		      bc.ELT.Width = ec.maxWidth
		    ElseIf width < ec.minWidth Then
		      bc.ELT.Width = ec.minWidth
		    End If
		    If height > ec.maxHeight Then
		      bc.ELT.Height = ec.maxHeight
		    ElseIf width < ec.minHeight Then
		      bc.ELT.Height = ec.minHeight
		    End If
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub startingTestStep(BS as BasicClass)
		  If BS IsA Test_StepClass and BS <> Nil then
		    If SchemCanvas.canvasPage = BS.GetUniqueID then return
		    //Display the selected TestStep in the Canvas
		    initCanvasTestSteps
		    CurrentTestStep.Text = BS.Name.GIAS
		    SchemCanvas.canvasPage = BS.GetUniqueID
		    SchemCanvasContainer.pageIndex = SchemCanvasContainer.testStepIDs.IndexOf(BS.GetUniqueID)
		    SchemCanvasContainer.hidePageElements
		    SchemCanvasContainer.showPageElements
		  ElseIf BS <> Nil AND NOT (BS isA TESSA_Prog_StepClass) Then
		    If BS.UpperStep <> Nil Then
		      If BS.UpperStep IsA Test_StepClass Then
		        //Do not refresh if selected TestStep hasn't changed
		        'If SchemCanvas.canvasPage = BS.UpperStep.GetUniqueID then return
		        //Display the selected Element's TestStep in the Canvas
		        initCanvasTestSteps
		        CurrentTestStep.Text = BS.UpperStep.Name.GIAS
		        SchemCanvas.canvasPage = BS.UpperStep.GetUniqueID
		        SchemCanvasContainer.pageIndex = SchemCanvasContainer.testStepIDs.IndexOf(BS.UpperStep.GetUniqueID)
		        SchemCanvasContainer.hidePageElements
		        SchemCanvasContainer.showPageElements
		      End If
		    End If
		  Else
		    resetCanvasPages
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub StepSelected(BS as BasicClass)
		  startBC = BS
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function tStepExists(testStepName as String) As Boolean
		  return (SchemCanvasContainer.testStepNames.IndexOf(testStepName) <> -1)
		End Function
	#tag EndMethod


	#tag Property, Flags = &h1
		Protected mSchematicTabClass As SchematicTabClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SchemCanvas As SchematicCanvas
	#tag EndProperty

	#tag Property, Flags = &h0
		startBC As BasicClass
	#tag EndProperty


#tag EndWindowCode

#tag Events OutgoingStep
	#tag Event
		Function getSchemTabInstance() As SchematicTabClass
		  return mSchematicTabClass
		End Function
	#tag EndEvent
	#tag Event
		Sub SelectedTStepChanged()
		  SchemCanvasContainer.myRefresh
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SchemCanvasContainer
	#tag Event
		Sub Open()
		  Self.SchemCanvas = Me.SchemCanvas
		End Sub
	#tag EndEvent
	#tag Event
		Sub LinkFollow(testStepName as String, outgoingIndex as Integer)
		  CurrentTestStep.Text = testStepName
		  OutgoingStep.TestStepMenu.ListIndex = outgoingIndex
		End Sub
	#tag EndEvent
#tag EndEvents
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
		Name="darkModeEnabled"
		Visible=true
		Group="Behavior"
		InitialValue=""
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
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
		Group="Appearance"
		InitialValue=""
		Type="Picture"
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
		Group="Position"
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
		Group="Position"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
