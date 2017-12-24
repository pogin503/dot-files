#!/usr/bin/env bash
set -eu

DOT_DIR=~/dotfiles

gibo -u
gibo Ansible Eclipse Windows macOS Linux Emacs Vim tags Vagrant Xcode JetBrains | uniq > "$DOT_DIR"/.gitignore_global
gibo ELisp Haskell Scala Rust Ruby Python Java C | uniq >> "$DOT_DIR"/.gitignore_global

sed -i -e s/^\*\.d$// "$DOT_DIR"/.gitignore_global

cat >> "$DOT_DIR"/.gitignore_global <<EOF
.ipynb_checkpoints
EOF
