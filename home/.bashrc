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
alias amd='cd ~/sandbox/amd/amg_rgm'
alias connect='cd ~/sandbox/connect'
alias hdl='cd ~/sandbox/hdl_lib'
alias piddp='cd ~/sandbox/piddp'
alias lri='cd ~/sandbox/lri'


# SSH
alias abidyne='ssh -Y cwoodruf@abidyne.jpl.nasa.gov'
alias cobra='ssh -Y cwoodruf@cobra.jpl.nasa.gov'
alias dline06='ssh -Y cwoodruf@dline06.jpl.nasa.gov'
alias dline07='ssh -Y cwoodruf@dline07.jpl.nasa.gov'
alias dline08='ssh -Y cwoodruf@dline08.jpl.nasa.gov'
alias dline09='ssh -Y cwoodruf@dline09.jpl.nasa.gov'
alias gfoarch='ssh -Y cwoodruf@gfoarch.jpl.nasa.gov'
alias lrp0='rdesktop -g 2560x1600 -P -z -x l -r sound:off -u cwoodruf lrp0:3389'
alias marsbrd1='ssh -Y chriswoodruff@marsbrd1.jpl.nasa.gov'
alias tadder='ssh -Y cwoodruf@tadder.jpl.nasa.gov'
alias thor='ssh -Y cwoodruf@thor.jpl.nasa.gov'
alias timphase='ssh -Y cwoodruf@timphase.jpl.nasa.gov'
alias yeti='ssh -Y cwoodruf@yeti.homelinux.com'


# Programs
alias rtems4.10='export PATH=/opt/rtems-4.10/bin:/opt/sparc-elf-4.6.0/bin:$PATH'
alias accurev='export PATH=/opt/accurev/bin:$PATH'
alias altera='export PATH=/opt/altera/11.0/quartus/bin:$PATH'
alias atrenta='export PATH=/opt/Atrenta/SpyGlass-5.0.0.3/SPYGLASS_HOME/bin:$PATH'
alias synopsys='export PATH=/opt/synopsys/G-2012.09-SP1/bin:$PATH'
alias ise10.1='source /opt/Xilinx/10.1/ISE/settings64.sh'
alias ise12.4='source /opt/Xilinx/12.4/ISE_DS/settings64.sh'
alias ise13.2='source /opt/Xilinx/13.2/ISE_DS/settings64.sh'
alias ise13.4='source /opt/Xilinx/13.4/ISE_DS/settings64.sh'
alias ise14.2='source /opt/Xilinx/14.2/ISE_DS/settings64.sh'
alias vivado14.2='export PATH=/opt/Xilinx/Vivado/2012.4/bin:$PATH'
alias libero10.0='export PATH=/opt/microsemi/Libero_v10.0/Libero/bin:$PATH'
alias libero10.1='export PATH=/opt/microsemi/Libero_v10.1/Libero/bin:$PATH'
alias modelsim10.0c='export PATH=/opt/mentor/modelsimse10.0c/modeltech/bin:$PATH'
alias modelsim10.1d='export PATH=/opt/mentor/modelsimse10.1d/modeltech/bin:$PATH'
alias modelsim10.2='export PATH=/opt/mentor/modelsimse10.2/modeltech/bin:$PATH'
alias questa10.1d='export PATH=/opt/mentor/questa10.1d/questasim/bin:$PATH'
alias questa10.2='export PATH=/opt/mentor/questa10.2_1/questasim/bin:$PATH'
alias gaisler='export GRMON_SHARE=/opt/gaisler/grmon-eval-2.0.33/linux/share && export LD_LIBRARY_PATH=/opt/gaisler/grmon-eval-2.0.33/linux/lib:$LD_LIBRARY_PATH && export PATH=/opt/gaisler/grmon-eval-2.0.33/linux/bin:$PATH'
#alias matlabr2011a='export PATH=/opt/MATLAB/R2011a/bin:$PATH'
alias matlabr2012b='export PATH=/opt/MATLAB/R2012b/bin:$PATH'
alias magicdraw='export PATH=/opt/magicdraw/17.0.1/bin:$PATH'
alias syscntrltools='export PATH=/opt/Atrenta/SpyGlass-5.0.0.3/SPYGLASS_HOME/bin:/opt/synopsys/G-2012.09-SP1/bin:/opt/microsemi/Libero_v10.0/Libero/bin:/opt/mentor/modelsimse10.1d/modeltech/bin:$PATH'
alias sciencetools='export PATH=/opt/Atrenta/SpyGlass-5.0.0.3/SPYGLASS_HOME/bin:/opt/synopsys/G-2012.09-SP1/bin:/opt/synopsys/G-2012.09-SP1/bin:/opt/mentor/modelsimse10.1d/modeltech/bin:$PATH && source /opt/Xilinx/13.2/ISE_DS/settings64.sh'
alias flighttools='export PATH=/opt/Atrenta/SpyGlass-5.0.0.3/SPYGLASS_HOME/bin:/opt/synopsys/G-2012.09-SP1/bin:/opt/microsemi/Libero_v10.0/Libero/bin:/opt/mentor/questa10.1d/questasim/bin:$PATH && source /opt/Xilinx/13.2/ISE_DS/settings64.sh'
alias soctools='export PATH=/opt/Atrenta/SpyGlass-5.0.0.3/SPYGLASS_HOME/bin:/opt/synopsys/G-2012.09-SP1/bin:/opt/microsemi/Libero_v10.0/Libero/bin:/opt/mentor/questa10.1d/questasim/bin:/opt/Xilinx/Vivado/2012.2/bin:$PATH'

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
