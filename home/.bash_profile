#
# ~/.bash_profile
#

# Turn off beep
setterm -blength 0

# start keychain
/usr/bin/keychain id_rsa
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
    . $HOME/.keychain/$HOSTNAME-sh

[[ -f ~/.bashrc ]] && . ~/.bashrc

[[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
