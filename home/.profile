# Turn off beep
setterm -blength 0

# Add local bin to PATH
export PATH=$PATH:/home/cwoodruf/bin:/home/cwoodruf/.gem/ruby/1.9.1/bin

# start keychain
/usr/bin/keychain id_rsa
[ -z "$HOSTNAME" ] && HOSTNAME=`uname -n`
[ -f $HOME/.keychain/$HOSTNAME-sh ] && \
    . $HOME/.keychain/$HOSTNAME-sh
# Set up keychain
#source ~/.keychain/`uname -n`-sh

# Set up directory listing colors
eval `dircolors ~/.dircolors`

# Environment variables
export PAGER=/usr/bin/less
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
export BROWSER=/usr/bin/chromium
export BUP_DIR=/media/BACKUP
export TMP=$HOME/tmp
export FIGNORE=.svn     # prevents bash completion of svn directories
export CXX=g++
export SYSTEMC=/usr/local/systemc-2.2
export ARCH=linux64

# License Variables
export MGLS_LICENSE_FILE='2020@cae-lmgr1,2020@cae-lmgr2,2020@cae-lmgr3'
export XILINXD_LICENSE_FILE='2200@cae-lmgr1,2200@cae-lmgr2,2200@cae-lmgr3'
export ACTLMGRD_LICENSE_DAEMON='29003@cae-lmgr1,29003@cae-lmgr2,29003@cae-lmgr3'
export MLM_LICENSE_FILE='7282@cae-lmgr6,7282@cae-lmgr7,7282@cae-lmgr8'
export SNPSLMD_LICENSE_FILE='9998@cae-lmgr1,9998@cae-lmgr2,9998@cae-lmgr3'

# Code locations
export CHROOT=$HOME/chroot
#export MATLABPATH='/home/cwoodruf/matlab:/home/cwoodruf/sandbox/matlab_lib/trunk'
export XILINX_MAKEFILE=$HOME/xilinx/xilinx_makefile.mk
export AMD_DIR=$HOME/sandbox/amd/amd_rgm
export HDL_LIB=$HOME/sandbox/hdl_lib
export HDL_LIB_LISA=$HOME/sandbox/lisa/hdl_lib
export LISA_DIR=$HOME/sandbox/lisa/lisa
export LRI_DIR=$HOME/sandbox/lri
export PIDDP_DIR=$HOME/sandbox/piddp/trunk
export CONNECT_DIR=$HOME/sandbox/connect
export THREE_NOISE_TEST=$HOME/sandbox/threenoisetest
export SVN="https://timphase/svn"
export LRI="$SVN/gracefo-lri-fpga"

. $HOME/.bashrc
