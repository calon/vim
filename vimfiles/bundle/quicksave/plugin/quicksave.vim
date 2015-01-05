
function! Quick_save()

    " You can customize path here
    let g:quick_save_path = expand($VIM . '/' . "backup" . '/')

    " Check buffer type, do not save special buffer
    if &buftype == ''
        if bufname("%") == ''
            let s:save_path = g:quick_save_path

            " Check whether the path exists, create directory when it doesn't exist.
            if !isdirectory(s:save_path)
                silent! call mkdir(s:save_path, "p")
            endif

            " Set path and suffix for quick save file.
            let s:save_suffix = ".txt"
            " get and trim first line.
            let s:title = s:trim(getline(1))
            if g:save_first_line_as_title == 1 && len(s:title) > 0
                let s:file_name = join ([s:title, strftime("%Y%m%d")], '_')
            else
                let s:file_name = strftime("%Y%m%d%H%M%S")
            endif

            let s:full_path = join([s:save_path, s:file_name, s:save_suffix], '')
            execute "write" s:full_path
        elseif g:auto_save_option == 0
            execute "update"
        endif
    endif
endfunction

function! s:trim(str) " trim whitespace and special characters
    let string = a:str
    let string = substitute(string, '^\s\+', '', '')
    let string = substitute(string, '\s\+$', '', '')
    let string = substitute(string, '[\/\\\:\*\?\"\<\>\|]*', '', 'g')
    let string = substitute(string, '\s\+', '_', 'g')
    return string
endfunction

" Set auto save option, if want to save file manually, you can change it to 0
let g:auto_save_option = 0

" Auto save when enter buffer
if has("autocmd") && g:auto_save_option == 1
    autocmd BufEnter * call Quick_save()
endif

" Define shortcut to quick save
if !mapcheck("<leader>s", "n")
    nnoremap <silent> <leader>s :call Quick_save()<CR>
endif

let g:save_first_line_as_title = 1
