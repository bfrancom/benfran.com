---
title: Mount Luks Encrypted LVM Volume in Linux
image: images/150.jpg
date: 2015-11-16 19:40:13.000000000 -07:00
---
In order to mount an luks encrypted drive in Linux (Debian Jessie)

`cryptsetup luksOpen /dev/sda5 cryptName`

Where "cryptname" is some random made-up name for the device. If this is successful, you should see `/dev/mapper/cryptname`

Then activate and scan the lvm volumes:
`vgchange -ay && lvscan`

Make sure your volume is active, then mount it. Your volume name should be in the list, and is different than the "cryptname."

Finally, mount the volume and enter the encryption password. eg)
`mount /dev/bzdebby-vg/root /mnt/crypthomebenz/`
