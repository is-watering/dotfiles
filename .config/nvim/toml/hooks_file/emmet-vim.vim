" hook_source {{{

  let g:user_emmet_mode = 'iv'
  let g:user_emmet_settings = {
    \ 'variables' : {
    \   'lang' : 'ja'
    \ }
  \ }
  let g:user_emmet_leader_key='<C-E>'
  " imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
  autocmd FileType html,html.twig,css,scss,scss.css,html.twig imap <buffer><expr><C-e>
    \ emmet#isExpandable() ? "\<plug>(emmet-expand-abbr)" :
    \ "\<C-e>"

" }}}
