---
title: Compiling Mutt With Slang
image: images/148.jpg
date: 2015-10-07 14:04:18.000000000 -06:00
---
I needed to compile the [mutt](http://www.mutt.org) e-mail client with slang so my colors would work correctly.  This is how it's done:

`wget -O /tmp/mutt-1.5.24.tar.gz ftp://ftp.mutt.org/pub/mutt/mutt-1.5.24.tar.gz`

`cd /tmp && tar xzvf mutt-1.5.24.tar.gz`

`cd mutt-1.5.24`

`./configure --enable-imap --with-slang --enable-smtp --with-ssl --with-sasl --enable-hcache` #Note: "--with-slang" here

`make`

`sudo make install`
