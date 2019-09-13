set nocompatible
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" NERDTree
" ファイルをツリー表示
NeoBundle 'scrooloose/nerdtree'

" ランチャー 
NeoBundle 'Shougo/unite.vim'

" Unite.vim で最近使ったファイルを表示出来るように
NeoBundle 'Shougo/neomru.vim'

" 補完
NeoBundle 'Shougo/neocomplete'

" カラースキーム
NeoBundle 'morhetz/gruvbox'

" hahhah
NeoBundle 'mattn/hahhah-vim'

" ステータスライン
NeoBundle 'itchyny/lightline.vim'

" コメントアウト
NeoBundle 'tyru/caw.vim'

" 閉じカッコ
NeoBundle 'cohama/lexima.vim'

" クォーテーションを入れたり切り替えたり
NeoBundle 'tpope/vim-surround'

" git
NeoBundle 'tpope/vim-fugitive'

" cake
"NeoBundle 'violetyk/cake.vim'

" ブラウザでリロード
NeoBundle 'tell-k/vim-browsereload-mac'

" スニペット
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'

" threes!
NeoBundle 'thinca/vim-threes'

" easymotion
NeoBundle 'Lokaltog/vim-easymotion'

" json
NeoBundle '5t111111/neat-json.vim'

" javascript
NeoBundleLazy 'othree/yajs.vim', {'autoload':{'filetypes':['javascript']}}

" gitの+-を表示
NeoBundle 'airblade/vim-gitgutter'

" インデントライン
"NeoBundle 'Yggdroot/indentLine'

" 終了タグをハイライト
NeoBundle 'Valloric/MatchTagAlways'

" スプラッシュ 
NeoBundle 'thinca/vim-splash'

call neobundle#end()
filetype plugin indent on

"" 毎回聞かれると邪魔な場合もあるので。
NeoBundleCheck
"
""-------------------------
"" End Neobundle Settings.
""-------------------------

"構文ハイライト
syntax on

set backspace=start,eol,indent "行頭bsで行連結
set number       "行番号
set ruler        "カーソルが何行目の何列目にあるか
set title        "ターミナルのタイトルをセット
set cursorline   "カーソル行を強調表示
set cursorcolumn "カーソル桁強調表示
set list         "空白文字の可視化
set laststatus=2 "ステータスラインを表示するウィンドウ
set encoding=utf-8
set listchars=tab:»-,trail:-,nbsp:%,extends:»,precedes:«,eol:↲
set history=2000 "ヒストリ
set hidden       "保存してなくても別のファイルを開けるように
set ignorecase   "検索の大文字小文字を区別しない
set shiftwidth=2 "自動で作られるタブ幅
set tabstop=2    "タブ幅
set showcmd      "コマンドをステータスラインに表示
set showmode     "ステータスラインに現在のモードを表示
set smartindent  "新しい行を作った時に自動インデント
set wildmenu     "補完候補の表示
set wrapscan     "検索がファイル末まで進んだら先頭から再検索
set wrap         "長い行を折り返して表示
set whichwrap=b,s,h,l,<,>,[,]  "カーソル移動を行末で止まらないように
set noswapfile   "swpファイルを作らない
set clipboard+=unnamed "ヤンクをクリップボードに

" カラースキーム
set background=dark "ダークモード
colorscheme gruvbox

" ステータスライン
set guifont=PowerlineSymbols
set noshowmode
scriptencoding utf-8
let g:lightline = {
	\	'colorscheme': 'wombat',
	\	'active': {
	\		'right':[
	\			['linechar', 'hahhah' ],
	\			['lineinfo'],
	\			['percent'],
	\			['fileformat'],
	\			['fileencoding', 'filetype'],
	\		]
	\	},
	\	'component': {
	\		'readonly': '%{&readonly?"x":""}',
	\	},
	\	'component_function': {
	\		'hahhah' : 'hahhah#get_text'
	\	},
	\	'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
	\	'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" }}

" NERDTree 自動起動
" autocmd VimEnter * execute 'NERDTree'

" leader をスペースに
let mapleader="\<Space>"

" Leader の設定
nnoremap <Leader>v :edit $MYVIMRC<CR>
nnoremap <Leader>cc :Ccontroller
nnoremap <Leader>cm :Cmodel
nnoremap <Leader>cv :Cview
nnoremap <Leader>ga :Gwrite
nnoremap <Leader>gc :Gcommit

" Unite.vim の設定
" インサートモードで始める
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" esc で終了
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
	nmap <silent><buffer> <ESC> <Plug>(unite_exit)
endfunction

" helpは<ESC>で閉じる
autocmd FileType help nnoremap <buffer> <ESC> <C-w>c

" NeoComplete の入力補完を一文字ずつ
let g:neocomplete#enable_at_startup = 1

let g:splash#path = $HOME . "/.vim/vim_intro.txt"

" インデントラインをデフォルト表示
"let g:indentLine_color_term = 111
"let g:indentLine_color_gui = '#708090'
"set list listchars=tab:\┆\ 
"let g:indentLine_char = '┆' "use ¦, ┆ or │

"MatchTagAlwaysのオプション機能ONにする
let g:mta_use_matchparen_group = 1

"MatchTagAlwaysを使用するファイルタイプ
let g:mta_filetypes = {
			\ 'html' : 1,
			\ 'xhtml' : 1,
			\ 'xml' : 1,
			\ 'jinja' : 1,
			\ 'php' : 1,
			\ 'ctp' : 1,
			\ 'vue' : 1,
			\}

" ctp をphp扱いに　htmlのシンタックスも有効に
autocmd BufNewFile,BufRead *.ctp set filetype=php
let php_htmlInStrings=1

" vue をhtml扱いに
autocmd BufNewFile,BufRead *.vue set filetype=html

" htmlの閉じタグ自動補完
augroup MyXML
	autocmd!
	autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype php inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype ctp inoremap <buffer> </ </<C-x><C-o>
	autocmd Filetype vue inoremap <buffer> </ </<C-x><C-o>
augroup END

" 最後のカーソル位置を復元する
augroup vimrcEx
	au BufRead * if line("'\"") > 0 && line("'\"") <= line("$") |
		\ exe "normal g`\"" | endif
augroup END

" カンマ、セミコロンを2回打つと、行末に追加
function! IsEndSign(sign)
	let c = getline(".")[col("$")-2]
	if c != a:sign
		return 1
	else
		return 0
	endif
endfunction
inoremap <expr>;; IsEndSign(';') ? "<C-O>$;" : "<C-O>$"
nnoremap <expr>;; IsEndSign(';') ? "A;<ESC>" : "$"
inoremap <expr>,, IsEndSign(',') ? "<C-O>$," : "<C-O>$"
nnoremap <expr>,, IsEndSign(',') ? "A,<ESC>" : "$"

" ノーマルモード　文字内で " で単語を囲う
nnoremap " diwi""<ESC>hp
nnoremap ' diwi''<ESC>hp
" ノーマルモード　文字内で "" で単語の囲いを取る
nnoremap "" diwpbhhxx
nnoremap '' diwpbhhxx

" pp でクリップボードからペースト
nnoremap pp :r !pbpaste<CR>

" <C-_>でコメントアウト"
nmap <C-_> <Plug>(caw:i:toggle)
vmap <C-_> <Plug>(caw:i:toggle)>

" 自動閉じカッコ　文末以外では無効
call lexima#add_rule({'at': '\%#.*[-0-9a-zA-Z_,:]', 'char': '{', 'input': '{'})
" 自動閉じカッコ　次の行に閉じカッコがあってもタイプ出来るように
call lexima#add_rule({'at': '\%#\n\s*}', 'char': '}', 'input': '}', 'delete': '}'})

" スニペットをタブ移動
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" easy-motion
nmap <Leader>s <Plug>(easymotion-s2)

" PHP関係
" .ctpはPHP扱いで
autocmd BufNewFile,BufRead *.ctp set filetype=php
" phpはHTMLのシンタックスも有効
let php_htmlInStrings=1
" cakePHP 現在のプロジェクトを自動認識
let g:cakephp_enable_auto_mode = 1

" PHP構文チェク
" augroup PHP
" 	autocmd FileType php set makeprg=php\ -l\ %
" 	autocmd BufWritePost *.php silent make | if len(getqflist()) != 1 | copen | else | cclose | endif
" augroup END

" 保存時にsudoで無理やり保存
cnoremap w!! w !sudo tee > /dev/null %<CR> :e!<CR>

" リターンは行挿入
noremap <CR> o<ESC>

" Tabは挿入モードでタブ
noremap <TAB> i<TAB>

" 候補確定はリターンで
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
	  return (pumvisible() ? "\<C-y>" : "\<CR>")
endfunction

" JSカラー
autocmd BufRead,BufNewFile *.es6 setfiletype javascript

" 空ファイルならテンプレートファイルを反映する
augroup templates
	autocmd BufNewFile *.html 0r ~/.dotfiles/templates/skel.html
	autocmd BufNewFile *.js 0r ~/.dotfiles/templates/skel.js
	autocmd BufNewFile *.css 0r ~/.dotfiles/templates/skel.css
augroup END

" クリップボードからペーストする時は自動インデントしない
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"検索のときはハイライトさせる
set hlsearch     
"esc 2回でハイライト消す
nnoremap <ESC><ESC> :noh<CR>

