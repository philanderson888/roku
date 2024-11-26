sub init()
    m.itemPoster = m.top.findNode("itemPoster")
    m.itemPoster.opacity = 1.0
    m.itemPoster.translation = [ 0, 0 ]
    m.itemPoster.scale = [ 1, 1 ]
    m.itemPoster.rotation = 0
    m.itemPoster.scaleRotateCenter = [ 0, 0 ]
    m.itemPoster.visible = true
    m.itemPoster.width = 180
    m.itemPoster.height = 148
end sub

sub showcontent()
    itemcontent = m.top.itemContent
    print "item parent is row list component"
    ' hack - it will come from the row type
    if itemcontent.shortDescriptionLine2 = "Portrait" then 
        m.itemPoster.width = 158
        m.itemPoster.height = 223
    else if itemcontent.shortDescriptionLine2 = "Landscape" then 
        m.itemPoster.width = 263
        m.itemPoster.height = 148
    else
        m.itemPoster.width = 180
        m.itemPoster.height = 148
    end if
    if itemcontent.HDPosterUrl <> invalid then
        m.itemPoster.uri = itemcontent.HDPosterUrl
        m.itemPoster.visible = true
        m.itemPoster.opacity = 0.75
    end if
    m.itemPoster.visible = true
end sub

sub showfocus()
    print "show focus"
    print "m.top.focusPercent"
    print m.top.focusPercent
    scale = 1 + (m.top.focusPercent * 0.1)
    scalex = 1 + (m.top.focusPercent * 0.03)
    scaley = 1 + (m.top.focusPercent * 0.1)
    m.itemPoster.scale = [scalex, scaley]
    if m.top.focusPercent < 0.05 then
        m.itemPoster.opacity = 0.8
    end if
    if m.top.focusPercent > 0.95 then
        m.itemPoster.opacity = 1.0
    end if
end sub

sub showunfocus()
    m.itemPoster.scale = [1, 1]
end sub 

function onKeyEvent(key as String, press as Boolean) as Boolean  
    if press then
        print "row list item ... key " + key + " pressed: "
    end if    
end function