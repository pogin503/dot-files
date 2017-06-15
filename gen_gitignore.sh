#!/usr/bin/env bash
gibo Windows macOS Linux C ELisp Haskell Scala Rust Python Emacs Vim Ruby tags Vagrant Xcode JetBrains | uniq > ~/dotfiles/.gitignore_global
cat >> ./.gitignore_global <<EOF
.ipynb_checkpoints
EOF
