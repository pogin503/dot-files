#!/usr/bin/env bash

# ln -s ~/dotfiles/.aliases ~/.aliases
ln -s ~/dotfiles/.gdbinit ~/.gdbinit
ln -s ~/dotfiles/.ghci ~/.ghci
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -s ~/dotfiles/.guile ~/.guile
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
# ln -s ~/dotfiles/.zshrc ~/.zshrc

mkdir -p ~/.config/fish
ln -s ~/dotfiles/.config/fish/aliases.fish  ~/.config/fish/aliases.fish
ln -s ~/dotfiles/.config/fish/config.fish  ~/.config/fish/config.fish

git config --global alias.co 'checkout'
git config --global alias.st 'status -sb'
git config --global alias.cm 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

git config --global core.excludesfile ~/.gitignore_global
git config core.editor emacsclient

# for clojure
if [ ! -d "$HOME"/.local/bin ]; then mkdir -p "$HOME"/.local/bin; fi

pushd "$HOME"/.local/bin
curl https://raw.github.com/technomancy/leiningen/stable/bin/lein
chmod a+x lein
./lein
popd

# Install Homebrew
if ! type "brew" > /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Apps
brew tap Homebrew/bundle
brew bundle --file=~/dotfiles/Brewfile
brew linkapps
brew cleanup
brew cask cleanup
brew doctor
brew cask doctor
