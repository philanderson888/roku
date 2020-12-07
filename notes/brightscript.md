# Brightscript

## Contents

- [Brightscript](#brightscript)
  - [Contents](#contents)
  - [Reference](#reference)
  - [Overview](#overview)
  - [Coding Guidelines](#coding-guidelines)
  - [Developer Mode](#developer-mode)
  - [Run With VSCode](#run-with-vscode)
  - [Debug Console](#debug-console)
  - [HelloWorld](#helloworld)
  - [Scope](#scope)
  - [Syntax](#syntax)
  - [Types](#types)
  - [Literals](#literals)
  - [Array](#array)
  - [object](#object)
  - [conditionals](#conditionals)
  - [operators](#operators)
  - [function](#function)
  - [init function](#init-function)
  - [events](#events)
  - [onKeyEvent](#onkeyevent)


## Reference

- Docs https://developer.roku.com/en-gb/overview

- Reference Docs https://developer.roku.com/en-gb/docs/references/references-overview.md 

- Course https://developer.roku.com/en-gb/videos/courses/rsg/overview.md

- Demos https://go.roku.com/dev-site-demos

- Developers channel https://go.roku.com/roku-dev-channel

- YouTube https://go.roku.com/roku-dev-youtube

- Roku on GitHub https://github.com/rokucommunity/vscode-brightscript-language

- Developer Forums
  
- Knowledge Center




## Overview

- written in C
- Interprets straight into bytecode at runtime
- Objects are associative arrays which have key/value pairs
- Interfaces
- Integers are default number
- dynamic types are OK
- static types are also OK
  

## Coding Guidelines

- 4 spaces = 1 tab
- ' 
- camelCase
- CONSTANTS_LIKE_THIS
- m.CONSTANTS
- ClassLikeStructures
- array = []
- assocArray = {}
- and, then, etc
- Object, String etc
- sub()  = void function
- function DoThis as Object   has return type
- do not abbreviate
- use early return
- log.brs
    - m.logger = getLogging("fileName")
    - m.logger.info("Log this","DEBUG")
- comments
    - fileName:function - extra info
- onKeyEvent listener - keep all the logic for this in one place,rather than on grid components
- message loops in preference to tasks !?!?!?!
- ' # TODO


## Developer Mode

Developer mode Home 3 Up 2 RLRLR

## Run With VSCode

Using `VSCode` we can run our app

1. Control-Shift-F5 restarts any running app
2. Control-F5 runs the app
3. F5 continues past the first line and shows the app on the screen

or

1. Control-Shift-F5
2. F5 
3. F5

launch.json

```json
{
    // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
    "version": "0.2.0",
    "configurations":[ 
        {
            "type": "brightscript",
            "request": "launch",
            "name": "BrightScript Debug: Launch",
            "stopOnEntry": true,
            "host": "192.168.87.249",
            "password": "rokudev",
            "rootDir": "${workspaceFolder}/brightscript/hello-world-04",
            "enableDebuggerAutoRecovery": false,
            "stopDebuggerOnAppExit": false
        }
    ]   
}
```

## Debug Console

```powershell
telnet 1.2.3.4 8085
```


## HelloWorld

https://developer.roku.com/en-gb/docs/developer-program/core-concepts/developing-scenegraph-applications.md

- \components
- \images
- \source
- Makefile
- manifest

MainScene.xml

```vb 
<script type="text/brightscript" uri="...brs" />
<children>
  <Overhang id="overhand" showOptions="false" showClock="false" logoUrl="..." 
    translation="[0,60]" />
  <Label id=".." text="..loading" width.. height..  translation="[0,0]" 
    horizAlign="center" vertAlign="center" visible="false" font="font:.." />
```

MainScene.brs

    GridScreen/
    DetailsScreen/

source

  main.brs

    holds main programming for the scene
    main()

images

manifest

  title
  major_version
  minor_version
  build_version
  mm_icon_focus_hd
  splash_screen_hd
  ui_resolutions=hd
  
  Scene = container
    poster = image
    label = text

  Fonts/

  Certificates/

  MakeFile

source\main.brs 

```vb
sub Main()
  ShowChannelRSGScreen()
end sub

sub ShowChannelRSGScreen()
  ' canvas '
  screen=CreateObject("roSGScreen")
  ' events sent to a port '
  m.port = 
  ' get XML '
  scene = scree.CreateScene("MainScene")
  screen.Show()

  ' event loop
  while(true)
      ' wait 0 seconds
      msg=wait(0,m.port)
      ' type of object which generated the event
      msgType=type(msg)
      if(msgType="roSGScreenEvent)
        if msg.IsScreenClosed() then return
      end if 
  end while
end sub
```

components\MainScene.brs

```vb
' initialize
sub Init()
  ' background '
  m.top.backgroundColor = "0x..."
  m.top.backgroundUri=""
  m.loadingIndicator=m.top.FindNode("loadingIndicator") 
  InitScreenStack()
  ShowGridScreen()
  ' get content
  RunContentTask()
end sub
```

now creates components\UILogic folder and init











## Scope

x is local scope only
m.x is component scope valid in the whole component

```vb
sub doThis()
  x=1
  m.x=100
```

## Syntax

: can separate multiple commands on one line

Optional Type Suffix

```vb
a_string$
// int
10%
// float
2.34!
// double
2.45678900#
```


## Types

- Boolean
- Int 32
- LongInteger 64
- Float 32
- Double 64
- String 
- Object
  - roArray
  - roAssociativeArray
  - roList
  - roVideoPlayer
- Function has return type
- Sub has void return
- Interface
- Interface with 'dot operator' must be static
- Invalid = 'invalid'
- dynamically assigned
  - 1 = integer
  - 2.0 = float
  - "hi"   = string
  - if reallocated then type can change unless has type character suffix

other types

- uri
- color
- font

SceneGraph Types

- assocarray
- Node
- TargetSet
- Time
- ContentNode - specifies content ie data to fill a node
- vector2d

## Literals

```vb
'  "" is an escaped quotation mark
"" 
```
Hex

```vb
' is Hex for 255
&HFF
```

Float
```vb
1.23E10
```

Double

```vb
1.23D-12
```

Long 64

```vb
123&
```

LINE_NUM  





## Array

```vb
myArray = []
myArray = [1,2,3]
myArray = [
  1
  2
  3
]
myArray = [
  1,
  2,
  3
]
```

```vb
function Main() as Void 
    dim cavemen[10] 
    cavemen.push("fred")
    cavemen.push("barney")
    cavemen.push("wilma")
    cavemen.push("betty") 
    for each caveman in cavemen
        print caveman
    end for 
end function
```

## object

```vb
myObj = {}
myObj = {
  key:"value",
  key2:"value2",
  key3:function01
}
```

## conditionals

```vb
<?xml version="1.0" encoding="utf-8" ?>
<component name="Rectangle01" extends="Scene"> 
	<children>
    <Overhang translation="[60,60]" color="0x232323ff"  backgroundUri="https://www.paperstreet.com/blog/wp-content/uploads/2016/04/iStock_000080733521_Double-768x513.jpg" title="Overhang Title" titleColor="0x1659de" showOptions="true" optionsText="some options" optionsAvailable="true"  /> 
    <Label id="Label1"  text="1" width="800"  height="100"  horizAlign="center" vertAlign="center" translation="[100,200]" />
    <Label id="Label2"  text="2" width="800"  height="100"  horizAlign="center" vertAlign="center" translation="[200,300]" />
    <Label id="Label3"  text="3" width="800"  height="100"  horizAlign="center" vertAlign="center" translation="[300,400]" />
	</children>
<script type="text/brightscript" >
<![CDATA[
  function init()
    m.top.setFocus(true)
    m.myLabel = m.top.findNode("Label1")
    m.myLabel.font.size=20
    m.myLabel.color="0xCCCCCC"
  end function
  function onKeyEvent(key as String, press as Boolean) as Boolean
    m.Label1 = m.top.findNode("Label1")
    m.Label2 = m.top.findNode("Label2")
    m.Label3 = m.top.findNode("Label3")
    if (key = "up") then 
      m.Label1.visible = true
      m.Label2.visible = false
      m.Label3.visible = false
      m.Label1.text = m.Label1.text + " and more"
      Print "you clicked up"
    elseif (key = "down") then 
        m.Label1.visible = false
        m.Label2.visible = true
        m.Label3.visible = false
        m.Label2.text = m.Label2.text + " and more"
        Print "you clicked down"
    elseif (key = "right") then 
        m.Label1.visible = false
        m.Label2.visible = false
        m.Label3.visible = true
        m.Label3.text = m.Label3.text + " and more"
        Print "you clicked right"
    end if
    return true
  end function
]]>
</script>
</component>
```
## operators

```vb
' MOD
MOD
```

## function

```vb
function five() as Integer
  return 5
end function
print five()
```


## init function

here is a `task` init function to read data asynchronously

```vb
<?xml version = "1.0" encoding = "utf-8" ?>
<component name = "ContentReader" extends = "Task" >
  <interface>
    <field id = "contenturi" type = "uri" />
    <field id = "content" type = "node" />
  </interface>
  <script type = "text/brightscript" >
    <![CDATA[
    sub init()
      m.top.functionName = "getcontent"
    end sub
    sub getcontent()
      content = createObject("roSGNode", "ContentNode")
      contentxml = createObject("roXMLElement")
      readInternet = createObject("roUrlTransfer")
      readInternet.setUrl(m.top.contenturi)
      contentxml.parse(readInternet.GetToString())
      if contentxml.getName()="Content"
        for each item in contentxml.GetNamedElements("item")
          itemcontent = content.createChild("ContentNode")
          itemcontent.setFields(item.getAttributes())
        end for
      end if
      m.top.content = content
    end sub
    ]]>
  </script>
</component>
```





## events

## onKeyEvent

press is true on key press down and false on key release up 

```vb
function onKeyEvent(key as String, press as Boolean) as Boolean

end function
```
