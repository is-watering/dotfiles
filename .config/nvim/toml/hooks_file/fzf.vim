" hook_add {{{

  nnoremap <Leader>f :<C-u>ProjectFiles<CR>
  nnoremap <Leader>h :<C-u>History<CR>
  nnoremap <Leader>b :<C-u>Buffers<CR>

  function! s:find_git_root()
    " プロジェクトルートで開く
    return system('git rev-parse --show-toplevel 2> /dev/null')[:-2]
  endfunction

  command! ProjectFiles execute 'Files' s:find_git_root()
  " command! -bang -nargs=? -complete=dir Files
  "     \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
  command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', 'head -20 {}']}, <bang>0)

  " floating window
  "let $FZF_DEFAULT_OPTS='--layout=reverse'
  let g:fzf_layout = { 'window': 'call FloatingFZF()' }

  function! FloatingFZF()
    let buf = nvim_create_buf(v:false, v:true)
    call setbufvar(buf, '&signcolumn', 'no')

    let height = &lines - 10
    let width = float2nr(&columns - (&columns * 2 / 10))
    let col = float2nr((&columns - width) / 2)

    let opts = {
      \ 'relative': 'editor',
      \ 'row': 4,
      \ 'col': col,
      \ 'width': width,
      \ 'height': height
      \ }

    call nvim_open_win(buf, v:true, opts)
  endfunction

" }}}
