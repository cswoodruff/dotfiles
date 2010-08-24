if [ -e /usr/share/terminfo/r/rxvt-256color ]; then
    export TERM='rxvt-256color'
else
    export TERM='rxvt-color'
fi
