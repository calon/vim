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
        let s:file_name = strftime("%Y%m%d%H%M%S")
        let s:full_path = join([s:save_path, s:file_name, s:save_suffix], '')
        execute "write" s:full_path
    elseif g:auto_save_option == 0
        execute "update"
    endif
endif

endfunction

" Set auto save option, if want to save file manually, you can change it to 0
let g:auto_save_option = 0

" Auto save when enter buffer
if has("autocmd") && g:auto_save_option == 1
    autocmd BufEnter * call Quick_save()
endif

" Define shortcut to quick save
nnoremap <silent> <leader>s :call Quick_save()<CR>

