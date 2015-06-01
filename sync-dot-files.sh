#!/bin/sh

set -e

for PROGRAM in .bashrc .bash_alias .gdbinit .tmux.conf .zshrc
do
    rsync -av $HOME/$PROGRAM ~/repo/dot-files/
done
