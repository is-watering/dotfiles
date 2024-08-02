" hook_add {{{

  let g:lightline = {
    \ 'colorscheme': 'deus',
    \ 'active': {
    \ 'left': [
    \           [ 'mode', 'paste', 'skk_mode' ],
    \           [ 'gitbranch', 'readonly', 'filename', 'modified' ],
    \            [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
    \         ],
    \ 'right': [
    \            [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ],
    \          ]
    \ },
    \ 'component_function': {
    \   'gitbranch': 'GitBranch',
    \   'skk_mode': 'statusline_skk#mode',
    \ },
    \ 'separator': { 'left': "\ue0b8", 'right': "\ue0be" },
    \ 'subseparator': { 'left': "\ue0b9", 'right': "\ue0bf" }
  \ }

  function! GitBranch()
    if exists("*gitbranch#name")
      let _ = gitbranch#name()
      return strlen(_) ? "\ue725 "._ : ''
    endif
    return ''
  endfunction

  let s:palette = g:lightline#colorscheme#deus#palette
  let s:term_red = 204
  let s:term_green = 124
  let s:term_yellow = 180
  let s:term_blue = 39
  let s:term_purple = 170
  let s:term_white = 145
  let s:term_black = 235
  let s:term_grey = 236
  
  let s:black = 236
  let s:white = 231
  let s:comment_grey = 252
  let s:gutter_grey = 239
  let s:cursor_grey = 236
  let s:visual_grey = 237

  let s:green = 78
  let s:darkgreen = 28
  let s:darkestgreen = 22
  let s:darkgreen = 28
  let s:darkestgreen = 22
  let s:darkestcyan = 23
  let s:mediumcyan = 117
  let s:darkestblue = 24
  let s:darkblue = 31
  let s:purple = 165
  let s:darkpurple = 91
  let s:red = 160
  let s:darkred = 124
  
  let s:palette.normal.left  = [ [ 23, 231, s:comment_grey, s:darkgreen, 'bold' ], [ 231, 31, s:green, s:black ] ]
  let s:palette.normal.middle  = [ [ 117, 24, s:green, s:black ] ]
  let s:palette.normal.right = [ [ 23, 117, s:comment_grey, s:darkgreen ], [ 117, 31, s:comment_grey, s:gutter_grey ], [ 117, 24, s:green, s:black ] ]

  let s:palette.insert.left  = [ [ 23, 231, s:darkestcyan, s:mediumcyan, 'bold' ], [ 231, 31, s:mediumcyan, s:darkestblue ] ]
  let s:palette.insert.middle  = [ [ 117, 24, s:mediumcyan, s:darkestblue ] ]
  let s:palette.insert.right = [ [ 23, 117, s:darkestcyan, s:mediumcyan ], [ 117, 31, s:mediumcyan, s:darkblue ], [ 117, 24, s:mediumcyan, s:darkestblue ] ]
  
  let s:palette.visual.left  = [ [ 23, 231, s:comment_grey, s:darkpurple, 'bold' ], [ 231, 31, s:purple, s:black ] ]
  let s:palette.visual.middle  = [ [ 117, 24, s:purple, s:black ] ]
  let s:palette.visual.right = [ [ 23, 117, s:comment_grey, s:darkpurple ], [ 117, 31, s:comment_grey, s:gutter_grey ], [ 117, 24, s:purple, s:black ] ]
  
  let s:palette.replace.left  = [ [ 23, 231, s:comment_grey, s:darkred, 'bold' ], [ 231, 31, s:red, s:black ] ]
  let s:palette.replace.middle  = [ [ 117, 24, s:red, s:black ] ]
  let s:palette.replace.right = [ [ 23, 117, s:comment_grey, s:darkred ], [ 117, 31, s:comment_grey, s:gutter_grey ], [ 117, 24, s:red, s:black ] ]

" }}}
