#!/usr/bin/env bash
set -eu
# set -x

DOT_DIR="$HOME"/dotfiles

ln -sf "$DOT_DIR"/.aliases          ~/.aliases
if [ -e ~/.bashrc ]; then
  cp ~/.bashrc ~/".bashrc_orig_$(date '+%Y-%m-%dT%H:%M')"
fi
ln -sf "$DOT_DIR"/.bashrc           ~/.bashrc
ln -sf "$DOT_DIR"/.gdbinit          ~/.gdbinit
ln -sf "$DOT_DIR"/.ghci             ~/.ghci
ln -sf "$DOT_DIR"/.guile            ~/.guile
ln -sf "$DOT_DIR"/.rubocop.yml      ~/.rubocop.yml
ln -sf "$DOT_DIR"/.tmux.conf        ~/.tmux.conf
ln -sf "$DOT_DIR"/.vimrc            ~/.vimrc
ln -sf "$DOT_DIR"/.zshrc            ~/.zshrc

mkdir -p ~/.config/fish
mkdir -p ~/.config/fish/functions
ln -sf "$DOT_DIR"/.config/fish/aliases.fish               ~/.config/fish/aliases.fish
ln -sf "$DOT_DIR"/.config/fish/config.fish                ~/.config/fish/config.fish
ln -sf "$DOT_DIR"/.config/fish/functions/functions.fish   ~/.config/fish/functions/functions.fish

mkdir -p ~/.config/git
ln -sf "$DOT_DIR"/.config/git/.commit_template  ~/.config/git/.commit_template
ln -sf "$DOT_DIR"/.config/git/.gitignore_global ~/.config/git/.gitignore_global

mkdir -p ~/.stack/
ln -sf "$DOT_DIR"/.stack/config.yaml ~/.stack/config.yaml

git config --global alias.co 'checkout'
git config --global alias.st 'status -sb'
git config --global alias.cm 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

git config --global user.name  "pogin503"
git config --global user.email "pogin503@gmail.com"

git config --global core.excludesfile ~/.config/git/.gitignore_global
# git config --global core.editor emacsclient
git config --global commit.template   ~/.config/git/.commit_template
git config --global core.quotepath false

# "$DOT_DIR"/clojure/setup.sh
# "$DOT_DIR"/rust/setup.sh
# "$DOT_DIR"/ats2/setup.sh

# if [[ $(uname) = 'Darwin' ]];then
#     "$DOT_DIR"/mac/setup.sh
# fi
