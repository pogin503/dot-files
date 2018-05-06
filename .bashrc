#!/usr/bin/env bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
PS1='[\u@\h \W]\n$ '

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=200000

# Command history
export HISTCONTROL=ignoredups  # (ignoreboth -> ignoredups and ignorespace)

HISTIGNORE='?:??:rm *:\\rm *:r \\m *'

# append to the history file, don't overwrite it
shopt -s histappend

# shellcheck source=.aliases
source ~/.aliases

if [ -f /usr/share/git-core/git-completion.bash ]; then
  # shellcheck disable=SC1091
  source /usr/share/git-core/git-completion.bash
fi
if [ -d "$HOME"/.composer/vendor/bin ]; then
   export PATH="$HOME"/.composer/vendor/bin:${PATH}
fi
