sub Main()
    print "hello world 02"
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    print (m.port)
    screen.setMessagePort(m.port)
    screen.CreateScene("MainScene")
    screen.show()
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub
