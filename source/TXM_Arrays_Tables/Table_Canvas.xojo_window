#tag Window
Begin ContainerControl Table_Canvas Implements HMICanvasInterface
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
   Height          =   410
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
   Width           =   744
   Begin ResizeContainer Resizer
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   False
      AllowTabs       =   True
      Backdrop        =   0
      BackgroundColor =   &cFFFFFF00
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   False
      HasBackgroundColor=   False
      Height          =   411
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   0
      Transparent     =   True
      Visible         =   True
      Width           =   744
   End
   Begin Listbox Table
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   False
      AllowExpandableRows=   False
      AllowFocusRing  =   True
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   2
      ColumnWidths    =   "30,"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLinesHorizontalStyle=   2
      GridLinesVerticalStyle=   3
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   382
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "No	Array1"
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   1
      Scope           =   2
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   28
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   744
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  if mTableClass <> Nil Then
		    mTableClass.Paint(g, 1)
		  End
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function CanvasRect() As REALbasic.Rect
		  // Part of the HMICanvasInterface interface.
		  Return Me.Bounds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RedrawTable(CompleteRedraw as Boolean)
		  // draw the table
		  RedrawTableVertical(CompleteRedraw)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RedrawTableVertical(CompleteRedraw as Boolean)
		  // select appropriate table and display it horizontally, meaning that every attribute and its values occupy one column each
		  
		  const FirstArrayCol = 1 // first column index where we show the array data
		  
		  if mTableClass <> nil then
		    
		    if mNeedsReset then
		      // A new Run started -> let's gather some data and cache it so that we do not need to recalc it every time
		      mNeedsReset = false
		      
		      Table.DeleteAllRows
		      
		      mPreviousActiveRow = -1
		      
		      // count the number of arrays
		      redim mArrayIsDirectVar(-1)
		      redim mArrayAttributes(-1)
		      dim attributesUbound as Integer = mTableClass.AttributesUbound
		      For n As Integer = 0 To attributesUbound
		        Dim arrayAttr As MultipleValuesAttributeClass = MultipleValuesAttributeClass(mTableClass.GetAttribute(n))
		        If arrayAttr <> Nil And arrayAttr.IsArray Then
		          mArrayAttributes.Append arrayAttr
		          mArrayIsDirectVar.Append true
		        End
		      Next
		      
		      Table.ColumnCount = mArrayAttributes.Ubound + 1 + FirstArrayCol
		      
		      redim mMinColumnWidths(-1) // first, remove all elements, so that...
		      redim mMinColumnWidths(Table.ColumnCount-1) // now we have the array elements for each column set to zero
		      
		      mMinColumnWidths(0) = Table.Column(0).WidthActual // for the "number" column
		      
		      for n as Integer = 0 to mArrayAttributes.Ubound
		        dim arrayAttr As MultipleValuesAttributeClass = mArrayAttributes(n)
		        #if FixIssue36 // !TT this makes currently no sense because the values are not used after editing:
		          Table.ColumnType(FirstArrayCol+n) = ListBox.TypeEditable
		        #endif
		        Table.Heading(FirstArrayCol+n) = arrayAttr.Name
		      next
		      
		      // Determine how many rows are visible in the Table
		      mVisibleRows = Floor ((Table.Height-4) / Table.RowHeight) - 2 // sub one for header and one for horizontal scrollbar
		      
		      dim g as Graphics = mPicture.Graphics
		      g.TextFont = Table.TextFont
		      g.TextSize = Table.TextSize
		      g.TextUnit = Table.TextUnit
		      
		    end if
		    
		    // At this point, we can be in two different situations:
		    // 1. The array is larger than the listbox's row count. This means: Add those missing array values to the listbox until all are added.
		    // 2. The run had started with a non-empty list (which we all added already through situation 1 above), but has reset the activeRow to
		    // a lower index (usually starting at 0) and is now updating values. For this, we need to update the rows starting with the last activeRow
		    // we had seen previously and up to the current activeRow.
		    //
		    // This means that we have two ranges to handle:
		    // 1. From the Table's last added row to the last array element (this is the case at the first run and whenever new values get _added_ to the arrays).
		    // 2. From the previous activeRow to the current activeRow.
		    // Since it's unlikely that we find both added array values and updated values far before it, we simply add or update all rows between the previous
		    // activeRow, ending either at the current activeRow or at the last newly added array index, if any were added.
		    //
		    // However: It may not even be desired to see all the old table values but only the newly recorded ones.
		    // To do that, set the constant showOnlyUpToActiveRow below to true
		    
		    const showOnlyUpToActiveRow = false
		    
		    dim arraySizes() as Integer
		    redim arraySizes(mArrayAttributes.Ubound)
		    dim maxRow as Integer = -1
		    // Determine the max row number from the size of the arrays - ideally they would all have the same size and we could query that size more easily.
		    // But it seems it could happen that one array is a directVar and the other is from a linked array, and that could have a different size.
		    // So we better manage this case by determining each array's own size
		    for attrIndex as Integer = 0 to mArrayAttributes.Ubound
		      dim arrayAttr As MultipleValuesAttributeClass = mArrayAttributes(attrIndex)
		      dim arraySize, goan, gian as Integer
		      goan = arrayAttr.GOAN
		      gian = arrayAttr.GIAN
		      dim isDirectVar as Boolean = goan >= gian
		      // isDirectVar indicates if the Values have to be taken from a linked table at the source attribute (=false)
		      // or from the table attribute itself (=true)
		      mArrayIsDirectVar (attrIndex) = isDirectVar
		      if isDirectVar then
		        arraySize = goan
		      else
		        arraySize = gian
		      end
		      arraySizes (attrIndex) = arraySize
		      #if not showOnlyUpToActiveRow
		        if arraySize >= maxRow then
		          maxRow = arraySize-1
		        end if
		      #endif
		    next
		    
		    #if not showOnlyUpToActiveRow
		      if maxRow < Table.ListCount then
		        // this means there are no new rows to add -> we can simply update just those up to the activeRow
		        maxRow = 0
		      end
		    #endif
		    
		    // Clear the "*" from the previously active row
		    if mPreviousActiveRow >= 0 then
		      dim s as String = Table.Cell (mPreviousActiveRow, 0)
		      if s.Right(1) = "*" then
		        s = s.Left (s.Len-1)
		        Table.Cell (mPreviousActiveRow, 0) = s
		      else
		        // huh, where did the asterisk go?!
		        break
		      end if
		    end if
		    
		    dim activeRow as Integer = mTableClass.ActiveRowInternal
		    
		    if maxRow < activeRow then
		      maxRow = activeRow
		    end if
		    
		    // Now let's add or update all new or changed rows
		    dim row as Integer = Max (0, mPreviousActiveRow)
		    dim gr as Graphics = mPicture.Graphics
		    while row <= maxRow
		      dim cellValue as String
		      
		      // Add a row, with the "Number" column
		      cellValue = Format (row, ",###") // 1000 shows as "1'000" or whatever the locale defines
		      if row >= Table.ListCount then
		        Table.AddRow cellValue
		        if row <> Table.LastIndex then
		          // something went wrong - mPreviousActiveRow must never be higher than the Table's row count
		          break
		        end if
		      else
		        dim s as String = Table.Cell (row, 0)
		        if s <> cellValue then
		          break // huh, the first column's values should never change, but always be the row number
		        end if
		      end if
		      dim width as Integer = Ceil (gr.StringWidth (cellValue + "*"))+8
		      if width > mMinColumnWidths(0) then mMinColumnWidths(0) = width
		      
		      // Put the array values into the other columns
		      for attrIndex as Integer = 0 to mArrayAttributes.Ubound
		        if row >= arraySizes(attrIndex) then continue // this array is smaller that the row we're at now
		        
		        // Get the array value
		        dim arrayAttr As MultipleValuesAttributeClass = mArrayAttributes(attrIndex)
		        if mArrayIsDirectVar(attrIndex) then
		          cellValue = arrayAttr.GOAS(row)
		        else
		          cellValue = arrayAttr.GIAS(row)
		        end if
		        
		        // Set the cell
		        dim column as Integer = attrIndex + FirstArrayCol
		        Table.Cell (row, column) = cellValue
		        
		        // Determine the width of the cell
		        width = Ceil (gr.StringWidth (cellValue))+8
		        if width > mMinColumnWidths (column) then mMinColumnWidths (column) = width
		      next
		      
		      row = row + 1
		    wend
		    
		    // Add the "*" to the currently active row
		    if Table.ListCount = 0 then
		      // ignore
		    elseif activeRow < 0 or activeRow >= Table.ListCount then
		      'break // something is wrong!
		    else
		      dim s as String = Table.Cell (activeRow, 0)
		      if s.Right(1) = "*" then
		        break // huh, where is it already there?!
		      else
		        Table.Cell (activeRow, 0) = s + "*"
		      end if
		      mPreviousActiveRow = activeRow
		    end if
		    
		    // Update the column widths
		    for column as Integer = 0 to mMinColumnWidths.Ubound
		      dim width as Integer = mMinColumnWidths(column)
		      if Table.Column(column).WidthActual < width then
		        Table.Column(column).MinWidthExpression = Str(width, "-#")
		        Table.Column(column).WidthActual = width
		      end if
		    next
		    
		    dim state as Integer = App.GetTESSAState
		    if state <> 4 then
		      // scroll to active row
		      Table.ScrollPosition = Max (0, activeRow-mVisibleRows)
		    end
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetUI()
		  // Part of the HMICanvasInterface interface.
		  mNeedsReset = true
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetCoordinates(X as integer, Offset as integer, Y as integer, W as integer, H as integer)
		  // Part of the HMICanvasInterface interface.
		  Me.Left = X - HMI_StepClass.cCanvasMargin
		  Me.Top = Y - HMI_StepClass.cCanvasMargin
		  
		  Me.Width = W + Offset + 2 * HMI_StepClass.cCanvasMargin
		  Me.Height= H + 2 * HMI_StepClass.cCanvasMargin
		  
		  Table.Left = HMI_StepClass.cCanvasMargin
		  Table.Top = HMI_StepClass.cCanvasMargin + 30
		  Table.Width = W
		  Table.Height = H - 30
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetEditMode(type As Boolean)
		  // Part of the HMICanvasInterface interface.
		  Resizer.SetEditMode(type)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetHMIClass(HMIClass As HMI_StepClass)
		  // Part of the HMICanvasInterface interface.
		  mTableClass = Table_StepClass(HMIClass)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetProperty(PropertyName as string, SetValue as string)
		  // virtual method, has to be overridden if implemented in the class
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetVisible(value As Boolean)
		  // Part of the HMICanvasInterface interface.
		  Me.Visible = value
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateCanvas(mode As Integer)
		  // Part of the HMICanvasInterface interface.
		  if mode = 0 or mode = 1 Then
		    RedrawTable(True)
		  ElseIf mode = 2 Then
		    RedrawTable(False)
		  End
		  
		  #if FixIssue36
		    // Refresh should not be necessary - if the listbox got modified, it'll refresh automatically.
		    // Regardless - Invalidate would still be better than Refresh here.
		  #else
		    Me.Refresh(false)
		  #endif
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mArrayAttributes() As MultipleValuesAttributeClass
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mArrayIsDirectVar() As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mMinColumnWidths() As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mNeedsReset As Boolean
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPicture As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mPreviousActiveRow As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mTableClass As Table_StepClass = nil
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mVisibleRows As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events Resizer
	#tag Event
		Sub Resize(X As Integer, Y As Integer, Width As Integer, Height As Integer)
		  if mTableClass <> Nil Then
		    mTableClass.Resize_HMI_Element(X, Y, Width, Height)
		  End
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Table
	#tag Event
		Sub Open()
		  mNeedsReset = true
		  mPreviousActiveRow = -1
		  
		  mPicture = new Picture (32, 32) // used to calculate the cell widths
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  
		End Function
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
