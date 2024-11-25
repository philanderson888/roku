sub addRowList()
    m.mainRowlist = m.top.findNode("mainRowList")
    m.mainRowlist.content = CreateObject("roSGNode", "RowListContent")
    m.mainRowlist.visible = false
    m.mainRowList.observeField("itemFocused", "onRowFocused")
    m.top.appendChild(m.mainRowlist)
end sub

sub onRowFocused(event)
    print "row focused"
    print event.getData()
end sub 

function onKeyEvent(key as String, press as Boolean) as Boolean  

    print "key pressed: "
    print key
    
end function