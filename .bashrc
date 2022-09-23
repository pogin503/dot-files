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

# for rbenv
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"

export CARGO_HOME="$XDG_DATA_HOME"/cargo

export GEM_HOME="$XDG_DATA_HOME"/gem
export GEM_SPEC_CACHE="$XDG_CACHE_HOME"/gem
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
export IRBRC="$XDG_CONFIG_HOME"/irb/irbrc

export HISTFILE="$XDG_DATA_HOME"/bash/history

export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/npmrc
export NVM_DIR="$XDG_DATA_HOME"/nvm

# export STACK_ROOT="$XDG_DATA_HOME"/stack

export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases
export VAGRANT_HOME="$XDG_DATA_HOME"/vagrant

export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export MACHINE_STORAGE_PATH="$XDG_DATA_HOME"/docker-machine

export MYSQL_HISTFILE="$XDG_DATA_HOME"/mysql_history

export PSQLRC="$XDG_CONFIG_HOME/pg/psqlrc"
export PSQL_HISTORY="$XDG_CACHE_HOME/pg/psql_history"
export PGPASSFILE="$XDG_CONFIG_HOME/pg/pgpass"
export PGSERVICEFILE="$XDG_CONFIG_HOME/pg/pg_service.conf"

export SQLITE_HISTORY="$XDG_DATA_HOME"/sqlite_history

export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"

export BASH_COMPLETION_USER_FILE="$XDG_CONFIG_HOME"/bash-completion/bash_completion

export AWS_SHARED_CREDENTIALS_FILE="$XDG_CONFIG_HOME"/aws/credentials
export AWS_CONFIG_FILE="$XDG_CONFIG_HOME"/aws/config

export GNUPGHOME="$XDG_DATA_HOME"/gnupg
if hash gpg2 2>/dev/null; then
  gpg2 --homedir "$XDG_DATA_HOME"/gnupg
fi

mkdir -p "$XDG_CACHE_HOME"/less
export LESSKEY="$XDG_CONFIG_HOME"/less/lesskey
export LESSHISTFILE="$XDG_CACHE_HOME"/less/lesshst

export GRADLE_USER_HOME=/Users/pogin/.local/share/gradle
export GRADLE_USER_HOME="$XDG_DATA_HOME"/gradle
# export XINITRC="$XDG_CONFIG_HOME"/X11/xinitrc
# export XSERVERRC="$XDG_CONFIG_HOME"/X11/xserverrc
export OCTAVE_HISTFILE="$XDG_CACHE_HOME/octave-hsts"
export OCTAVE_SITE_INITFILE="$XDG_CONFIG_HOME/octave/octaverc"
export PYTHON_EGG_CACHE="$XDG_CACHE_HOME"/python-eggs
export PYLINTHOME="$XDG_CACHE_HOME"/pylint
export INPUTRC="$XDG_CONFIG_HOME"/readline/inputrc
export PATH="/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin:$PATH"

if [[ $(uname) = 'Darwin' ]]; then
  export GROOVY_HOME=/usr/local/opt/groovy/libexec
  if [ -f "$(brew --prefix)"/etc/bash_completion ]; then
    . "$(brew --prefix)"/etc/bash_completion
  fi
fi

# WebAssembly
export WASMER_DIR="$HOME/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
