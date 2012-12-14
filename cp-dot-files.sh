#!/bin/sh

for PROGRAM in .bashrc .gdbinit .bash_profile .tmux.conf .zshrc
do
    cp ~/$PROGRAM `pwd`/
done
