sub init()
    example = m.top.findNode("exampleCheckList")

    example.checkedState = [ true, false, true, false ]

    examplerect = m.top.boundingRect()
    centerx = (1280 - examplerect.width) / 2
    centery = (720 - examplerect.height) / 2
    m.top.translation = [ centerx, centery ]
end sub

sub onKeyEvent(key as String, press as Boolean) as Boolean
    print key " key pressed"
end sub
