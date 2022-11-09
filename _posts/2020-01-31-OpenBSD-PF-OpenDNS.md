---
title: OpenBSD PF and OpenDNS
image: images/187.jpg
date: 2020-01-31 10:38:00.000000000 -06:00
tags:
  - openbsd
  - technology
  - automation
  - security
---

At home, I needed a way to prevent anything but OpenDNS from being used for DNS, and needed a rule that would do it in OpenBSD PF.

## Install and Configure
First off, to setup an OpenDNS client on OpenBSD, install the ddclient package via `pkg_add ddclient`

You should get an output like so:

```
bzrtr# pkg_add ddclient

quirks-3.183 signed on 2020-01-31T18:21:51Z
quirks-3.124->3.183: ok
ddclient-3.8.3p1:p5-Net-SSLeay-1.88: ok
ddclient-3.8.3p1:p5-IO-Socket-SSL-2.066: ok
ddclient-3.8.3p1:p5-Digest-SHA1-2.13p4: ok
ddclient-3.8.3p1: ok
Read shared items: ok
The following new rcscripts were installed: /etc/rc.d/ddclient
See rcctl(8) for details.
```


Append the [recommended settings](https://support.opendns.com/hc/en-us/articles/227987727-Linux-IP-Updater-for-Dynamic-Networks) from the vendor:

```bash
##
## OpenDNS.com account-configuration
##
protocol=dyndns2
use=web, web=myip.dnsomatic.com
ssl=yes
server=updates.opendns.com
login=opendns_username
password=‘opendns_password’
opendns_network_label
```

## Test

Test the new configuration by running:

`ddclient -daemon=0 -debug -verbose -noquiet`

Fix it if there are errors.

## Add to startup

`/var/log/messages` was showing an error:

```
Jan 31 16:23:59 bzrtr ddclient[72430]: WARNING:  file /var/db/ddclient/ddclient.cache: Cannot open file '/var/db/ddclient/ddclient.cache'. (Permission denied)
Jan 31 16:23:59 bzrtr ddclient[72430]: FATAL:    Cannot create file '/var/db/ddclient/ddclient.cache'. (Permission denied)
```

To fix it, I had to `chown -R _ddclient:wheel /var/db/ddclient/`

Then `rcctl restart ddclient`


## Configure OpenBSD PF

If you haven't used [OpenBSD pf](https://www.openbsd.org/faq/pf/), it is the default firewall on [OpenBSD](https://www.openbsd.org/), and is amazing!

The ruleset boils down to the few lines:

```bash
table <opendns> { 208.67.222.222 208.67.220.220 }
block drop quick on egress proto { tcp udp } from any to !<opendns> port = 53
```

Of course this doesn't help with DNS over HTTP—D'oh!
