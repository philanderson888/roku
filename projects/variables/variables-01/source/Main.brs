sub Main()
    print "debugging showChannelSGScreen"
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    print (m.port)
    ?type(2)  '   Integer  
    ?type(2.0) '     Float  
    ?type("hello")  '     String  
    ?type(CreateObject("roList"))  '     roList  
    ?type(3)    '  Integer  
    b!=1  
    ? "Type of 'b!' is " + type(b!)   ' Float  
    c$="hello"  
    ? "Type of c$ " + c$ + " is always " + type(c$)  ' String
    d="hello again"  
    ?type(d)  '    String  
    d=d+d  
    ?type(d)  '    String  
    ?type(d, 3)  '    roString  
    d=1  
    ?type(d)  '    Integer  
    d=1.0  
    Print "type of '1.0' is " + type(d)  '    Float
    Print 5 "th"
    Print "5".toint()+5    ' prints 10
    print type("5".toint()) ' Integer
    print type("5".tofloat()) ' Float
    print "5".tofloat() ' 5.0
    print "5".toint() ' 5
    
    print "5".tostr() ' 5
    print type("5".tostr()) ' String

    print 5.tostr() ' 5

    print (-5).tostr() ' -5
    print (1+2).tostr() ' 3

    print "i=-55"
    i=-55
    
    print "i.tostr() is ... "
    print i.tostr()

    print "i.tostr() <> -55 is ... "
    print i.toStr() <> "-55"

    print "100%.tostr() is ... "
    print 100%.tostr()

    print "100%.tostr() <> 100 is ... "
    print 100%.tostr() <> "100"

    print "-100%.tostr() is ... "
    print (-100%).tostr()

    print "-100%.tostr() <> -100 is ... "
    print (-100%).tostr() <> "-100"
   
    print "y% = 10"
    y% = 10

    print "y%.tostr() is ... "
    print y%.tostr()

    print "y%.tostr() <> 10 is ... "
    print y%.tostr() <> "10"

    print "5.tostr() is ... "
    print "5".tostr() 

    print "5.toInt() is ... "
    print "5".toint() 

    print "5.toFloat() is ... "
    print "5".tofloat()

    print type("5.tofloat()")
    print type("5".tofloat())

    print "fs = -1.1"
    fs="-1.1"

    print "fs.tofloat() is ... "
    print fs.tofloat()

    print "fs.toint() is ... "
    print fs.toint()

    print "fs.tofloat() <> -1.1 ... "
    print fs.tofloat() <> -1.1

    print "fs.toint() <> -1 ... "
    print fs.toint() <> -1

    print "01234567 .left(3) is ... "
    print "01234567".left(3)

    print "01234567 .right(4) is ... "
    print "01234567".right(4)

    print "01234567 .mid(3) is ... "
    print "01234567".mid(3)

    print "01234567 .mid(3,1) is ... "
    print "01234567".mid(3,1)

    print "01234567 .instr(56) is ... "
    print "01234567".instr("56")

    print "01234567 .instr(6,56) is ... "
    print "01234567".instr(6,"56")

    print "01234567 .instr(0,0) is ... "
    print "01234567".instr(0,"0")

    Print "quotes are escaped using quotes ie " + """" + "some value" + """"

    Print "exponent 2^3 is " + (2^3).tostr()

    print "create an array and push items to it"
    array01 = [1,2,3]
    for each item in array01
        Print item
    end for
    array01.push(4)
    for each item in array01
        sleep(30)
        Print item
    end for



    object01 = CreateObject("roAssociativeArray")
    object01.field="some value"
    Print "object declared with roAssociativeArray is """ + object01.field + """"
    object02 = { field: "value" }
    Print "object declared with {field:'value'} is also """ + object02.field + """"
    object02["field"] = "new value"
    Print "updated object field using [""field""]=""" + object02.field + """"
    object01.AddReplace("field","still even newer value")
    Print "also can use AddReplace(field,value) method so now field = """ + object02.field + """"
    object03 = { field01:"value01",field02:"value02"}
    for each key in object03 
        print " " key " = " object03[key]
    end for

    ' create a custom object using 'associative array
    Print "Creating a custom object"
    obj = ConstructMyObject()
    obj.Set("hi!")
    print obj.Get()
    print "--------"
    print obj


    ' read 'photos' xml file
    Print "reading xml file (failing for now)"
    rsp=CreateObject("roXMLElement")
    rsp.Parse(ReadAsciiFile("pkg:/example.xml"))
    Print "photos root element" rsp.photos
    Print "photo element " rsp.photos.photo
    Print "one photo element" rsp.photos.photo[0]
    Print "Print xml attribute value eg rsp.photos@perpage = " rsp.photos.perpage '100
    'Print "photo 0 id is " rsp.photos.photo[0].id
    
    
    print "reading booklist xml file (failing for now)"
    rsp2=CreateObject("roXMLElement")
    rsp2.Parse(ReadAsciiFile("pkg:/booklist.xml"))
    Print "get xml booklist " rsp2.booklist
    Print "get xml booklist book" rsp2.booklist.book
    Print "get xml booklist book" rsp2.booklist.book.lang

    
    screen.setMessagePort(m.port)
    scene = screen.CreateScene("HelloWorld")
    screen.show()
    while(true)
        msg = wait(0, m.port)
        msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        end if
    end while
end sub

function ConstructMyObject()
    obj = {
        Set       : function(x) : m.Value = x : end function
        Get       : function() : return m.Value : end function
        Value     : 0
    }
    return obj
end function
