filetype plugin indent off

" set all& " init all settings
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set guifont=Cica:h14
set printfont=Cica:h14
set ambiwidth=single
set number " 行番号を表示
set autoindent " 改行時に自動でインデントする
set wrap " 自動折り返しを有効
"set cursorline " カーソルラインを有効
set mouse=a
set ignorecase " 検索時に大文字小文字を無視
set wrapscan " 最後尾まで検索を終えたら次の検索で先頭に移る
set smartcase
set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように
set whichwrap+=h,l,<,>,[,],b,s " 行末・行頭から次の行へ移動可能に
set backspace=indent,eol,start "Backspaceキーの影響範囲に制限を設けない
set autoread " 外部でファイルに変更があったときに自動で読み直す
au CursorHold * :checktime
set hidden " ファイルを保存しなくても別のファイルを開けるように
set backupcopy=yes " ファイルのコピーを作成し、保存時に上書き
set mmp=20000
set title
set completeopt=menuone
set hlsearch
hi Search ctermbg=43
hi Search ctermfg=20
" set winblend=1 " Floating windows pseudo-transparency

au BufNewFile,BufRead *.{css,sass,scss,pcss,styl} set filetype=scss.css
au BufNewFile,BufRead *.{njk} set filetype=html.twig

let mapleader = "\<Space>"

set clipboard=unnamed,unnamedplus
nnoremap ,y "+y
vnoremap ,y "+y
nnoremap ,Y "+Y
vnoremap ,Y "+Y
nnoremap ,p "+p
vnoremap ,p "+p
nnoremap ,P "+P
vnoremap ,P "+P

" ビジュアルモードで連続ペースト
vnoremap <silent> <C-p> "0p<CR>

" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

" ノーマルモードでEnter押すと改行
nnoremap <CR> i<CR><ESC>
" ESC代替
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>
inoremap <silent> っj <ESC>

" autocmd ColorScheme * hi CursorLine cterm=none ctermbg=237

autocmd FileType html,jinja inoremap ,br <br>

" %で対応する括弧へ移動
" source $VIMRUNTIME/macros/matchit.vim

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
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'

  " Required:

  " Add or remove your plugins here like this:
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
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

""""""""""""""""""""""""""""""
" color overrides
""""""""""""""""""""""""""""""

hi Pmenu ctermbg=31
hi PmenuSel ctermbg=43 ctermfg=20
hi PmenuSbar ctermbg=249
hi PmenuThumb ctermfg=240

hi NormalFloat ctermfg=250 ctermbg=240


