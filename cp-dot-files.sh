#!/bin/sh

for PROGRAM in .bashrc .bash_alias .gdbinit .tmux.conf .zshrc
do
    cp ~/$PROGRAM `pwd`/
done

cat .bash_profile >> ~/.bash_profile
