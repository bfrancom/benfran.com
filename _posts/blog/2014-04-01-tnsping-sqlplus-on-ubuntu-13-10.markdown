---
title: tnsping & sqlplus On Ubuntu 13.10
image: images/142.jpg
date: 2014-04-01 15:47:14.000000000 -06:00
---
I need oracle tools to diagnose and troubleshoot.  This is the easiest, and least intrusive method I've found:
<ol>
	<li><a title="Oracle XE" href="http://www.oracle.com/technetwork/products/express-edition/downloads/index.html" target="_blank">Download</a> and extract the "u01" folder from the Oracle XE RPM installation to /.</li>
	<li>Update your *.ora files here: /u01/app/oracle/product/11.2.0/xe/network/admin/</li>
	<li>Export environment variables:

export ORACLE_HOME=/u01/app/oracle/product/11.2.0/xe
export ORACLE_BASE=/u01/app/oracle
export LD_LIBRARY_PATH=$ORACLE_HOME/lib:$LD_LIBRARY_PATH
export PATH=$ORACLE_HOME/bin:$PATH</li>
	<li>Test it out. Seems to work just fine without having to install the full XE.</li>
</ol>
