---
title: openSUSE resolution not filling screen
image: images/56.jpg
date: 2008-05-22 04:47:00.000000000 -06:00
---
Found the fix <a href="http://linux.derkeiler.com/Mailing-Lists/SuSE/2008-02/msg03076.html">here.</a><br /><blockquote> The available solution is in the openSUSE 10.3 Release Notes:<br /><br />Older Intel Graphics Chips<br />Older Intel graphics chips are supported by two drivers ("i810" and<br />"intel"). The intel driver is the default on openSUSE 10.3 due to the<br />high demand for features like native mode setting (no longer VESA BIOS<br />based) and RANDR 1.2 support.<br />When updating to openSUSE 10.3, the i810 driver is not exchanged with<br />the intel driver. Use "sax2 -r" to switch to the intel driver.<br />The intel driver is still not as stable as i810; use "sax2 -r -m 0=i810"<br />to switch back to i810, if you encounter problems that did not occur<br />previously with the i810 driver. In those cases, consider to open a bug<br />report against the intel driver.<br />----------</blockquote>
