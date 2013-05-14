#!/bin/sh

set -e

# curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
# git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

for PROGRAM in .bashrc .bash_alias .gdbinit .tmux.conf .zshrc
do
    rsync -av `pwd`/$PROGRAM $HOME
done

cp -R ~/.oh-my-zsh 
cat .bash_profile >> ~/.bash_profile
