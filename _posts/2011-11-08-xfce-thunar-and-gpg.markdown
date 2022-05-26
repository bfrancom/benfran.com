---
title: Xfce, Thunar and GPG
image: images/132.jpg
date: 2011-11-08 12:48:36.000000000 -07:00
---
I needed a way to encrypt files with GPG via the file manager (Thunar) right-click-context-menu in XFCE.

I came across this post that almost had it:
http://ubuntuforums.org/showthread.php?t=578093

In Thunar, Go to Edit-&gt;Configure Custom Actions

Add a new action, call it "Encrypt" with the following command:

xfce4-terminal -x gpg --encrypt %f

That should work, and you can setup another one for decrypt.
