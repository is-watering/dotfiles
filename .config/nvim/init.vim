filetype plugin indent off

" set all& " init all settings
set encoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set fileformats=unix,dos,mac
set guifont=Cica:h14
" set printfont=Cica:h14
set ambiwidth=single
set number " 行番号を表示
" set relativenumber " 相対行番号を表示
" set autoindent " 改行時に自動でインデントする
set wrap " 自動折り返しを有効
" set cursorline " カーソルラインを有効
set mouse=a
set ignorecase " 検索時に大文字小文字を無視
set wrapscan " 最後尾まで検索を終えたら次の検索で先頭に移る
set smartcase
set virtualedit=onemore " 行末の1文字先までカーソルを移動できるように
set whichwrap+=h,l,<,>,[,],b,s " 行末・行頭から次の行へ移動可能に
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
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
set inccommand=split
set wildmenu
set wildoptions=pum

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

" Python path
let g:python3_host_prog = '~/.rye/shims/python3'

" ビジュアルモードで連続ペースト
vnoremap <silent> <C-p> "0p<CR>

" ノーマルモード時だけ ; と : を入れ替える
nnoremap ; :
nnoremap : ;

" ノーマルモードでEnter押すと改行
nnoremap <CR> i<CR><ESC>

" インサートモードを抜けたときにIMEオフ
" inoremap <ESC> <ESC>:set iminsert=0<CR>
" inoremap <CR>[ <CR>[:set iminsert=0<CR>

" ESC代替
inoremap <silent> jj <ESC>
inoremap <silent> っｊ <ESC>
inoremap <silent> っj <ESC>

" autocmd ColorScheme * hi CursorLine cterm=none ctermbg=237

autocmd FileType html,jinja,php inoremap ,br <br>

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
" Ward off unexpected things that your distro might have made, as
" well as sanely reset options when re-sourcing .vimrc
set nocompatible

" Set Dein base path (required)
let s:dein_base = '/home/pp/.cache/dein'

" Set Dein source path (required)
let s:dein_src = '/home/pp/.cache/dein/repos/github.com/Shougo/dein.vim'

" Set Dein runtime path (required)
execute 'set runtimepath+=' . s:dein_src

" Call Dein initialization (required)
call dein#begin(s:dein_base)

call dein#add(s:dein_src)

" Your plugins go here:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')

" Let dein manage dein
let s:toml_dir  = $HOME . '/.config/nvim/toml/'
let s:toml      = s:toml_dir . '/dein.toml'
let s:ddc       = s:toml_dir . '/ddc.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
let $TOML_DIR = s:toml_dir

" Add or remove your plugins here like this:
call dein#load_toml(s:toml,      {'lazy': 0})
call dein#load_toml(s:ddc,       {'lazy': 1})
call dein#load_toml(s:lazy_toml, {'lazy': 1})

" Finish Dein initialization (required)
call dein#end()

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax enable

" Uncomment if you want to install not-installed plugins on startup.
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

