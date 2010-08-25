"============================================================================
" General settings
"----------------------------------------------------------------------------
set nocompatible        " nocp:  turn off vi compatibility
set undolevels=1000     " ul:  lots and lots of undo
set history=1000        " hi:  size of :command history
"set modelines=20
"set modeline            " ml:  Turn on modelines

set ai                  " always set autoindenting on
set backup              " keep a backup file
set ruler               " show the cursor position all the time
set number
set hidden              " Allow switching of buffers without saving
set scrolloff=0         " Keep the cursor from getting to the edge

if has("gui_running")   " GUI is running or is about to start.
"    set lines=85 columns=100 
    set guioptions-=T
    set guioptions-=m
else
    " This is console Vim.
    if(&term == 'rxvt-256color' || &term =~? '^screen')
        " On my machine, I use urxvt with 256 color support
        set t_Co=256
    endif
endif
                        

filetype on
filetype plugin on
filetype indent on
syntax on 

"============================================================================
" Colors
"----------------------------------------------------------------------------
colorscheme vylight

"============================================================================
" Presentation
"----------------------------------------------------------------------------
set shortmess=aIoO      " sm:  really short messages, don't show intro
set showmode            " smd:  show the current input mode
set more                " more:  page on extended output
set errorbells          " eb:  ring bell on error messages
set novisualbell        " novb:  turn of visual bell
set noequalalways       " noea:  don't always keep windows at equal size
set splitbelow          " sb:  splitted window appears below current one

"============================================================================
" Statusline, Ruler
"----------------------------------------------------------------------------
"set laststatus=2        " ls:  always put a status line
"set statusline=%([%-n]%y%1*%m%*\ %f%R%)\ %{CurrSubName()}\ %=\ %(%l,%c%V\ %P\ [0x%02.2B]%)
"hi User1 term=inverse,bold cterm=bold ctermfg=red ctermbg=white
"set maxfuncdepth=1000   " Need more depth for sub names

"============================================================================
" Filename Autocompletion
"----------------------------------------------------------------------------
set wildchar=<Tab>          " wc:  tab does autocompletion
set wildmode=longest,list   " wim:  bash-style autocompletion
" wig:  when autocompleting, ignore certain files
set wildignore=*~,#*#,*.sw?,*.o,*.class,*.java.html,*.cgi.html,*.html.html,.viminfo,*.pdf,*.mp3

"============================================================================
" Search and Replace
"----------------------------------------------------------------------------
set incsearch           " is:  show partial matches as search is entered
set hlsearch            " hls:  highlight search patterns
set ignorecase          " Ignore case distinction when searching
set smartcase           " ... unless there are capitals in the search string.
"set nowrapscan          " Don't wrap to top of buffer when searching

"============================================================================
" Tab Standards
"----------------------------------------------------------------------------
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set expandtab 

"============================================================================
" Sessions
"----------------------------------------------------------------------------
set sessionoptions=blank,buffers,curdir,folds,help,resize,tabpages,winsize
nmap SQ <ESC>:mksession! ~/sessions/default.vim<CR>:wqa<CR>
nmap SSA :wa<CR>:mksession! ~/sessions/
nmap SO :wa<CR>:so ~/sessions/

"============================================================================
" Maps
"----------------------------------------------------------------------------
:let mapleader = ","
