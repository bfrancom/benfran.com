---
title: Reconfiguring Home LAN
image: images/126.jpg
date: 2010-11-29 14:29:43.000000000 -07:00
---
<a href="/images/old/PBS22_utfvdb.png"><img src="/images/old/PBS22_utfvdb.png" alt="" title="Squid Logo" width="120" height="88" class="aligncenter size-full wp-image-500" /></a>
<a href="/images/old/wii2_wqa71z.jpg"><img src="/images/old/wii2_wqa71z.jpg" alt="" title="wii" width="142" height="64" class="aligncenter size-full wp-image-501" /></a>
I took off this past week to extend the holiday, and spend time with the family.  Unfortunately, I came down with a cold at the beginning of the week which later turned into a sinus infection.  Here it is Monday again, and I've almost completely kicked it!

While sick, I didn't feel like doing much except sit around and work on the computer or watch the occasional TV show.  For several reasons, and having a lot of spare time on my hands, I decided to hook the Wii up via a wired Ethernet connection, and route it through a proxy.  So, after connecting the USB to Ethernet converter, I proceeded with the configuration.  Unfortunately I found the current revision of the Wii firmware doesn't have an easy way of defining a proxy for a wired connection.  (Actually it is easy after you figure it out.  You just have to setup a wireless connection first, then change it to wired).

After I got the Nintendo up and running, I hit another hurdle; apparently Netflix (on the Wii) hates proxies too— Well, at least the Squid proxy.  I really like to route everything through a proxy for logging, troubleshooting, and control.  But the Netflix app wasn't having anything to do with it.  I tried some ACL's in Squid to tell it not to cache the sites the Wii was trying to go to, but that didn't work.

Snippets from my squid.conf file:

<code>acl netflix dstdomain .netflix.com
acl netflix02 dstdomain .nintendowifi.net:443 #also tried w/o the ":443"
acl netflix03 dstdomain .wii.com

no_cache deny netflix
no_cache deny netflix02
no_cache deny netflix03</code>

And here are the respective log entries showing it's not caching for these domains:

<code>1290914315.544   1045 10.0.0.x TCP_MISS/200 4392 CONNECT naswii.nintendowifi.net:443 bfrancom DIRECT/209.67.106.143 -
1290914401.010    372 10.0.0.x TCP_MISS/200 279 POST http://rcw.wc24.wii.com/cgi-bin/check.cgi bfrancom DIRECT/133.205.133.198 text/plain</code>

Since that didn't work, I bypassed the proxy for anything from the Wii IP in my FreeBSD pf.conf:

<code>rdr on $int_if inet proto tcp from !10.0.0.x to any port www -> 127.0.0.1 port 3128
pass in on $int_if inet proto tcp from !10.0.0.x to 127.0.0.1 port 3128 keep state</code>

This works great, and routes regular Wii traffic through Squid.  I'd really like to get the Netflix application working through squid in the future.
