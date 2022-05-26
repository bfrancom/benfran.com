---
title: i3wm, Compton, i3lock, xscreensaver, notifications
image: images/161.jpg
date: 2016-10-18 16:54:22.000000000 -06:00
---
Using i3lock and compton seems to let dunst/notify-osd and other notifications (chrome) bleed through to the lock screen.

I've come up with a script that seems to work ok, and not let this happen:

```
  1 #!/bin/bash
  2 export DISPLAY=:0.0
  3 export DBUS_SESSION_BUS_ADDRESS=$(grep -z DBUS_SESSION_BUS_ADDRESS /proc/$(pidof i3bar)/environ | cut -d= -f2-)
  4 pkill compton
  5 killall -SIGUSR1 dunst
  6 #xscreensaver-command -lock
  7 i3lock --nofork -c "#000000"
  8 nohup compton -cCGb --backend glx --vsync opengl
  9 killall -SIGUSR2 dunst

```
