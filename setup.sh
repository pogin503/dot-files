#!/usr/bin/env bash
set -eu
# set -x

SCRIPT_DIR=$(dirname "$0")
. "$SCRIPT_DIR"/etc/env.sh

ln -sf "$DOT_DIR"/.aliases          ~/.aliases
if [ -e ~/.bashrc ]; then
  cp ~/.bashrc ~/".bashrc_orig_$(date '+%Y-%m-%dT%H:%M')"
fi
ln -sf "$DOT_DIR"/.bashrc              ~/.bashrc
ln -sf "$DOT_DIR"/.tmux.conf           ~/.tmux.conf
ln -sf "$DOT_DIR"/.vimrc               ~/.vimrc
ln -sf "$DOT_DIR"/.zshrc               ~/.zshrc

mkdir -p "$XDG_CONFIG_HOME"/fish
mkdir -p "$XDG_CONFIG_HOME"/fish/functions
ln -sf "$DOT_DIR"/.config/fish/aliases.fish "$XDG_CONFIG_HOME"/fish/aliases.fish
ln -sf "$DOT_DIR"/.config/fish/config.fish  "$XDG_CONFIG_HOME"/fish/config.fish

files=$(find "$DOT_DIR"/.config/fish/functions/ -type f -print0 | xargs -0 -n1 basename)

for file in $files; do
  ln -sf "$DOT_DIR"/.config/fish/functions/"$file" "$XDG_CONFIG_HOME"/fish/functions/"$file"
done

ln -sf "$DOT_DIR"/.textlintrc  ~/.textlintrc

# languages
mkdir -p "$XDG_CONFIG_HOME"
mkdir -p "$XDG_CONFIG_HOME"/rubocop
mkdir -p "$XDG_CONFIG_HOME"/R
ln -sf "$DOT_DIR"/.config/R/.Renviron  "$XDG_CONFIG_HOME"/R/.Renviron
ln -sf "$DOT_DIR"/.gdbinit             ~/.gdbinit
ln -sf "$DOT_DIR"/.ghci                ~/.ghci
ln -sf "$DOT_DIR"/.guile               ~/.guile
ln -sf "$DOT_DIR"/.rubocop.yml         "$XDG_CONFIG_HOME"/rubocop/.rubocop.yml
ln -sf "$DOT_DIR"/.ansible.cfg         ~/.ansible.cfg

mkdir -p "$XDG_CONFIG_HOME"/git
ln -sf "$DOT_DIR"/.config/git/.commit_template  "$XDG_CONFIG_HOME"/git/.commit_template
ln -sf "$DOT_DIR"/.config/git/.gitignore_global "$XDG_CONFIG_HOME"/git/.gitignore_global

mkdir -p ~/.stack/
ln -sf "$DOT_DIR"/.stack/config.yaml ~/.stack/config.yaml

# git config
git config --global alias.co 'checkout'
git config --global alias.st 'status -sb'
git config --global alias.cm 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

git config --global user.name  "pogin503"
git config --global user.email "pogin503@gmail.com"

git config --global core.excludesfile "$XDG_CONFIG_HOME"/git/.gitignore_global
# git config --global core.editor emacsclient
git config --global commit.template   "$XDG_CONFIG_HOME"/git/.commit_template
git config --global core.quotepath false

# ghq setting
if [[ $(uname) = 'Darwin' ]]; then
  git config --global ghq.root /Volumes/ext_SSD/repo
else
  :
fi


# "$DOT_DIR"/clojure/setup.sh
# "$DOT_DIR"/rust/setup.sh
# "$DOT_DIR"/ats2/setup.sh

"$DOT_DIR"/etc/setup.sh
