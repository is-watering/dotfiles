" hook_source {{{

  if !exists('g:context_filetype#same_filetypes')
    let g:context_filetype#filetypes = {}
  endif
  let g:context_filetype#filetypes = {
    \ 'html': [
    \   {
    \     'filetype': 'css',
    \     'start': '<style\%( [^>]*\)\?>',
    \     'end': '</style>',
    \   },
    \   {
    \     'filetype': 'css',
    \     'start': '<[^>]\+ style=\([''"]\)',
    \     'end': '\1',
    \   },
    \ ],
  \}

" }}}
