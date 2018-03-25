
" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo-=C

" Let the matchit plugin know what items can be matched.
if exists("loaded_matchit")
  let b:match_ignorecase = 0
  " let b:match_words =
	" \ '\<fu\%[nction]\>:\<retu\%[rn]\>:\<endf\%[unction]\>,' .
 	" \ '\<\(wh\%[ile]\|for\)\>:\<brea\%[k]\>:\<con\%[tinue]\>:\<end\(w\%[hile]\|fo\%[r]\)\>,' .
	" \ '\<if\>:\<el\%[seif]\>:\<en\%[dif]\>,' .
	" \ '\<try\>:\<cat\%[ch]\>:\<fina\%[lly]\>:\<endt\%[ry]\>,' .
	" \ '\<aug\%[roup]\s\+\%(END\>\)\@!\S:\<aug\%[roup]\s\+END\>,' .
	" \ '(:)'

  " very tricky examples:
  " bad: let b:match_words = '\(foo\)\(bar\):more\1:and\2:end\1\2' 
  " good:
  let b:match_words = '\<\(\(foo\)\(bar\)\):\3\2:end\1'
  let b:match_words .= ',\<baz\zebar\>:\<barbaz\>'
  let b:match_words .= ',\<zab\zsrab\>:\<rabzab\>'
  let b:match_words .= ',\<where\>:\<wh\zeen\>'
  let b:match_words .= ',\%(end\)\@<!むめ:endむめも'
  let b:match_words .= ',ぽ:も'
  let b:match_words .= ',\\begin{\([^}]\+\)}:\\end{\1}'
  let b:match_words .= ',one😀🐑one:two😐🐑two:three🙁🐑'

  let b:match_skip = 'synIDattr(synID(line("."),col("."),1),"name")
        \ =~? "comment\\|string\\|vimSynReg\\|vimSet"'
endif

let &cpo = s:cpo_save
unlet s:cpo_save

