sub init()
    m.top.backgroundURI = "pkg:/images/rsgde_bg_hd.jpg"
    example = m.top.findNode("exampleButtonGroup")
    example.buttons = [ "OK", "Cancel", "Help", "Extra Button", "Phils Super Button"]
    examplerect = example.boundingRect()
    centerx = (1280 - examplerect.width) / 2
    centery = (720 - examplerect.height) / 2
    example.translation = [ centerx, centery ]
    m.top.setFocus(true)
end sub
