#!/usr/bin/env bash
gibo -u
gibo Windows macOS Linux C ELisp Haskell Scala Rust Python Emacs Vim Ruby tags Vagrant Xcode JetBrains | uniq > ~/dotfiles/.gitignore_global
cat >> ~/dotfiles/.gitignore_global <<EOF
.ipynb_checkpoints
EOF
