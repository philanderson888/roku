# components

## Contents

- [components](#components)
  - [Contents](#contents)
  - [manifest](#manifest)
  - [components](#components-1)
  - [display components](#display-components)
  - [overhang](#overhang)
  - [lists and grids](#lists-and-grids)
  - [panelset](#panelset)
  - [interface](#interface)
  - [content feed](#content-feed)
  - [channel](#channel)
  - [node types](#node-types)
  - [identifying a node](#identifying-a-node)
  - [group](#group)
  - [label](#label)
  - [content node](#content-node)
  - [events](#events)
    - [typical event loop](#typical-event-loop)
    - [event types](#event-types)
  - [OnKeyEvent()](#onkeyevent)
  - [m fields and methods](#m-fields-and-methods)
  - [fields](#fields)
  - [methods](#methods)
  - [layout](#layout)
  - [flow](#flow)
  - [xml to brightscript](#xml-to-brightscript)
  - [samples](#samples)
  - [iterate over videos](#iterate-over-videos)
  - [closing a screen](#closing-a-screen)
  - [show video screen](#show-video-screen)
  - [Channel](#channel-1)
  - [Display videos](#display-videos)
  - [Components](#components-2)
  - [Scenegraph](#scenegraph)
  - [methods](#methods-1)
  - [focus](#focus)
  - [threading](#threading)
  - [RowList](#rowlist)


## manifest

Channel root always contains a manifest

- name
- version
- channel icon
- splash screen image

```vb
# Channel
title=Title
subtitle=SubTitle
major_version=1
minor_version=1
build_version=1
# Assets
image1=pkg:/images/showthis.png
# splash
splash=pkg:/images/splash.png
# resolution
ui_resolutions=fhd
# screensaver
...
# extra
confirm_partner_button=1
```


https://developer.roku.com/en-gb/docs/developer-program/getting-started/architecture/channel-manifest.md


## components

one <component> element per file

inside this may have

- interface
- <script></script>
- <children></children>

eg

- list
- vector array
- associative array
- object

https://developer.roku.com/en-gb/docs/references/scenegraph/xml-elements/component.md

## display components

- grid
  - row
    - thumbnail = poster
      - focus
        - highlighted
        - name
        - duration
        - description- list 
- panel


## overhang

This sits at the top of the screen like a `jumbotron` main heading for the screen

## lists and grids

https://developer.roku.com/en-gb/docs/references/scenegraph/list-and-grid-nodes/overview.md

abstract base class `ArrayGrid`

List

- LabelList
- MarkupList
- RowList
- CheckList
- RadioButtonList
- TargetList
- TargetSet
- ZoomRowList
  
Grid

- PosterGrid
- MarkupGrid
- TimeGrid

Index defined by position in `ContentNode` starting at 0 etc

When a list or grid has focus, the items are automatically scrollable up or down from the keypad

```vb
itemFocused="true"
itemUnfocused="true" 
itemSelected="true" ' OK button
' watch for changes, include callback
m.episodeList.observeField("itemFocused","showExtraDetails") 
' play video
m.episodeList.observeField("itemSelected","playVideo")
' display episode info from selected item
episodeInfo = m.episodeList.content.getChild(m.episodeList.itemFocused)
```



## panelset

This is a container with children of panels and allows one to slide left and right.  

When in focus the user can use `left` and `right`


## interface

- encapsulates internal fields
- exposes public <field> elements
- allows instances to be created
- exposes functional fields <function> elements https://developer.roku.com/en-gb/docs/developer-program/core-concepts/handling-application-events.md#HandlingApplicationEvents-FunctionalFields

  

https://developer.roku.com/en-gb/docs/references/scenegraph/xml-elements/interface.md

## content feed

- typically contains hundreds or even thousands of content items
- id
- name
- description
- thumbnail
- url
- tags
- genre

## channel

- home page
- details page 

## node types

- Playback nodes
  - streamUrl
  - streamFormat
  - length
  
- Child Content Node
  - has the actual videos

## identifying a node

```vb
ifSGNodeDict findNode() 
```

## group

group is the base class of all `renderable` nodes
- visible
- opacity
- translation
- rotation
- scale
- 
## label

https://developer.roku.com/en-gb/docs/references/scenegraph/renderable-nodes/label.md 


## content node

grid (xml)

  root (xml created in brightscript)

    child (xml created in brightscript)

```vb
' root
root = createObject("RoSGNode","ContentNode")
' child
child = root.createChild("ContentNode")
child.title
child.description
child.streamUrl
child.streamFormat
' add content to SceneGraph
sgComponent.content = root
```

map each video in a series

all metadata for each movie is stored in a child content node 

```vb
' channel
row.title="My Channel"
for each movie in row
  child = root.createChild("ContentNode")
  child.title=movie.title
  ....
end for
```

content node metadata  maps to content feed fields

content node maps metadata in content feed to each of the SceneGraph components in your channel 

- non-renderable
- data node
- maps to data in your content feed


## events

https://developer.roku.com/en-gb/docs/developer-program/core-concepts/event-loops.md

event = message

when button is clicked an `event` or `message` is created

event loop

```vb
while true
    ' wait for an event
    ' process the event
end while
```

event message type is `roMessagePort`

### typical event loop

```vb
port = CreateObject("roMessagePort")
screen = CreateObject("roSpringboardScreen")
screen.SetMessagePort(port) ' instruct screen to send events to port
screen.Show()
while true
    msg = wait(0, port) ' wait for a message
    if type(msg) = "roSpringboardScreenEvent" then
        if msg.isScreenClosed() then
            return -1
        elseif msg.isButtonPressed()
            print "button pressed: ";msg.GetIndex()
        else
            ' ignore other unknown or uninteresting roSpringBoardScreenEvents
        endif
    else
        ' ignore other events, not type roSpringboardScreenEvent
    endif
end while
```

### event types

```vb
isListItemSelected() as Boolean
isScreenClosed() as Boolean
isListFocused() as Boolean
isListSelected() as Boolean
isListItemFocused() as Boolean
isButtonPressed() as Boolean
isPlaybackPosition() as Boolean
isRemoteKeyPressed() as Boolean
isRequestSucceeded() as Boolean
isRequestFailed() as Boolean
isRequestInterrupted() as Boolean
isStatusMessage() as Boolean
isPaused() as Boolean
isResumed() as Boolean
isCleared() as Boolean
isPartialResult() as Boolean
isFullResult() as Boolean
isAdSelected() as Boolean
isStorageDeviceAdded() as Boolean
isStorageDeviceRemoved() as Boolean
isStreamStarted() as Boolean
isListItemInfo() as Boolean
isButtonInfo() as Boolean
```


## OnKeyEvent() 

Triggered when a key is pressed from the remote control

```vb
function OnKeyEvent(key as String, press as Boolean) as Boolean
  result = false
  if press
    if key = "back"
      CloseScreen()
      result = true
    end if
  end if
  return result
```

https://developer.roku.com/en-gb/docs/references/scenegraph/component-functions/onkeyevent.md

## m fields and methods

```vb
m.top.backroundColor = "0xFFEEDD"
m.top.backgroundUri = "pkg:/images/picture.png"
m.loadingIndicator
' number of screens open
m.screenStack.Count()
```

## fields

```vb
' index of selected video in a row of videos
itemIndex
```

## methods

```vb
' number of child nodes
content.GetChildCount()
' select multiple videos
content.GetChildren(initialIndex,numberOfItems)
```

## layout

https://developer.roku.com/en-gb/docs/developer-program/core-concepts/controlling-screen-layout.md

- translation = x,y
- z-order 
- parent-child to group elements with `Group` and `LayoutGroup`
  

## flow

https://developer.roku.com/en-gb/docs/developer-program/core-concepts/controlling-screen-program-flow.md

- key press
- data arrival
- z-order
- parent-child
- creating and deleting elements
- hiding and showing elements
- focus/blur elements

## xml to brightscript

xml `PosterGrid` matches `roPosterScreen`

## samples

grid

https://github.com/rokudev/scenegraph-master-sample/tree/master/GridScreen

simple grid

https://github.com/rokudev/samples/blob/master/ux%20components/lists%20and%20grids/Simple_Grid_and_Video.zip 

grid with details and video

https://github.com/rokudev/samples/blob/master/ux%20components/lists%20and%20grids/Simple_Grid_with_Details_and_Video.zip


## iterate over videos

```vb
children=content.GetChildren(0,numberOfItems)
childrenClone = []
for each child in children
  childrenClone.Push(child.Clone(false))
```


 ## closing a screen

 ```vb
CloseScreen() 
 ```
   
## show video screen

```vb
sub ShowVideoScreen(content as Object, itemIndex as Integer)
  m.videoPlayer = CreateObject("RoSGNode","Video")
```

## Channel

- Grid Screen = Home Screen
- Details Screen = Series
- Episode Picker
- Adverts
- Subscriptions
- Deep link to content
    - curl -d http://<your roku IP address>:8060/launch/dev?contentID=13234&MediaType=season
- Content Feed
    - Descriptive node
        - Category
        - Title
        - Description
        - Thumbnail
        - ReleaseDate
    - Playback
        - url
        - videoType
        - duration
    - Content Nodes
        - Non renderable
        - data node
    - Playback node
        - streamurl
        - streamFormat
        - length
    - Child content node
        - has the actual videos

## Display videos

Root = screen
Child = movie

```vb
for each movie in row
  child = root...createChild
end for
```

## Components

    - renderable
        - containers
            - grid
                - row
                    - label
            - list
            - panel
        - rectangle
        - label
        - poster
        - button
        - dialog
        - keyboard
        - video content
        - audio content
    - non-renderable
        - timer
        - animation
        - content

## Scenegraph

- Main scene
    - Grid
        - Row
            - Label
    - Details
        - Layout group
    - Episodes
        - Episodes Item
    - overhang
    - showOptions
    - showClock
    - logoUrl
    - translation
- Manifest
    - major, minor, build


## methods

```vb
Init()
OnVisibleChanged()
OnItemFocused()
```

## focus

```vb
<?xml version="1.0" encoding="utf-8" ?> 
<component name="SimpleRowListScene" extends="Scene" >
  <script type="text/brightscript" >
    <![CDATA[
      function init()
          m.theRowList = m.top.FindNode("theRowList")
          m.theRowList.SetFocus(true)
      end function
    ]]>
  </script>
  <children>
      <SimpleRowList id="theRowList" translation="[50,50]" />
  </children>
</component>
```

## threading

- Main Thread runs main.brs which creates `scene` component and then starts `render` thread
  
- Render Thread renders all visual components

## RowList

This enables us to display a list of items but in a row format which is common when scrolling through videos - genres are vertical and similar videos are laid out horizontally to scroll through

