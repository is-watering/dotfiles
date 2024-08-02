" hook_source {{{

  nnoremap <silent> <C-a> :<C-u>ClurinNext<CR>
  nnoremap <silent> <C-x> :<C-u>ClurinPrev<CR>
  vnoremap <silent> <C-a> :call clurin#pa(+v:count1, 1)<CR>
  vnoremap <silent> <C-x> :call clurin#pa(-v:count1, 1)<CR>

  function! g:CountUp(strs, cnt, def) abort
    " a:strs: matched text list
    " a:cnt: non zero.
    " a:def: definition
    return str2nr(a:strs[0]) + a:cnt
  endfunction

  function! g:CtrlAX(cnt) abort
    if a:cnt >= 0
      execute 'normal!' a:cnt . "\<C-A>"
    else
      execute 'normal!' (-a:cnt) . "\<C-X>"
    endif
  endfunction

  " for RSpec
  au BufRead *_spec.rb let b:clurin = [
    \ ['be_truthy', 'be_falsey'],
    \ [{'pattern': '\.to_not ', 'replace': '.to '}]
  \ ]

  let g:clurin = {
    \ '-': { 'def': [
    \   [
    \     {'pattern': '\(-\?\d\+\)', 'replace': function('g:CountUp')},
    \   ],
    \   ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    \   ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'],
    \   ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'],
    \   ['月', '火', '水', '木', '金', '土', '日'],
    \   ['臨', '兵', '闘', '者', '皆', '陣', '烈', '在', '前'],
    \   ['true', 'false'],
    \   ['True', 'False'],
    \   ['on', 'off'],
    \   ['On', 'Off'],
    \   ['enable', 'disable'],
    \   ['Enable', 'Disable'],
    \   ['left', 'right'],
    \ ]},
    \ 'vim': {'def': [
    \   [
    \     {'pattern': '\[''\(\k\+\)''\]', 'replace': '[''\1'']'},
    \     {'pattern': '\["\(\k\+\)"\]',   'replace': '["\1"]'},
    \     {'pattern': '\.\(\k\+\)',       'replace': '.\1'},
    \   ],
    \   ['nmap', 'vmap', 'imap'],
    \   ['nnoremap', 'vnoremap', 'inoremap'],
    \ ]},
    \ 'c cpp' : {'def': [
    \   [ '&&', '||' ],
    \   [
    \     {'pattern': '\(\k\+\)\.', 'replace': '\1.'},
    \     {'pattern': '\(\k\+\)->', 'replace': '\1->'},
    \   ]
    \ ], 'nomatch': function('g:CtrlAX')},
  \ }

" }}}
