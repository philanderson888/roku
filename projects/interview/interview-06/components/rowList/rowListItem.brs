sub init()
    m.itemRectangle = m.top.findNode("itemRectangle")
    m.itemRectangle.opacity = 0.75
    m.itemRectangle.color = "#659286"
    m.itemRectangle.translation = [ 0, 0 ]
    m.itemRectangle.scale = [ 1, 1 ]
    m.itemRectangle.rotation = 0
    m.itemRectangle.scaleRotateCenter = [ 0, 0 ]
end sub

sub showcontent()
    itemcontent = m.top.itemContent
    print "item rectangle has parent and m.top as row list item"
    if itemcontent.shortDescriptionLine2 = "Portrait" then 
        m.itemRectangle.width = 158
        m.itemRectangle.height = 223
    else if itemcontent.shortDescriptionLine2 = "Landscape" then 
        m.itemRectangle.width = 263
        m.itemRectangle.height = 148
    else
        m.itemRectangle.width = 180
        m.itemRectangle.height = 148
    end if
    if itemcontent.color <> invalid then
        m.itemRectangle.color = itemcontent.color
    end if
end sub

sub showfocus()
    print "show focus"
    print "m.top.focusPercent"
    print m.top.focusPercent
    scale = 1 + (m.top.focusPercent * 0.1)
    m.itemRectangle.scale = [1, scale]
    m.itemRectangle.color = "#3a534c"
    if m.top.focusPercent < 0.05 then
        m.itemRectangle.opacity = 0.3
        m.itemRectangle.color = "#659286"
    end if
    if m.top.focusPercent > 0.95 then
        m.itemRectangle.opacity = 1.0
        m.itemRectangle.color = "##486860"
    end if
end sub

sub showunfocus()
    m.itemRectangle.scale = [1, 1]
    m.itemRectangle.color = "#659286"
end sub 

function onKeyEvent(key as String, press as Boolean) as Boolean  

    if press then
        print "row list itemr ... key " + key + " pressed: "
    end if

    print "item rectangle: "
    print m.itemRectangle 
    
end function