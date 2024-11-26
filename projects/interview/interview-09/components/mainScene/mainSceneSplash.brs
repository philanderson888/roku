sub runSplashScreen()
    m.splashTimer = createObject("roSGNode", "Timer")
    m.splashTimer.repeat = false
    m.splashTimer.duration = 2.5
    m.splashTimer.ObserveField("fire", "onSplashTimerFired")
    m.top.appendChild(m.splashTimer)
    m.splashTimer.control = "start"
end sub

sub onSplashTimerFired()
    m.top.backgroundUri = "pkg:/images/minno-background4.png"
    m.top.backgroundColor = "0x79C9BEFF"
    print "can remove splash screen now and show main scene"
    setRowListVisible()
    m.top.removeChild(m.splashTimer)
    m.splashTimer = invalid
end sub 
