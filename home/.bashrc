# .bashrc

# If not running interactively, don’t do anything
[ -z "$PS1" ] && return

# Colors
BLACK=$(tput setaf 0)
RED=$(tput setaf 1)
GREEN=$(tput setaf 2)
YELLOW=$(tput setaf 3)
BLUE=$(tput setaf 4)
MAGENTA=$(tput setaf 5)
CYAN=$(tput setaf 6)
WHITE=$(tput setaf 7)
NOCOLOR=$(tput sgr0)

# Prompt: blue for local login, green for ssh login
if [ -z "$SSH_CLIENT" ]; then
    PS1="\[$NOCOLOR\]\u@\[$BLUE\]\h:\[$NOCOLOR\]\w\$ "
else
    PS1="\[$NOCOLOR\]\u@\[$GREEN\]\h:\[$NOCOLOR\]\w\$ "
fi

# Set up keychain
source ~/.keychain/`hostname`-sh

# Set up directory listing colors
source ~/.dircolors

# Turn on vi key bindings for readline
set -o vi   

# Environment variables
export PATH=$PATH:/home/cwoodruf/bin:/opt/mentor/modelsim6.6b/modeltech/linux_x86_64:/opt/synopsys/synplifypro/fpga_e201009sp3/bin:/opt/altera/11.0/quartus/bin

export EDITOR=vim
export VISUAL=vim
export BROWSER=chromium
export FIGNORE=.svn     # prevents bash completion of svn directories

export CXX=g++
export SYSTEMC=/usr/local/systemc-2.2
export ARCH=linux64

# Code locations
#export MATLABPATH='/home/cwoodruf/matlab:/home/cwoodruf/sandbox/matlab_lib/trunk'
export XILINX_MAKEFILE=$HOME/xilinx/xilinx_makefile.mk
export AMD_DIR=$HOME/sandbox/amd/amd_rgm/RGM_Nallatech/trunk
export HDL_LIB=$HOME/sandbox/hdl_lib/trunk
#export HDL_LIB=$HOME/sandbox/hdl_lib/branches/piddp/feature_dataless
export PIDDP_DIR=$HOME/sandbox/piddp/trunk
export CONNECT_DIR=$HOME/sandbox/connect
export SVN='https://timphase.jpl.nasa.gov/svn'


# Aliases
alias ls='ls --color=auto'
alias pkgbk='comm -23 <(pacman -Qeq) <(pacman -Qmq) > ~/backup/pkglist; pacman -Qmq > ~/backup/pkglist_aur'
alias etckeeper='sudo etckeeper'
alias keys='xmodmap ~/.Xmodmap'
alias lock='xscreensaver-command -lock'
alias open='xdg-open'
alias mount_nearspace='sudo mount.cifs //nearspace1/cwoodruf /home/cwoodruf/nearspace -o username=cwoodruf,uid=cwoodruf,gid=users'
alias aoeu='setxkbmap us && xmodmap ~/.Xmodmap'
alias asdf='setxkbmap dvorak && xmodmap ~/.Xmodmap'


# Locations
alias dotfiles='cd ~/.homesick/repos/dotfiles/home'
alias amd='cd ~/sandbox/amd'
alias connect='cd ~/sandbox/connect'
alias hdl='cd ~/sandbox/hdl_lib/trunk'
alias piddp='cd ~/sandbox/piddp/trunk'
alias strs='cd ~/sandbox/connect/strstrunk/trunk'


# SSH
alias abidyne="ssh -Y cwoodruf@abidyne.jpl.nasa.gov"
alias cobra="ssh -Y cwoodruf@cobra.jpl.nasa.gov"
alias odo="ssh -Y cwoodruf@odo.jpl.nasa.gov"
alias timphase="ssh -Y cwoodruf@timphase.jpl.nasa.gov"
alias tadder="ssh -Y cwoodruf@tadder.jpl.nasa.gov"
alias tyr="ssh -Y cwoodruf@tyr.jpl.nasa.gov"
alias marsbrd1="ssh -Y chriswoodruff@marsbrd1.jpl.nasa.gov"
alias dline="ssh -Y cwoodruf@dline08.jpl.nasa.gov"
alias yeti='ssh -Y cwoodruf@yeti.homelinux.com'
alias connectlinux='ssh -Y cwoodruf@connect335linux.jpl.nasa.gov'
alias connectwin='rdesktop -g 1440x900 -P -z -x l -r sound:off -u cwoodruf connect335win:3389'


# Programs
alias chainsaw="/home/cwoodruf/bin/chainsaw_2_1/bin/chainsaw"
alias ise10="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/10.1/ISE/settings64.sh"
alias ise12="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/12.3/ISE_DS/settings64.sh"
alias ise13="export LM_LICENSE_FILE=2200@dhub-lmgr1,2200@dhub-lmgr2,2200@dhub-lmgr3 && source /opt/xilinx/13.2/ISE_DS/settings64.sh"
alias matlab="export LM_LICENSE_FILE=7282@cae-lmgr6,7282@cae-lmgr7,7282@cae-lmgr8 && /usr/local/bin/matlab -nosplash"     #-nodesktop
alias synpro="export LM_LICENSE_FILE=9998@dhub-lmgr1,9998@dhub-lmgr2,9998@dhub-lmgr3 && synplify_pro"
alias vsim="export LM_LICENSE_FILE=2020@dhub-lmgr1,2020@dhub-lmgr2,2020@dhub-lmgr3 && vsim"


# Sudo for pacman
pacman() {
  case $1 in
      (-Ss | -Si | -Q* | -T | -G)
          /usr/bin/pacman "$@" ;;
      (-S* | -R* | -U | *)
          /usr/bin/sudo /usr/bin/pacman "$@" ;;
  esac
}

# Ranger change directory on exit
ranger() {
    command ranger --fail-unless-cd $@ &&
    cd "$(grep \^\' ~/.config/ranger/bookmarks | cut -b3-)"
}
