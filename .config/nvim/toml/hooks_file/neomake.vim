" hook_source {{{

  let g:neomake_scss_enabled_makers = ['stylelint']
  let g:neomake_scss_stylelint_maker = {
    \ 'exe': 'stylelint',
    \ 'args': ['--fix'],
  \ }

" }}}
