"---------------------------------------
" 通用
"---------------------------------------
set nocompatible " 如果使用兼容模式，后续设置会使用 Vi 的一些设置
" source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin " 使用更接近 Windows 的操作配置

" 在编辑保存配置文件后立即在当前会话启用
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

"---------------------------------------
" 备份、临时文件、历史和会话信息
"---------------------------------------
set backup " 自动生成备份文件
set writebackup " 覆盖文件前建立备份
set updatecount=30 " 输入这么多个字符以后，把交换文件写入磁盘
set backupdir=D:\\Bak\\txt " 备份目录
set directory=D:\\Bak\\txt " 交换目录
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
set undodir=D:\\Bak\\txt " 撤销文件目录
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
" set imcmdline " 开始编辑命令行时总是打开输入方法
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

"---------------------------------------
" 搜索
"---------------------------------------
" 开启语法高亮
" 开启搜索高亮
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
set filetype=txt " 设置默认文件类型
set syntax=txt " 设置默认语法类型
color ir_black " 设置默认颜色主题
if has("gui_running")
    colorscheme ir_black
else
    colorscheme desert256.vim
endif


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

"---------------------------------------
" 剪贴板、寄存器
"---------------------------------------
set clipboard=unnamed "与系统共剪贴板

"---------------------------------------
" 状态栏设置
"---------------------------------------
set laststatus=2 " 总是显示状态行

if has('statusline')
  set statusline=%m%r%h%w[TYPE=%Y][POS=%l,%v][%p%%][LEN=%L][%{(&fenc)}]
  set statusline+=%#StatusLine#
  set statusline+=[%t][BUF=%n][%{strftime('%Y%m%d',getftime(expand('%')))}]
endif

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
nnoremap ; :

" 上下移动
nnoremap <silent> k gk
nnoremap <silent> j gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" 上下翻页
nnoremap <Space> <C-F>
nnoremap <BackSpace> <C-B>

" 切换是否显示行号，显示绝对或相对行号
nnoremap <F2> <Esc>:call ToggleRelativeNumber()<CR>

" 显示/禁止搜索高亮
nnoremap <silent> <F3> <Esc>:call ToggleHLSearch()<CR>

" 启用/禁止折行
nnoremap <silent> <F6> <Esc>:call ToggleWrap()<CR>

" 新建标签页
noremap <F10> <Esc>:tabnew<CR>

" 打开另存为对话框
noremap <F12> <Esc>:browse saveas<CR>

" 显示缓冲区清单
noremap <leader>bl <Esc>:Bufferlist<CR>

" 在垂直窗口中编辑配置文件
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

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
    if &nu == 1
       set rnu
    elseif &rnu == 1
       set nornu
    else
       set nu
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
let g:calendar_diary="D:/Share/My Dropbox/Note/Diary/"
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
let g:yankring_manage_numbered_reg = 1
nnoremap <leader>yr :YRShow<CR>

