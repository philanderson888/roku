sub init()
    m.itemRectangle = m.top.findNode("itemRectangle")
    m.itemRectangle.opacity = 0.5
    m.itemRectangle.opacity = 0.75
    m.itemRectangle.color = "0xaaaaaaFF" 
    m.itemRectangle.color = "0xffffffFF" 
    m.itemRectangle.color = "0x000000FF" 
    m.itemRectangle.color = "0x90d0bf"
    m.itemRectangle.color = "0x333333"
    m.itemRectangle.width = 180
    m.itemRectangle.height = 135
    m.itemRectangle.height = 200
    m.itemRectangle.translation = [ 0, 0 ]
    m.itemRectangle.scale = [ 1, 1 ]
    m.itemRectangle.rotation = 0
    m.itemRectangle.scaleRotateCenter = [ 0, 0 ]


    'm.itemposter = m.top.findNode("itemPoster") 
    'm.itemlabel = m.top.findNode("itemLabel")
end sub

sub showcontent()
    itemcontent = m.top.itemContent
    print "item rectangle has parent and m.top as row list item"

    'm.itemposter.uri = itemcontent.HDPosterUrl
    'm.itemlabel.text = itemcontent.title

    if itemcontent.color <> invalid then
        m.itemRectangle.color = itemcontent.color
    end if

    if itemcontent.shortDescriptionLine2 = "Portrait" then 
        print "portrait mode"
        m.itemRectangle.width = 180
        m.itemRectangle.height = 360
        m.itemRectangle.color = "0x333333"
    else if itemcontent.shortDescriptionLine2 = "Landscape" then 
        m.itemRectangle.width = 360
        m.itemRectangle.height = 148
        m.itemRectangle.color = "0x444444"
    else
        m.itemRectangle.width = 180
        m.itemRectangle.height = 148
        m.itemRectangle.color = "0x555555"
    end if

    'print "showing content for item "; itemcontent.title

    'if m.itemLabel.text = "Animation Nodes" then
    '    m.itemlabel.text = "Animations & Nodes"
    'end if
end sub

sub showfocus()
    print "show focus"
    print "m.top.focusPercent"
    print m.top.focusPercent
    scale = 1 + (m.top.focusPercent * 0.1)
    m.itemRectangle.scale = [1, scale]
    m.itemRectangle.color = "0xcccccccc" 
    if m.top.focusPercent < 0.05 then
        m.itemRectangle.opacity = 0.3
        m.itemRectangle.color = "0xffffff"
    end if
    if m.top.focusPercent > 0.95 then
        m.itemRectangle.opacity = 1.0
        m.itemRectangle.color = "0x333333"
    end if
end sub

sub showunfocus()
    m.itemRectangle.scale = [1, 1]
    m.itemRectangle.color = "0x90d0bf"
    m.itemRectangle.color = "0x333333"
end sub 

sub showrowfocus()
    'm.itemRectangle.opacity = 0.75 - (m.top.rowFocusPercent * 0.75)
    'm.itemRectangle.opacity = 1.0
    'm.itemlabel.opacity = m.top.rowFocusPercent
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean  

    if press then
        print "row list itemr ... key " + key + " pressed: "
    end if

    print "item rectangle: "
    print m.itemRectangle 
    
end function