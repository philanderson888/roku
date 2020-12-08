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