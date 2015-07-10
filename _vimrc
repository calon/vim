" 通用 {{{1
set nocompatible " 如果使用兼容模式，后续设置会使用 Vi 的一些设置
" source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin " 使用更接近 Windows 的操作配置
set t_Co=256
source $VIM/vimrc_path.vim
set browsedir=buffer

" 界面 {{{1

" 进入后最大化窗口 {{{2
if has("autocmd")
  "autocmd bufwritepost .vimrc source $MYVIMRC
  autocmd GUIEnter * simalt ~x
endif


" 文件、语法和颜色主题 {{{2
"set filetype=txt " 设置默认文件类型
set syntax=txt " 设置默认语法类型
" 设置默认颜色主题
" if has("gui_running")
"     colorscheme ir_black
" else
"     colorscheme desert256.vim
" endif
set synmaxcol=1024

" 字体设置 {{{2
set guifont=Yahei_Mono:h11 " GUI 版本使用的字体列表。
set guifontwide=Yahei_Mono:h11 " 如果非空，指定逗号分隔的用于双宽字符的字体列表。


" 提示信息 {{{2
set showcmd " 在屏幕最后一行显示 (部分的) 命令
set shortmess=aoOtTI " 缩写某些提示信息
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号
set list " 显示特殊字符
set listchars=tab:>-,nbsp:.

" 光标和标尺 {{{2
" set cursorline " 显示光标所在行背景颜色
" set ruler " 显示光标位置的行号和列号
set number " 显示行号
autocmd BufWinLeave * setlocal nocursorline " 非当前缓冲区取消高亮光标所在行
autocmd BufWinEnter * setlocal cursorline " 当前缓冲区高亮光标所在行


set backspace=2 " 退格会删除缩进、换行符和插入的起始位置
set iskeyword+=_,$,@,%,#,- " 定义一个word中可以包含哪些字符。"@"在这里代指所有的字母。

" 打开文件时回到上次光标所在的位置
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif

" GUI {{{2
if has('mouse') " 所有模式下允许使用鼠标
  set mouse=a
endif  

set guioptions=ehrv " 菜单、滚动条、工具栏、对话框等的设置，去掉m（菜单栏）和T（工具栏）

" 屏幕显示 {{{2
set scrolloff=3 " 光标上下两侧最少保留的屏幕行数
set sidescrolloff=8 " 光标左右两侧最少保留的屏幕列数
set whichwrap=b,s,<,>,[,] "对某一个或几个按键开启到头后自动折向下一行的功能
set lazyredraw " 执行宏、寄存器和其它不通过输入的命令时屏幕不会重画
set linebreak

" 状态栏设置 {{{2
set laststatus=2 " 总是显示状态行

"if has('statusline')
  "set statusline=%m  " 修改标志位
  "set statusline+=%r  " 只读标志位
  "set statusline+=%h  " 帮助缓冲区标志位
  "set statusline+=%w  " 预览窗口标志位
  "set statusline+=[%Y] " 文件类型
  "set statusline+=[%{&ff}]  " 文件格式
  "set statusline+=[%l\/%L,\ %v,\ %p%%]  " 光标位置、文件行数和窗口在文件位置的百分比
  "set statusline+=[%{(&fenc)}] " 文件编码
  "set statusline+=%#StatusLine#
  "set statusline+=[%t]  " 文件名
  "set statusline+=[%{FileSize()}]  " 文件大小
  "set statusline+=[#%n]  " 缓冲区号
  "set statusline+=[%{strftime(\"%Y\-%m\-%d\ %H\:%M\",getftime(expand(\"%:p\")))}]
"endif

" let g:airline_powerline_fonts = 1
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#show_buffers = 1
" let g:airline#extensions#tabline#show_tab_nr = 1
" let g:airline#extensions#tabline#show_tab_type = 1
" let g:airline#extensions#tabline#buffer_idx_mode = 1
"   nmap <leader>1 <Plug>AirlineSelectTab1
"   nmap <leader>2 <Plug>AirlineSelectTab2
"   nmap <leader>3 <Plug>AirlineSelectTab3
"   nmap <leader>4 <Plug>AirlineSelectTab4
"   nmap <leader>5 <Plug>AirlineSelectTab5
"   nmap <leader>6 <Plug>AirlineSelectTab6
"   nmap <leader>7 <Plug>AirlineSelectTab7
"   nmap <leader>8 <Plug>AirlineSelectTab8
"   nmap <leader>9 <Plug>AirlineSelectTab9

" 窗口标题设置 {{{2
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%F\  " file name
    set titlestring+=%h%m%r%w " flag
    set titlestring+=\ -\ %{v:progname} " program name
endif


" 命令行 {{{2
set wildmenu " 打开命令行补全功能

" 选择 {{{2
set selection=inclusive " 选择区的最后一个字符包含在操作范围之内
set selectmode="" " 指定什么场合开始选择时启动选择模式而不是可视模式

" 文件、缓冲区和会话 {{{1

" 备份、临时文件 {{{2
set backup " 自动生成备份文件
set writebackup " 覆盖文件前建立备份
set noswapfile " 取消交换文件
" set updatecount=30 " 输入这么多个字符以后，把交换文件写入磁盘

" 历史和会话信息 {{{2
set history=500		" keep 50 lines of command line history
set sessionoptions=blank,curdir,folds,help,resize,tabpages,winpos,winsize " 保存和恢复会话时，同时保存和恢复的设置类型

" 缓冲区 {{{2
set hidden " 退出时隐藏而不是卸载缓冲区
set confirm " 某些因为缓冲区有未保存的改变而失败的操作会弹出对话框要求确认

" 快速切换缓冲区

" nnoremap <Tab> :bnext<CR>
" nnoremap <C-Tab> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>
nnoremap <C-Left> :bprevious<CR>

let c = 1
while c <= 49
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile

nnoremap <leader>x :bd<CR>

" 撤销文件 {{{2
" set undodir=E:\\Bak\\txt " 撤销文件目录
set undofile
" set undolevels = 1000 "maximum number of changes that can be undone
" set undoreload = 10000 "maximum number lines to save for undo on a buffer reload


" 文档处理设置 {{{1

" 制表和缩进 {{{2

if has("autocmd")

  " 开启文件类型侦测
  " 开启基于文件类型的自动缩进
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" set autoindent " 自动缩进
set smartindent " 智能缩进
set tabstop=4 " 制表符相当于4个空格
set softtabstop=4 " 插入制表符或者使用退格删除制表符时，把制表符算作4个空格
set shiftwidth=4 " 缩进一步对应的空格数
set expandtab " 插入模式里: 插入制表符时使用合适数量的空格。如果 'autoindent' 打开，'>' 和 '<' 命令使用空格进行缩进。
" set smarttab " use tabs at the start of a line, spaces elsewhere
set shiftround " 缩进取整到 shiftwidth 的倍数。应用于 > 和 < 命令。
" 针对 Web 开发，统一缩进2个空格
autocmd BufNewFile,BufRead *.html,*.htm,*.css,*.js set tabstop=2 softtabstop=2 shiftwidth=2

" 语言、字符编码、输入法设置和排版 {{{2
let &termencoding=&encoding
set encoding=utf-8 " 内部使用的字符编码为UTF-8
set fileencodings=utf-8,chinese,ucs-bom,gb18030,gbk,gb2312,cp936 "编辑已存在文件时，参考此字符编码列表
set helplang=cn " 帮助文件语言为中文
set langmenu=zh_CN.UTF-8 " 菜单语言选项
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8 " 弹出信息语言选项
set ambiwidth=double " 把所有的“不明宽度”字符——指的是在 Unicode 字符集中某些同时在东西方语言中使用的字符，如省略号、破折号、书名号和全角引号，在西方文字中通常字符宽度等同于普通 ASCII 字符，而在东方文字中通常字符宽度等同于两倍的普通 ASCII 字符，因而其宽度“不明”——的宽度置为双倍字符宽度（中文字符宽度）。此数值只在 encoding 设为 utf-8 或某一 Unicode 编码时才有效。需要额外注意的是，如果你通过终端使用 Vim 的话，需要令终端也将这些字符显示为双宽度。
set imcmdline " 开始编辑命令行时总是打开输入方法
set formatoptions+=1Bjmn

" 搜索 {{{2

" 保持搜索结果在屏幕正中
nnoremap n nzzzv
nnoremap N Nzzzv

" 开启搜索高亮TrueType Collection
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set incsearch " 即时跳转到搜索目标所在行
set ignorecase " 搜索时忽略大小写
set smartcase " 搜索小写忽略大小写

" 剪贴板、寄存器 {{{2
set clipboard=unnamed "与系统共剪贴板

" 优化大文件编辑 {{{2

"if !exists("my_auto_commands_loaded")
        "let my_auto_commands_loaded = 1
        "let g:LargeFile = 1024 * 1024 * 100
        "augroup LargeFile
                "autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
        "augroup END
"endif

" 拼写检查 {{{2
if version >= 700
   " set spl=en spell
   set nospell
endif

" 列块编辑选项 {{{2
set virtualedit+=block
" 按键映射 {{{1

" 通用按键映射 {{{2

" 进入命令行
nnoremap <silent> ; :

" 复制到行末
nnoremap Y y$

" 切换当前目录
nnoremap <F1> :lcd %:p:h<CR>

" 切换显示绝对或相对行号
nnoremap <F2> <Esc>:call ToggleRelativeNumber()<CR>
inoremap <F2> <Esc>:call ToggleRelativeNumber()<CR>

" 显示/禁止搜索高亮
nnoremap <F3> <Esc>:call ToggleHLSearch()<CR>
inoremap <F3> <Esc>:call ToggleHLSearch()<CR>

" 插入时间戳
nnoremap <F4> a<C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR><Esc>
inoremap <F4> <C-R>=strftime("%Y-%m-%d %H:%M:%S")<CR>

" UndoTree 显示撤销历史
nnoremap <F5> <Esc>:UndotreeToggle<CR>
inoremap <F5> <Esc>:UndotreeToggle<CR>

" 启用/禁止折行
nnoremap <F6> <Esc>:call ToggleWrap()<CR>
inoremap <F6> <Esc>:call ToggleWrap()<CR>

" 切换语法高亮
nnoremap <F7> <Esc>:call ToggleSyntaxHighlight()<CR>
inoremap <F7> <Esc>:call ToggleSyntaxHighlight()<CR>

function! ToggleSyntaxHighlight()
     if exists("g:syntax_on")
          syntax off
     else
          syntax enable
     endif
endfunction

" Locate 搜索清单
nnoremap <A-F7> <Esc>:L<SPACE>
inoremap <A-F7> <Esc>:L<SPACE>

" TagList Toggle
nnoremap <F8> :TlistToggle<CR>


" 新建缓冲区
nnoremap <F10> <Esc>:enew<CR>
inoremap <F10> <Esc>:enew<CR>

" 关闭缓冲区
nnoremap <C-F10> <Esc>:bdelete<CR>
inoremap <C-F10> <Esc>:bdelete<CR>

" 标签页操作
nnoremap <leader>tn :tabnew<CR>
"nnoremap <leader>tc :tabclose<CR>

" 快速保存 Quick save
nnoremap <F12> <Esc>:call Quick_save()<CR>
inoremap <F12> <Esc>:call Quick_save()<CR>a

" 打开另存为对话框
nnoremap <C-F12> <Esc>:browse saveas<CR>
inoremap <C-F12> <Esc>:browse saveas<CR>

" 普通模式下 Ctrl+c 复制文件路径
nnoremap <c-c> :let @* = expand('%:p')<CR>

" 编辑配置文件
nnoremap <leader>ev :e $MYVIMRC<CR>

nnoremap <leader>sv :source $MYVIMRC<CR>

function! ToggleWrap()
     if &wrap
          set nowrap
     else
          set wrap
     endif
endfunction

function! ToggleHLSearch()
     if &hls
          set nohls
     else
          set hls
     endif
endfunction

function! ToggleRelativeNumber()
    if( &nu == 1 )
        set nonu
        set rnu
    else
        set nu
        set nornu
    endif
endfunction

" 缩进操作
vnoremap < <gv
vnoremap > >gv

" 粘贴文本后跳到最后的位置
vnoremap y y`]
vnoremap p p`]
nnoremap p p`]

" 移动 {{{2

" 窗口间跳转
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
nnoremap <S-Up> <C-W><Up>
nnoremap <S-Down> <C-W><Down>
nnoremap <S-Left> <C-W><Left>
nnoremap <S-Right> <C-W><Right>

" 上下移动
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" 上下翻页
nnoremap <Space> <C-F>
nnoremap <BackSpace> <C-B>

" 标签页跳转
" nnoremap <silent> <C-Right> :tabnext<CR>
" nnoremap <silent> <C-Left> :tabprevious<CR>


" 在插入模式下移动方向
" inoremap <C-h> <Left>
" inoremap <C-l> <Right>
" inoremap <C-j> <Down>
" inoremap <C-k> <Up>

" 快速跳转缓冲区
let i = 1
while i <= 99
  execute 'nnoremap <leader>' . i . ' <ESC>:b' . i . '<CR>'
  let i = i + 1
endwhile  

" 折叠 {{{2
nnoremap f za
nnoremap , f
set foldenable " 开始折叠
set foldmethod=marker " 设置语法折叠
setlocal foldlevel=1 " 设置折叠层数
" set foldclose=all " 设置为自动关闭折叠 
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
set foldtext=CustomFoldText()
set foldopen=block,hor,jump,mark,percent,quickfix,search,tag,undo

function! CustomFoldText()
    "get first non-blank line
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif

    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldLevelStr.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage . foldLevelStr
endf

let g:html_dynamic_folds = 1

" function! NeatFoldText()
"   let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
"   let lines_count = v:foldend - v:foldstart + 1
"   let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
"   let foldchar = matchstr(&fillchars, 'fold:\zs.')
"   let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
"   let foldtextend = lines_count_text . repeat(foldchar, 8)
"   let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
"   return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
" endfunction


" 插件管理和配置 {{{1

" Pathogen  {{{2
call pathogen#infect()

" Calendar {{{2
let g:calendar_monday = 1 "以星期一为开始 
let g:calendar_focus_today = 1 " 光标在当天的日期上 
let g:calendar_mark = 'left-fit' "可以让*和数字可靠近 

" Voom  {{{2
nnoremap <leader>vm <Esc>:VoomToggle markdown<CR>
nnoremap <F11> <Esc>:VoomToggle markdown<CR>
nnoremap <C-F11> <Esc>:VoomToggle<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
"if !exists(":DiffOrig")
  "command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  "\ | wincmd p | diffthis
"endif

" EasyAlign {{{2
" Start interactive EasyAlign in visual mode
" vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign with a Vim movement
" nmap <Leader>a <Plug>(EasyAlign)

" MiniBufExpl {{{2
" let g:miniBufExplCheckDupeBufs = 0

" CtrlP {{{2
"let g:ctrlp_cmd = 'CtrlPMRUFiles'

" Neocomplete {{{2
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Disbale ignore case
let g:neocomplete#enable_ignore_case = 0

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Search from neocomplete, omni candidates, vim keywords.
let g:neocomplete#fallback_mappings =
\ ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" complete from all buffers
let g:neocomplete#same_filetypes = {}
let g:neocomplete#same_filetypes._ = '_'

" SuperTab {{{2

" let g:SuperTabNoCompleteAfter = ['^', ',', '\s', '"', "'"]
" let g:SuperTabDefaultCompletionType = "<c-n>"

" Vim-Notes
" nnoremap <F8> <Esc>:Note<CR>
" let g:notes_suffix = '.txt'
" let g:notes_tab_indents = 0

" TagList

let Tlist_Show_One_File = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_Menu = 1

" Unite.vim {{{2

nnoremap <C-p> :Unite -no-split -auto-resize -buffer-name=MRU_File file_mru<CR>

autocmd FileType unite call s:unite_settings()

function! s:unite_settings()
  let b:SuperTabDisabled=1
  setlocal noswapfile undolevels=-1
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction

" For ag/silver searcher

" if executable('ag')
"   " Use ag in unite grep source.
"   let g:unite_source_grep_command = 'ag'
"   let g:unite_source_grep_default_opts =
"         \ '--line-numbers --nocolor --nogroup --hidden --ignore ' .
"         \  '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
"   let g:unite_source_grep_recursive_opt = ''
" endif

" Yank history

let g:unite_source_history_yank_enable = 1
nnoremap <Leader>y :Unite -no-split -start-insert -auto-resize -buffer-name=Yank_History history/yank<CR>

nnoremap <Leader><Leader> :Unite -no-split -auto-resize -buffer-name=Buffer_List buffer<CR>

" Unite Menu

nnoremap <F9> :Unite -auto-resize -buffer-name=Unite_Menu menu<CR>
inoremap <F9> :Unite -auto-resize -buffer-name=Unite_Menu menu<CR>

nnoremap <C-L> :Unite -no-split -auto-resize -buffer-name=Lines line<CR>
inoremap <C-L> :Unite -no-split -auto-resize -buffer-name=Lines line<CR>

let g:unite_source_menu_menus = {}

let g:unite_source_menu_menus.Unite = {
    \ 'description' : ' > Unite 常用操作（文件、缓冲区）
        \                            ',
    \}

let g:unite_source_menu_menus.Unite.command_candidates = [
    \[' > 查看历史文件         Ctrl-p ',
        \'Unite -no-split -auto-resize -buffer-name=MRU_File file_mru'],
    \[' > 筛选当前缓冲区内容   Ctrl-l',
        \'Unite -no-split -auto-resize -buffer-name=Lines line'],
    \[' > 查看当前目录文件 ',
        \'lcd %:p:h | Unite -no-split -auto-resize -start-insert -buffer-name=File_List file'],
    \[' > 查看缓冲区 ',
        \'Unite -no-split -quick-match -auto-resize -buffer-name=Buffer_List buffer'],
    \[' > 增加文件书签        :UniteBookmarkAdd ',
        \'UniteBookmarkAdd'],
    \[' > 查看文件书签 ',
        \'Unite -no-split -auto-resize -buffer-name=Bookmark bookmark'],
    \[' > 查看复制寄存器内容 ',
        \'Unite -no-split -quick-match -auto-resize -buffer-name=Yank_History history/yank'],
    \]

let g:unite_source_menu_menus.View = {
    \ 'description' : ' > 视图设置切换操作（View）
        \                            ',
    \}

let g:unite_source_menu_menus.View.command_candidates = [
    \[' > 切换大纲视图（Markdown）   :VoomToggle markdown ',
        \'VoomToggle markdown'],
    \[' > Toggle Comment 切换注释    gcc ',
        \'exe "normal! gcc"'],
    \[' > 多行注释                   gcw ',
        \'exe "normal! gcw"'],
    \[' > 取消多行注释               gcuw ',
        \'exe "normal! gcuw"'],
    \[' > 切换颜色代码自动着色       :ColorToggle ',
        \'ColorToggle'],
    \[' > 设置为纯文本类型           :set filetype=txt ',
        \'set filetype=txt'],
    \[' > 切换当前窗口工作目录       <F1> ',
        \'lcd %:p:h'],
    \[' > 切换行号显示模式           <F2> ',
        \'call ToggleRelativeNumber()'],
    \[' > 切换搜索结果高亮显示       <F3> ',
        \'call ToggleHLSearch()'],
    \[' > 切换撤销历史显示           <F5> ',
        \'UndotreeToggle'],
    \[' > 切换自动换行               <F6> ',
        \'call ToggleWrap()'],
    \[' > 切换语法高亮显示           <F7> ',
        \'call ToggleSyntaxHighlight()'],
    \[' > 打开 TagList               <F8> ',
        \'TlistToggle'],
    \[' > 切换缩进标志显示           :IndentLinesToggle',
        \'IndentLinesToggle'],
    \]
let g:unite_source_menu_menus.Edit = {
    \ 'description' : ' > 编辑操作（Edit）
        \                            ',
    \}


let g:unite_source_menu_menus.Edit.command_candidates = [
    \[' > 剔重排序，带 [!] 则反向排序     :sort[!] u ',
        \'sort u'],
    \[' > 排序并只保留最后一个            :g/^\(.*\)$\n\1$/d ',
        \'g/^\(.*\)$\n\1$/d'],
    \[' > Bookmark 增删书签               mm 或 :ToggleBookmark ',
        \'ToggleBookmark'],
    \[' > 编辑书签的描述说明              mi 或 :Annotate <TEXT> ',
        \'echo ":Annotate <TEXT>" '],
    \[' > 在新窗口中显示所有书签          ma 或 :ShowAllBookmarks ',
        \'ShowAllBookmarks'],
    \[' > 清除当前缓冲区书签              mc 或 :clearbookmarks ',
        \'clearbookmarks'],
    \[' > 删除 HTML 的标签部分            :%s#<[^>]\+>##g ',
        \'%s#<[^>]\+>##g'],
    \[' > Pathogen 更新插件帮助文档       :Helptags ',
        \'Helptags'],
    \[' > 转换为 GB2312 编码              :set fileencoding=cp936 ',
        \'set fileencoding=cp936'],
    \[' > 转换为 UTF-8 编码               :set fileencoding=utf-8 ',
        \'set fileencoding=utf-8'],
    \[' > 跳回最后编辑的位置              `. ',
        \'exe "normal! `."'],
    \[' > Case Switch 切换大小写           ~ ',
        \'exe "normal! ~"'],
    \[' > 显示光标位置，并统计字词        g<Ctrl-g> ',
        \'exe "normal! g\<c-g>"'],
    \[' > Align 对齐                      :Tabularize ',
        \'echo ":Tabularize " '],
    \[' > Mark 标记当前词                 <Leader>m ',
        \'call mark#MarkCurrentWord()<CR>'],
    \[' > Mark 标记指定模式               :Mark {pattern} ',
        \'echo ":Mark {pattern}" '],
    \[' > To Html 转换为网页文件          :TOhtml ',
        \'TOhtml'],
    \]

let g:unite_source_menu_menus.Search = {
    \ 'description' : ' > 搜索（Search）
        \                            ',
    \}

let g:unite_source_menu_menus.Search.command_candidates = [
    \[' > 遍历搜索文件内容     Ctrl-/ 或 :Ag [Options] Pattern [Path] ',
        \'echo ":Ag [Options] Pattern [Path]" （--context 展示上下文）'],
    \[' > 遍历搜索文件         :Ag [Options] -l Pattern [Path] ',
        \'echo ":Ag [Options] -l Pattern [Path]" '],
    \[' > Locate 列出搜索清单  :L[!] /<pattern1>/<pattern2>/.../[<flags>]） ',
        \'echo ":L[!] /{pattern1}/{pattern2}/.../[{flags}]" '],
    \]


" NeoMru
" let g:neomru#time_format = strftime("[%m-%d %H:%M] ")

" Vimfiler {{{2
nnoremap <C-\> :lcd %:p:h <Bar> VimFiler -force-quit -toggle -split -horizontal -buffer-name=VimFiler -sort-type=Time<CR>
" autocmd VimEnter * if !argc() | VimFiler | endif
let g:vimfiler_enable_auto_cd = 1
call vimfiler#custom#profile('default', 'context', {
		\   'sort_type' : 'Time'
		\ })

" Vim-Bookmark {{{2
let g:bookmark_sign = '>>'
let g:bookmark_annotation_sign = '##'


" Lightline {{{2

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ], [ 'filename' ], [ 'updatetime' ] ],
      \   'right': [ [ 'lineinfo' ], ['percent'], [ 'fileformat', 'fileencoding', 'filetype' ], [ 'size' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'modified': 'MyModified',
      \   'size': 'FileSize',
      \   'updatetime': 'UpdateTime',
      \ },
      \ 'subseparator': { 'left': '|', 'right': '|' }
      \ }

function! UpdateTime()
    return strftime("%Y-%m-%d %H:%M", getftime(expand("%:p")))
endfunction

function! FileSize()
  let bytes = getfsize(expand("%:p"))
  if bytes <= 0
    return ""
  endif
  if bytes < 1024
    return bytes
  else
    return (bytes / 1024) . "K"
  endif
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
       \ ('' != expand('%:t') ? expand('%:t') : '[No Name]') .
       \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyModified()
  return &ft =~ 'help' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help' && &readonly ? 'RO' : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : 'No Format'
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'No Type') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

" Buftabline {{{2
let g:buftabline_show = 1 " only if there are at least two buffers 
let g:buftabline_numbers = 1
let g:buftabline_indicators = 1


" Platinum Searcher  {{{2
let g:ackprg = "pt"
let g:ack_default_options = " --smart-case --nocolor"
let g:ackhighlight = 1
nnoremap <Leader>g <Esc>:Ack!<Space>
nnoremap <Leader>gw <Esc>:lcd %:p:h <Bar> AckWindow!<Space>

let g:ack_mappings = { "<Esc>": ":q<CR>" }

" The Nerd Tree
" nnoremap <C-\> :NERDTreeToggle<CR>
" let NERDTreeShowBookmarks = 1
" let NERDTreeChDirMode = 2

" Need Vimproc
" nnoremap <silent> <Leader>g :<C-u>Unite grep:. -buffer-name=Search<CR>
" if executable('pt')
"   let g:unite_source_grep_command = 'pt'
"   let g:unite_source_grep_default_opts = '--smart-case --nogroup --nocolor'
"   let g:unite_source_grep_recursive_opt = ''
"   let g:unite_source_grep_encoding = 'utf-8'
" endif

" Modeline {{{1
" vim:foldmethod=marker:foldlevel=0

