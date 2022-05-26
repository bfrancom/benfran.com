---
title: Linux KDE Connect vs macOS Sierra Continuity
image: images/162.jpg
date: 2016-11-04 09:54:22.000000000 -06:00
---

# KDE Connect

## Overview
Disclaimer: I don't own a mac, so I can't offer personal experience, just what I've garnered from their site, and other folks experiences.

After seeing someone demo universal clipboard on iOS/Mac, It tried finding the Linux equivalent, and came up with KDEconnect. KDEconnect has been around for a few years ([GSOC](https://albertvaka.wordpress.com/2013/08/05/introducing-kde-connect/) 2013) with the shared clipboard feature.  Whereas the universal clipboard on the Mac just came out (Sept 2016) with [Sierra/iOS10.](https://support.apple.com/kb/PH25168?locale=en_US&viewlocale=en_US) 

The parent app of mac's universal clipboard is called "Continuity", and has been around since iOS8/Yosemite circa Sept, 2014.

Pushbullet did universal copy & paste in [August 2014](https://blog.pushbullet.com/2014/08/20/introducing-universal-copy-and-paste/).

I merely point these things out to show that this isn't a new feature to computing in 2016, and I love how the tech industry builds on each others ideas to make cool products. However, I despise when companies become litigious jerks, claiming to be the originator/inventor when the clearly were not. This is especially true for a patent holder where there is a bunch of prior work/art/proof.

## KDE Connect Features
Here are some features listed from the [github page](https://github.com/albertvaka/kdeconnect-kde) and from the [lead developers blog](https://albertvaka.wordpress.com):

* Shared clipboard: copy and paste between your phone and your computer (or any other device).
* Notification sync: Read your Android notifications from the desktop and vice versa.
* Share files and URLs instantly from one device to another.
* Multimedia remote control: Use your phone as a remote for Linux media players.
* Virtual touchpad: Use your phone screen as your computer's touchpad.
* Trigger custom commands from your phone
* Reply to SMS from your desktop

It's a KDE app, and I run i3wm. If you don't run KDE, you are supposed to install indicator-kdeconnect. I didn't want to do this since it wasn't in my default repos...So I installed KDE (😲) breifly to test it out.

I only tested out the shared clipboard, and it worked perfectly in my limited testing of about 10 minutes. I was able to copy to and fro either laptop/android. Yes, I realize this is a poor test, and I should suspend/resume, disconnect/reconnect from the network on both devices, and do various iterations of that, amongst other things. 

## macOS Sierra: Continuity Features
* Handoff: "With Handoff, you can start work on one device, then switch to another nearby device and pick up where you left off."
* Instant Hotspot: "Use Instant Hotspot with any Mac, iPhone, iPad, or iPod touch that meets the Continuity system requirements. It works when your devices are near each other"
* Phone calling: "With the iPhone Cellular Calls feature, you can make and receive calls from your Mac, iPad, or iPod touch when those devices are on the same network as your iPhone."
* SMS: "the text messages that you send and receive on your iPhone can appear on your Mac, iPad, and iPod touch as well. You can then continue the conversation from whichever device is closest to you."
* Universal Clipboard: "you can copy text, images, photos, and video on one Apple device, then paste the content on another Apple device."
* Auto Unlock: unlock your mac from your AppleWatch when in proximity.

## Installation

### KDE Connect

* If running KDE and it isn't there already:
	 `apt-get install kdeconnect`
* Download KDE Connect app from the android store and follow on screen setup 

### Continuity
* Seems to be preinstalled with Sierra/iOS10. Just need to configure it.

## Connectivity
KDE Connect uses network access, while Apple's Continuity uses a combination of iCloud, network, and  bluetooth.

## Security
KDE Connect utilizes  TLS sockets now instead of the previously used RSA private key for encryption.

I couldn't find much info on Continuity in regards to security.

## Thoughts
These projects definitely have some overlap, but I only tested the universal clipboard on KDE Connect.  I like how KDE Connect is open source, and limits everything to your local devices/network. It's also hard to compare Desktop environments between everything that is available on Linux vs Apple's desktop environment. (I'm sticking with [i3wm](http://i3wm.org/))

There are also 3rd party apps like pushbullet that work over the cloud, but I'm not sure if I trust them, Apple, Google, nor any 3rd party with all my data, and feel it's best to limit sharing your data wherever you can.
