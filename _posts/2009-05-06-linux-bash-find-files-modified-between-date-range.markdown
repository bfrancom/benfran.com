---
title: Linux, Bash Find Files Modified Between Date Range
image: images/76.jpg
date: 2009-05-06 08:21:00.000000000 -06:00
---
I just found this handy reference site here:<br /><br /><a href="http://www.ibm.com/developerworks/aix/library/au-productivitytips.html">http://www.ibm.com/developerworks/aix/library/au-productivitytips.html</a><br /><br />Here was my script that finds the files modified between given dates, and then will tar the ouptut to an archive.<br /><br /><blockquote> find /path/ -name *.JPG -daystart -newer file.start ! -daystart -newer file.end -print0 | xargs -0 tar rvf filename.tar</blockquote>
