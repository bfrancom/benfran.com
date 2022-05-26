---
title: Using avconv to Convert Videos for Low Bandwidth (3G)
image: images/160.jpg
date: 2016-08-18 12:33:22.000000000 -06:00
---
In working further on a video project, I had to re-encode (reencode?) them to a lower bitrate for slower connections.

So far, this seems to work:

`avconv -i in.mp4 -c:a copy -c:v libx264 -crf 28 -preset veryfast out.mp4`

and then:

`MP4Box -brand mp42 out.mp4`

Further details here:

https://trac.ffmpeg.org/wiki/Encode/H.264
