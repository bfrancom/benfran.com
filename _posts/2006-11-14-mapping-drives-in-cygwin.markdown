---
title: Mapping Drives in Cygwin
image: images/37.jpg
date: 2006-11-14 05:56:00.000000000 -07:00
---
Map drive cygwin:<br />I had a dilemma whilst executing cron jobs on a box that needed some NetWare drives mapped.  (This ought to work for Windows mapped drives also).<br />The trick is to use the good ol' windows "net use" command.<br />i.e)<br />net use I: \kpi_fs02Data /user:username password<br /><br />I was surprized this worked inside cygwin at first.<br /><br />You have to use a million backslashes instead of regular UNC paths due to having to escape backslashes with a bakslash.
