---
title: GroupWise 7 SLED 11
image: images/78.jpg
date: 2009-06-16 02:08:00.000000000 -06:00
---
I had to add this onto the startup script for GroupWise to function better on SLED:<br /><br /><blockquote>/opt/novell/groupwise/client/bin/groupwise.sh -jvm=-Dawt.toolkit=sun.awt.motif.MToolkit</blockquote>
