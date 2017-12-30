#!/usr/bin/env zsh

# Path to your oh-my-zsh configuration.
ZSH="$HOME"/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="my-arrow"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git ruby gem brew autojump cake vagrant rails knife cabal node npm)

source ~/.aliases

## 実行したプロセスの消費時間が3秒以上かかったら
## 自動的に消費時間の統計情報を表示する。
REPORTTIME=3

## 全てのユーザのログイン・ログアウトを監視する。
watch="all"
## ログイン時にはすぐに表示する。
log

## ^Dでログアウトしないようにする。
setopt ignore_eof

RED=$'%{\e[0;31m%}'
GREEN=$'%{\e[0;32m%}'
YELLOW='%{\e[0;33m%}'
BLUE=$'%{\e[0;34m%}'
PINK=$'%{\e[0;35m%}'
CYAN=$'%{\e[0;36m%}'
GREY=$'%{\e[1;30m%}'
NORMAL=$'%{\e[0m%}'

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/opt/X11/bin:$PATH

# for rbenv
export PATH=~/.rbenv/bin:$PATH
eval "$(rbenv init -)"

# for pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# for cask
export PATH="$HOME/.cask/bin:$PATH"

fpath=($HOME/repo/zsh-completions $fpath)

# for stack or clojure
if [[ ! -e "$HOME"/.local/bin ]];then
  mkdir "$HOME"/.local/bin
fi
export PATH=$HOME/.local/bin:$PATH

# for ats
export PATSHOME=$HOME/atshome/ATS2-Postiats-0.2.1
export PATH=${PATSHOME}/bin:${PATH}
export PATSHOMERELOC=$HOME/atshome/ATS2-Postiats-contrib-0.1.12


if [[ $(uname) = 'Darwin' ]];then
	export PATH="$HOME/Library/Haskell/bin:$PATH"

	# brew api token
	if [ -f ~/private/.brew_api_token ];then
		source ~/private/.homebrew_api_token
	fi
fi

if [ -d "$HOME"/.composer/vendor/bin ]; then
   export PATH="$HOME"/.composer/vendor/bin:${PATH}
fi
