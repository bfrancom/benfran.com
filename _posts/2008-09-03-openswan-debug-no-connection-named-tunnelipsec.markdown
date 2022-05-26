---
title: Openswan debug "no connection named tunnelipsec"
image: images/61.jpg
date: 2008-09-03 10:38:00.000000000 -06:00
---
Notes on openswan troubleshooting and various sundry rotary girders:<br /><i class="quote">/usr/sbin/ipsec auto --add "connection name" #before using --up</i><br /><i class="quote"></i><br /><i class="quote">/usr/sbin/ipsec auto --up tunnelipsec<br /></i><i class="quote"><br /><br /></i><i class="quote"></i><i class="quote"></i>> config setup> interfaces="ipsec0=eth0"You shouldn't specify interfaces with the 2.6 kernel. It has no ipsecXinterfaces.<br /><p></p><p>route add -net 192.168.1.0 netmask 255.255.255.0 gw 67.128.y.z dev eth1</p><p> </p><p> #sysctl -p<br />net.ipv4.ip_forward = 1</p>
