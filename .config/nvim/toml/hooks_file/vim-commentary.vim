" hook_source {{{

  autocmd FileType jinja setlocal commentstring={#-\ %s\ #}
  autocmd FileType html.twig setlocal commentstring={#-\ %s\ #}
  autocmd BufNewFile,BufRead *.pcss setlocal commentstring=/*\ %s\ */

" }}}
