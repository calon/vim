" Vim syntax file
" Language:	PlainText
" Maintainer:	Calon <calon.xu@gmail.com>
" URL:		http://calon,weblogs.us/
" Last Update:  2010-12-12 21:00

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'txt'
endif

":so $VIMRUNTIME/syntax/html.vim

syn case ignore

syn cluster AlwaysContains add=Errors,Titles
syn cluster NormalContains add=Numbers,CPM,EPM,Links
syn cluster QuoteContains  add=Quoted,SingleQuoted,Bracketed

"标题文本: 前面有任意个空格,数字.[数字.]打头, 并且该行里不含有,.。，等标点符号
"Title: Lines start with digit and '.'
syn match Titles "^\(\d\+ \)\+\s*[^,。，]\+$"
syn match Titles "^\(\d\+ \)\+\s*[^,。，]\+$"
syn match Titles "^\(\d\+\.\)\+\s*[^,。，]\+$"
syn match Titles "^\(\d\+\.\)\+\s*[^,。，]\+,"

"标题文本: 汉字数字加'.、'打头，且该行不含,.。，标点符号
"Title: Lines start with Chinese digit and '.'
syn match Titles "^\([一二三四五六七八九十][、.]\)\+\s*[^,。，]\+$"
syn match Titles "^\([一二三四五六七八九十][、.]\)\+\s*[^,。，]\+,"

"标题文本: 以数字打头, 中间有空格, 后跟任意文字. 且该行不含有,.。，标点符号
"Title: Lines start with digit
syn match Titles "^\d\s\+.\+\s*[^,。，]$"
syn match Titles "^\d\s\+.\+\s*[^,。，],"

" English Punctuation Marks
syn match EPM "[~\-_+*<>\[\]{}=|#@$%&\\/:&\^\.,!?]"

syn match Letters "[A-Za-z]"

" Normal Chinese Punctuation Marks
syn match CPM "[，。；：！？、《》【】“”‘’（）『』「」〖〗﹝﹞〔〕〈〉…￥·■◆▲●★□◇△○☆＄‰￥℃※±⑴⑵⑶⑷⑸⑹⑺⑻⑼⑽⑾⑿⒀⒁⒂⒃⒄⒅⒆⒇⒈⒉⒊⒋⒌⒍⒎⒏⒐⒑⒒⒓⒔⒕⒖⒗⒘⒙⒚⒛①②③④⑤⑥⑦⑧⑨⑩㈠㈡㈢㈣㈤㈥㈦㈧㈨㈩→←↑↓§№◎ⅠⅡⅢⅣⅤⅥⅦⅧⅨⅩⅪⅫ≈≡≠＝≤≥＜＞≮≯∷±＋－×÷／∫∮∝∞∧∨∑∏∪∩∈∵∴⊥∥∠⌒⊙≌∽√°¤￠〇]"

" 数字
syn match Numbers "\d\(\.\d\+\)\?"
syn match Numbers "\d"

" 链接
syn match Links   "\<[A-Za-z0-9_.-]\+@\([A-Za-z0-9_-]\+\.\)\+[A-Za-z]\{2,4}\>\(?[A-Za-z0-9%&=+.,@*_-]\+\)\="  contains=CPM
syn match Links   "\<\(\(https\=\|ftp\|news\|telnet\|gopher\|wais\)://\([A-Za-z0-9._-]\+\(:[^ @]*\)\=@\)\=\|\(www[23]\=\.\|ftp\.\)\)[A-Za-z0-9%._/~:,=$@-]\+\>/*\(?[A-Za-z0-9/%&=+.,@*_-]\+\)\=\(#[A-Za-z0-9%._-]\+\)\="  contains=CPM



"引号与括号
syn region Bracketed         matchgroup=CPM  start="[（]"        end="[）]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Quoted            matchgroup=EPM  start="\""          end="\""    contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Quoted            matchgroup=CPM  start="[《]"        end="[》]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Quoted            matchgroup=CPM  start="[“]"        end="[”]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Quoted            matchgroup=CPM  start="[『]"        end="[』]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Quoted            matchgroup=CPM  start="[【]"        end="[】]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Quoted            matchgroup=CPM  start="[﹝]"        end="[﹞]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Quoted            matchgroup=CPM  start="[〔]"        end="[〕]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Quoted            matchgroup=EPM  start="\(\s\|^\)\@<='" end="'"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region SingleQuoted      matchgroup=CPM  start="[〈]"        end="[〉]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region SingleQuoted      matchgroup=CPM  start="[「]"        end="[」]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region SingleQuoted      matchgroup=CPM  start="[‘]"        end="[’]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region SingleQuoted      matchgroup=CPM  start="[〖]"        end="[〗]"  contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Comments          matchgroup=EPM  start="("           end=")"     contains=@QuoteContains,@NormalContains,@AlwaysContains
syn region Comments          matchgroup=Comments start="\/\/"    end="$"     contains=@AlwaysContains                 oneline
syn region Comments          matchgroup=Comments start="\/\*"    end="\*\/"  contains=@AlwaysContains
syn region Tags              matchgroup=EPM  start="<"           end=">"     contains=@NormalContains,@AlwaysContains oneline
syn region Tags              matchgroup=EPM  start="{"           end="}"     contains=@NormalContains,@AlwaysContains oneline
syn region Tags              matchgroup=EPM  start="\["          end="\]"    contains=@NormalContains,@AlwaysContains oneline 

syn keyword Errors error bug warning fatal rtfm

syn case match
" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
  if version < 508
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink Numbers              Number
  HiLink CPM                  String
  HiLink EPM                  Tag
  HiLink Bracketed            Delimiter
  HiLink Quoted               Label
  HiLink SingleQuoted         Structure
  HiLink Comments             Comment
  HiLink Links                Underlined
  HiLink Tags                 Function
  HiLink Letters              Identifier
  HiLink Titles               Function
  delcommand HiLink

  hi Errors                   ctermfg=red guifg=red

let b:current_syntax = "txt"

