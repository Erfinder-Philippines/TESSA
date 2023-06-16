#tag Window
Begin GraphicalTabContainer ElementsTabContainer Implements TabInterface
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
   Height          =   584
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
   Width           =   1078
   Begin TextField FilterEdit
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   "Search for an Element"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   "Search for an Element"
      Top             =   42
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   309
      Begin BevelButton ClearFilterButton
         AllowAutoDeactivate=   True
         AllowFocus      =   True
         BackgroundColor =   &c00000000
         BevelStyle      =   5
         Bold            =   False
         ButtonStyle     =   0
         Caption         =   "X"
         CaptionAlignment=   3
         CaptionDelta    =   0
         CaptionPosition =   1
         Enabled         =   True
         FontName        =   "Consolas"
         FontSize        =   0.0
         FontUnit        =   0
         HasBackgroundColor=   False
         Height          =   20
         Icon            =   0
         IconAlignment   =   0
         IconDeltaX      =   0
         IconDeltaY      =   0
         Index           =   -2147483648
         InitialParent   =   "FilterEdit"
         Italic          =   False
         Left            =   296
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         MenuStyle       =   0
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextColor       =   &c00000000
         Tooltip         =   ""
         Top             =   43
         Transparent     =   True
         Underline       =   False
         Value           =   False
         Visible         =   False
         Width           =   20
      End
   End
   Begin Label HelpLabel
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   16.0
      FontUnit        =   0
      Height          =   36
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   675
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Help Label"
      TextAlignment   =   2
      TextColor       =   &c4C4C4C00
      Tooltip         =   ""
      Top             =   418
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   303
   End
   Begin Timer FilterEditTimer
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   500
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
   Begin PushButton SaveButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   30
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   963
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   316
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   82
   End
   Begin PopupMenu CopyToClipboard
      AllowAutoDeactivate=   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Copy ..\n.. all texts\n.. all not empty texts\n.. Icon\n.. selected item"
      Italic          =   False
      Left            =   869
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      SelectedRowIndex=   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   320
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   93
   End
   Begin GraphicalListbox HelpAttrList
      ActiveColumn    =   -1
      ActiveRow       =   -1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   False
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   ""
      darkModeEnabled =   False
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   20
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      genericTblHorizontal=   False
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   1
      HasBorder       =   False
      HasHeader       =   True
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   500
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Attribute	Description"
      Italic          =   False
      Left            =   336
      ListboxType     =   1
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Select an Attribute to modify its description"
      Top             =   33
      Transparent     =   False
      Underline       =   False
      Visible         =   False
      Width           =   295
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin TextArea HelpText
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   271
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   662
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   33
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   False
      Width           =   407
   End
   Begin TextField ElementPath
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   "Element Path"
      Top             =   551
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   1062
   End
   Begin TextArea LabelDesc
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   True
      AllowStyledText =   True
      AllowTabs       =   False
      BackgroundColor =   &cEEEEEE00
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   False
      HasHorizontalScrollbar=   False
      HasVerticalScrollbar=   True
      Height          =   109
      HideSelection   =   True
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LineHeight      =   0.0
      LineSpacing     =   1.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      MaximumCharactersAllowed=   0
      Multiline       =   True
      ReadOnly        =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Explanations for the chosen element."
      TextAlignment   =   0
      TextColor       =   &c00000000
      Tooltip         =   ""
      Top             =   434
      Transparent     =   False
      Underline       =   False
      UnicodeMode     =   0
      ValidationMask  =   ""
      Visible         =   True
      Width           =   307
   End
   Begin Label LabelBasicClass
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   19
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Basic class of the chosen element"
      TextAlignment   =   0
      TextColor       =   &c4C4C4C00
      Tooltip         =   ""
      Top             =   409
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   229
   End
   Begin Label LabelDescTitle
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   19
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   7
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Title of the chosen element"
      TextAlignment   =   0
      TextColor       =   &c4C4C4C00
      Tooltip         =   ""
      Top             =   367
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   229
   End
   Begin GraphicalListbox ListboxElems
      ActiveColumn    =   -1
      ActiveRow       =   -1
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   True
      AllowExpandableRows=   True
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   True
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      darkModeEnabled =   False
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   26
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      genericTblHorizontal=   False
      GridLinesHorizontalStyle=   1
      GridLinesVerticalStyle=   0
      HasBorder       =   False
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   265
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Name"
      Italic          =   False
      Left            =   9
      ListboxType     =   5
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   0
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   "Drag an Element into the Hierarchical Test List to add it"
      Top             =   76
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   304
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Canvas Picture64
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowTabs       =   False
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      Height          =   64
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   248
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   358
      Transparent     =   True
      Visible         =   True
      Width           =   66
   End
   Begin Label HelpLabel1
      AllowAutoDeactivate=   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   25
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   True
      Left            =   7
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Drag an Element from the library and drop it on the Main Tree."
      TextAlignment   =   0
      TextColor       =   &c4C4C4C00
      Tooltip         =   ""
      Top             =   4
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   371
   End
   Begin CustomTextField CustomTextField1
      AllowAutoDeactivate=   True
      AllowFocus      =   True
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      darkModeEnabled =   False
      DoubleBuffer    =   False
      Enabled         =   False
      EraseBackground =   True
      FontSize        =   20.0
      HasBackgroundColor=   False
      Height          =   40
      Icon            =   739188735
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   16
      TabPanelIndex   =   0
      TabStop         =   True
      TextHint        =   "Search for an Element"
      TextValue       =   ""
      Tooltip         =   ""
      Top             =   -82
      Transparent     =   True
      Visible         =   False
      Width           =   306
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Activate()
		  #if false // This code seems to try to select the element that's selected in the HTL, but taht didn't even work right because the listbox in not expanded when the loop below looks for a match
		    If MainWindow.HTL.GetActiveStep <> Nil Then
		      if SelectedElementType = Nil then
		        SelectedElementType = ElementTypeFactory.instance.GetElementType(MainWindow.HTL.GetActiveStep)
		        if SelectedElementType <> Nil Then
		          Dim fileName As String = SelectedElementType.GetName
		          Dim count As Integer = Me.ListboxElems.ListCount - 1
		          For i As Integer = 0 to count
		            If Me.ListboxElems.Cell(i, 0) = fileName Then
		              Me.ListboxElems.ListIndex = i
		              Return
		            End
		          Next
		        End
		      End
		    End
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub DarkModeTabElements(value as Boolean)
		  Dim txtColor As Color
		  dim bgColor, txtBgColor as Color
		  
		  If value Then
		    txtColor = Color.White
		    bgColor = &c2D3137
		    txtBgColor = &c23282D
		  Else
		    txtColor = Color.Black
		    bgColor = &cF5F6F7
		    txtBgColor = Color.White
		  End If
		  
		  Dim i, c As Integer
		  Dim obj As Control
		  c = Self.ControlCount - 1
		  For i = 0 To c Step 1
		    obj = Self.Control(i)
		    
		    If obj IsA Label Then
		      Dim objLabel As Label = Label(obj)
		      objLabel.TextColor = txtColor
		    Elseif  obj IsA TextArea Then
		      Dim objText As TextArea = TextArea(obj)
		      objText.TextColor = txtColor
		      objText.BackgroundColor = txtBgColor
		    Elseif obj IsA TextField Then
		      Dim objText As TextField = TextField(obj)
		      objText.TextColor = txtColor
		      objText.BackgroundColor = txtBgColor
		    End If
		  Next
		  
		  self.BackgroundColor = bgColor
		  ListboxElems.darkModeEnabled = value
		  HelpAttrList.darkModeEnabled = value
		  'CustomTextField1.darkModeEnabled = value
		  Invalidate(False)
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseEnter()
		  Me.Show
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  self.RebuildElementsListbox
		  ShowInspector(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  const padding = 10
		  g.PenSize = 2
		  //drawing round rectangle for UI
		  dim x,y,w,h as Double
		  x = HelpAttrList.Left - padding
		  y = HelpAttrList.Top - padding
		  w = HelpAttrList.Width + padding*2
		  h = HelpAttrList.Height + padding*2
		  If Not HelpAttrList.Visible and Not HelpText.Visible Then
		    g.ForeColor = &cD8D8D8
		    g.DrawRoundRectangle(x,y,w,h, 10,10)
		  ElseIf HelpAttrList.Visible and Not HelpText.Visible Then
		    g.ForeColor = &c2589FF
		    g.DrawRoundRectangle(x,y,w,h, 10,10)
		    
		    x = HelpText.Left - padding
		    y = HelpText.Top - padding
		    w = HelpText.Width + padding*2
		    h = HelpText.Height + padding*2
		    g.ForeColor = &cD8D8D8
		    g.DrawRoundRectangle(x,y,w,h, 10,10)
		  ElseIf HelpAttrList.Visible and HelpText.Visible Then
		    w = 2
		    h = HelpText.Height
		    x = HelpText.Left - w
		    y = HelpText.Top
		    
		    g.ForeColor = &c2589FF
		    g.FillRectangle(x,y,w,h)
		  End If
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function CopyAllItems() As Boolean Handles CopyAllItems.Action
		  CopyClipAll
		  
		  return true
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CopyIcon() As Boolean Handles CopyIcon.Action
		  CopyClipIcon
		  
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function CopySelectedItem() As Boolean Handles CopySelectedItem.Action
		  CopyClipSelected
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function CloneTab() As ContainerControl
		  // Part of the TabInterface interface.
		  Return New ElementsTabContainer(Self.mElementsTabClass)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(ParentTabClass As TabClass)
		  // Part of the TabInterface interface.
		  Super.Constructor
		  mElementsTabClass = ElementsTabClass(ParentTabClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function Contains(Item As FolderItem) As Boolean
		  // Returns true if the given folder item exists
		  For row as Integer = 0 To ListboxElems.ListCount - 1
		    If ListboxElems.Cell(row, 0) = Item.DisplayName Then
		      Return True
		    End
		  Next
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyClipAll()
		  If HelpAttrList.ListCount > 0 Then
		    Dim c As New Clipboard
		    Dim S,H,A as string
		    Dim i,n,k as integer
		    
		    S=HelpAttrList.Cell(0,0)+CR+ReplaceAll(HelpAttrList.Cell(0,1),CR," ")+CR
		    for i=1 to HelpAttrList.ListCount-1
		      S=S+HelpAttrList.Cell(i,0)
		      n=0
		      H=TrimString(ReplaceAll(HelpAttrList.Cell(i,1),CR,NL),true,true,true,true)
		      if H="" then
		        S=S+NL
		      else
		        if H.Instr(1,":")=0 then
		          H=ReplaceAll(H,NL," ")
		        end
		        A=""
		        while (A<>"") or (n<20)
		          if A<>"" then
		            k=A.Instr(1,":")
		            if k>0 then
		              S=S+TAB+TrimString(A.Mid(1,k-1),true,true,true,true)+TAB+TrimString(ReplaceAll(A.Mid(k+1,A.len),CR," "),true,true,true,true)+CR
		            else
		              S=S+TAB+TrimString(ReplaceAll(A,CR," "),true,true,true,true)+CR
		            end
		          end
		          n=n+1
		          A=TrimString(NthField(H,NL,n),true,true,true,true)
		        wend
		      end
		    next
		    c.Text = S
		    c.Close
		  End
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyClipAllFullOnly()
		  If HelpAttrList.ListCount > 0 Then
		    Dim c As New Clipboard
		    Dim S,H,A as string
		    Dim i,n,k as integer
		    
		    S=HelpAttrList.Cell(0,0)+CR+ReplaceAll(HelpAttrList.Cell(0,1),CR," ")+CR
		    for i=1 to HelpAttrList.ListCount-1
		      
		      n=0
		      H=TrimString(ReplaceAll(HelpAttrList.Cell(i,1),CR,NL),true,true,true,true)
		      if H="" then
		        'S=S+NL
		      else
		        S=S+HelpAttrList.Cell(i,0)
		        if H.Instr(1,":")=0 then
		          H=ReplaceAll(H,NL," ")
		        end
		        A=""
		        while (A<>"") or (n<20)
		          if A<>"" then
		            k=A.Instr(1,":")
		            if k>0 then
		              S=S+TAB+TrimString(A.Mid(1,k-1),true,true,true,true)+TAB+TrimString(ReplaceAll(A.Mid(k+1,A.len),CR," "),true,true,true,true)+CR
		            else
		              k=A.Instr(1,"-")
		              if (k>0) and  (k<3) then
		                S=S+TAB+TAB+TrimString(ReplaceAll(A,CR," "),true,true,true,true)+CR
		              else
		                S=S+TAB+TrimString(ReplaceAll(A,CR," "),true,true,true,true)+CR
		              end
		            end
		          end
		          n=n+1
		          A=TrimString(NthField(H,NL,n),true,true,true,true)
		        wend
		      end
		    next
		    c.Text = S
		    c.Close
		  End
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyClipIcon()
		  Dim c As New Clipboard
		  If Picture64.Backdrop <> Nil Then
		    c.Picture = Picture64.Backdrop
		    c.Close
		  Else
		    MsgBox("No icon is available!")
		  End If
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyClipSelected()
		  Dim c As New Clipboard
		  c.Text = HelpAttrList.Cell(HelpAttrList.ListIndex,0)+chr(9)+HelpText.Text
		  c.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FIlterChanged()
		  FilterEditTimer.Reset
		  FilterEditTimer.Mode = Timer.ModeSingle
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadElements(node as ElementTreeNode)
		  For Each nodeChild As ElementTreeNode In node.children
		    
		    dim expand As boolean = self.filter <> ""
		    
		    if self.filter <> "" and not nodeChild.MatchesFilter(self.filter) then
		      Continue
		    end if
		    
		    'check whether node is an Element
		    If (nodeChild.element <> Nil) Then
		      Dim nodeElement as ElementType = nodeChild.element
		      Dim elementName as String = nodeElement.GetName
		      
		      If not nodeElement.EnableDrag then
		        elementName = "*" + elementName
		      End If
		      
		      ListboxElems.AddRow(elementName)
		      Dim row as Integer = ListboxElems.LastIndex
		      ListboxElems.RowTag(row) = nodeElement
		      ListboxElems.RowPicture(Row) = nodeElement.getIcon()
		    End
		    
		    'LoadElements(nodeChild)
		    
		    If nodeChild.children.Ubound >= 0 Then
		      If nodeChild.element = Nil Then
		        ListboxElems.AddFolder(nodeChild.name)
		        Dim row As Integer = ListboxElems.LastIndex
		        ListboxElems.RowTag(Row) = nodeChild
		        If nodeChild.image <> Nil Then
		          ListboxElems.RowPicture(Row) = nodeChild.image
		        End If
		        ListboxElems.Expanded(Row) = expand
		      Else 
		        LoadElements(nodeChild)
		      End If
		    End If
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RebuildElementsListbox(filter as string = "")
		  #If DebugBuild
		    system.DebugLog "filter: " + filter
		  #endif
		  
		  ListboxElems.DeleteAllRows
		  self.filter = filter
		  LoadElements (ElementTypeFactory.instance.TreeRoot)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowHelpEditor(value as Boolean)
		  If value <> HelpText.Visible Then
		    HelpText.Visible = value
		    CopyToClipboard.Visible = value
		    SaveButton.Visible = value
		    If value Then
		      HelpLabel.Visible = False
		    End If
		    Invalidate(False)
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ShowInspector(value as Boolean)
		  HelpAttrList.Visible = value
		  HelpLabel.Visible = False
		  
		  const padding = 10 //for positioning of help label
		  If not value Then
		    ShowHelpEditor(False)
		    HelpLabel.Width = HelpAttrList.Width
		    HelpLabel.Value = "No Element Selected"
		    HelpLabel.Tooltip = "Select an Element to open Inspector."
		    //center the HelpLabel
		    HelpLabel.Left = HelpAttrList.Left
		    HelpLabel.Top = HelpAttrList.Top + (HelpAttrList.Height/2) - padding
		    HelpLabel.Visible = True
		  ElseIf value then
		    HelpLabel.Width = HelpText.Width
		    HelpLabel.Value = "No Attribute Selected"
		    HelpLabel.Tooltip = "Select an Attribute to edit description."
		    //center the HelpLabel
		    HelpLabel.Left = HelpText.Left
		    HelpLabel.Top = HelpText.Top + (HelpText.Height/2) - padding
		    HelpLabel.Visible = True
		  End If
		  
		  Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StepSelected(BS as BasicClass)
		  // Part of the TabInterface interface.
		  
		  //Get Help for the selected element in the HTL
		  UpdateDescLabel(BS)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateDescLabel(BS as BasicClass)
		  If BS <> Nil Then
		    SelectedElementType = ElementTypeFactory.instance.GetElementType(BS)
		    If SelectedElementType <> Nil Then
		      Dim elementName As String = SelectedElementType.GetName
		      LabelDescTitle.Text = elementName
		      LabelDesc.Text = SelectedElementType.GetMainDescription
		      
		      Me.Picture64.Backdrop = SelectedElementType.getBigIcon
		      Me.ElementPath.Text = SelectedElementType.GetPath.NativePath
		      Me.LabelBasicClass.Text = SelectedElementType.GetType
		      
		      HelpAttrList.DeleteAllRows
		      For Each AttrName As String In SelectedElementType.getAttributeList
		        If AttrName = "" Then
		          Continue
		        End
		        If AttrName = "MainDesc" Then
		          HelpAttrList.AddRow("Element " + SelectedElementType.GetName)
		        Else
		          HelpAttrList.AddRow(AttrName)
		        End
		        HelpAttrList.Cell(HelpAttrList.LastIndex, 1) = SelectedElementType.GetAttributeDescription(AttrName)
		      Next
		      ShowInspector(True)
		      Return
		    End If
		  End
		  
		  Me.LabelDescTitle.Text = "Unknown"
		  Me.LabelDesc.Text = ""
		  Me.LabelBasicClass.Text = ""
		  Me.ElementPath.Text = ""
		  Me.Picture64.Backdrop = Nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateDescLabel(Row As Integer)
		  If Row >= 0 Then
		    dim tag as object = ListboxElems.RowTag(row)
		    If tag<> Nil Then
		      If tag IsA ElementTreeNode Then
		        Dim node as ElementTreeNode = ElementTreeNode(tag)
		        Me.LabelDescTitle.Text = node.name
		        Me.LabelDesc.Text = ""
		        Me.LabelBasicClass.Text = ""
		        Me.ElementPath.Text = ""
		        Me.Picture64.Backdrop = Nil
		        ShowInspector(False)
		        Return
		      End
		      
		      SelectedElementType = ElementType(tag)
		      If  SelectedElementType <> Nil Then
		        Dim elementName As String = SelectedElementType.GetName
		        LabelDescTitle.Text = elementName
		        LabelDesc.Text = SelectedElementType.GetMainDescription
		        
		        Me.Picture64.Backdrop = SelectedElementType.getBigIcon
		        Me.ElementPath.Text = SelectedElementType.GetPath.NativePath
		        Me.LabelBasicClass.Text = SelectedElementType.GetType
		        
		        HelpAttrList.DeleteAllRows
		        For Each AttrName As String in SelectedElementType.getAttributeList
		          if AttrName = "" then
		            Continue
		          End
		          If AttrName = "MainDesc" Then
		            HelpAttrList.AddRow("Element " + SelectedElementType.GetName)
		          Else
		            HelpAttrList.AddRow(AttrName)
		          End
		          HelpAttrList.Cell(HelpAttrList.LastIndex, 1) = SelectedElementType.GetAttributeDescription(AttrName)
		        next
		        ShowInspector(True)
		        Return
		      End
		    End
		  End
		  
		  Me.LabelDescTitle.Text = "Unknown"
		  Me.LabelDesc.Text = ""
		  Me.LabelBasicClass.Text = ""
		  Me.ElementPath.Text = ""
		  Me.Picture64.Backdrop = Nil
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private filter As String
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected mElementsTabClass As ElementsTabClass = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		SelectedElementType As ElementType = nil
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowsSize_Tab0_H As Integer = 500
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowsSize_Tab0_W As Integer = 300
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowsSize_Tab1_H As Integer = 500
	#tag EndProperty

	#tag Property, Flags = &h0
		WindowsSize_Tab1_W As Integer = 610
	#tag EndProperty


#tag EndWindowCode

#tag Events FilterEdit
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  self.FIlterChanged
		End Function
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  self.FIlterChanged
		  
		  ClearFilterButton.Visible = me.text <> ""
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ClearFilterButton
	#tag Event
		Sub Action()
		  FilterEdit.text = ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.Parent = nil
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events FilterEditTimer
	#tag Event
		Sub Action()
		  Dim filter as String = FilterEdit.Value 'CustomTextField1.TextValue
		  
		  self.RebuildElementsListbox filter
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events SaveButton
	#tag Event
		Sub Action()
		  //set &  save element help info into appropriate file
		  HelpAttrList.Cell(HelpAttrList.ListIndex, 1) = HelpText.Text
		  if SelectedElementType<>nil then
		    SelectedElementType.SetDesckForAttribute(HelpAttrList.Cell(HelpAttrList.ListIndex, 0), HelpText.Text)
		    SelectedElementType.SaveData
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events CopyToClipboard
	#tag Event
		Sub Change()
		  Select case CopyToClipboard.ListIndex
		  case 0
		    
		  case 1
		    CopyClipAll
		  case 2
		    CopyClipAllFullOnly
		  case 3
		    CopyClipIcon
		  case 4
		    CopyClipSelected
		  end
		  
		  CopyToClipboard.ListIndex=0
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HelpAttrList
	#tag Event
		Function CellClick(row as Integer, column as Integer, x as Integer, y as Integer) As Boolean
		  #Pragma Unused column
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  HelpText.Text=HelpAttrList.Cell(row,1)
		  ShowHelpEditor(True)
		End Function
	#tag EndEvent
	#tag Event
		Sub CellLostFocus(row as Integer, column as Integer)
		  #Pragma Unused column
		  HelpAttrList.Cell(row, 1) = HelpText.Text
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events HelpText
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  #Pragma Unused X
		  #Pragma Unused Y
		  
		  Dim cutMenuItem As new MenuItem("Cut")
		  cutMenuItem.KeyboardShortcut = App.kCutEditShortcut
		  Dim copyMenuItem As new MenuItem("Copy")
		  copyMenuItem.KeyboardShortcut = App.kCopyEditShortcut
		  Dim delMenuItem As new MenuItem("Delete")
		  delMenuItem.KeyboardShortcut = App.kDelEditShortcut
		  Dim pasteMenuItem As new MenuItem("Paste")
		  pasteMenuItem.KeyboardShortcut = App.kPasteEditShortcut
		  
		  Dim selAllMenuItem As new MenuItem("Select All")
		  selAllMenuItem.KeyboardShortcut = App.kSelAllEditShortcut
		  
		  Dim buffer As New Clipboard
		  If buffer.Text.Len <= 0 Then
		    pasteMenuItem.Enabled = false
		  End
		  buffer.Close
		  
		  If Me.SelText.Len <= 0 Then
		    cutMenuItem.Enabled = false
		    copyMenuItem.Enabled = false
		    delMenuItem.Enabled = false
		  End
		  
		  If Me.Text.Len <= 0 Then
		    selAllMenuItem.Enabled = false
		  End
		  
		  base.Append(cutMenuItem)
		  base.Append(copyMenuItem)
		  base.Append(pasteMenuItem)
		  base.Append(delMenuItem)
		  base.Append(new MenuItem(MenuItem.TextSeparator))
		  base.Append(selAllMenuItem)
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem <> Nil Then
		    Select case hitItem.Text
		    case Is = "Cut"
		      Me.Copy
		      Me.SelText = ""
		    Case is = "Copy"
		      Me.Copy
		    Case is = "Paste"
		      Me.Paste
		    Case is = "Delete"
		      Me.SelText = ""
		    Case is = "Select All"
		      Me.SelectAll
		    End
		  End
		  
		  Return true
		End Function
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  #if TargetMacOS
		    Dim keyDown As String = Uppercase(Key)
		    If keyboard.AsyncCommandKey then
		      Select case keyDown
		      case Is = "X"
		        Me.Copy
		        Me.SelText = ""
		      Case is = "C"
		        Me.Copy
		      Case is = "V"
		        Me.Paste
		      Case is = "A"
		        Me.SelectAll
		      End
		    end
		  #endif
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ListboxElems
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  Dim tag As Variant = ListboxElems.RowTag(row)
		  
		  If not (tag isa ElementType) then
		    return false
		  End If
		  
		  Dim item As ElementType = tag
		  
		  If Not item.EnableDrag Then
		    Return False
		  End
		  
		  drag.DragPicture = CreateDragRowImage(Me.RowPicture(row), Me.Cell(row, 0))
		  drag.DropLeft = System.MouseX - Self.Left
		  drag.DropTop = System.MouseY - Self.Top
		  drag.DropWidth = drag.DragPicture.Width
		  drag.DropHeight = drag.DragPicture.Height
		  
		  drag.PrivateRawData("tessa.abspath") = item.GetXMLpath
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim node As ElementTreeNode = ListboxElems.RowTag(row)
		  If node <> Nil Then
		    LoadElements(node)
		  End
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  'ShowHelpEditor(False)
		  
		  // update description
		  UpdateDescLabel(ListboxElems.ListIndex)
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Select Case Key
		  Case ChrB(28) 'Left arrow key is pressed so fold the folder's rows
		    Dim i As Integer = Me.ListIndex
		    Dim depth As Integer = Me.RowDepth(i)
		    If depth = 0 then
		      return false
		    End If
		    
		    Dim targetDepth As Integer = depth-1 'targetDepth is the depth of the parent row
		    While depth > targetDepth
		      i=i-1
		      depth = ListboxElems.RowDepth(i)
		    Wend
		    
		    ListboxElems.ListIndex = i
		    ListboxElems.Expanded(i) = false
		    
		    Return True
		    
		  Case ChrB(29) 'Right arrow key is pressed so expand the row
		    ListboxElems.Expanded(Me.ListIndex) = true
		    Return True
		  End Select
		End Function
	#tag EndEvent
	#tag Event
		Function DisclosureWidgetPaint(g As Graphics, row As Integer, ByRef x As Integer, ByRef y As Integer, ByRef width As Integer, ByRef height As Integer) As Boolean
		  If me.RowExpandedAt(row) Then
		    g.DrawPicture(icon_disclosure_open, x, y)
		  Else
		    g.DrawPicture(icon_disclosure_closed, x, y)
		  End If
		  
		  return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events CustomTextField1
	#tag Event
		Sub IconAction()
		  Me.TextValue = ""
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChanged()
		  self.FIlterChanged
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
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue=""
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
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
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
	#tag ViewProperty
		Name="Transparent"
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
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
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
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="WindowsSize_Tab0_H"
		Visible=false
		Group="Behavior"
		InitialValue="500"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="WindowsSize_Tab0_W"
		Visible=false
		Group="Behavior"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="WindowsSize_Tab1_H"
		Visible=false
		Group="Behavior"
		InitialValue="500"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="WindowsSize_Tab1_W"
		Visible=false
		Group="Behavior"
		InitialValue="610"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
