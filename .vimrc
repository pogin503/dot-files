" Required:
filetype plugin indent on

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on
filetype indent on
syntax on

set showcmd
set number
set ignorecase
set smartcase

set hlsearch

" オートインデント
set autoindent

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" Enable use of the mouse for all modes
" 全モードでマウスを有効化
" set mouse=a

" エンコーディング
set fileencodings=utf-8,sjis,iso-2022-jp,euc-jp
set fileformats=unix,dos,mac

" TABキーを押した際にタブ文字の代わりにスペースを入れる
set expandtab
" 画面上のタブ文字の幅
set tabstop=4
" 自動インデントでずれる幅
set shiftwidth=4

" set clipboard&
" set clipboard^=unnamedplus
