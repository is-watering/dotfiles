" hook_source {{{

function! s:skkeleton_init() abort
  call skkeleton#config({
    \ 'eggLikeNewline': v:true,
    \ 'globalDictionaries': [["~/.skk/SKK-JISYO.utf8.L", "utf-8"]],
    \ })
  call skkeleton#register_kanatable('rom', {
    \ "z\<Space>": ["\u3000", ''],
    \ })
endfunction

  imap <C-j> <Plug>(skkeleton-toggle)
  cmap <C-j> <Plug>(skkeleton-toggle)

autocmd User skkeleton-initialize-pre call s:skkeleton_init()

" }}}
