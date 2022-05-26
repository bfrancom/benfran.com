---
title: OpenBSD Xenocara Missing Resolution
image: images/165.jpg
date: 2017-01-11 10:12:22.000000000 -06:00
---

This is just like I had to do in Linux, except the directory already existed.
Create directory and add a file called `10-monitor.conf`

`# mkdir -p /etc/X11/xorg.conf.d`

Get missing resolution by running:

`% cvt 1920 1080 60`

Output of that cvt command:
```
# 1920x1080 59.96 Hz (CVT 2.07M9) hsync: 67.16 kHz; pclk: 173.00 MHz
Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
```

Add the modeline to a conf file:

/etc/X11/xorg.conf.d/10-monitor.conf
```
Section "Monitor"
	Identifier "eDP1"
	Modeline "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
	Option "PreferredMode" "1920x1080_60.00"
EndSection
```
