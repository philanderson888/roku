sub init()
    print "Centred Rectangle"
    di = CreateObject("roDeviceInfo")
    uiRes = di.GetUIResolution()
    m.rect = m.top.findNode("rect")
    centerX = (uiRes.width - m.rect.width) / 2
    centerY = (uiRes.height - m.rect.height) / 2
    m.rect.translation = [centerX, centerY]
    print "Centered Rectangle at "; centerX; centerY
    SetColor()
end sub

sub SetColor()
    m.rect.color = "0xa158ccFF"
end sub
