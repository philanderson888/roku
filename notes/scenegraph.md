# scenegraph

## Contents

- [scenegraph](#scenegraph)
  - [Contents](#contents)
  - [introduction](#introduction)
  - [reference](#reference)
  - [manifest](#manifest)
  - [resolution](#resolution)
  - [components](#components)
  - [initial focus](#initial-focus)
  - [display components](#display-components)
  - [abstract nodes](#abstract-nodes)
  - [Node](#node)
  - [Scene](#scene)
  - [AnimationBase](#animationbase)
  - [ArrayGrid](#arraygrid)
  - [renderable nodes](#renderable-nodes)
  - [label](#label)
  - [poster](#poster)
  - [rectangle](#rectangle)
  - [SimpleLabel](#simplelabel)
  - [overhang](#overhang)
  - [lists and grids](#lists-and-grids)
  - [panelset](#panelset)
  - [interface](#interface)
  - [animation nodes](#animation-nodes)
  - [simple animation](#simple-animation)
  - [sequential animation](#sequential-animation)
  - [parallel animation](#parallel-animation)
  - [color field](#color-field)
  - [float field](#float-field)
  - [vector 2d field](#vector-2d-field)
  - [typographic nodes](#typographic-nodes)
  - [font](#font)
  - [scrolling label](#scrolling-label)
  - [ScrollableText](#scrollabletext)
  - [control nodes](#control-nodes)
  - [ContentNode](#contentnode)
  - [content metada](#content-metada)
  - [Exposing Fields Using Interfaces](#exposing-fields-using-interfaces)
  - [layout / group nodes](#layout--group-nodes)
  - [group](#group)
  - [layout group](#layout-group)
  - [button group](#button-group)
  - [target group](#target-group)
  - [widgets](#widgets)
  - [Button](#button)
  - [TextEditBox](#texteditbox)
  - [PinPad](#pinpad)
  - [Keyboard](#keyboard)
  - [MiniKeyboard](#minikeyboard)
  - [BusySpinner](#busyspinner)
  - [ParentalControlPinPad](#parentalcontrolpinpad)
  - [Lists And Grids](#lists-and-grids-1)
  - [content feed](#content-feed)
  - [channel](#channel)
  - [node types](#node-types)
  - [identifying a node](#identifying-a-node)
  - [group](#group-1)
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
  - [Components](#components-1)
  - [Scenegraph](#scenegraph-1)
  - [methods](#methods-1)
  - [focus](#focus)
  - [threading](#threading)
  - [RowList](#rowlist)

## introduction

`SceneGraph` is the XML component of pages

scene graph provides a collection of nodes in a hierarchical fashion 

- leaf node (no children)
- group node (one or more children)
  
## reference

https://developer.roku.com/en-gb/docs/references/scenegraph/xml-elements/component.md

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




## resolution

resolution assumes the following but automatically scales for hardware not supporting these resolutions

- FHD 1920x1080
- HD 1280x720
- SD 720X480
  
items are automatically scaled depending on the supported resoultions

## components

```xml
<component name="MyComponent" extends="scene/group" initialFocus="node-to-get-initial-focus">
  <interface>
    <field id="" type="" />
  </interface>
  <children></children>
  <script></script>
</component>
```

a component is called from the main component with `<MyComponent />`

root component extends `scene` 

other components extend `group` (default)

component types

- list
- vector array
- associative array
- object

https://developer.roku.com/en-gb/docs/references/scenegraph/xml-elements/component.md

## initial focus

when rendering the `scene` component ie the main component we can also add in the `initialFocus` attribute to set the item which has the initial focus!!!

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

## abstract nodes

these are root abstract nodes, from which other nodes are derived

- Node
- Scene
- AnimationBase
- ArrayGrid

## Node

`Node` is the abstract root of all nodes.

In brightscript it is called `roSGNode`

- id
- focusedChild
- focusable
- change
  - none
  - insert (child at 0)
  - add (child at end)
  - remove
  - set (replace child node)
  - clear (remove all children)
  - move (child from index a to b)

## Scene

Scene is root of `SceneGraph` node tree.  Just have one per application.

Every `roSGScreen` object must have a scene at root and it must be created using

```vb
screen=CreateObject("roSGScreen")
scene=screen.CreateScene("Scene")
```

- backgroundURI
- backgroundColor
- backExitScene

## AnimationBase 

extends `Node`

- moving
- fade in/out
- change colour

animation state can be

- control
  - start/stop/pause/resume/finish
- state
  - running/paused/stopped
- repeat
- delay

## ArrayGrid

extends `Group`

provides `list` and `grid` functionality

- content
- itemSize [x,y]
- itemSpacing [x,y] between items
- numRows/Columns
- focusRow/Column

## renderable nodes

- Label
- Poster
- Rectangle
- SimpleLabel

## label

renders text

- horizAlign
- vertAlign
- wrap
- width/height
- color
- font
- numLines
- maxLines
- lineSpacing

https://developer.roku.com/en-gb/docs/references/scenegraph/renderable-nodes/label.md 

```vb
<?xml version="1.0" encoding="utf-8" ?>

<!--********** Copyright 2015 Roku Corp.  All Rights Reserved. **********-->

<component name="labeltest" extends="Group" >

<script type="text/brightscript" >
<![CDATA[

  sub init()
    m.top.setFocus(true)
  end sub

]]>
</script>

<Label
  id="testLabel"
  height="44"
  width="0"
  font="font:MediumBoldSystemFont"
  text = "Application Development Made Easy!"
  horizAlign = "left"
  vertAlign = "center"
  translation="[318,8]" />

</component>
```

## poster


- extends group
- draws an image
- can have children eg label

- uri of image
- width/height
- loadSync    default is false ie images load asynchronously


```vb
<?xml version="1.0" encoding="utf-8" ?>
<!--********** Copyright 2015 Roku Corp.  All Rights Reserved. **********-->
<component name="postertest" extends="Group" >
<script type="text/brightscript" >
<![CDATA[
sub init()
  m.top.setFocus(true)
end sub
]]>
</script>
<Poster
  id="testPoster"
  uri="pkg:/images/rokuowds.png"
  width="0.0"
  height="0.0"
  translation="[160,8]" />
</component>
```

## rectangle

- extends group
- can have children

- width/height
- color

```vb
<?xml version="1.0" encoding="utf-8" ?>

<!--********** Copyright 2015 Roku Corp.  All Rights Reserved. **********-->

<component name="rectangleexample" extends="Group" >

<script type="text/brightscript" >
<![CDATA[

sub init()
  m.top.setFocus(true)
end sub

]]>
</script>

<children>

<Rectangle
  id="testRectangle"
  color="0x880088FF"
  width="1280"
  height="60"
  translation="[0,0]" />

</children>

</component>
```

## SimpleLabel

- more memory efficient than label
- single line of text

- vertOrigin aligns text top/bottom (of lowest symbol)/center/baseline(tails of eg y,g cut below this line)
- horizOrigin left/center/right
- text
- color
- fontUri
- fontSize

```vb
<?xml version="1.0" encoding="utf-8" ?>

<!--********** Copyright 2018 Roku Corp.  All Rights Reserved. **********-->

<component name="simpleLabeltest" extends="Group" >

<script type="text/brightscript" >
<![CDATA[

  sub init()
    m.top.setFocus(true)
  end sub

]]>
</script>

<SimpleLabel
  id="testLabel"
  font="fontUri:MediumBoldSystemFont"
  text = "Application Development Made Easy!"
  horizOrigin = "left"
  vertOrigin = "baseline"
  translation="[640,360]" />

</component>
```



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

## animation nodes

inherit from `AnimationBase`

- animation
- sequential
- parallel
- floatfield
  - fade in/out
  - rotate
- vector2d  
  - move
  - enlarge/shrink
- colorfield
  - change colour

fields
- duration
- easeFunction


## simple animation

```vb
function init()
   scaleAnimation = m.top.FindNode("scaleAnimation")
   transAnimation = m.top.FindNode("transAnimation")
   scaleAnimation.control = "start"
   transAnimation.control = "start"
end function
```

```xml
<?xml version="1.0" encoding="utf-8" ?>
<component name="SimpleScaleAnimation" extends="Group" >
<script type="text/brightscript" uri="pkg:/xml/SimpleAnimation.brs" />

<children>

<Poster id="myPoster"
    opacity="1.0"
    uri="pkg:/images/myImage.jpg" />
<Animation id="scaleAnimation"
       duration="1"
       repeat="true"
       easeFunction="linear" >
    <Vector2DFieldInterpolator id = "myInterp"
    key="[0.0, 0.25, 0.5, 0.75, 1.0]"
    keyValue="[ [0.0, 0.0], [0.25, 0.25], [0.5, 0.5], [0.75, 0.75], [1.0, 1.0]]"
    fieldToInterp="myPoster.scale" />
</Animation>
<Animation id="transAnimation"
       duration="1"
       repeat="true"
       easeFunction="linear" >
    <Vector2DFieldInterpolator id = "myInterp2"
        key="[0.0, 1.0]"
        keyValue="[ [640.0, 320.0], [100.0, 100.0] ]"
    fieldToInterp="myPoster.translation" />
</Animation>

</children>

</component>
```

## sequential animation

a set of animations in order

```xml
<?xml version="1.0" encoding="utf-8" ?>

<!--********** Copyright 2015 Roku Corp.  All Rights Reserved. **********-->

<component name="animationsequentialtest" extends="Group" >
    <script type="text/brightscript" >
        <![CDATA[
            function init()
              m.testsequentialanimation = m.top.FindNode("testSequentialAnimation")
              m.testsequentialanimation.repeat = "true"
              m.testsequentialanimation.control = "start"
              m.top.setFocus(true)
            end function
         ]]>
    </script>

<children>

    <LayoutGroup   id = "dancingbars"  translation = "[640,360]"  itemSpacings = "[10]"  layoutDirection = "horizontal"  horizAlignment = "center"  vertAlignment = "center" >
        <Rectangle      id="R1"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[0, 0]"/>
        <Rectangle      id="R2"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[60, 0]"/>
        <Rectangle      id="R3"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[120, 0]"/>
        <Rectangle      id="R4"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[180, 0]"/>
        <Rectangle      id="R5"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[240, 0]"/>
    </LayoutGroup>
    <Label   text = "Bars Should Be Dancing"  width = "1280"  translation = "[0,500]"  horizAlign = "center"  vertAlign = "center"  />
    <SequentialAnimation   id = "testSequentialAnimation" >
    <Animation        id = "R1Animation"       duration = "2"       easeFunction = "linear" >
        <Vector2DFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ [1, 1], [1, 2], [1, 1] ]"    fieldToInterp="R1.scale" />        
        <FloatFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ 0.2, 1, 0.2 ]"    fieldToInterp="R1.opacity" />
    </Animation>
    <Animation        id = "R2Animation"       duration = "2"       easeFunction = "linear" >
         <Vector2DFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ [1, 1], [1, 2], [1, 1] ]"    fieldToInterp="R2.scale" />
         <FloatFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ 0.2, 1, 0.2 ]"    fieldToInterp="R2.opacity" />
    </Animation>
    <Animation        id = "R3Animation"       duration = "2"       easeFunction = "linear" >
        <Vector2DFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ [1, 1], [1, 2], [1, 1] ]"    fieldToInterp="R3.scale" />
        <FloatFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ 0.2, 1, 0.2 ]"    fieldToInterp="R3.opacity" />
    </Animation>
    <Animation        id = "R4Animation"       duration = "2"       easeFunction = "linear" >
        <Vector2DFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ [1, 1], [1, 2], [1, 1] ]"    fieldToInterp="R4.scale" />
        <FloatFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ 0.2, 1, 0.2 ]"    fieldToInterp="R4.opacity" />
    </Animation>
    <Animation       id = "R5Animation"      duration = "2"      easeFunction = "linear" >
        <Vector2DFieldInterpolator   key= "[0, 0.5, 1]"   keyValue= "[ [1, 1], [1, 2], [1, 1] ]"   fieldToInterp="R5.scale" />
        <FloatFieldInterpolator   key= "[0, 0.5, 1]"   keyValue= "[ 0.2, 1, 0.2 ]"   fieldToInterp="R5.opacity" />
    </Animation>
    </SequentialAnimation>

</children>

</component>
```

## parallel animation

animations which can occur at the same time

```xml
<?xml version="1.0" encoding="utf-8" ?>

<!--********** Copyright 2015 Roku Corp.  All Rights Reserved. **********-->

<component name="animationparalleltest" extends="Group" >
    <script type="text/brightscript" >
        <![CDATA[
            function init()
              m.testparallelanimation = m.top.FindNode("testParallelAnimation")
              m.testparallelanimation.repeat = "true"
              m.testparallelanimation.control = "start"
              m.top.setFocus(true)
            end function
        ]]>
    </script>

<children>

    <LayoutGroup   id = "dancingbars"  translation = "[640,360]"  itemSpacings = "[10]"  layoutDirection = "horizontal"  horizAlignment = "center"  vertAlignment = "center" >
      <Rectangle      id="R1"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[0, 0]"/>
      <Rectangle      id="R2"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[60, 0]"/>
      <Rectangle      id="R3"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[120, 0]"/>
      <Rectangle      id="R4"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[180, 0]"/>
      <Rectangle      id="R5"      color="0x00FF00FF"      opacity = ".2"     width = "50"      height = "100"      scaleRotateCenter = "[25, 50]"     translation = "[240, 0]"/>
    </LayoutGroup>
    <Label   text = "Bars Should Be Dancing"  width = "1280"  translation = "[0,500]"  horizAlign = "center"  vertAlign = "center"  />
    <ParallelAnimation   id = "testParallelAnimation" > <!--** ParallelAnimation   id = "testParallelAnimation"   repeat = "true" **-->
    <Animation id = "R1Animation" duration = "2" easeFunction = "linear" >
        <Vector2DFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ [1, 1], [1, 2], [1, 1] ]"    fieldToInterp="R1.scale" /> 
        <FloatFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ 0.2, 1, 0.2 ]"    fieldToInterp="R1.opacity" />
    </Animation>
     <Animation        id = "R2Animation"       duration = "2"       easeFunction = "linear" > 
         <Vector2DFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ [1, 1], [1, 2], [1, 1] ]"    fieldToInterp="R2.scale" />
             <FloatFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ 0.2, 1, 0.2 ]"    fieldToInterp="R2.opacity" />
     </Animation>
     <Animation        id = "R3Animation"       duration = "2"       easeFunction = "linear" > 
         <Vector2DFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ [1, 1], [1, 2], [1, 1] ]"    fieldToInterp="R3.scale" />
             <FloatFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ 0.2, 1, 0.2 ]"    fieldToInterp="R3.opacity" />
     </Animation>
     <Animation        id = "R4Animation"       duration = "2"       easeFunction = "linear" >
         <Vector2DFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ [1, 1], [1, 2], [1, 1] ]"    fieldToInterp="R4.scale" />
             <FloatFieldInterpolator    key= "[0, 0.5, 1]"    keyValue= "[ 0.2, 1, 0.2 ]"    fieldToInterp="R4.opacity" />
     </Animation>
     <Animation       id = "R5Animation"      duration = "2"      easeFunction = "linear" >
         <Vector2DFieldInterpolator   key= "[0, 0.5, 1]"   keyValue= "[ [1, 1], [1, 2], [1, 1] ]"   fieldToInterp="R5.scale" />
         <FloatFieldInterpolator   key= "[0, 0.5, 1]"   keyValue= "[ 0.2, 1, 0.2 ]"   fieldToInterp="R5.opacity" />
     </Animation>
    </ParallelAnimation>

</children>

</component>
```

## color field 

changes color

```xml
<?xml version="1.0" encoding="utf-8" ?>

<!--********** Copyright 2015 Roku Corp.  All Rights Reserved. **********-->

    <component name="animationcolortest" extends="Group" >

        <script type="text/brightscript" >
            <![CDATA[
                function init()
                   m.top.setFocus(true)
                end function
            ]]>
        </script>

<children>

    <Rectangle   id="testRectangle"   color="0x0000CCFF"   width="810"   height="44"   translation="[310,8]" />
    <Animation   id="testAnimation"  duration="10"  repeat="true"  control="start"  easeFunction="linear" >
        <ColorFieldInterpolator id = "testColor"   key="[0.0, 0.5, 1.0]"    keyValue="[ 0x0000CCFF, 0x00000FFF, 0x0000CCFF ]"       fieldToInterp="testRectangle.color"   />
    </Animation>


</children>

</component>
```

## float field

example - change opacity over 10 seconds

- fieldToInterp  target `id.field` and the target field type must be `float`
- reverse

```xml
<?xml version="1.0" encoding="utf-8" ?>

<!--********** Copyright 2015 Roku Corp.  All Rights Reserved. **********-->

    <component name="animationfloattest" extends="Group" >

        <script type="text/brightscript" >
            <![CDATA[
                function init()
                    m.top.setFocus(true)
                end function
            ]]>
        </script>

<children>

    <Poster  id="testPoster"  uri="pkg:/images/rokuowds.png"  width="0.0"  height="0.0"  translation="[160,8]"  opacity="0.0" />
    <Animation   id="testAnimation"  duration="10"  repeat="true"  control="start"  easeFunction="linear" >
        <FloatFieldInterpolator    id = "testFloat"   key="[0.0, 0.5, 1.0]"    keyValue="[ 1.0, 0.0, 1.0 ]"       fieldToInterp="testPoster.opacity"   />
    </Animation>

</children>

</component>
```

## vector 2d field

translate [x,y]


```xml
<?xml version="1.0" encoding="utf-8" ?>

<!--********** Copyright 2015 Roku Corp.  All Rights Reserved. **********-->

<component name="animationv2dtest" extends="Group" >

    <script type="text/brightscript" >
        <![CDATA[
            function init()
                m.top.setFocus(true)
            end function
        ]]>
    </script>

<children>

    <Label
        id="testLabel"
        height="44"
        width="0"
        font="font:MediumBoldSystemFont"
        text = "Application Development Made Easy!"
        horizAlign = "left"
        vertAlign = "center"
        translation="[318,8]" />

        <Animation
            id="testAnimation"
            duration="10"
            repeat="true"
            control="start"
            easeFunction="linear">
            <Vector2DFieldInterpolator
                id = "testVector2D"
                key="[0.0, 0.5, 1.0]"
                keyValue="[ [318.0, 8.0], [656.0, 8.0], [318.0, 8.0] ]"
                fieldToInterp="testLabel.translation"   />

        </Animation>
</children>

</component>
```

## typographic nodes

- font
- scrollingLabel
- ScrollableText

## font

```xml
<Label id="mySmallLabel"
    width="200" height="200"
    text="Can you read this?"
    font="font:SmallBoldSystemFont" />
```
or

```vb
m.mylargerlabel.font.size = m.mylargerlabel.font.size+5
```

## scrolling label

allows a string to scroll horizontally if the text does not fit into the required width

- text
- color
- font
- height/width
- maxWidth
- scrollSpeed

## ScrollableText

Scrolls text vertically which the user can read and scroll  through vertically

- text
- color
- font
- width/height

## control nodes

- content node
- task
- MaskGroup
- Timer
- ComponentLibrary
- ChannelStore

[control nodes](control-nodes.md)

## ContentNode

extends Node

used to specify data which can be used to configure a component.

lists and grids require this for configuration

hierarchy follows the xml hierarchy

- text for labels
- spacing

Create using

```xml
<ContentNode role= or id= >
  <ContentNode content_meta-data_attribute = "attribute" ... />
  ...
</ContentNode>
```

eg

```xml
<LabelList  id = "labellist" >
  <ContentNode  role = "content" >
    <ContentNode title = "Renderable Nodes" description = "Basic Nodes That Show Things" />
    <ContentNode title = "Z-Order/Parent-Child" description = "SceneGraph Tree Order Matters" />
    <ContentNode title = "Animations" description = "Moving Stuff Around and Flashing Lights" />
    <ContentNode title = "Events and Observers" description = "Reacting When Stuff Happens" />
  </ContentNode>
</LabelList>
```

or create in brightscript

```vb
ContentNode_object = createObject("RoSGNode","ContentNode")
ContentNode_child_object = ContentNode_object.createChild("ContentNode")
ContentNode_child_object.field_name = data
```

See example at https://developer.roku.com/en-gb/docs/references/scenegraph/control-nodes/contentnode.md

## content metada

all of the following are exposed on every component as metadata fields

- ContentType eg audio, movie, series, season, episode 
- Title
- TitleSeason
- Description
- ReleaseDate "1/1/2001"
- Rating eg 18 icon
- StarRating eg 80
- UserStarRating eg 80
- ShortDescription
- EpisodeNumber
- NumEpisodes
- Actors ["a","b"]
- Directors
- Director
- Categories ["comedy","drama"]
- Album
- Artist
- TextOverlay

## Exposing Fields Using Interfaces

to expose an interface field

```xml
<component  name = "listitemcontent" extends = "ContentNode" >

  <interface >
    <field id = "componentname" type = "string" />
  </interface>

</component>
```

access via

```vb
iteminfo.componentname
```

## layout / group nodes

- group
- buttongroup
- layoutgroup
- targetgroup

## group

extends `Node`

- base class of all renderable nodes
- coordinates relative to parent element
- 2d matrix M = C [x,y] S scale R rotation T [x,y] translation
- visible
- opacity
- translation [x,y]
- rotation
- scale
- clippingRect

## layout group

extends `Group`

provides a grid layout for child elements

- layoutDirection="horiz/vert"
- horizAlignment="left/right/center"
- vertAlignment="top/center/bottom/vert"

## button group

extends LayoutGroup

- min/maxWidth
- buttonHeight
- buttonSelected  index of selected button in group
- buttonFocused index of button with focus in group
- focusButton 
- buttons ["button1","button2"]

## target group

extends group

creates series of rectangular regions for children to occupy

often used to create a scrolling widget of items eg a row of items.  The item in focus is automatically adjusted so it appears on screen rather than scrolling off the screen

also need to render each item whether visible or not

- itemComponentName  contains group items. an instance of this group is created on demand for each visible item in the group
- content  defines content
- targetSet 
- defaultTargetSetFocusIndex  eg 0 for intial set
- wrap   false by default
- duration  when moving to next item
- currFocusItemIndex   index of item in focus
- itemSelected   index
- itemFocused  index
  
Examples https://developer.roku.com/en-gb/docs/references/scenegraph/layout-group-nodes/targetgroup.md 

## widgets

- button
- TextEditBox
- Pinpad
- Keyboard
- MiniKeyboard
- BusySpinner
- ParentalControlPinpad

## Button

typically in button group

- buttonSelected event on press
- label
- icon
- background

## TextEditBox

editable text eg username and password

- text
- hintText
- maxTextLength


## PinPad

extends group

enter number

- pin   numbers entered
- pinLength
- secureMode
- showPinDisplay  
- itemFocused   index of pin for initial focus

## Keyboard

## MiniKeyboard

## BusySpinner

Example here https://developer.roku.com/en-gb/docs/references/scenegraph/widget-nodes/busyspinner.md

## ParentalControlPinPad

## Lists And Grids

- LabelList  renders a text label
- MarkupList renders an xml component
- 


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

