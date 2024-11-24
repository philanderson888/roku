sub init()
    date = CreateObject("roDateTime")
    print "The date is now "; date.AsDateString("long-date")
    print "initializing background component .. "
    'm.top.backgroundURI = "pkg:/images/rsgetbg.jpg"
    m.myLabel = m.top.findNode("myLabel")
    m.myLabel.font.size=92
    m.myLabel.color="0x72D7EEFF"
end sub