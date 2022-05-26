---
title: HP Laserjet 4350tn 4350 etc. and DOT4_001 port vs. LPT1
image: images/8.jpg
date: 2005-07-12 04:55:00.000000000 -06:00
---
I called HP directly about this issue, and these were my findings:  I didn't want to sign up on HP's lame forums to post the solution either, so here goes.  <br />Our print job hung on our Laserjet 4350tn. My findings were that it defaulted to the USB port DOT4_001.  When running parallel it needs to be LPT1. It was a large check run in the queue, and it hoses up our Accounting system if it cannot print.  I had switched it to LPT1 before calling HP, and it printed fine.  HP verified my findings.<br />They said if it keeps defaulting to the USB port to reinstall the drivers.
