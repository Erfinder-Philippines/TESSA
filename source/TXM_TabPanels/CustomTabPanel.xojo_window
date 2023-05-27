#tag Window
Begin ContainerControl CustomTabPanel
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cF5F6F700
   DoubleBuffer    =   False
   Enabled         =   True
   EraseBackground =   True
   HasBackgroundColor=   False
   Height          =   390
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
   Transparent     =   False
   Visible         =   True
   Width           =   623
   Begin PagePanel Pages
      AllowAutoDeactivate=   True
      Enabled         =   True
      Height          =   338
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   1
      Panels          =   ""
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   "True"
      Tooltip         =   ""
      Top             =   37
      Transparent     =   False
      Value           =   0
      Visible         =   True
      Width           =   623
   End
   BeginSegmentedButton SegmentedButton Tabs
      Enabled         =   True
      Height          =   24
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   15
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   2
      Segments        =   "Page 0\n\nFalse"
      SelectionStyle  =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   1
      Transparent     =   False
      Visible         =   False
      Width           =   100
   End
   Begin GraphicalTabsManager GraphicalTabs
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      darkModeEnabled =   True
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   40
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      selectedTabIndex=   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   623
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  RaiseEvent Open()
		  
		  mOpenFinished = true
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  'g.ForeColor = &cD8D8D8
		  'g.PenSize = 2
		  'g.DrawRoundRectangle(2, Tabs.Height / 2 , g.Width - 20, g.Height - 20, 10, 10)
		  If darkModeEnabled Then
		    g.DrawingColor = &c23282D
		  Else
		    g.DrawingColor = &cF5F6F7
		  End If
		  g.FillRectangle(0,0,g.Width,g.Height)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddTab(tab as TabClass, container as ContainerControl)
		  // #44 - We add every possible container to the PagePanel, so that they're all present at all times.
		  // However, the Tabs will only show those that are fitting for the currently selected StepClass.
		  
		  if mTabClassPerPage.IndexOf (tab) >= 0 then
		    break // already added?!
		    return
		  end if
		  
		  // Remember the new tab in mTabClassPerPage
		  mTabClassPerPage.Append tab
		  if mTabClassPerPage.Ubound = Pages.PanelCount then
		    // Add one more page to the PagePanel
		    Pages.Append
		  end if
		  
		  // Add the tab's ContainerControl to the PagePanel
		  container.Transparent = true
		  container.LockBottom = true
		  container.LockLeft = true
		  container.LockRight = true
		  container.LockTop = true
		  container.EmbedWithinPanel (Pages, mTabClassPerPage.Ubound, 0, 0, Pages.Width, Pages.Height)
		  
		  // We keep a reference to the container so we can
		  // directly access it
		  If container isA GraphicalTabContainer Then
		    GraphicalTabContainers.AddRow(container)
		  End If
		  
		  self.UpdateTabs()
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CurrentTab() As TabClass
		  return mCurrentTab
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DarkModeTabs(value as Boolean)
		  For each cc as ContainerControl in GraphicalTabContainers
		    GraphicalTabContainer(cc).darkModeEnabled = value
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DidUpdate(MeasStep as BasicClass)
		  TabManager.GetAttributesTabClass.RefreshShownValues (false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub OnTabChange(itemIndex as Integer, forced as Boolean = false)
		  If mPageIndexPerTab.LastIndex = -1 Then
		    // There are no tabs to change into
		    Return
		  End If
		  
		  //For OutOfBounds check when a tab will be hidden again
		  Dim pageIndex As Integer
		  If itemIndex > mPageIndexPerTab.LastRowIndex Then
		    // Switch to the rightmost tab
		    pageIndex = mPageIndexPerTab(mPageIndexPerTab.LastRowIndex)
		  Elseif itemIndex < mPageIndexPerTab.FirstRowIndex Then
		    // Switch to the leftmost tab
		    pageIndex = mPageIndexPerTab(mPageIndexPerTab.FirstRowIndex)
		  Else
		    pageIndex = mPageIndexPerTab(itemIndex)
		  End If
		  
		  'Dim pageIndex As Integer = mPageIndexPerTab(itemIndex)
		  
		  dim newTab As TabClass = mTabClassPerPage(pageIndex)
		  
		  if newTab <> mCurrentTab or forced then
		    If mCurrentTab <> Nil Then
		      mCurrentTab.ExitTab
		      mCurrentTab.StepSelected (nil)
		    End
		    
		    RaiseEvent TabChanging (mCurrentTab, newTab)
		    mCurrentTab = newTab
		    
		    newTab.StepSelected (mSelectedStep)
		    newTab.EnterTab
		  end if
		  
		  // properly sync the PagePanel with the GraphicalTabManager
		  // in case a Page/Tab is removed or added
		  GraphicalTabs.SelectTab(itemIndex,False)
		  
		  'System.DebugLog "PageVal: " + str(Pages.SelectedPanelIndex) + " pageIndx " + str(pageIndex)
		  'Pages.Value = pageIndex
		  if Pages.Value <> pageIndex then
		    Pages.Value = pageIndex
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepSelected(BS as BasicClass)
		  // Rearrange Tabs and then inform every visible Tab about the selected Step object
		  
		  if mSelectedStep <> BS then
		    mSelectedStep = BS
		    self.UpdateTabs() // will also invoke tab.StepSelected
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateTabs()
		  // Make the fitting Tabs visible (see issue #44)
		  
		  'If Tabs.SelectedSegmentIndex <> -1 and mPageIndexPerTab.LastRowIndex <> -1 then
		  '//store name and index of the last selected Tab
		  'mLastSelectedTabIndex = Tabs.SelectedSegmentIndex
		  'mLastSelectedTabName = mTabClassPerPage(mPageIndexPerTab(mLastSelectedTabIndex)).TabName.GOAS
		  'End if
		  
		  If GraphicalTabs.selectedTabIndex <> -1 And mPageIndexPerTab.LastRowIndex <> -1 _ 
		    And mLastSelectedTabIndex <= mPageIndexPerTab.LastIndex Then
		    //store name and index of the last selected Tab
		    mLastSelectedTabIndex = GraphicalTabs.selectedTabIndex
		    mLastSelectedTabName = mTabClassPerPage(mPageIndexPerTab(mLastSelectedTabIndex)).TabName.GOAS
		  End If
		  
		  if not mOpenFinished or mTabClassPerPage.Ubound < 0 then return
		  Dim currentStep As BasicClass = mSelectedStep
		  redim mPageIndexPerTab(-1)
		  dim defaultIndex as Integer = 0
		  Dim ub As Integer = -1
		  Dim hasDefaultTab As Boolean = False
		  Dim attributesTabIndex As Integer = -1
		  for pageIndex as Integer = 0 to mTabClassPerPage.Ubound
		    Dim tab As TabClass = mTabClassPerPage (pageIndex)
		    Dim isDefault As Boolean
		    If tab.FitsForStep (currentStep, isDefault) Then
		      ub = ub + 1
		      mPageIndexPerTab.Append pageIndex
		      If isDefault Then
		        defaultIndex = ub
		        hasDefaultTab = True
		      End If
		    End If
		    
		    If tab IsA AttributesTabClass Then
		      attributesTabIndex = ub
		    End If
		    
		  Next
		  
		  if ub < 0 then
		    // must never happen
		    Return
		    break
		    ub = 0
		  else
		    
		    If GraphicalTabs.NumberOfTabs > ub Then
		      GraphicalTabs.RemoveAllTabs
		    End If
		    
		    while GraphicalTabs.NumberOfTabs < ub
		      Var t As New GraphicalTab("",nil)
		      GraphicalTabs.AddTab(t)
		    Wend
		    
		    Redim mVisibleTabs(-1)
		    mIgnoreChangeEvent = true
		    For i As Integer = 0 To ub
		      Dim item As GraphicalTab = GraphicalTabs.TabAt(i)
		      dim tab as TabClass = mTabClassPerPage(mPageIndexPerTab(i))
		      item.isSelected = false
		      item.tabLabel = tab.TabName.GOAS
		      mVisibleTabs.Append tab
		    next
		    GraphicalTabs.TabAt(defaultIndex).isSelected = true
		    
		    // We move to the defaultTab of the currentstep
		    Dim moveToSpecificTab As Boolean = False
		    If hasDefaultTab Then
		      moveToSpecificTab = True
		      OnTabChange (defaultIndex, True)
		    End If
		    
		    // We stay at the current Tab
		    If mCurrentTab <> Nil And Not moveToSpecificTab Then
		      dim tab as TabClass
		      For i as integer = 0 to ub
		        tab = mTabClassPerPage(mPageIndexPerTab(i))
		        If tab.TabName.GOAS = mLastSelectedTabName Then
		          GraphicalTabs.TabAt(defaultIndex).isSelected = false
		          GraphicalTabs.TabAt(i).isSelected = true
		          GraphicalTabs.selectedTabIndex = i
		          OnTabChange (i, True)
		          LastSelectedTabFound = True
		          Exit
		        End If
		        LastSelectedTabFound = False
		      Next
		      
		      // If the Tab has been Removed or Hidden,
		      // We select the Attributes Tab,
		      // If Attributes does not exist, we use the first tab
		      
		      // There is no Attributes Tab
		      If Not LastSelectedTabFound And Not hasDefaultTab And attributesTabIndex = -1 Then
		        Dim tabIdx As Integer = mPageIndexPerTab.FirstRowIndex
		        GraphicalTabs.selectedTabIndex = tabIdx
		        OnTabChange (tabIdx, True)
		      Elseif Not LastSelectedTabFound And Not hasDefaultTab And attributesTabIndex > -1 Then
		        Dim tabIdx As Integer = attributesTabIndex
		        GraphicalTabs.selectedTabIndex = tabIdx
		        OnTabChange (tabIdx, True)
		      End If
		    Else
		      OnTabChange (defaultIndex, True)
		    End If
		    mIgnoreChangeEvent = False
		  end if
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TabChanging(fromTab as TabClass, toTab as TabClass)
	#tag EndHook


	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdarkModeEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdarkModeEnabled = value
			  GraphicalTabs.darkModeEnabled = value
			  DarkModeTabs(value)
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private GraphicalTabContainers() As ContainerControl
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastSelectedTabFound As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mCurrentTab As TabClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mIgnoreChangeEvent As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastSelectedTabIndex As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mLastSelectedTabName As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOpenFinished As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Points to the PagePanel page number for each shown Tab
		#tag EndNote
		Private mPageIndexPerTab() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mSelectedStep As BasicClass
	#tag EndProperty

	#tag Property, Flags = &h21
		#tag Note
			Must be in sync with the ContainerControls added to the Pages control
		#tag EndNote
		Private mTabClassPerPage() As TabClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVisibleTabs() As TabClass
	#tag EndProperty


#tag EndWindowCode

#tag Events Tabs
	#tag Event
		Sub Pressed(segmentIndex as integer)
		  if mIgnoreChangeEvent then return
		  self.OnTabChange (segmentIndex)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events GraphicalTabs
	#tag Event
		Sub TabChanged(index as Integer)
		  if mIgnoreChangeEvent then return
		  self.OnTabChange (index)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
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
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
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
		Name="LockTop"
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
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Boolean"
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
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue=""
		Type="Integer"
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
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
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
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
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
		Name="DoubleBuffer"
		Visible=true
		Group="Windows Behavior"
		InitialValue="False"
		Type="Boolean"
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
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=false
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
