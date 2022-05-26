---
title: FLV to MPG Script
image: images/64.jpg
date: 2008-11-21 07:33:00.000000000 -07:00
---
#!/bin/bash<br />ffmpeg -i "$1" -ab 128000 -ar 44100 -b 200000 -s 320x240 -ac 2 "$1".mpg
