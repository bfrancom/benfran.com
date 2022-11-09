---
title: AWS Data Migration Service
image: images/185.jpg
date: 2020-01-30 20:38:00.000000000 -06:00
tags:
  - aws
  - technology
  - automation
  - dms
---

I was just doing some testing of the AWS Data Migration Service (DMS), and it isn't obvious when setting up endpoints that the public IP address of the replication instance is the one that traffic will always come from/to. At least in my testing, this was true.

I use the amazing [OpenBSD pf](https://www.openbsd.org/faq/pf/) firewall for the home perimiter, and was able to verify with 2 different AWS accounts.

Do the test by creating a target endpoint in DMS, and add your firewall IP as the destination

![endpoint](https://i.imgur.com/3rkwKQ5.png) 

Then, run your test

![test](https://i.imgur.com/3CGq0aX.png)

Assuming you have logging/blocking setup correctly in OpenBSD, this was the command to see the denied traffic to verify the source IP:

`tcpdump -n -e -ttt -i pflog0 port 5432`

Which produced the following output:

`Jan 30 20:43:54.026177 rule 4/(match) block in on em0: 52.x.x.x.38527 > 67.x.x.x.5432: S 362481813:362481813(0) win 26880 <mss 1460,sackOK,timestamp 664198628 0,nop,wscale 7> (DF) [tos 0x20]`


