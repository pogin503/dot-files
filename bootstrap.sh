#!/bin/bash


ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/Brewfile ~/Brewfile
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitconfig_global ~/.gitconfig_global
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.gdbinit ~/.gdbinit
ln -s ~/dotfiles/.ghci ~/.ghci
ln -s ~/dotfiles/.gemrc ~/.gemrc
ln -s ~/dotfiles/.guile ~/.guile
ln -s ~/dotfiles/.aliases ~/.aliases

git config --global alias.co 'checkout'
git config --global alias.st 'status -sb'
git config --global alias.cm 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'
