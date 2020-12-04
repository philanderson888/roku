# Control Nodes

## Contents

- [Control Nodes](#control-nodes)
  - [Contents](#contents)
  - [Introduction](#introduction)
  - [control nodes](#control-nodes-1)
  - [Content Node](#content-node)
  - [Task](#task)
  - [MaskGroup](#maskgroup)
  - [Timer](#timer)
  - [ComponentLibrary](#componentlibrary)
  - [ChannelStore](#channelstore)

## Introduction

## control nodes

- content node
- task
- MaskGroup
- Timer
- ComponentLibrary
- ChannelStore


## Content Node

Already covered in [scenegraph](scenegraph.md) document

## Task

runs background thread

useful for functions which can't be run on the component, the full list of which is here https://developer.roku.com/en-gb/docs/developer-program/core-concepts/scenegraph-brightscript/brightscript-support.md

useful to read data from server to create a `ContentNode` node which configures a component

so can think of as a content reader

- new Task node for each async operation
- reuse Task over and over
- observe input fields and returns output like a server

## MaskGroup

extends group

applies `alpha mask bitmap` to children eg fade out or partially cover an image or make it appear partially faded

OpenGL has to be supported

## Timer

- control start/stop
- repeat
- duration seconds
- fire   triggers callback 

```xml
<?xml version="1.0" encoding="utf-8" ?>

<!--********** Copyright 2015 Roku Corp.  All Rights Reserved. **********-->

<component   name="timertest"   extends="Group" >

<script type="text/brightscript" >
<![CDATA[

sub init()
  m.testtimer = m.top.findNode("testTimer")
  m.testtimer.control = "start"
  m.defaulttext = "Wait for it, wait for it..."
  m.alternatetext = "Timer fired!!!"

  m.testtimerlabel = m.top.FindNode("testTimerLabel")
  m.testtimerlabel.text = m.defaulttext
  m.textchange = false
  m.testtimer.ObserveField("fire","changetext")
  m.top.setFocus(true)
end sub

sub changetext()
  if (m.textchange = false) then
    m.testtimerlabel.text = m.alternatetext
    m.textchange = true
   else
     m.testtimerlabel.text = m.defaulttext
     m.textchange = false
   end if
end sub

]]>
</script>

<children>

<Label
  id="testTimerLabel"
  width = "1280"
  translation = "[0,500]"
  horizAlign = "center"
  vertAlign = "center"
/>

<Timer
  id="testTimer"
  repeat="true"
  duration="5"
/>

</children>

</component>
```

## ComponentLibrary

dowloads custom scenegraph components

usually download from brightscript then start the application once the download has finished

must have separate manifest

Example at https://developer.roku.com/en-gb/docs/references/scenegraph/control-nodes/componentlibrary.md

## ChannelStore

creates `roChannelStore` component to connect to the store and can be used to purchase items etc



