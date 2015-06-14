#!/bin/bash


ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/Brewfile ~/Brewfile
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gdbinit ~/.gdbinit
ln -s ~/dotfiles/.ghci ~/.ghci
ln -s ~/dotfiles/.guile ~/.guile
ln -s ~/dotfiles/.aliases ~/.aliases

git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/bundle
vim +":NeoBundleInstall" +:q

git config --global alias.co 'checkout'
git config --global alias.st 'status -sb'
git config --global alias.cm 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

git config --global core.excludesfile ~/.gitignore_global
git config core.editor emacsclient
