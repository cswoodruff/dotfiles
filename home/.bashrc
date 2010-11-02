# Check for an interactive session
[ -z "$PS1" ] && return

#PS1='[\u@\h \W]\$ '
if [ -z "$SSH_CLIENT" ]; then
    PS1='\u@\[\e[1;34m\]\h:\[\e[m\]\w\$ '
else
    PS1='\u@\[\e[1;32m\]\h:\[\e[m\]\w\$ '
fi

source ~/.keychain/$HOSTNAME-sh

set -o vi   # turn on vi key bindings for readline


# PATH variable
export PATH=$PATH:/opt/mentor/modelsim6.6b/modeltech/linux_x86_64:$HOME/bin

export EDITOR=vim
export VISUAL=vim

# Code locations
#export HDL_LIB=$HOME/sandbox/hdl_lib/trunk/
export HDL_LIB=$HOME/sandbox/hdl_lib/branches/piddp/feature_dataless/
export PIDDP_DIR=$HOME/sandbox/piddp/trunk/

export CXX=g++
export SYSTEMC=/usr/local/systemc-2.2
export ARCH=linux64


# Aliases
alias ls='ls --color=auto'
alias pkgbk='comm -23 <(clyde -Qeq) <(clyde -Qmq) > ~/backup/pkglist; clyde -Qmq > ~/backup/pkglist_aur'
alias etckeeper='sudo etckeeper'
alias lock='xscreensaver-command -lock'

# SSH
alias abidyne="ssh -Y cwoodruf@abidyne.jpl.nasa.gov"
alias cobra="ssh -Y cwoodruf@cobra.jpl.nasa.gov"
alias marsbrd1="ssh -Y chriswoodruff@marsbrd1.jpl.nasa.gov"
alias odo="ssh -Y cwoodruf@odo.jpl.nasa.gov"
alias timphase="ssh -Y cwoodruf@timphase.jpl.nasa.gov"
alias tyr="ssh -Y cwoodruf@tyr.jpl.nasa.gov"
alias yeti='ssh -Y cwoodruf@yeti.homelinux.com'


# Programs
alias ise12.2="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/12.2/ISE_DS/settings64.sh"
alias ise12.3="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/12.3/ISE_DS/settings64.sh"
alias matlab="export LM_LICENSE_FILE=7282@cae-lmgr6,7282@cae-lmgr7,7282@cae-lmgr8 && /usr/local/bin/matlab -nosplash"     #-nodesktop
alias vsim="export LM_LICENSE_FILE=2020@dhub-lmgr1,2020@dhub-lmgr2,2020@dhub-lmgr3 && vsim"


# Sudo for clyde
clyde() {
  case $1 in
      (-Ss | -Si | -Q* | -T | -G)
          /usr/bin/clyde "$@" ;;
      (-S* | -R* | -U | *)
          /usr/bin/sudo /usr/bin/clyde "$@" ;;
  esac
}
