---
title: 'Screencasting Key-Press Software: key-mon'
image: images/143.jpg
date: 2014-11-02 21:09:47.000000000 -07:00
---
<iframe width="560" height="315" src="//www.youtube.com/embed/-z8TQsFYkOY" frameborder="0" allowfullscreen></iframe>

I’m thinking of doing some future screencasts/tutorials on tmux, and found this software called key-mon.

The best options I found so far, are:

`nohup key-mon --nomouse --backgroundless -t modern --scale=2 1.6 --no-press-fadeout=1 &`

And this is the best screencast bitrate I’ve come up with so far (Arch Linux):

`avconv -f x11grab -s 1920x1080 -r 30 -i :0.0 -qscale 0 -vcodec huffyuv destination.avi`

Posted in Uncategorized	| Tags: arch, archlinux, demo, keymon, tmux	| Leave a comment |
