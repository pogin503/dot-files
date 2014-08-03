" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
set nocompatible
filetype indent plugin off
filetype off

set showcmd
set number
set ignorecase
set smartcase

" オートインデント
set autoindent

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" Enable use of the mouse for all modes
" 全モードでマウスを有効化
set mouse=a

if has('vim_starting')
	" neobudle.vimの関数を呼ぶためにインストールしたディレクトリを指定if
	set runtimepath+=~/.vim/bundle/neobundle.vim/
	call neobundle#rc(expand('~/.vim/bundle'))
endif

" NeoBundle 自体を管理
NeoBundleFetch 'Shougo/neobudle.vim'

NeoBundle 'Shougo/neobundle.vim'
" 管理するプラグイン
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'Shougo/unite.vim'
" NeoBundle 'Shougo/vimproc.vim'
NeoBundle 'thinca/vim-quickrun'

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on
filetype indent on
syntax on

" インストールチェック
NeoBundleCheck
