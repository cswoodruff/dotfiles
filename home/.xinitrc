#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Turn system beep off
xset b off

/usr/bin/xmodmap .Xmodmap

/usr/bin/xscreensaver -no-splash &

/usr/bin/urxvtd -q -f -o

# Use for awesome to make Java programs play nice
#wmname LG3D
#exec awesome

#exec gnome-session
#exec wmii
#exec fvwm-crystal
#exec openbox
exec ck-launch-session startxfce4
