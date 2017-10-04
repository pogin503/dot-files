#!/usr/bin/env bash
set -eu
# set -x

DOT_DIR="$HOME"/dotfiles

ln -sf "$DOT_DIR"/.aliases          ~/.aliases
ln -sf "$DOT_DIR"/.gdbinit          ~/.gdbinit
ln -sf "$DOT_DIR"/.ghci             ~/.ghci
ln -sf "$DOT_DIR"/.gitignore_global ~/.gitignore_global
ln -sf "$DOT_DIR"/.guile            ~/.guile
ln -sf "$DOT_DIR"/.tmux.conf        ~/.tmux.conf
ln -sf "$DOT_DIR"/.vimrc            ~/.vimrc
ln -sf "$DOT_DIR"/.zshrc            ~/.zshrc

mkdir -p ~/.config/fish
ln -sf "$DOT_DIR"/.config/fish/aliases.fish     ~/.config/fish/aliases.fish
ln -sf "$DOT_DIR"/.config/fish/config.fish      ~/.config/fish/config.fish
ln -sf "$DOT_DIR"/.config/fish/functions.fish   ~/.config/fish/functions.fish

mkdir -p ~/.stack/
ln -sf "$DOT_DIR"/.stack/config.yaml ~/.stack/config.yaml

git config --global alias.co 'checkout'
git config --global alias.st 'status -sb'
git config --global alias.cm 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

git config --global user.name  "pogin503"
git config --global user.email "pogin503@gmail.com"

git config --global core.excludesfile ~/.gitignore_global
# git config --global core.editor emacsclient

git config --global core.quotepath false

# "$DOT_DIR"/clojure/setup.sh
# "$DOT_DIR"/rust/setup.sh
"$DOT_DIR"/ats2/setup.sh

if [[ $(uname) = 'Darwin' ]];then
    "$DOT_DIR"/mac/setup.sh
fi
