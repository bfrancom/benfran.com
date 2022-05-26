---
title: Unattended OpenBSD Upgrades using Ansible
image: images/167.jpg
date: 2018-09-01 16:17:22.000000000 -06:00
---

Is this ideal? No...What could ever go wrong with an unattended upgrade?
Run this at your own risk!

What drove me to do this? Security and also the recent speculative execution [vulnerabilities.](https://www.undeadly.org/cgi?action=article;sid=20180824024934)

Update doas.conf

	/etc/doas.conf
	permit nopass bfrancom as root cmd /usr/sbin/pkg_add
	permit nopass bfrancom as root cmd /usr/sbin/syspatch

Setup a playbook

	---
	- hosts: openbsd_routers
	  remote_user: bobbyjoe
	
	  tasks:
	    - name: doas /usr/sbin/pkg_add -u
	      command: doas /usr/sbin/pkg_add -u
	    - name: doas /usr/sbin/syspatch
	      command: doas /usr/sbin/syspatch

You may want to add a reboot in there.
