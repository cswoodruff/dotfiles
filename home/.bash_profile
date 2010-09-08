# start keychain
/usr/bin/keychain id_rsa
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
    . $HOME/.keychain/$HOSTNAME-sh

. $HOME/.bashrc
