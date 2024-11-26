sub init()
    'm.itemRectangle = m.top.findNode("itemRectangle")
    'm.itemRectangle.opacity = 0.75
    'm.itemRectangle.color = "#659286"
    'm.itemRectangle.translation = [ 0, 0 ]
    'm.itemRectangle.scale = [ 1, 1 ]
    'm.itemRectangle.rotation = 0
    'm.itemRectangle.scaleRotateCenter = [ 0, 0 ]

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
    print "item rectangle has parent and m.top as row list item"
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
    'm.itemRectangle.scale = [1, scale]
    'm.itemRectangle.color = "#3a534c"
    m.itemPoster.scale = [scalex, scaley]
    if m.top.focusPercent < 0.05 then
        'm.itemRectangle.opacity = 0.3
        m.itemPoster.opacity = 0.8
        'm.itemRectangle.color = "#659286"
    end if
    if m.top.focusPercent > 0.95 then
        'm.itemRectangle.opacity = 1.0
        m.itemPoster.opacity = 1.0
        'm.itemRectangle.color = "##486860"
    end if
end sub

sub showunfocus()
    'm.itemRectangle.scale = [1, 1]
    m.itemPoster.scale = [1, 1]
    'm.itemRectangle.opacity = 0.75
    'm.itemRectangle.color = "#659286"
end sub 

function onKeyEvent(key as String, press as Boolean) as Boolean  

    if press then
        print "row list item ... key " + key + " pressed: "
    end if

    'print "item rectangle: "
    'print m.itemRectangle 
    
end function