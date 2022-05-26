---
title: Mythbuntu, XBMC, HDMI
image: images/130.jpg
date: 2011-04-04 22:15:39.000000000 -06:00
---
Had a bit of issue re-routing all sound through HDMI.  Here is the fix:

create or edit /etc/asound.conf, and here is the only line in my file:
<blockquote>defaults.pcm.device 3</blockquote>
Run the following command, and note which device your HDMI output is:
<blockquote>~$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: NVidia [HDA NVidia], device 0: ALC662 rev1 Analog [ALC662 rev1 Analog]
Subdevices: 1/1
Subdevice #0: subdevice #0
card 0: NVidia [HDA NVidia], device 1: ALC662 rev1 Digital [ALC662 rev1 Digital]
Subdevices: 1/1
Subdevice #0: subdevice #0
card 0: NVidia [HDA NVidia], device 3: NVIDIA HDMI [NVIDIA HDMI]
Subdevices: 1/1
Subdevice #0: subdevice #0</blockquote>
In xbmc preferences-&gt;system-&gt;audio ouput device &amp; passthrough device...change to custom, and enter manually your HDMI ID.  Mine was:
<blockquote>hw:0,3</blockquote>
