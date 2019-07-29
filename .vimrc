filetype plugin indent off

set all& " init all settings
set encoding=utf-8
set fileencodings=iso-2022-jp,euc-jp,sjis,utf-8
set fileformats=unix,dos,mac
set guifont=Cica:h14
set printfont=Cica:h14
set ambiwidth=single
set number "行番号を表示
set autoindent "改行時に自動でインデントする
set wrap "自動折り返しを有効
set cursorline "カーソルラインを有効
set mouse=a
set ignorecase "検索時に大文字小文字を無視
set smartcase
set virtualedit=onemore "行末の1文字先までカーソルを移動できるように
set hidden "

au BufRead,BufNewFile *.{sass,scss,pcss,css} set filetype=scss.css

let mapleader = "\<Space>"

set clipboard=unnamed
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,Y "+Y
vnoremap ,Y "+Y
nnoremap ,p "+p
vnoremap ,p "+p
nnoremap ,P "+P
vnoremap ,P "+P

" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

" ノーマルモードでEnter押すと改行
nnoremap <CR> i<CR><ESC>

autocmd ColorScheme * highlight CursorLine cterm=none ctermbg=237

""""""""""""""""""""""""""""""
" 最後のカーソル位置を復元する
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
endif
""""""""""""""""""""""""""""""

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('rhysd/vim-healthcheck')
  call dein#add('roxma/nvim-yarp')
  call dein#add('roxma/vim-hug-neovim-rpc')
  
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim')
  call dein#add('$HOME/.cache/dein/repos/github.com/Shougo/dein.vim')
    nnoremap <silent> <Leader>h :History<CR>
    tnoremap <expr> <Esc> (&filetype == "fzf") ? "<Esc>" : "<c-\><c-n>"
  
  call dein#add('Shougo/deoplete.nvim')
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#auto_complete_delay = 0
    let g:deoplete#auto_complete_start_length = 1
  
  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('editorconfig/editorconfig-vim')  
  call dein#add('sheerun/vim-polyglot')

  call dein#add('scrooloose/nerdtree')
    nnoremap <silent><C-e> :NERDTreeToggle<CR>
    " ファイルを開いたらNERDTreeを閉じる
    let g:NERDTreeQuitOnOpen=1
    " NERDTreeを同時に閉じる
    autocmd bufenter * if (winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree()) | q | endif
    
  call dein#add('cocopon/vaffle.vim')
    let g:vaffle_auto_cd = 1

  call dein#add('hisaknown/nanomap.vim')
  "call dein#add('severin-lemaignan/vim-minimap')
  
  call dein#add('nathanaelkane/vim-indent-guides')
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_auto_colors = 0
    autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=236
    autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=237

  call dein#add('ryanoasis/vim-devicons')
    let g:WebDevIconsUnicodeDecorateFolderNodes = 1

  call dein#add('itchyny/lightline.vim')
    let g:lightline = {
      \   'colorscheme': 'powerline',
      \   'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \   },
      \   'component_function': {
      \     'gitbranch': 'LightLineFugitive'
      \   },
      \   'separator': { 'left': "\ue0b8", 'right': "\ue0be" },
      \   'subseparator': { 'left': "\ue0b9", 'right': "\ue0bf" }
      \ }

    function! LightLineFugitive()
      try
        if expand('%:t') !~? 'Tagbar\|Gundo\|NERD' && &ft !~? 'vimfiler' && exists('*fugitive#head')
          let mark = "\ue725 "  " edit here for cool mark
          let _ = fugitive#head()
          return strlen(_) ? mark._ : ''
        endif
      catch
      endtry
      return ''
    endfunction
  
  call dein#add('tpope/vim-fugitive')
  
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')

  call dein#add('tpope/vim-commentary')
    autocmd FileType jinja setlocal commentstring={#\ %s\ #}

  call dein#add('Valloric/MatchTagAlways')

  call dein#add('mattn/emmet-vim')
    imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

  call dein#add('vim-scripts/twilight256.vim')

  " Required:
  call dein#end()
  call dein#save_state()
endif

colorscheme twilight256

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

""""""""""""""""""""""""""""""
" color overrides
""""""""""""""""""""""""""""""

hi Pmenu ctermbg=31
hi PmenuSel ctermbg=43 ctermfg=20
hi PmenuSbar ctermbg=249
hi PmenuThumb ctermfg=240

