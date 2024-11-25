sub init()
    m.itemposter = m.top.findNode("itemPoster") 
    'm.itemmask = m.top.findNode("itemMask")
    m.itemlabel = m.top.findNode("itemLabel")
    m.itemRectangle = m.top.findNode("itemRectangle")
end sub

sub showcontent()
    itemcontent = m.top.itemContent
    m.itemposter.uri = itemcontent.HDPosterUrl
    'm.itemlabel.text = itemcontent.title
    m.itemRectangle.color = "0x000000FF"

    print "showing content for item "; itemcontent.title

    if m.itemLabel.text = "Animation Nodes" then
        m.itemlabel.text = "Animations & Nodes"
    end if
end sub

sub showfocus()
    scale = 1 + (m.top.focusPercent * 0.02)
    m.itemposter.scale = [scale, scale]
end sub

sub showrowfocus()
    'm.itemmask.opacity = 0.75 - (m.top.rowFocusPercent * 0.75)
    m.itemlabel.opacity = m.top.rowFocusPercent
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean  

    print "key pressed: "
    print key
    
end function