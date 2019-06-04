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

au BufRead,BufNewFile *.{sass,scss,pcss,css} set filetype=scss.css

autocmd ColorScheme * highlight CursorLine cterm=none ctermbg=237

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
let s:toml_dir  = $HOME . '/.config/nvim/' 
let s:toml      = s:toml_dir . '/dein.toml'

  " Required:
  
  " Add or remove your plugins here like this:
  call dein#load_toml(s:toml,      {'lazy': 0})
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')

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
