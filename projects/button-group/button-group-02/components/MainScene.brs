sub init()
    example = m.top.findNode("exampleButtonGroup")
    example.buttons = [ "OK", "Cancel", "Help", "Extra Button", "Phils Super Button"]
    examplerect = example.boundingRect()
    centerx = (1280 - examplerect.width) / 2
    centery = (720 - examplerect.height) / 2
    example.translation = [ centerx, centery ]
    m.top.setFocus(true)
end sub

function onKeyEvent(key as String, press as Boolean) as Boolean
    m.posterLabel = m.top.findNode("posterLabel")
    m.posterLabel.font.color="0x000000"
    if (key = "up") then 
      m.posterLabel.text = "button group example - text size increased"
      m.posterLabel.font.size+=5
      Print "you clicked up"
    end if
    if (key = "down") then 
      m.posterLabel.text = "button group example - text size decreased"
      m.posterLabel.font.size-=5
      Print "you clicked down"
    end if
    return true
end function
