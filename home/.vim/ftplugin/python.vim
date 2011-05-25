" Python files
" Language:	        Python
" Maintainer:	    Chris Woodruff
" Original Author:  Chris Woodruff
" Last Change:      2011 April 18

" Only load this indent file when no other was loaded.
if exists("b:did_ftpython")
    finish
endif
let b:did_ftpython = 1

" Execute file being edited with <Shift> + e:
map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>
