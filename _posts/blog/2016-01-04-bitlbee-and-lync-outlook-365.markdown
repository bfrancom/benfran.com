---
title: 'Linux: bitlbee sipe and lync (skype for business) outlook 365'
image: images/155.jpg
date: 2016-01-04 16:56:13.000000000 -07:00
---
I'm a big command line nerd. What can I say? And with so many ways to contact and communicate with people, what better way than to integrate everything into one place. It makes it easier to respond, and I can write filters as to not be overly distracted.

To get command line chat working in linux with lync, follow this tutorial here:

http://www.kossboss.com/linux---bitlbee-and-weechat-working-with-ocs-lync-office-communicator-gtalk-and-facebook

and more info here:

https://wiki.bitlbee.org/HowtoSIPE

I also had to change the nickname list since they all came across as `sipusername` instead of `Display Name`. To do that, just enter in: `account accountname set nick_source full_name`.
