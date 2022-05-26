---
title: Join Multiple mpg Files
image: images/65.jpg
date: 2008-11-21 07:44:00.000000000 -07:00
---
cat file01.mpg file02.mpg file03.mpg > alltogether.mpg<br /><br />Other notes:<br /><br />mpegdemux -d -s 0xe0 source.mpg dst.m1v<br />mpegdemux -d -s 0xc0-0xdf -b audio_##.mpa source.mpg<br /><br /><br />mplex -f 8 -o result.mpg dst.m1v audio_c0.mpa<br /><br />Also can use Project-X to demux
