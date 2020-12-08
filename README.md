# roku

This is a repo for learning Brightscript and SceneGraph for creating Roku apps

## Brightscript

[Brightscript](brightscript.md)

## SceneGraph

[scenegraph](notes/scenegraph.md)


# glossary

- [roku](#roku)
  - [Brightscript](#brightscript)
  - [SceneGraph](#scenegraph)
- [glossary](#glossary)
  - [General Glossary](#general-glossary)
  - [deep linking](#deep-linking)
    - [reference](#reference)
    - [technical overview](#technical-overview)
    - [parameters](#parameters)
    - [handling](#handling)
    - [implement](#implement)
    - [test](#test)
    - [submit for certification](#submit-for-certification)
  - [resolution](#resolution)
  - [Video Glossary](#video-glossary)

## General Glossary

https://accedobroadband.jira.com/wiki/spaces/AP/pages/97190141/Terms+and+acronyms

- XDK
  - HTML/JS framework with MVC for UI
- TAL
    - Television Abstraction Layer by BBC
- POC proof of concept
- RAF Roku Ad Framework
  - Roku_Ads.brs
- OVP Online Video Playser
- roSGScreen   Roku SceneGraph Screen
- Channel
    - Content Feed is xml data
        - Parent 
            - Child has video details
                
- OS
    - 9.4
        - AirPlay2 support : ios device to play on Roku device
        - Homekit control via Home app and Siri
        - Apple Homekit https://www.apple.com/uk/shop/accessories/all-accessories/homekit
    - 9.1
        - guest mode
        - signal beacon is required to measure the time to fully render the home screen, from the moment the user requests it (20 seconds)
        - instant signup
            - mandatory for channels with > 10 million hours in 3 months.
- Channel Store https://channelstore.roku.com/en-gb/browse
- Search
    - Voice search
    - Instant Signup
    - Featured Free
    - Zone = row of related content
    - My Feed
- Content Engagement Program
    - Search
    - Instant signup
    - Featured free
    - Audience Development Program
        - Self serve roku home screen display ads
- Monetisation
    - Ad-supported channels
    - Subscription SVOD monthly
    - Transactional channel
        - Pay to install
        - In-app purchases
        - Roku gets 20%
- Developer Dashboard
- SceneGraph like the HTML
- Analytics
    - Metrics
        - Sumo Metrics
            - How long between button press and display item
    - Trends
    - Health
- Security
    - Apps are sandboxed
    - SSL
    - Each system is uniquely keyed at the factory
- Bandwidth Throttling
    - Charles
- Bitrate reporting
    - m.player.streamingSegment
    - m.player.streamInfo
- Publish - sideload then encrypt package
- SVOD Subscription Video On Demand
- TVOD Transactional Video On Demand pay per item
- PVOD Premium Video On Demand
- AVOD Advertising Video On Demand free with adverts
- OTT via browser
- MRSS Media RSS feed
- trick play indexes scenes
- BIF files
- DASH
- HLS

## deep linking

auto-launches relevant app when a url is clicked from an app outside the one you are trying to reach

public channels with video content must implement deeplinking to pass certification

- curl -d http://<your roku IP address>:8060/launch/dev?contentID=13234&MediaType=season


### reference

- video https://developer.roku.com/en-gb/videos/courses/rsg/deep-linking.md
- sample https://github.com/rokudev/deep-Linking-samples

### technical overview

on selected media, `contentId` and `mediaType` are passed to channel which identifies launch behaviour.  

```vb
if (args.mediaType <> invalid) and (args.contentId <> invalid)
    if args.mediaType="movie" then playVideo(contentItem)
    else if args.mediaType="episode" then playEpisodicVideo(contentItem)
    else if args.mediaType="season" then ShowEpisodePicker(contentItem)
    ' next in series, first or latest
    else if args.mediaType="series" then playSeriesVideo(contentItem) 
end if
```

### parameters

- movie > 15 min
  - contentId
- episode 
  - contentId
- season 
- series
  - smart bookmark
    - followed TV - item last reached
    - unwatched - first
    - daily/weekly - latest
- short form - standalone < 15 min eg trailer
  - contentId
- special eg concert
  - contentId
- live
  - contentId


### handling

- invalid links - return to home screen
- unauthenticated - must authenticate first then flow into deep request
- paywall
- profile (default to last one used but not a child profile)
- go straight into content with smart bookmark, don't show resume/start over screen
- don't deep link to another channel
  
### implement

- add `args as Dynamic` array to Main
- validate id and media type
- if movie/episode/short-form/series/special just play item
- if season show episode picker
- else error and show home page
- roInputEvent tests if deep link passed in while also in the app already, in which case don't reopen the app

### test

- http://devtools.web.roku.com/DeepLinkingTester/
  
or
 
- https://my.roku.com/account/add?channel=KX3UPK
 
curl commands

- http://<roku-device-ip-address>:8060/<EcpCommand>/<channelId>?contentId=<contentIdValue>&mediaType=<mediaTypeValue>

### submit for certification





## resolution

resolution assumes the following but automatically scales for hardware not supporting these resolutions

- FHD 1920x1080
- HD 1280x720
- SD 720X480
  
items are automatically scaled depending on the supported resoultions

## Video Glossary

- HRD High dynamic range
    - Higher is better and brighter
    - HDR10
    - HDR10+
    - HLG for TV station
    - Dolby Vision adds extra metadata on every frame so better sound quality
- 4K = UHD Ultra High Definition = pixel count
- 1 NIT = 1 Candela per square metre
- Candela = light emitted in a particular direction BUT based on Human Perception!?!?
- Lumens = total amount of light emitted in every direction


