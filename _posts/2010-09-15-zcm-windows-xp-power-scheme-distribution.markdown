---
title: ZCM Windows XP Power Scheme Distribution
image: images/111.jpg
date: 2010-09-15 02:28:25.000000000 -06:00
---
(This is a <a href="http://www.novell.com/communities/node/11887/zcm-windows-xp-power-scheme-distribution">cool solution</a> I posted to the Novell website)

<b>Problem:</b>
Some of our machine images didn't have the proper power scheme configured before they were rolled out.  In some cases it's easier to re-image the machine, but in other cases like this one, it was better to find a solution where we could push power settings out to all our workstations to confirm they are setup properly.

<b>Solution:</b>
I searched the web high and low to find a power scheme solution that we could distribute to multiple users easily.  The problem is that each user has their own dynamic registry entry for their power settings.  This would be a difficult task at best to figure out each user string on each computer. You can't use powercfg.exe to accomplish this directly since it only works on a per user basis, and limited users cannot change their power settings.  When you run powercfg.exe with Administrative privileges, it only changes the power scheme for the Administrator.

I finally found a website that did almost exactly what I needed.  I'd like to thank Jon Giffard for this entry in his blog that gave me the solution:

<a href="https://jgiffard.wordpress.com/2010/01/05/19/">https://jgiffard.wordpress.com/2010/01/05/19/</a>


<blockquote>“Just to be clear, MSFT decided that power management should be stored for each individual user and then didn’t allow them to change it. Square that circle.”</blockquote>

So, it was ZCM to the rescue!

<b>The Fix:</b>
You can utilize a Microsoft tool, SubInACL, to change the registry rights on the power schemes.  I put the following ZCM bundle together with the help from Jon's blog.

Create a new ZCM MSI Bundle with the following:
<ol><li> Install SubInACL</li>
<li>Change rights to the power settings in the registry (so users can temporarily access the power settings).</li>
<li>Run powercfg script <b>as the user</b> to change the settings to the desired scheme.</li>
<li>Change rights to the power settings in the registry back to read only (so users can't mess with it).</li>
</ol>

<b>Details:</b>
<ol><li>Create a new ZCM MSI Bundle</li>
<li>Install SubInACL from http://download.microsoft.com/download/1/7/d/17d82b72-bc6a-4dc8-bfaa-98b37b22b367/subinacl.msi</li>
<li>I used 3 separate batch scripts since you have to run the 2nd script as the user.</li>

Script01 Contents:
<code>
@echo on
cd "%ProgramFiles%Windows Resource KitsTools"
subinacl.exe /noverbose /subkeyreg "HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindowsCurrentVersionControls FolderPowerCfg" /grant=users
</code>
Script02 Contents: (While creating the script in ZCM, be sure to go to “More Options,” and <b>run as a User!</b>
<code>
@echo on
%SYSTEMROOT%system32powercfg.exe /setactive "Always On"
</code>

Script03 Contents:
<code>@echo on
cd "%ProgramFiles%Windows Resource KitsTools"
subinacl.exe /noverbose /subkeyreg "HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindowsCurrentVersionControls FolderPowerCfg" /revoke=users
subinacl.exe /noverbose /subkeyreg "HKEY_LOCAL_MACHINESOFTWAREMicrosoftWindowsCurrentVersionControls FolderPowerCfg" /grant=users=R</code>

<b>Conclusion:</b>
Test this on a test PC before you roll out to the rest of your production workstations to avoid any serious blunders.  Then you can login as a limited user and ensure your power scheme is configured properly.  After testing, you can then roll this out to the production dynamic “Windows XP Workstations” device group.
