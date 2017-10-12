#!/usr/bin/env bash

# Install Homebrew
if ! command "brew" > /dev/null; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install Apps
# brew tap Homebrew/bundle
# brew bundle --file=~/dotfiles/Brewfile
# brew linkapps
# brew cleanup
# brew cask cleanup
# brew doctor
# brew cask doctor
