---
title: Motorola Netopia 3000 (Netopia 3347-02) PPPoE & Routed Subnet
image: images/84.jpg
date: 2009-12-07 09:10:00.000000000 -07:00
---
<a onblur="try {parent.deselectBloggerImageGracefully();} catch(e) {}" href="/images/old/3300_ent.front.sm.gif"><img style="display:block; margin:0px auto 10px; text-align:center;cursor:pointer; cursor:hand;width: 110px; height: 80px;" src="/images/old/3300_ent.front.sm.gif" border="0" alt="" /></a><br /><br /><br />I had some troubles with some newer Netopia modems and configuring them in routed subnet mode. The modem wouldn't pass any outside traffic to our Cisco router.  For initial configuration, I followed this guide:<br /><a href="http://www.netopia.com/support/hardware/technotes/CQG_042.html">http://www.netopia.com/support/hardware/technotes/CQG_042.html</a><br />The problem is that you have to allow the addresses to bypass the stateful inspection.  This is done here:<br /><br /><blockquote>Home > Security > Stateful Inspection > Exposed Addresses</blockquote><br /><br />Then you add your IP or range in the fields provided.
