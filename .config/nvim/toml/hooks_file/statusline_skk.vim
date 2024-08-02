" hook_add {{{

let g:lightline_skk_announce = v:true

" }}}

" hook_source {{{

call statusline_skk#option('display', {
  \ 'hiragana': 'あぁ󰗧',
  \ 'katakana': 'アァ󰗧',
  \ 'hankaku-katakana': 'ｱｧ󰗧',
  \ 'zenkaku-alphabet': 'Ａａ󰗧',
  \ 'alphabet': 'Aa󰗧',
  \ })

" }}}
