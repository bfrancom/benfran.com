---
title: My Productivity Tools
image: images/189.jpg
toc: true
tags: [hacks, productivity]
---

## Health is #1

For me, if I'm not healthy, I'm not productive. This means doing what I can to eat, exercise and sleep well. 

## Time management
For time management, and remembering breaks, I use the following:

* Cron Job to lock the screen (Mac or Linux)
* [Timeout app for Mac](https://apps.apple.com/us/app/time-out-break-reminders/id402592703?mt=12)
* [Pomodoro Tomato Timer](https://tomato-timer.com/)
* Blocking out news and social sites in `/etc/hosts` I have:

```
127.0.0.1       twitter.com instagram.com linkedin.com news.ycombinator.com 
```

## E-mail
* [Mutt](https://www.benfrancom.com/mutt-offline-with-mbsync/)
* Only responding to e-mail only twice a day
  * [https://www.calnewport.com/blog/2020/04/12/task-inflation-and-inbox-capture-on-unexpected-side-effects-of-enforced-telework/](https://www.calnewport.com/blog/2020/04/12/task-inflation-and-inbox-capture-on-unexpected-side-effects-of-enforced-telework/)
  * [https://tim.blog/2014/07/14/autoresponse/](https://tim.blog/2014/07/14/autoresponse/)

## Music

I still love the Unix philosophy of a tool doing one thing well. In that spirit, rather than using iTunes or some other behemoth of a music application that is slow and bulky, on the desktop, I use the following:

I use [MPD](https://www.musicpd.org/) & [ncmppp](https://rybczak.net/ncmpcpp/) for local music, while for streaming music, I use [pianobar](https://github.com/PromyLOPh/pianobar). These are all great minimal tools that take some time to setup, but then you forget it–Although they are difficult to live without once you are used to them.

These tools are very fast and keyboard/terminal centric. They are highly customizable, and work well. I like them a lot and have been using them for years.

### MPD

.mpdconf

```bash
music_directory         "~/Music/mpd"
playlist_directory              "~/.config/mpd/playlists"
db_file                 "~/.config/mpd/database"
pid_file                        "~/.config/mpd/pid"
state_file                      "~/.config/mpd/state"
sticker_file                    "~/.config/mpd/sticker.sql"
user                            "bf"
bind_to_address         "127.0.0.1"
log_level                       "verbose"
auto_update     "yes"
input {
        plugin "curl"
}
audio_output {
        type            "ao"
        name            "My Mac Device"
        mixer_type      "software"
}
```

### ncmpcpp

.ncmpcpp/config

```bash
allow_for_physical_item_deletion = "yes"
```

### pianobar

I setup controls from the keyboard like so:

~/.config/pianobar/config

```bash
history = 50
audio_quality = high
event_command = ~/.config/pianobar/pianobar-conky
```

.config/pianobar/pianobar-conky

```bash
#!/bin/bash

# create variables
while read L; do
        k="`echo "$L" | cut -d '=' -f 1`"
        v="`echo "$L" | cut -d '=' -f 2`"
        export "$k=$v"
done < <(grep -e '^\(title\|artist\|album\|stationName\|songStationName\|pRet\|pRetStr\|wRet\|wRetStr\|songDuration\|songPlayed\|rating\|coverArt\|stationCount\|station[0-9]*\)=' /dev/stdin) # don't overwrite $1...

case "$1" in
songstart)
#curl -s -4 -o ~/.config/pianobar/coverArt.jpg "$coverArt"
echo -n "$title"> ~/.config/pianobar/title
echo -n "$album" > ~/.config/pianobar/album
echo -n "$artist" > ~/.config/pianobar/artist

if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform
    /usr/bin/osascript -e "display notification \"Title: $title\" with title \"Album: $album\" subtitle \"Artist: $artist\""
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    # Do something under GNU/Linux platform
    notify-send -i ~/.config/pianobar/coverArt.jpg "Pianobar - $stationName" "Now Playing: $artist - $title"
#elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
#    # Do something under 32 bits Windows NT platform
#elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
#    # Do something under 64 bits Windows NT platform
fi
#notify-send -i ~/.config/pianobar/coverArt.jpg "Pianobar - $stationName" "Now Playing: $artist - $title"
#/usr/bin/osascript -e "display notification \"Title: $title\" with title \"Album: $album\" subtitle \"Artist: $artist\""
;;

esac
```

