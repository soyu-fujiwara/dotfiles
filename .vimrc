"設定
set title
set nocompatible

"マウス
set mouse=a
set ttymouse=xterm2

"空白/タブ
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set ambiwidth=double
set smartindent

"入力
set backspace=indent,eol,start
set virtualedit=block
set whichwrap=b,s,[,],<,>

"表示
set t_Co=256
set number
set cursorline
set list
set listchars=tab:>.,trail:\ ,eol:\ ,extends:>,precedes:<,nbsp:%
highlight SpecialKey term=underline ctermfg=darkgray guifg=darkgray

"ステータスライン
set laststatus=2
augroup InsertHook
    au!
    au InsertEnter * highlight StatusLine ctermfg=240 ctermbg=15 guifg=#2E4340 guibg=#999999
    au InsertLeave * highlight StatusLine ctermfg=11  ctermbg=16  guifg=black guibg=#999900
augroup END

"ファイルナンバー表示
"set statusline=[%n]
"ホスト名表示
"set statusline+=%{matchstr(hostname(),'\\w\\+')}@
"ファイル名表示
set statusline+=%<%F
"変更のチェック表示
set statusline+=%m
"読み込み専用かどうか表示
set statusline+=%r
"ここからツールバー右側
set statusline+=%=
"ヘルプページなら[HELP]と表示
set statusline+=%h
"プレビューウインドウなら[Prevew]と表示
set statusline+=%w
"ファイルフォーマット表示
"set statusline+=[%{&fileformat}]
"ファイルタイプ表示
"set statusline+=%y
"skk.vimの状態
"set statusline+=%{exists('*SkkGetModeStr')?SkkGetModeStr():''}
"文字バイト数/カラム番号
set statusline+=[ASCII=%B,HEX=%c]
"文字コード表示
set statusline+=[%{has('multi_byte')&&\&fileencoding!=''?&fileencoding:&encoding}]
"現在文字行/全体行表示
set statusline+=[maxLine=%L]
"現在の列・行番号
set statusline+=[%c:%l]
"現在のファイルの文字数をカウント
"set statusline+=[WC=%{exists('*WordCount')?WordCount():[]}]
"現在行が全体行の何%目か表示
"set statusline+=[%p%%]



"コマンド補完
set wildmenu
set wildmode=list:full
set completeopt=menu,preview,menuone

"検索
set incsearch "インクリメンタルサーチ
set nowrapscan
set ignorecase "大文字小文字無視
set smartcase

"色
colorscheme koehler

"キーバインド
nmap <UP> gk
nmap <DOWN> gj
vmap <UP> gk
vmap <DOWN> gj



filetype off

"初回起動時
if has('vim_starting')
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

"初期化
call neobundle#begin(expand('~/.vim/bundle'))

"プラグイン
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

"unite 設定
"ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
"画面分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
"インサートで開く
let g:unite_enable_start_insert=1

NeoBundle 'scrooloose/nerdtree'

nnoremap <silent> <C-e> :NERDTreeToggle<CR>

call neobundle#end()

filetype plugin indent on

