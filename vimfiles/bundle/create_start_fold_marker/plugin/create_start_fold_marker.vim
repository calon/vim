" create_start_fold_marker.vim -- create start fold marker with level number
" plugin for Vim version 7.0 and above
" Home: http://www.vim.org/scripts/script.php?script_id=2891
" Author: Vlad Irnov  (vlad DOT irnov AT gmail DOT com)
" Version: 1.00, 2009-12-19
" Description: [[[
" This plugin helps insert start fold markers with level numbers: {{{1, {{{2,
" {{{3, and so on. It creates the following global mappings for Normal and
" Visual modes:
"
" <Leader>fm    Create start fold marker with level number. It is apppended to
"               the end of current line. The level is set to that of the
"               previous start fold marker with level number (if any). The
"               start fold marker string is obtained from option 'foldmarker'.
"
" <Leader>fM    Create fold marker as child: level number is incremented by 1.
"
" <Leader>cm    Create fold marker as comment according to buffer's filetype.
"               E.g., if filetype is html, <!--{{{1--> is appended. Dictionary
"               s:commentstrings defines comment strings for a few filetypes.
"               For all other filetypes, comment strings are obtained from
"               option 'commentstring'. If comment strings are not what you
"               want, you can edit dictionary s:commentstrings.
"
" <Leader>cM    Create fold marker as comment and as child.
" ]]]

if exists("g:loaded_create_start_fold_marker")
    finish
endif
let g:loaded_create_start_fold_marker = 'v1.0'

let s:cpo_save = &cpo
set cpo&vim

nnoremap <silent> <leader>f :call <SID>CreateMarker()<CR>
vnoremap <silent> <leader>f :call <SID>CreateMarker()<CR>
nnoremap <silent> <leader>fc :call <SID>CreateMarker('as_comment')<CR>
vnoremap <silent> <leader>fc :call <SID>CreateMarker('as_comment')<CR>
nnoremap <silent> <leader>ff :call <SID>CreateMarker('as_child')<CR>
vnoremap <silent> <leader>ff :call <SID>CreateMarker('as_child')<CR>
nnoremap <silent> <leader>ffc :call <SID>CreateMarker('as_child', 'as_comment')<CR>
vnoremap <silent> <leader>ffc :call <SID>CreateMarker('as_child', 'as_comment')<CR>

let s:commentstrings = {
    \ 'vim': '"%s',
    \ 'python': '#%s',
    \ 'perl': '#%s',
    \ 'ruby': '#%s',
    \ 'c': '//%s',
    \ 'tex': '%%s',
    \ 'html': "<!--%s-->" }

func! s:CreateMarker(...)
    if &ma==0 || &ro==1
        echo 'create_start_fold_marker.vim: BUFFER IS NOT EDITABLE'
        return
    endif
    let level = 1
    let [comment1, comment2] = ['','']
    let marker = split(&foldmarker, ',')[0]
    "let lnum = search('{{{\d\+', 'bnW') "}}}
    let [lnum, cnum] = searchpos('\V\C'.marker.'\d\+', 'bnW')
    if lnum
        let level = matchlist(getline(lnum), '\V\C'.marker.'\(\d\+\)', cnum-1)[1]
        if index(a:000, 'as_child')>=0
            let level+=1
        endif
    endif

    if index(a:000, 'as_comment')>=0
        if has_key(s:commentstrings, &ft)
            let [comment1, comment2] = split(s:commentstrings[&ft], '\V\C%s', 1)
        else
            let [comment1, comment2] = split(&commentstring, '\V\C%s', 1)
        endif
    endif

"    if &ft==#'text'
"        call setline('.', '--- '.getline('.').' ---')
"        normal! 4l
"    endif
    call setline('.', getline('.').' '.comment1.marker.level.comment2)
endfunc

let &cpo = s:cpo_save
unlet s:cpo_save
" vim: fdm=marker fmr=[[[,]]] fdl=0
