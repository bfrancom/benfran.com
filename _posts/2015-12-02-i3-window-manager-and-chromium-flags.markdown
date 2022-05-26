---
title: Linux i3 Window Manager and Chromium Kerberos Flags
image: images/152.jpg
date: 2015-12-02 14:24:11.000000000 -07:00
---
The normal method of editing the chromium.desktop file didn't work in i3 setting the flags in chromium. I also tried some .profile settings too, which didn't work. Or rather, they'd work from the console, but not from dmenu. This is the fix if you run chromium from dmenu. Tested in Debian Jessie.

I ended up having to create a file in `/etc/chromium.d/chromium-flags`.

Contents of the file look like:

`CHROMIUM_FLAGS="$CHROMIUM_FLAGS --password-store=gnome --auth-server-whitelist="*.server.org,*.server.org""`

Now lousy sharepoint doesn't ask for my creds every few seconds.
