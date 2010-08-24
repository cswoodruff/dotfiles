# Check for an interactive session
[ -z "$PS1" ] && return

PS1='[\u@\h \W]\$ '

set -o vi   # turn on vi key bindings for readline


# PATH variable
export PATH=$PATH:/opt/mentor/modelsim6.6b/modeltech/linux_x86_64:$HOME/bin


# Code locations
#export HDL_LIB=$HOME/sandbox/hdl_lib/trunk/
export HDL_LIB=$HOME/sandbox/hdl_lib/branches/feature_iq_sampler/
export PIDDP_DIR=$HOME/sandbox/piddp/trunk/

export CXX=g++
export SYSTEMC=/usr/local/systemc-2.2
export ARCH=linux64


# Aliases
alias ls='ls --color=auto'
alias pkgbk='comm -23 <(clyde -Qeq) <(clyde -Qmq) > pkglist; clyde -Qmq > pkglist_aur'
alias etckeeper='sudo etckeeper'


# SSH
alias abidyne="ssh abidyne"
alias cobra="ssh cobra"
alias marsbrd1="ssh marsbrd1"
alias odo="ssh odo"
alias timphase="ssh timphase"
alias tyr="ssh tyr"
alias yeti='ssh cwoodruf@yeti.homelinux.com'


# Programs
#alias ise11="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/11.1/settings64.sh"
alias ise12="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/12.2/ISE_DS/settings64.sh"
alias matlab="export LM_LICENSE_FILE=7282@cae-lmgr6,7282@cae-lmgr7,7282@cae-lmgr8 && /usr/local/bin/matlab -nosplash"     #-nodesktop
alias modelsim="export LM_LICENSE_FILE=2020@dhub-lmgr1,2020@dhub-lmgr2,2020@dhub-lmgr3 && vsim"


# Sudo for clyde
clyde() {
  case $1 in
      (-Ss | -Si | -Q* | -T | -G)
          /usr/bin/clyde "$@" ;;
      (-S* | -R* | -U | *)
          /usr/bin/sudo /usr/bin/clyde "$@" ;;
  esac
}
