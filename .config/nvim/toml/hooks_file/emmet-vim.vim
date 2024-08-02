" hook_source {{{

  let g:user_emmet_mode = 'iv'
  let g:user_emmet_settings = {
    \ 'variables' : {
    \   'lang' : 'ja'
    \ }
  \ }
  imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" }}}
