#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

/usr/bin/xmodmap .Xmodmap
/usr/bin/xscreensaver -no-splash &

exec awesome
