---
title: TMUX, mutt, and Vim Colors
image: images/139.jpg
date: 2013-10-14 15:26:53.000000000 -06:00
---
Just some notes on setting up mutt in tmux and using vim for the default editor.

I wanted to get a clear background in mutt without the background text highlighted.

In order to make that happen, I started mutt with an alias in ~/.bashrc:
<blockquote>alias mutt='TERM=vt100 mutt'</blockquote>
...but then using vim as the default mutt editor wouldn't edit in color.

So in ~/.vimrc I have this, and it works like I expect:
<blockquote>set term=xterm-256color</blockquote>
So now it looks like so (sorry it's chopped to protect the innocent):

<a href="http://blog-bfrancom.rhcloud.com/wp-content/uploads/2013/10/Mutt.png"><img class="size-medium wp-image-711 alignleft" alt="Mutt" src="http://res.cloudinary.com/bfrancom/image/upload/h_300,w_86/v1399820280/Mutt_lxerij.png" width="86" height="300" /></a>
