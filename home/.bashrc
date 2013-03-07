# .bashrc

# If not running interactively, dont do anything
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

# Turn on vi key bindings for readline
set -o vi   

# Set up keychain
source ~/.keychain/`uname -n`-sh

# Set up directory listing colors
eval `dircolors ~/.dircolors`

# Environment variables
export PATH=$PATH:/home/cwoodruf/bin:/home/cwoodruf/.gem/ruby/1.9.1/bin
export PAGER=/usr/bin/less
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export BROWSER=/usr/bin/chromium
export BUP_DIR=/media/BACKUP
export TMP=$HOME/tmp
export FIGNORE=.svn     # prevents bash completion of svn directories
export CXX=g++
export ARCH=linux64

# Code locations
#export MATLABPATH='/home/cwoodruf/matlab:/home/cwoodruf/sandbox/matlab_lib/trunk'
export XILINX_MAKEFILE=$HOME/xilinx/xilinx_makefile.mk
export HDL_LIB=$HOME/sandbox/hdl_lib
export PIDDP_DIR=$HOME/sandbox/piddp/trunk
export THREE_NOISE_TEST=$HOME/sandbox/threenoisetest
export SVN="https://timphase/svn"

# Common
alias ls='ls --color=auto'
alias p='pushd'
alias o='popd'
alias d='dirs'
alias pkgbk='comm -23 <(pacman -Qeq|sort) <(pacman -Qmq|sort) > ~/backup/pkglist; pacman -Qmq > ~/backup/pkglist_aur'
alias etckeeper='sudo etckeeper'
alias lock='xscreensaver-command -lock'
alias open='mimeo'
alias aoeu='setxkbmap us'
alias asdf='setxkbmap dvorak'
alias mirrors='sudo reflector -l 5 --sort rate --save /etc/pacman.d/mirrorlist && cat /etc/pacman.d/mirrorlist'
alias vi='vim'


# Remote Mounts
alias windows='sudo mount -t ntfs-3g /dev/sdc1 /mnt/windows'
alias gfolri='sudo mount.cifs //gfolri/share /mnt/gfolri -o username=cwoodruf,credentials=/home/cwoodruf/.cifs_credentials,uid=cwoodruf'
alias nearspace='sudo mount.cifs //nearspace1.jpl.nasa.gov/cwoodruf ~/nearspace -o workgroup=jpl,username=cwoodruf,credentials=/home/cwoodruf/.cifs_credentials,sec=ntlmssp'


# Locations
alias dotfiles='cd ~/.homesick/repos/dotfiles/home'
alias hdl='cd ~/sandbox/hdl_lib'
alias piddp='cd ~/sandbox/piddp'
alias soc='cd ~/soc/grlib/designs/leon3-xilinx-kc705'


# SSH
alias abidyne='ssh -Y cwoodruf@abidyne.jpl.nasa.gov'
alias cobra='ssh -Y cwoodruf@cobra.jpl.nasa.gov'
alias dline06='ssh -Y cwoodruf@dline06.jpl.nasa.gov'
alias dline07='ssh -Y cwoodruf@dline07.jpl.nasa.gov'
alias dline08='ssh -Y cwoodruf@dline08.jpl.nasa.gov'
alias dline09='ssh -Y cwoodruf@dline09.jpl.nasa.gov'
alias gfoarch='ssh -Y cwoodruf@gfoarch.jpl.nasa.gov'
alias lrp0='rdesktop -g 2560x1600 -P -z -x l -r sound:off -d JPL -u cwoodruf lrp0:3389'
alias marsbrd1='ssh -Y chriswoodruff@marsbrd1.jpl.nasa.gov'
alias tadder='ssh -Y cwoodruf@tadder.jpl.nasa.gov'
alias thor='ssh -Y cwoodruf@thor.jpl.nasa.gov'
alias timphase='ssh -Y cwoodruf@timphase.jpl.nasa.gov'
alias yeti='ssh -Y cwoodruf@yeti.homelinux.com'


# Programs
alias chainsaw='/home/cwoodruf/bin/chainsaw_2_1/bin/chainsaw'


# Sudo for pacman
pacman() {
  case $1 in
      (-Ss | -Si | -Q* | -T | -G | --version)
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
