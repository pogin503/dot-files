#!/bin/sh

set -e

for PROGRAM in .bashrc .bash_alias .gdbinit .tmux.conf .zshrc
do
    rsync -av $HOME/$PROGRAM ~/repo/dot-files/
done

# curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
# git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

# cp -R ~/.oh-my-zsh 
# cat .bash_profile >> ~/.bash_profile
