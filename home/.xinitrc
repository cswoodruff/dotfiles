#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Turn system beep off
xset b off

# Use for awesome to make Java programs play nice
# wname LG3D

/usr/bin/xmodmap .Xmodmap

/usr/bin/xscreensaver -no-splash &

exec awesome
#exec gnome-session
#exec wmii
#exec fvwm-crystal
#exec openbox
