# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

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

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/sbin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/opt/X11/bin:$PATH


# for rbenv
which rbenv > /dev/null 2>&1
if [ $? -eq 0 ]; then # コマンドが存在すれば
    export PATH=~/.rbenv/bin:$PATH
    eval "$(rbenv init -)"
fi

# for cabal path
export PATH="$HOME/Library/Haskell/bin:$PATH"

# for cask
export PATH="$HOME/.cask/bin:$PATH"

fpath=($HOME/repo/zsh-completions $fpath)

source ~/.aliases

local RED=$'%{\e[0;31m%}'
local GREEN=$'%{\e[0;32m%}'
local YELLOW='%{\e[0;33m%}'
local BLUE=$'%{\e[0;34m%}'
local PINK=$'%{\e[0;35m%}'
local CYAN=$'%{\e[0;36m%}'
local GREY=$'%{\e[1;30m%}'
local NORMAL=$'%{\e[0m%}'

## 実行したプロセスの消費時間が3秒以上かかったら
## 自動的に消費時間の統計情報を表示する。
REPORTTIME=3

## 全てのユーザのログイン・ログアウトを監視する。
watch="all"
## ログイン時にはすぐに表示する。
log

## ^Dでログアウトしないようにする。
setopt ignore_eof

# for clojure
if [[ ! -e $HOME/local/bin ]];then
    mkdir $HOME/local/bin
fi
export PATH=$HOME/local/bin:$PATH

# for ats
export PATSHOME=$HOME/atshome/ATS2-Postiats-0.2.1
export PATH=${PATSHOME}/bin:${PATH}
export PATSHOMERELOC=$HOME/atshome/ATS2-Postiats-contrib-0.1.12
