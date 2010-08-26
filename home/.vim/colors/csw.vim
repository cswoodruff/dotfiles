" Vim color file
" Maintainer:   Chris Woodruff
" Last Change:  
" Email:        

set background=light
hi clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="csw"

hi Normal		guifg=black			guibg=white
hi Title		guifg=black
hi Cursor		guifg=white			guibg=#777777
hi LineNr		guifg=#777777		guibg=white
hi Visual		guibg=#bbddff
hi StatusLine	guifg=black			guibg=#dddddd       gui=none
hi StatusLineNC	guifg=#dddddd		guibg=#dddddd       gui=none
hi VertSplit	guibg=#dddddd		guifg=#dddddd       gui=none
hi NonText		guifg=orange		guibg=white
hi Search		guibg=yellow
hi Directory	guifg=darkblue
hi WarningMsg	guifg=red
hi ErrorMsg		guifg=#f03050		guibg=#eeeeee       gui=none
hi Error		guifg=white			guibg=red           gui=none
hi MoreMsg												gui=none
hi ModeMsg												gui=none

" Syntax highlighting
hi Comment		guifg=#777777							gui=none
hi Conditional	guifg=blue								gui=none
hi Constant		guifg=darkred							gui=none
hi Delimiter	guifg=darkblue							gui=none
hi Identifier	guifg=darkgreen							gui=none
hi Keyword		guifg=darkgreen							gui=none
hi Operator		guifg=darkblue							gui=none
hi Preproc		guifg=darkcyan							gui=none
hi Special		guifg=darkblue							gui=none
hi Statement	guifg=blue								gui=none
hi Todo			guifg=black			guibg=yellow		gui=none
hi Type			guifg=darkmagenta						gui=none

hi link Function        Normal
hi link Character       Constant
hi link String          Constant
hi link Boolean         Constant
hi link Number          Constant
hi link Float           Number
hi link Repeat          Conditional
hi link Label           Statement
hi link Exception       Statement
hi link Include         PreProc
hi link Define          PreProc
hi link Macro           PreProc
hi link PreCondit       PreProc
hi link StorageClass    Type
hi link Structure       Type
hi link Typedef         Type
hi link Tag             Special
hi link SpecialChar     Special
hi link SpecialComment  Special
hi link Debug           Special
