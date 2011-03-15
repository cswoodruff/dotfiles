
[ -z "$PS1" ] && return

#PS1='[\u@\h \W]\$ '
if [ -z "$SSH_CLIENT" ]; then
    PS1='\u@\[\e[1;34m\]\h:\[\e[0m\]\w\$ '
else
    PS1='\u@\[\e[1;32m\]\h:\[\e[0m\]\w\$ '
fi

source ~/.keychain/`hostname`-sh
source ~/.dircolors

set -o vi   # turn on vi key bindings for readline


# PATH variable
export PATH=$PATH:/home/cwoodruf/bin:/opt/mentor/modelsim6.6b/modeltech/linux_x86_64:/opt/synopsys/synplifypro/fpga_e201009sp3/bin

export EDITOR=vim
export VISUAL=vim
export BROWSER=opera

# Code locations
export XILINX_MAKEFILE=$HOME/xilinx/xilinx_makefile.mk
export HDL_LIB=$HOME/sandbox/hdl_lib/trunk
#export HDL_LIB=$HOME/sandbox/hdl_lib/branches/piddp/feature_dataless
export PIDDP_DIR=$HOME/sandbox/piddp/trunk
export CONNECT_DIR=$HOME/sandbox/connect

export CXX=g++
export SYSTEMC=/usr/local/systemc-2.2
export ARCH=linux64

export FIGNORE=.svn     # prevents completion of svn directories

# Aliases
alias ls='ls --color=auto'
alias pkgbk='comm -23 <(clyde -Qeq) <(clyde -Qmq) > ~/backup/pkglist; clyde -Qmq > ~/backup/pkglist_aur'
alias etckeeper='sudo etckeeper'
alias keys='xmodmap ~/.Xmodmap'
alias lock='xscreensaver-command -lock'
alias open='xdg-open'

# SSH
alias abidyne="ssh -Y cwoodruf@abidyne.jpl.nasa.gov"
alias cobra="ssh -Y cwoodruf@cobra.jpl.nasa.gov"
alias marsbrd1="ssh -Y chriswoodruff@marsbrd1.jpl.nasa.gov"
alias odo="ssh -Y cwoodruf@odo.jpl.nasa.gov"
alias timphase="ssh -Y cwoodruf@timphase.jpl.nasa.gov"
alias tyr="ssh -Y cwoodruf@tyr.jpl.nasa.gov"
alias yeti='ssh -Y cwoodruf@yeti.homelinux.com'


# Programs
alias ise10="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/10.1/ISE/settings64.sh"
alias ise12="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/12.3/ISE_DS/settings64.sh"
alias ise13="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/13.1/ISE_DS/settings64.sh"
alias synpro="export LM_LICENSE_FILE=9998@dhub-lmgr1,9998@dhub-lmgr2,9998@dhub-lmgr3 && synplify_pro"
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

# Ranger change directory on exit
ranger() {
    command ranger --fail-unless-cd $@ &&
    cd "$(grep \^\' ~/.config/ranger/bookmarks | cut -b3-)"
}


# # An enhanced 'cd' - push directories
# # onto a stack as you navigate to it.
# # The current directory is at the top
# # of the stack.
# function stack_cd {
#     if [ $1 ]; then
#         # use the pushd bash command to push the directory
#         # to the top of the stack, and enter that directory
#         pushd "$1" > /dev/null
#     else
#         cd > /dev/null
#         # the normal cd behavior is to enter $HOME if no
#         # arguments are specified
#         # pushd $HOME > /dev/null
#     fi
# }
# # the cd command is now an alias to the stack_cd function
# alias cd=stack_cd

# Swap the top two directories on the stack
function swap {
    if [ $1 ]; then
        pushd +$1 > /dev/null
    else
        pushd > /dev/null
    fi
}
# s is an alias to the swap function
alias s=swap

# Pop the top (current) directory off the stack
# and move to the next directory
function pop_stack {
    if [ $1 ]; then
        popd +$1 > /dev/null
    else
        popd > /dev/null
    fi
}
alias p=pop_stack

# Display the stack of directories
alias d='dirs -v'
