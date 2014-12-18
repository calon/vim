" Vim Escape Search 1.0 December 2014
" A simple way to escape characters that would otherwise have a special meaning
" in Vim search expressions.
" Usgae:
"   Source this file, or copy the line into your .vimrc.
"   Start typing a search, e.g.:
"   /http://www.vim.org/
"   Before pressing Enter, press F7 to escape the search.:
"   /http:\/\/www\.vim\.org\/
" Author:
"   Rolf Asmund

cnoremap <F7> q/k:let h=getline('.'):q/=escape(h, "*.\\/[")
