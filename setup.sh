#!/bin/bash

ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/.config/fish/aliases.fish  ~/.config/fish/aliases.fish
ln -s ~/dotfiles/.config/fish/config.fish  ~/.config/fish/config.fish
ln -s ~/dotfiles/.gdbinit ~/.gdbinit
ln -s ~/dotfiles/.ghci ~/.ghci
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/.guile ~/.guile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc


# ln -s ~/dotfiles/.zshrc ~/.zshrc

# git clone git://github.com/Shougo/neobundle.vim.git ~/.vim/bundle
# vim +":NeoBundleInstall" +:q

git config --global alias.co 'checkout'
git config --global alias.st 'status -sb'
git config --global alias.cm 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

git config --global core.excludesfile ~/.gitignore_global
git config core.editor emacsclient

# for clojure
if [ ! -d $HOME/.local/bin ]; then mkdir -p $HOME/.local/bin; fi

pushd $HOME/.local/bin
wget https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod a+x lein
./lein
popd
