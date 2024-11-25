sub addRowList()
    m.mainRowlist = m.top.findNode("mainRowList")
    m.mainRowlist.content = CreateObject("roSGNode", "RowListContent")
    m.mainRowlist.visible = false
    m.mainRowList.observeField("itemFocused", "onRowFocused")
    m.mainRowList.observeField("itemUnfocused", "onRowUnfocused")
    m.mainRowList.observeField("rowItemFocused", "onRowItemFocused")
    m.mainRowList.observeField("rowItemUnfocused", "onRowItemUnfocused")
    m.top.appendChild(m.mainRowlist)
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