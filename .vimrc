if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" NeoBundle 自体を管理
NeoBundleFetch 'Shougo/neobundle.vim'

" 管理するプラグイン
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'gregsexton/gitv'
NeoBundle 'vim-scripts/sudo.vim'
NeoBundle 'thinca/vim-quickrun'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }

" Required:
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------

" ファイル形式検出、プラグイン、インデントを ON
filetype plugin indent on
filetype indent on
syntax on

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
