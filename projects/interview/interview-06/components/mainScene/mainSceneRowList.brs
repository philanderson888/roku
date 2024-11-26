sub addRowList()
    m.mainRowlist = m.top.findNode("mainRowList")
    m.mainRowlist.content = CreateObject("roSGNode", "RowListContent")
    m.mainRowlist.visible = false
    m.mainRowlist.translation = "[ 90, 100 ]"
    m.mainRowlist.id = "mainRowList"
    m.mainRowlist.focusable = true
    m.mainRowlist.itemComponentName = "RowListItem"
    m.mainRowlist.numRows = 4
    m.mainRowlist.rowFocusAnimationStyle = "fixedFocusWrap"
    m.mainRowlist.rowFocusAnimationStyle = "fixedFocusWrap"
    m.mainRowList.itemSize = [ 3000, 180 ]
    m.mainRowList.rowHeights =  [       160,        160,        160,        160,        273 ]
    m.mainRowList.rowItemSize = [ [180, 148], [180, 148], [180, 148], [263, 148], [148, 263] ]

    m.mainRowList.rowSpacing = 20
    m.mainRowList.rowItemspacing = [ [20, 20] ]
    m.mainRowList.itemSpacing = [ 20, 30 ]

    m.mainRowList.focusXOffset = 0
    m.mainRowlist.showRowLabel = [ false, false, false, false ]
    m.mainRowlist.showRowCounter = true  
    m.mainRowList.drawFocusFeedback = false
    m.mainRowList.rowLabelOffset = [ [0, 10] ]

    m.mainRowList.observeField("itemFocused", "onRowFocused")
    m.mainRowList.observeField("itemUnfocused", "onRowUnfocused")
    m.mainRowList.observeField("rowItemFocused", "onRowItemFocused")
    m.mainRowList.observeField("rowItemUnfocused", "onRowItemUnfocused")
    m.top.observeField("focusedChild", "onFocusedChildChanged")
    m.top.appendChild(m.mainRowlist)

end sub

sub setRowListVisible()
    m.mainRowList.visible = true
    m.mainRowlist.setFocus(true)
    print "main row list item size "
    for each item in m.mainRowList.itemSize
        print item
    end for
    print "main row list row item size "
    for each item in m.mainRowList.rowItemSize
        print item
    end for
end sub

sub onFocusedChildChanged(event)
    print "focused child changed ... on main row list"
end sub

sub onRowFocused(event)
    print "row focused"
    print event.getData()

end sub 

sub onRowUnfocused(event)
    print "row unfocused"
    print event.getData()

    print "m.mainRowList"
    print m.mainRowList 
    print "item focused"
    print m.mainRowList.itemFocused
    print "row item focused"
    print m.mainRowList.rowItemFocused
    print "row item size"
    for each item in m.mainRowList.rowItemSize
        print item
    end for
end sub 

sub onRowItemFocused(event)
    print "row item focused"
    print event.getData()
    print "item "; m.mainRowList.rowItemFocused[1]; " in row "; m.mainRowList.rowItemFocused[0]; " was focused"
end sub

sub onRowItemUnfocused(event)
    print "row item unfocused"
    print event.getData()
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean  

    if press then
        print "row list helper ... key " + key + " pressed: "
    end if
    
end function