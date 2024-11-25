sub runSplashScreen()
    m.splashTimer = createObject("roSGNode", "Timer")
    m.splashTimer.repeat = false
    m.splashTimer.duration = 3
    m.splashTimer.ObserveField("fire", "onSplashTimerFired")
    m.top.appendChild(m.splashTimer)
    m.splashTimer.control = "start"
end sub

sub onSplashTimerFired()
    m.top.backgroundUri = "pkg:/images/minno-background4.png"
    m.top.backgroundColor = "0x79C9BEFF"
    print "can remove splash screen now and show main scene"
    m.mainRowList.visible = true
    m.mainRowlist.setFocus(true)

    print "main row list added"
    print "main row list: "
    print m.mainRowlist
    print m.mainRowList.itemSize

    m.top.removeChild(m.splashTimer)
    m.splashTimer = invalid
end sub 
