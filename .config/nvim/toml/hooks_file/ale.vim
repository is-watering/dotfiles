" hook_add {{{

  autocmd VimEnter,Colorscheme * :hi ALEErrorSign cterm=bold ctermfg=1 ctermbg=234
  autocmd VimEnter,Colorscheme * :hi ALEWarningSign cterm=bold ctermfg=11 ctermbg=234
  autocmd VimEnter,Colorscheme * :hi ALEError cterm=NONE ctermfg=0 ctermbg=1
  autocmd VimEnter,Colorscheme * :hi ALEWarning cterm=NONE ctermfg=0 ctermbg=11

" }}}

" hook_source {{{

  let g:ale_linters = {
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
  \ }
  let g:ale_fixers = {
    \ 'css': ['stylelint'],
    \ 'scss': ['stylelint'],
  \ }
  let g:ale_lint_on_text_changed = 1
  let g:ale_lint_on_save = 1
  let g:ale_fix_on_save = 0

  " let g:ale_css_stylelint_executable = 'stylelint'
  " let g:ale_css_stylelint_options = '--fix'
  " let g:ale_scss_stylelint_executable = 'stylelint'
  " let g:ale_scss_stylelint_options = '--fix'
  let g:ale_scss_stylelint_use_global = 0

" }}}
