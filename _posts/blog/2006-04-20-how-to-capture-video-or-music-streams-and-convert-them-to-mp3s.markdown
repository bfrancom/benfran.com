---
title: How to Capture Video or Music Streams and convert them to mp3's
image: images/23.jpg
date: 2006-04-20 00:29:00.000000000 -06:00
---
<i>You'll need Mplayer and Lame of course to do this.<br />Here is my script:</i><br /><br />########################################<br />#!/bin/bash<br />echo "Enter name of URL to capture"<br /><br />read URL<br /><br />mplayer -dumpstream -dumpfile song.dump $URL<br /><br />mplayer -vc dummy -vo null -ao pcm song.dump<br /><br />echo "Enter Song name you want to save stream as (i.e. Doowap.mp3)"<br /><br />read songname<br /><br />lame -m s -q 2 --vbr-new -V 1 -B 320 audiodump.wav $songname<br /><br />rm audiodump.wav<br />rm song.dump<br />##################################################
