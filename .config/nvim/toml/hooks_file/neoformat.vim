" hook_source {{{

  let g:neoformat_enabled_scss = ['stylelint']
  let g:neoformat_scss_stylelint = {
    \ 'exe': 'stylelint',
    \ 'args': ['--fix', '--stdin-filename', '"%:t"'],
    \ 'stdin': 1,
  \ }

" }}}
