#!/usr/bin/env bash
set -eu
# set -x

ln -sf ~/dotfiles/.aliases ~/.aliases
ln -sf  ~/dotfiles/.gdbinit ~/.gdbinit
ln -sf ~/dotfiles/.ghci ~/.ghci
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.guile ~/.guile
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc

mkdir -p ~/.config/fish
ln -sf ~/dotfiles/.config/fish/aliases.fish  ~/.config/fish/aliases.fish
ln -sf ~/dotfiles/.config/fish/config.fish  ~/.config/fish/config.fish

git config --global alias.co 'checkout'
git config --global alias.st 'status -sb'
git config --global alias.cm 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

git config --global user.name "pogin503"
git config --global user.email "pogin503@gmail.com"

git config --global core.excludesfile ~/.gitignore_global
# git config --global core.editor emacsclient
pwd
# ./clojure/setup.sh
./rust/setup.sh

if [[ $(uname) = 'Darwin' ]];then
    ./mac/setup.sh
fi
