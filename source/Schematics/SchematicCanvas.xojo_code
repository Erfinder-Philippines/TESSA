#tag Class
Protected Class SchematicCanvas
Inherits Canvas
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  If SelLink <> -1 Then
		    Dim l as LinkInfo
		    l = Links(SelLink)
		    If WithinLink(SelLink) And l.linkNotInView Then
		      //Center Row
		      Dim lbxFrom as new Listbox
		      Dim lbxTo as new Listbox
		      lbxFrom = l.fromElement.ElementAttributes
		      lbxTo = l.toElement.ElementAttributes
		      dim yIndexFrom as Integer = l.f_attribute_Y
		      dim yIndexTo as Integer = l.t_attribute_Y
		      Dim visibleRowsFrom As Integer = (lbxFrom.Height \ lbxFrom.RowHeight) - 1
		      Dim visibleRowsTo As Integer = (lbxTo.Height \ lbxTo.RowHeight) - 1
		      
		      // Adjust ScrollPosition
		      If yIndexFrom <> -1 And lbxFrom.ListCount > visibleRowsFrom \ 2 Then
		        lbxFrom.ScrollPosition = yIndexFrom - (visibleRowsFrom \ 2)
		        lbxFrom.ListIndex = yIndexFrom
		      End If
		      If yIndexTo <> -1 And lbxTo.ListCount > visibleRowsTo \ 2 Then
		        lbxTo.ScrollPosition = yIndexTo - (visibleRowsTo \ 2)
		        lbxTo.ListIndex = yIndexTo
		      End If
		      l.linkNotInView = False
		      
		      // Double click to follow link source/destination
		      'ElseIf WithinLink(SelLink) And NOT l.linkNotInView And NOT l.isLocal Then
		      'RaiseEvent followLink(l,SelLink)
		    End If
		  End If
		End Sub
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  MousePosition = New Realbasic.Point(x, y)
		  mOldX = X
		  mOldY = Y
		  SetFocus
		  
		  //Bottom-Up
		  'For each c as ElementContainer in Container
		  'If MousePosition.X >= c.Left And MousePosition.X <= c.Right And _
		  'MousePosition.Y >= c.Top And MousePosition.Y <= c.Bottom Then
		  'MouseOffset.x = c.Left - MousePosition.x
		  'MouseOffset.y = c.Top - MousePosition.y
		  'DraggingRect = c
		  'Exit
		  'Else
		  'MouseOffset.x = 0
		  'MouseOffset.y = 0
		  'DraggingRect = Nil
		  'End If
		  'Next
		  
		  //Top-Down
		  If Container <> Nil then
		    For i as Integer = UBound(Container) DownTo 0
		      If MousePosition.X >= Container(i).Left - canvasOffsetX And MousePosition.X <= Container(i).Right - canvasOffsetX And _
		        MousePosition.Y >= Container(i).Top  - canvasOffsetY And MousePosition.Y <= Container(i).Bottom  - canvasOffsetY And _
		        Container(i).parentTeststep = canvasPage Then
		        MouseOffset.x = Container(i).Left - MousePosition.x
		        MouseOffset.y = Container(i).Top - MousePosition.y
		        DraggingRect = Container(i)
		        If not IsContextualClick and DraggingRect.cursorAtResize Then
		          DraggingRect.isBeingResized = True
		        Else
		          DraggingRect.isBeingResized = False
		        End If
		        Exit
		      Else
		        MouseOffset.x = 0
		        MouseOffset.y = 0
		        DraggingRect = Nil
		      End If
		    Next
		  End If
		  
		  For i as Integer = 0 To Ubound(Links)
		    If WithinLink(i) And Links(i).linkIsDrawn Then
		      SelLink = i
		      Me.Invalidate(False)
		      LinkSelected(i)
		      Return True
		      Exit
		    Else
		      Links(i).thickness = 3
		    End If
		  Next
		  
		  SelLink = -1
		  Me.Invalidate(False)
		  Return True
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  MousePosition = New Realbasic.Point(x, y)
		  // If the mouse has been moved, calculate the delta
		  // and scroll the image.
		  Dim dx As Integer = X - mOldX
		  Dim dy As Integer = Y - mOldY
		  If DraggingRect <> Nil Then
		    If DraggingRect.isBeingResized and (X <> mOldX Or y <> mOldY) Then
		      DraggingRect.Composited = true
		      If Not (DraggingRect.Width + dx < DraggingRect.minWidth) Then
		        If Not (DraggingRect.Width + dx > DraggingRect.maxWidth) Then
		          #If TargetWindows Then
		            DraggingRect.Visible = False
		          #Endif
		          DraggingRect.Width = DraggingRect.Width + dx
		        End If
		      End If
		      If Not (DraggingRect.Height + dy < DraggingRect.minHeight) Then
		        'system.DebugLog "minheight ok" + str(DraggingRect.Height + dy) + " < " + str(DraggingRect.minHeight)
		        If Not (DraggingRect.Height + dy > DraggingRect.maxHeight) Then
		          #If TargetWindows Then
		            DraggingRect.Visible = False
		          #Endif
		          DraggingRect.Height = DraggingRect.Height + dy
		        End If
		      End If
		      DraggingRect.Refresh
		      mOldX = x
		      mOldY = y
		    ElseIf NOT DraggingRect.isBeingResized Then
		      DraggingRect.Left = MouseOffset.X + MousePosition.X
		      DraggingRect.Top = MouseOffset.Y + MousePosition.Y
		      #If TargetWindows Then
		        DraggingRect.Visible = False
		      #Endif
		    End If
		  ElseIf X <> mOldX Or y <> mOldY Then
		    
		    hScrollBar = RaiseEvent getHScrollBarVal
		    vScrollBar = RaiseEvent getVScrollBarVal
		    // Only allow image to be scrolled right and down
		    If Not (hScrollBar.value - dx < 0) Then 
		      // Don't allow image to be scrolled beyond its size
		      If Not (hScrollBar.value - dx > hScrollBar.Maximum) Then 
		        // Adjust scrollbars which will scroll image 
		        RaiseEvent setHScrollBarVal(hScrollBar.value - dx)
		      End If
		    End If
		    
		    If Not (vScrollBar.Value - dy < 0)Then 
		      If Not (vScrollBar.Value - dx > vScrollBar.Maximum) Then 
		        RaiseEvent setVScrollBarVal(vscrollBar.value - dy)
		      End If
		    End If
		    
		    canvasIsScrolling = True
		    #If TargetWindows Then
		      ShowContainers(False)
		    #Endif
		    
		    mOldX = X
		    mOldY = Y
		  End if
		  
		  Me.Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  MousePosition = New Realbasic.Point(x, y)
		  
		  'me.Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  // Update our mouse position.
		  MousePosition = New Realbasic.Point(x, y)
		  
		  // We're no longer dragging anything, and save the last Coordinates
		  If App.GlobalTestSequence <> Nil and DraggingRect <> Nil then
		    saveELT(DraggingRect)
		  End If
		  // to avoid nilexceptions
		  If DraggingRect <> Nil Then
		    DraggingRect.isBeingResized = False
		    DraggingRect.Composited = False
		    #If TargetWindows Then
		      DraggingRect.Visible = True
		    #Endif
		  ElseIf canvasIsScrolling Then
		    canvasIsScrolling = False
		    ShowContainers(True)
		  End If
		  
		  DraggingRect = Nil
		  
		  // refresh, without erasing the background
		  'Me.Invalidate(False)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  'gridImage = grid
		  canvasOffsetX = me.Left
		  canvasOffsetY = me.Top
		  MousePosition = New Realbasic.Point(-1, -1)
		  MouseOffset = New Realbasic.Point(0, 0)
		  Links = MainWindow.Links
		  darkModeEC(darkModeEnabled)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub darkModeEC(value as Boolean)
		  If value Then
		    gridImage = grid_dark
		  Else
		    gridImage = grid_light
		  End If
		  'RaiseEvent DarkModeSchematics
		  If Container = Nil Then
		    return
		  End If
		  If value Then
		    For each ec as ElementContainer in Container
		      ec.darkModeEnabled = True
		    Next
		  Else
		    For each ec as ElementContainer in Container
		      ec.darkModeEnabled = False
		    Next
		  End If
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function drawLinks() As Picture
		  Const margin As Integer = 10
		  Const yellowGreen as Color = &c8FF943
		  Const lightBlue as Color = &c51A1FF
		  Const skyBlue as Color = &c2589FF
		  dim pic as new Picture (gridImage.Width, gridImage.Width)
		  dim g as Graphics = pic.Graphics
		  g.DrawPicture(gridImage,0,0)
		  g.PenHeight = 5
		  For each lk as LinkInfo in Links
		    // Shorten this code soon
		    
		    If lk.isLocal And (lk.fromElement.parentTeststep = canvasPage And lk.toElement.parentTeststep = canvasPage) Then
		      //Drawing Local links; only links that are inside the current teststep
		      g.ForeColor = lightBlue
		      g.PenWidth = lk.thickness
		      dim cW as Integer = lk.circleWidth
		      dim fromListBoxTop As Integer = lk.fromElement.ElementAttributes.Top
		      dim toListBoxTop As Integer = lk.toElement.ElementAttributes.Top
		      dim y1 as Integer = (lk.fromElement.Top + fromListBoxTop) - mYScroll - canvasOffsetY
		      dim y2 as Integer = (lk.toElement.Top + toListBoxTop) - mYScroll - canvasOffsetY
		      dim rowCountStartFrom as Integer = lk.fromElement.ElementAttributes.ScrollPosition + 1
		      dim rowCountStartTo as Integer = lk.toElement.ElementAttributes.ScrollPosition + 1
		      dim fromListBoxHeight As Integer = lk.fromElement.ElementAttributes.Height
		      dim toListBoxHeight As Integer = lk.toElement.ElementAttributes.Height
		      
		      //Which Rows are visible. Store them in an array
		      dim fromIRowsVisible as Integer = fromListBoxHeight / cW
		      dim toIRowsVisible as Integer = toListBoxHeight / cW
		      dim visibleRowsFrom(), visibleRowsTo() as Integer
		      For i as Integer = 0 to fromIRowsVisible - 1
		        visibleRowsFrom.Append((rowCountStartFrom) + i)
		      Next
		      For j as Integer = 0 to toIRowsVisible - 1
		        visibleRowsTo.Append((rowCountStartTo) + j)
		      Next
		      
		      //Y-axis to draw the start and end of link.
		      dim fromSearchIndex, toSearchIndex As Integer
		      fromSearchIndex = visibleRowsFrom.IndexOf(lk.f_attribute_Y + 1)
		      toSearchIndex = visibleRowsTo.IndexOf(lk.t_attribute_Y + 1)
		      If fromSearchIndex <> -1 then
		        y1 = y1 + ((fromSearchIndex) * cW)
		      ElseIf lk.f_attribute_Y >= visibleRowsFrom(fromIRowsVisible - 1) then
		        y1 = y1 + ((fromIRowsVisible - 1) * cW)
		        g.ForeColor = &cC6C6C68C
		        lk.linkNotInView = True 
		      ElseIf lk.f_attribute_Y < visibleRowsFrom(0) - 1 then
		        g.ForeColor = &cC6C6C68C
		        lk.linkNotInView = True
		      End If
		      
		      If toSearchIndex <> -1 then
		        y2 = y2 + ((toSearchIndex) * cW)
		      ElseIf lk.t_attribute_Y >= visibleRowsTo(toIRowsVisible - 1) then
		        y2 = y2 + ((toIRowsVisible - 1) * cW)
		        g.ForeColor = &cC6C6C68C
		        lk.linkNotInView = True
		      ElseIf lk.t_attribute_Y < visibleRowsTo(0) - 1 then
		        g.ForeColor = &cC6C6C68C
		        lk.linkNotInView = True
		      End If
		      
		      //Draw the links
		      dim fromListBoxWidth As Integer = lk.fromElement.ElementAttributes.Width
		      dim toListBoxWidth As Integer = lk.toElement.ElementAttributes.Width
		      dim fromListBoxLeft As Integer = lk.fromElement.ElementAttributes.Left
		      dim toListBoxLeft As Integer = lk.toElement.ElementAttributes.Left
		      dim x1, x2 As Integer 
		      If (lk.fromElement.Right / 2) > (lk.toElement.Right / 2) then
		        x1 = (lk.fromElement.Left - fromListBoxLeft - margin) - mXScroll - canvasOffsetX
		        x2 = (lk.toElement.Left + toListBoxWidth + margin) - mXScroll - canvasOffsetX
		      Else
		        x1 = (lk.fromElement.Left + fromListBoxWidth + margin) - mXScroll - canvasOffsetX
		        x2 = (lk.toElement.Left - toListBoxLeft) - mXScroll - canvasOffsetX
		      End If
		      g.FillOval(x1, y1 + 1, cW, cW)
		      g.DrawLine(x1 + (cW/2), y1 + (cW/2), x2, y2 + (cW/2))
		      lk.linkIsDrawn = True
		      
		      //Update coordinates of the links
		      lk.startX = x1 + (cW/2)
		      lk.endX = x2
		      lk.startY = y1 + (cW/2)
		      lk.endY = y2 + (cW/2)
		      
		    ElseIf (lk.fromElement.parentTeststep = canvasPage OR lk.toElement.parentTeststep = canvasPage) AND NOT lk.isLocal Then
		      g.ForeColor = skyBlue
		      g.PenWidth = lk.thickness
		      dim cW as Integer = lk.circleWidth
		      lk.linkNotInView = False
		      
		      If lk.fromElement.parentTeststep = canvasPage and lk.toElement.parentTeststep = outStepContainer.getMenuID Then
		        //From ElementContainer To the outStepContainer
		        dim fromListBoxTop As Integer = lk.fromElement.ElementAttributes.Top
		        dim toListBoxTop As Integer = outStepContainer.ElementsListBox.Top
		        dim y1 as Integer = (lk.fromElement.Top + fromListBoxTop) - mYScroll - canvasOffsetY
		        dim y2 as Integer = (me.Top + toListBoxTop) - mYScroll - canvasOffsetY
		        dim rowCountStartFrom as Integer = lk.fromElement.ElementAttributes.ScrollPosition + 1
		        dim rowCountStartTo as Integer = outStepContainer.ElementsListBox.ScrollPosition + 1
		        dim fromListBoxHeight As Integer = lk.fromElement.ElementAttributes.Height
		        dim toListBoxHeight As Integer = outStepContainer.ElementsListBox.Height
		        
		        //Which Rows are visible. Store them in an array
		        dim fromIRowsVisible as Integer = fromListBoxHeight / cW
		        dim toIRowsVisible as Integer = toListBoxHeight / cW
		        dim visibleRowsFrom(), visibleRowsTo() as Integer
		        For i as Integer = 0 to fromIRowsVisible - 1
		          visibleRowsFrom.Append((rowCountStartFrom) + i)
		        Next
		        For j as Integer = 0 to toIRowsVisible - 1
		          visibleRowsTo.Append((rowCountStartTo) + j)
		        Next
		        
		        //Y-axis to draw the start and end of link.
		        dim fromSearchIndex, toSearchIndex As Integer
		        dim elementID as String = lk.toElement.uniqueID
		        dim to_Y as Integer = outStepContainer.getRowIndex(elementID)
		        fromSearchIndex = visibleRowsFrom.IndexOf(lk.f_attribute_Y + 1)
		        toSearchIndex = visibleRowsTo.IndexOf(to_Y + 1)
		        If fromSearchIndex <> -1 then
		          y1 = y1 + ((fromSearchIndex) * cW)
		        ElseIf lk.f_attribute_Y >= visibleRowsFrom(fromIRowsVisible - 1) then
		          y1 = y1 + ((fromIRowsVisible - 1) * cW)
		          g.ForeColor = &cC6C6C68C
		          lk.linkNotInView = True 
		        ElseIf lk.f_attribute_Y < visibleRowsFrom(0) - 1 then
		          g.ForeColor = &cC6C6C68C
		          lk.linkNotInView = True
		        End If
		        
		        If toSearchIndex <> -1 then
		          y2 = y2 + ((toSearchIndex) * cW)
		        ElseIf to_Y >= visibleRowsTo(toIRowsVisible - 1) then
		          y2 = y2 + ((toIRowsVisible - 1) * cW)
		          g.ForeColor = &cC6C6C68C
		          lk.linkNotInView = True
		        ElseIf to_Y < visibleRowsTo(0) - 1 then
		          g.ForeColor = &cC6C6C68C
		          lk.linkNotInView = True
		        End If
		        
		        //Draw the links
		        dim fromListBoxWidth As Integer = lk.fromElement.ElementAttributes.Width
		        dim toListBoxWidth As Integer = outStepContainer.ElementsListBox.Width
		        dim fromListBoxLeft As Integer = lk.fromElement.ElementAttributes.Left
		        dim toListBoxLeft As Integer = outStepContainer.ElementsListBox.Left
		        dim x1, x2 As Integer 
		        x1 = (lk.fromElement.Left + fromListBoxWidth + margin) - mXScroll - canvasOffsetX
		        x2 = (outStepContainer.Left - toListBoxLeft - margin) - mXScroll - canvasOffsetX
		        
		        g.FillOval(x1, y1 + 1, cW, cW)
		        g.DrawLine(x1 + (cW/2), y1 + (cW/2), x2, y2 + (cW/2))
		        lk.linkIsDrawn = True
		        
		        //Update coordinates of the links
		        lk.startX = x1 + (cW/2)
		        lk.endX = x2
		        lk.startY = y1 + (cW/2)
		        lk.endY = y2 + (cW/2)
		        
		      ElseIf lk.toElement.parentTeststep = canvasPage and lk.fromElement.parentTeststep = outStepContainer.getMenuID Then
		        //from the OutStepContainer to ElementContainer
		        dim fromListBoxTop As Integer = outStepContainer.ElementsListBox.Top
		        dim toListBoxTop As Integer = lk.toElement.ElementAttributes.Top
		        dim y1 as Integer = (me.Top + fromListBoxTop) - mYScroll - canvasOffsetY
		        dim y2 as Integer = (lk.toElement.Top + toListBoxTop) - mYScroll - canvasOffsetY
		        dim rowCountStartFrom as Integer = outStepContainer.ElementsListBox.ScrollPosition + 1
		        dim rowCountStartTo as Integer = lk.toElement.ElementAttributes.ScrollPosition + 1
		        dim fromListBoxHeight As Integer = outStepContainer.ElementsListBox.Height
		        dim toListBoxHeight As Integer = lk.toElement.ElementAttributes.Height
		        
		        //Which Rows are visible. Store them in an array
		        dim fromIRowsVisible as Integer = fromListBoxHeight / cW
		        dim toIRowsVisible as Integer = toListBoxHeight / cW
		        dim visibleRowsFrom(), visibleRowsTo() as Integer
		        For i as Integer = 0 to fromIRowsVisible - 1
		          visibleRowsFrom.Append((rowCountStartFrom) + i)
		        Next
		        For j as Integer = 0 to toIRowsVisible - 1
		          visibleRowsTo.Append((rowCountStartTo) + j)
		        Next
		        
		        //Y-axis to draw the start and end of link.
		        dim fromSearchIndex, toSearchIndex As Integer
		        dim elementID as String = lk.fromElement.uniqueID
		        dim from_Y as Integer = outStepContainer.getRowIndex(elementID)
		        fromSearchIndex = visibleRowsFrom.IndexOf(from_Y + 1)
		        toSearchIndex = visibleRowsTo.IndexOf(lk.t_attribute_Y + 1)
		        'System.DebugLog str(toSearchIndex) + " " + str(lk.t_attribute_Y)
		        If fromSearchIndex <> -1 then
		          y1 = y1 + ((fromSearchIndex) * cW)
		        ElseIf from_Y >= visibleRowsFrom(fromIRowsVisible - 1) then
		          y1 = y1 + ((fromIRowsVisible - 1) * cW)
		          g.ForeColor = &cC6C6C68C
		          lk.linkNotInView = True 
		        ElseIf from_Y < visibleRowsFrom(0) - 1 then
		          g.ForeColor = &cC6C6C68C
		          lk.linkNotInView = True
		        End If
		        
		        If toSearchIndex <> -1 then
		          y2 = y2 + ((toSearchIndex) * cW)
		        ElseIf lk.t_attribute_Y >= visibleRowsTo(toIRowsVisible - 1) then
		          y2 = y2 + ((toIRowsVisible - 1) * cW)
		          g.ForeColor = &cC6C6C68C
		          lk.linkNotInView = True
		        ElseIf lk.t_attribute_Y < visibleRowsTo(0) - 1 then
		          g.ForeColor = &cC6C6C68C
		          lk.linkNotInView = True
		        End If
		        
		        //Draw the links
		        dim fromListBoxWidth As Integer = outStepContainer.ElementsListBox.Width
		        dim toListBoxWidth As Integer = lk.toElement.ElementAttributes.Width
		        dim fromListBoxLeft As Integer = outStepContainer.ElementsListBox.Left
		        dim toListBoxLeft As Integer = lk.toElement.ElementAttributes.Left
		        dim x1, x2 As Integer 
		        x1 = (outStepContainer.Left - fromListBoxLeft - margin - cW) - mXScroll - canvasOffsetX
		        x2 = (lk.toElement.Left + toListBoxWidth + margin) - mXScroll - canvasOffsetX
		        g.FillOval(x1, y1 + 1, cW, cW)
		        g.DrawLine(x1 + (cW/2), y1 + (cW/2), x2, y2 + (cW/2))
		        lk.linkIsDrawn = True
		        
		        //Update coordinates of the links
		        lk.startX = x1 + (cW/2)
		        lk.endX = x2
		        lk.startY = y1 + (cW/2)
		        lk.endY = y2 + (cW/2)
		      End If
		    Else
		      lk.linkIsDrawn = False
		    End If
		  Next
		  
		  Return pic
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub emptyCanvas()
		  If Container <> Nil Then
		    For each ec as ElementContainer in Container
		      ec.Close
		    Next
		    Redim Container(-1)
		  End If
		  Redim Links(-1)
		  canvasPage = ""
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub followLink()
		  //support function for followLink Event
		  RaiseEvent followLink
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getSelectedLink() As Integer
		  Return SelLink
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LinkSelected(num as Integer)
		  // Link is clicked
		  For i as Integer = 0 To Ubound(Links)
		    If num = i Then
		      Links(i).thickness = 5
		    Else
		      Links(i).thickness = 3 //default thickness
		    End If
		  Next
		  
		  dim searchID as String = Links(num).toElement.uniqueID
		  dim bc as BasicClass = App.GlobalTestSequence.FindElementByUniqueID(searchID)
		  dim attrIndex as Integer = Links(num).t_attribute_Y
		  dim linkName as String = bc.GetAttribute(attrIndex).LinkName
		  'System.DebugLog "Link: " + linkName
		  
		  me.Invalidate(False)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub saveELT(ec as ElementContainer)
		  Dim bc as BasicClass = App.GlobalTestSequence.FindElementByUniqueID(ec.uniqueID)
		  If bc <> Nil then
		    bc.ELT.X = ec.Left - canvasOffsetX
		    bc.ELT.Y = ec.Top - canvasOffsetY
		    bc.ELT.Width = ec.Width
		    bc.ELT.Height = ec.Height
		  End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub setSelectedLink(num as Integer)
		  SelLink = num
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ShowContainers(value as Boolean)
		  For each ec as ElementContainer in Container
		    If ec.parentTeststep = canvasPage Then
		      ec.Visible = value
		    End If
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WithinLink(num As Integer) As Boolean
		  Dim x1, x2, y1, y2, clickArea As Integer
		  Dim m As Double
		  Dim l As LinkInfo
		  l = Links(num)
		  
		  If l <> nil Then
		    x1 = l.startX - mHorizontalScrollBarLast
		    y1 = l.startY - mVerticalScrollBarLast
		    x2 = l.endX - mHorizontalScrollBarLast
		    y2 = l.endY - mVerticalScrollBarLast
		  End If
		  
		  // slope of the link line
		  m = (y2 - y1) / (x2 - x1) 
		  clickArea = m * mOldX - (m * x1 - y1)
		  
		  If mOldX >= Min(x1, x2) And mOldX <= Max(x1, x2) Then
		    //You can add a buffer here for the thickness if the clicks
		    //can't register because the lines are too thin
		    If Abs(mOldY - clickArea) <= l.thickness Then 
		      Return True
		    End If
		  End If
		  
		  Return False
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event DarkModeSchematics()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event followLink()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event getHScrollBarVal() As ScrollBar
	#tag EndHook

	#tag Hook, Flags = &h0
		Event getVScrollBarVal() As ScrollBar
	#tag EndHook

	#tag Hook, Flags = &h0
		Event setHScrollBarVal(value as Integer)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event setVScrollBarVal(value as Integer)
	#tag EndHook


	#tag Property, Flags = &h0
		canvasIsScrolling As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		canvasOffsetX As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		canvasOffsetY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		canvasPage As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Container() As ElementContainer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return mdarkModeEnabled
			End Get
		#tag EndGetter
		#tag Setter
			Set
			  mdarkModeEnabled = value
			  darkModeEC(value)
			End Set
		#tag EndSetter
		darkModeEnabled As Boolean
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		DraggingRect As ElementContainer
	#tag EndProperty

	#tag Property, Flags = &h0
		gridImage As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		hScrollBar As ScrollBar
	#tag EndProperty

	#tag Property, Flags = &h0
		Links() As LinkInfo
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mdarkModeEnabled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		mHorizontalScrollBarLast As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOldX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mOldY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MouseOffset As REALbasic.Point
	#tag EndProperty

	#tag Property, Flags = &h21
		Private MousePosition As REALbasic.Point
	#tag EndProperty

	#tag Property, Flags = &h0
		mVerticalScrollBarLast As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mXScroll As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mYScroll As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		outStepContainer As TestStepContainer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  return Left + Width
			End Get
		#tag EndGetter
		Right As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SelLink As Integer = -1
	#tag EndProperty

	#tag Property, Flags = &h0
		vScrollBar As ScrollBar
	#tag EndProperty


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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue=""
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
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
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
			Name="TabStop"
			Visible=true
			Group="Position"
			InitialValue="True"
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
			InitialValue="True"
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
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
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
			Name="mYScroll"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mHorizontalScrollBarLast"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mVerticalScrollBarLast"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mXScroll"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="gridImage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Picture"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="canvasOffsetX"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="canvasOffsetY"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="canvasPage"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Right"
			Visible=false
			Group="Behavior"
			InitialValue=""
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
			Name="InitialParent"
			Visible=false
			Group=""
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="canvasIsScrolling"
			Visible=false
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
