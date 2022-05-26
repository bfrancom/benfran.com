---
title: Download Brightcove Videos
image: images/157.jpg
date: 2016-03-17 16:05:10.000000000 -06:00
---
I like to listen to video conferences and podcasts at higher than normal speeds. Brightcove video doesn't allow you to speed it up, so I was wondering if I could download it and play it with mplayer, or mpv. Then I found this site: http://mrbluecoat.blogspot.com/2013/11/download-brightcove-videos-tutorial.html?m=1

Here is the text, in case the page is ever lost:


Download BrightCove videos (tutorial)

Update:  The download method described in my original post no longer works.  It looks like they've updated their delivery system to incorporate additional security measures.  Fortunately, there's an easier rtmpdump method that still works:

0.  if you don't already have it, install the rtmpdump suite:
sudo apt-get install rtmpdump
1. open a terminal and become root:
sudo su - root
2. create a firewall rule to temporarily redirect TCP traffic to a custom port:
iptables -t nat -A OUTPUT -p tcp --dport 1935 -m owner \! --uid-owner root -j REDIRECT
3. run a (cleverly named) companion program in the rtmpdump package that sniffs traffic for streaming video
rtmpsuck
4. minimize the root terminal window and then open (or refresh) the video page in your browser and play the video

5. bring up the root terminal window and when it says "Closing connection... done!" (or the video finishes playing) press Ctrl+C to stop rtmpsuck

6. the video will have been saved in the root user's home directory; move it to tmp (note: if the source video is flv, swf, etc. you will need to change the extension in the command below)
mv ~/*.mp4 /tmp
7. delete the temporary firewall rule
iptables -t nat -D OUTPUT -p tcp --dport 1935 -m owner \! --uid-owner root -j REDIRECT
8. close the root terminal window and enjoy your video!


P.S. This works for other video sites as well, such as News and Sports broadcasts.
