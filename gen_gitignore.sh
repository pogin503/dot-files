#!/usr/bin/env bash
set -eux
gibo -u
gibo Ansible Eclipse Windows macOS Linux C ELisp Haskell Scala Rust Python Emacs Vim Ruby tags Vagrant Xcode JetBrains | uniq > ~/dotfiles/.gitignore_global

# gibo Ansible Eclipse Windows macOS Linux Emacs Vim tags Vagrant Xcode JetBrains | uniq > ~/dotfiles/.gitignore_global
# gibo ELisp Haskell Scala Rust Ruby Python Java C | uniq >> ~/dotfiles/.gitignore_global
sed -i -e s/^\*\.d$// ~/dotfiles/.gitignore_global

cat >> ~/dotfiles/.gitignore_global <<EOF
.ipynb_checkpoints
EOF
