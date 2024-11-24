sub init()
    print "Centred Rectangle "
    di = CreateObject("roDeviceInfo")
    uiRes = di.GetUIResolution()
    m.rect2 = m.top.findNode("rect2")
    X = (uiRes.width - m.rect.width) / 4
    Y = (uiRes.height - m.rect.height) / 4
    m.rect2.translation = [X, Y]
    m.rect2.color = "0xa158ccFF"   
    print "Centered Rectangle 2 at "; X; Y
    SetColor2()
end sub

sub SetColor2()
    m.rect2.color = "0xc5c951FF"
end sub
