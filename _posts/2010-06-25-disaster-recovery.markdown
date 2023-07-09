---
title: Disaster Recovery
image: images/100.jpg
date: 2010-06-25 16:14:05.000000000 -06:00
---
<a href="https://blog-bfrancom.rhcloud.com/wp-content/uploads/2010/06/tornado22.jpg"><img class="size-medium wp-image-349 alignnone" title="tornado" src="https://res.cloudinary.com/bfrancom/image/upload/h_225,w_300/v1399820346/tornado2_phrnne.jpg" alt="Disaster Recovery, Business Continuity" width="300" height="225" /></a>

This week proved interesting. We had a remote server system upgrade fail &amp; system board fail.  We quickly had the affected users up and running remotely against their backup data until the issues were fixed.  We utilize RSYNC on Linux for our remote backups, and it has proven itself countless times.  It has also helped automate some manual processes and increased productivity substantially.
