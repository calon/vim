"---------------------------------------
" 通用
"---------------------------------------
set nocompatible " 如果使用兼容模式，后续设置会使用 Vi 的一些设置
" source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin " 使用更接近 Windows 的操作配置
set t_Co=256

" 在编辑保存配置文件后立即在当前会话启用
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

source $VIM/vimrc_path.vim

"---------------------------------------
" 备份、临时文件、历史和会话信息
"---------------------------------------
set backup " 自动生成备份文件
set writebackup " 覆盖文件前建立备份
set updatecount=30 " 输入这么多个字符以后，把交换文件写入磁盘
" set backupdir=E:\\Bak\\txt " 备份目录
" set directory=E:\\Bak\\txt " 交换目录
" 失去焦点时自动保存
" au FocusLost * :wa

"---------------------------------------
" 历史和会话信息
"---------------------------------------
set history=500		" keep 50 lines of command line history
set sessionoptions=blank,curdir,folds,help,resize,tabpages,winpos,winsize " 保存和恢复会话时，同时保存和恢复的设置类型

"---------------------------------------
" 撤销文件
"---------------------------------------
" set undodir=E:\\Bak\\txt " 撤销文件目录
set undofile
" set undolevels = 1000 "maximum number of changes that can be undone
" set undoreload = 10000 "maximum number lines to save for undo on a buffer reload

"---------------------------------------
" 插件管理
"---------------------------------------
call pathogen#infect()

"---------------------------------------
" 制表和缩进
"---------------------------------------

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

"---------------------------------------
" 语言、字符编码和输入法设置
"---------------------------------------
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
set formatoptions+=mB "打开断行模块对亚洲语言支持。 m 表示允许在两个汉字之间断行， 即使汉字之间没有出现空格。 B 表示将两行合并为一行的时候， 汉字与汉字之间不要补空格。

"---------------------------------------
" 字体设置
"---------------------------------------
set guifont=Yahei_Mono:h11 " GUI 版本使用的字体列表。
set guifontwide=Yahei_Mono:h11 " 如果非空，指定逗号分隔的用于双宽字符的字体列表。

"---------------------------------------
" 缓冲区
"---------------------------------------
set hidden " 退出时隐藏而不是卸载缓冲区
set confirm " 某些因为缓冲区有未保存的改变而失败的操作会弹出对话框要求确认

" 快速切换缓冲区
" noremap <unique> <script> <leader>1 :1b<CR>
" noremap <unique> <script> <leader>2 :2b<CR>
" noremap <unique> <script> <leader>3 :3b<CR>
" noremap <unique> <script> <leader>4 :4b<CR>
" noremap <unique> <script> <leader>5 :5b<CR>
" noremap <unique> <script> <leader>6 :6b<CR>
" noremap <unique> <script> <leader>7 :7b<CR>
" noremap <unique> <script> <leader>8 :8b<CR>
" noremap <unique> <script> <leader>9 :9b<CR>
" noremap <unique> <script> <leader>0 :0b<CR>
" inoremap <unique> <script> <leader>1 <Esc>:1b<CR>
" inoremap <unique> <script> <leader>2 <Esc>:2b<CR>
" inoremap <unique> <script> <leader>3 <Esc>:3b<CR>
" inoremap <unique> <script> <leader>4 <Esc>:4b<CR>
" inoremap <unique> <script> <leader>5 <Esc>:5b<CR>
" inoremap <unique> <script> <leader>6 <Esc>:6b<CR>
" inoremap <unique> <script> <leader>7 <Esc>:7b<CR>
" inoremap <unique> <script> <leader>8 <Esc>:8b<CR>
" inoremap <unique> <script> <leader>9 <Esc>:9b<CR>
" inoremap <unique> <script> <leader>0 <Esc>:0b<CR>

let c = 1
while c <= 99
  execute "nnoremap " . c . "gb :" . c . "b\<CR>"
  let c += 1
endwhile

"---------------------------------------
" 搜索
"---------------------------------------
" 开启语法高亮
" 开启搜索高亮TrueType Collection
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set incsearch " 即时跳转到搜索目标所在行
set ignorecase " 搜索时忽略大小写
set smartcase " 搜索小写忽略大小写

"---------------------------------------
" 文件、语法和颜色主题
"---------------------------------------
"set filetype=txt " 设置默认文件类型
set syntax=txt " 设置默认语法类型
" 设置默认颜色主题
" if has("gui_running")
"     colorscheme ir_black
" else
"     colorscheme desert256.vim
" endif
 

"---------------------------------------
" 提示信息
"---------------------------------------
set showcmd " 在屏幕最后一行显示 (部分的) 命令。
set shortmess=atI " 缩写某些提示信息
set showmatch " 插入括号时，短暂地跳转到匹配的对应括号。
set list " 显示特殊字符
set listchars=tab:>-,nbsp:.

"---------------------------------------
" 光标和标尺
"---------------------------------------
" set cursorline " 显示光标所在行背景颜色
" set ruler " 显示光标位置的行号和列号
set number " 显示行号
" autocmd BufWinLeave * setlocal nocursorline nocursorcolumn " 非当前缓冲区取消高亮光标所在行列
autocmd BufWinLeave * setlocal nocursorline " 非当前缓冲区取消高亮光标所在行
" autocmd BufWinEnter * setlocal cursorline cursorcolumn " 当前缓冲区高亮光标所在行列
autocmd BufWinEnter * setlocal cursorline " 当前缓冲区高亮光标所在行
" set rulerformat=%55(%{strftime('%a\ %b\ %e\ %I:%M\ %p')}\ %5l,%-6(%c%V%)\ %P%) " 设置标尺提示信息


set backspace=2 " 退格会删除缩进、换行符和插入的起始位置
set iskeyword+=_,$,@,%,#,- " 定义一个word中可以包含哪些字符。"@"在这里代指所有的字母。

" 打开文件时回到上次光标所在的位置
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \ exe "normal! g`\"" |
     \ endif

"---------------------------------------
" 命令行
"---------------------------------------
set wildmenu " 打开命令行补全功能

"---------------------------------------
" GUI
"---------------------------------------
if has('mouse') " 所有模式下允许使用鼠标
  set mouse=a
endif  

set guioptions=behgmrLtTv " 菜单、滚动条、工具栏、对话框等的设置


"---------------------------------------
" 选择
"---------------------------------------
set selection=inclusive " 选择区的最后一个字符包含在操作范围之内
set selectmode="" " 指定什么场合开始选择时启动选择模式而不是可视模式

"---------------------------------------
" 屏幕显示
"---------------------------------------
set scrolloff=1 " 光标上下两侧最少保留的屏幕行数。
set whichwrap=b,s,<,>,[,] "对某一个或几个按键开启到头后自动折向下一行的功能
set lazyredraw " Don't redraw while executing macros (good performance config)
set linebreak


"---------------------------------------
" 剪贴板、寄存器
"---------------------------------------
set clipboard=unnamed "与系统共剪贴板

"---------------------------------------
" 状态栏设置
"---------------------------------------
set laststatus=2 " 总是显示状态行

if has('statusline')
  set statusline=%m  " 修改标志位
  set statusline+=%r  " 只读标志位
  set statusline+=%h  " 帮助缓冲区标志位
  set statusline+=%w  " 预览窗口标志位
  set statusline+=[%Y] " 文件类型
  set statusline+=[%{&ff}]  " 文件格式
  set statusline+=[%l\/%L,\ %v,\ %p%%]  " 光标位置、文件行数和窗口在文件位置的百分比
  set statusline+=[%{(&fenc)}] " 文件编码
  set statusline+=%#StatusLine#
  set statusline+=[%t]  " 文件名
  set statusline+=[%{FileSize()}]  " 文件大小
  set statusline+=[#%n]  " 缓冲区号
  set statusline+=[%{strftime(\"%Y\-%m\-%d\ %H\:%M\",getftime(expand(\"%:p\")))}]
endif

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


"---------------------------------------
" 窗口标题设置
"---------------------------------------
if has('title') && (has('gui_running') || &title)
    set titlestring=
    set titlestring+=%F\  " file name
    set titlestring+=%h%m%r%w " flag
    set titlestring+=\ -\ %{v:progname} " program name
endif

"---------------------------------------
" 优化大文件编辑
"---------------------------------------

if !exists("my_auto_commands_loaded")
        let my_auto_commands_loaded = 1
        let g:LargeFile = 1024 * 1024 * 100
        augroup LargeFile
                autocmd BufReadPre * let f=expand("<afile>") | if getfsize(f) > g:LargeFile | set eventignore+=FileType | setlocal noswapfile bufhidden=unload buftype=nowrite undolevels=-1 | else | set eventignore-=FileType | endif
        augroup END
endif

"---------------------------------------
" 拼写检查
"---------------------------------------
if version >= 700
   set spl=en spell
   set nospell
endif

"---------------------------------------
" 按键映射
"---------------------------------------

" 进入命令行
nnoremap <silent> ; :

" 上下移动
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" 上下翻页
nnoremap <Space> <C-F>
nnoremap <BackSpace> <C-B>

" 转换为纯文本类型，应用相应的语法高亮和插件
nnoremap <F1> <Esc>:set filetype=txt<CR>

" 切换显示绝对或相对行号
nnoremap <F2> <Esc>:call ToggleRelativeNumber()<CR>

" 显示/禁止搜索高亮
nnoremap <silent> <F3> <Esc>:call ToggleHLSearch()<CR>

" 插入时间戳

nmap <F4> a<C-R>=strftime("%Y%m%d%H%M%S")<CR><Esc>
imap <F4> <C-R>=strftime("%Y%m%d%H%M%S")<CR>

" 启用/禁止折行
nnoremap <silent> <F6> <Esc>:call ToggleWrap()<CR>

" 新建标签页
noremap <F10> <Esc>:enew<CR>

" 打开另存为对话框
noremap <F12> <Esc>:browse saveas<CR>

" 显示缓冲区清单
noremap <leader>b <Esc>:Bufferlist<CR>
" noremap <leader>mb <Esc>:MBEToggle<CR>

" 普通模式下 Ctrl+c 复制文件路径
nnoremap <c-c> :let @* = expand('%:p')<cr>

" 编辑配置文件
nnoremap <leader>ev :e $MYVIMRC<CR>

nnoremap <leader>sv :so $MYVIMRC<CR>

" 应用语法高亮
nnoremap <leader>tx <Esc>:set filetype=txt<CR>

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

" 窗口间跳转
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" 标签页操作
noremap <leader>tn :tabnew<CR>
noremap <leader>tc :tabclose<CR>

" Next Tab
nnoremap <silent> <C-Right> :tabnext<CR>

" Previous Tab
nnoremap <silent> <C-Left> :tabprevious<CR>


" 缩进操作
vnoremap < <gv
vnoremap > >gv

" 在插入模式下移动方向
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-j> <Down>
inoremap <C-k> <Up>

" 在vim中将查找出来的所有结果全部显示在单独的窗口中，在该窗口中双击该行就能定位到文件中的相应行上。 
cnoremap <leader>/ :exec 'lvimgrep /' . input('/', expand('<cword>')) . '/j % <bar> lopen'<CR>

" 编码转换
cabbrev utf2gb set encoding=cp936 fileencoding=cp936
cabbrev gb2utf set encoding=utf-8 fileencoding=utf-8

"---------------------------------------
" 插件配置
"---------------------------------------

" Calendar插件
" let g:calendar_diary="C:/Software/Share/My Dropbox/Note/Diary/"
let g:calendar_monday = 1 "以星期一为开始 
let g:calendar_focus_today = 1 " 光标在当天的日期上 
let g:calendar_mark = 'left-fit' "可以让*和数字可靠近 

" Voom Markdown
nnoremap <leader>vm <Esc>:Voom markdown<CR>
noremap <F11> <Esc>:Voom markdown<CR>
nnoremap <leader>ol <Esc>:Voom<CR>

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" YankRing
"let g:yankring_manage_numbered_reg = 1
"nnoremap <leader>yr :YRShow<CR>
"let g:yankring_window_use_horiz = 0  " Use vertical split
"let g:yankring_history_dir = '$VIM'
"let g:yankring_max_element_length = 102400
"let g:yankring_max_display = 70
"let g:yankring_persist = 0

" BetterSearch
nnoremap <A-F7> :BetterSearchPromptOn<CR>
vnoremap <A-F7> :BetterSearchVisualSelect<CR>
nnoremap <A-w>  :BetterSearchSwitchWin<CR>

" PinyinSearch
" nnoremap <Leader>ps :call PinyinSearch()<CR>
" nnoremap <Leader>pn :call PinyinNext()<CR>
" let g:PinyinSearch_Dict = "c:/Program Files/Vim/PinyinSearch.dict"

" PyDiction
" let g:pydiction_location = 'c:\Program Files\Vim\vimfiles\bundle\pydiction\ftplugin\pydiction\complete-dict'

" Omni Completion
" autocmd FileType python set omnifunc=pythoncomplete#Complete
" imap <silent><A-`> <C-X><C-O>

" Indent Guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_guide_size = 1

"" Neocomplcache
"let g:neocomplcache_enable_at_startup = 1
"" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
"" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 0
"" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 0
"let g:neocomplcache_max_list = 15
"" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
"let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" if !exists('g:neocomplcache_dictionary_patterns')
"    let g:neocomplcache_dictionary_patterns = {}
" endif
"     let g:neocomplcache_dictionary_patterns = {
"         \'python': expand('c:/Program Files/Vim/vimfiles/dict/python-dict'),
"         \}

" if !exists('g:neocomplcache_dictionary_patterns')
"   let g:neocomplcache_dictionary_patterns = {}
" endif
" " works well for the pydiction.vim dictionary file(complete-dict)
" let g:neocomplcache_dictionary_patterns.python = '\(\h\w*[.(]\?\)\+'

  "let g:neocomplcache_dictionary_filetype_lists = {
      "\ 'default' : '',
      "\ 'vimshell' : $HOME.'/.vimshell_hist',
      "\ 'scheme' : $HOME.'/.gosh_completions',
      "\ 'python' : $VIM.'/vimfiles/dict/python-dict'
         "\ }


" Define keyword.
"if !exists('g:neocomplcache_keyword_patterns')
    "let g:neocomplcache_keyword_patterns = {}
"endif
    "let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 0

" Enable omni completion.
"autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
"autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags


" inoremap <expr><space> pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"

" XPTemplate

" let g:xptemplate_pum_tab_nav = 1
" let g:xptemplate_nav_next = '<C-Left>'
" let g:xptemplate_nav_prev = '<C-Right>'

" Quick Filter
nnoremap <leader>f :call FilteringNew().addToParameter('alt', @/).run()<CR>

" Gundo
" nnoremap <F5> :GundoToggle<CR>

" Colorizer
nmap <leader>ct <Plug>Colorizer

" TagList
" nnoremap <silent> <F8> :TlistToggle<CR>

" PanDoc
" nnoremap <leader>pd :!pandoc % -o %:r.html<CR>

" Rainbow Parentheses Improved 
" let g:rainbow_active = 1

" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)
" Start interactive EasyAlign with a Vim movement
nmap <Leader>a <Plug>(EasyAlign)

" MiniBufExpl
" let g:miniBufExplCheckDupeBufs = 0

" CtrlP
let g:ctrlp_cmd = 'CtrlPMRUFiles'

" neocomplete.vim
" Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

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

" SuperTab
" let g:SuperTabDefaultCompletionType = "<c-n>"
