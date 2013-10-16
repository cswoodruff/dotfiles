#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Turn system beep off
xset -b

# Keyboard modifications
setxkbmap dvorak -option caps:escape -option terminate:ctrl_alt_bksp
xbindkeys

# Start screensaver
#/usr/bin/xscreensaver -no-splash &
exec xautolock -time 15 -locker 'i3lock --image /home/cwoodruf/pictures/wallpaper/hal.png' &

# Wallpaper
#feh --bg-scale /home/cwoodruf/pictures/wallpaper/ArchLinux.png
feh --bg-scale /home/cwoodruf/pictures/wallpaper/hal.jpg

# Start terminal daemon
/usr/bin/urxvtd -q -f -o


case $1 in
    gnome) exec gnome-session;;
    i3);;
    *) exec i3 --force-xinerama -V >> ~/.i3/i3log 2>&1;;
esac

# Use for awesome to make Java programs play nice
#wmname LG3D
#exec awesome
#exec wmii
#exec fvwm-crystal
#exec openbox
#exec ck-launch-session fusion-icon
#exec gnome-session
#exec ck-launch-session startxfce4

#echo "Starting at $(date)" >> ~/.i3/i3log
#exec i3 --force-xinerama -V >> ~/.i3/i3log 2>&1
