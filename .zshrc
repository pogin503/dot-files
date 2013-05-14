# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="af-magic"
#ZSH_THEME="random"
#ZSH_THEME="arrow"
#ZSH_THEME="apple"
ZSH_THEME="my-arrow"
#ZSH_THEME="example"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

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
plugins=(git ruby brew autojump cake vagrant rails)

source $ZSH/oh-my-zsh.sh

source ~/.bash_alias
# Customize to your needs...
export PATH=/Users/OginoRyo/.rbenv/shims:/usr/local/share/npm/bin:~/.cabal/bin:/Users/OginoRyo/Library/Haskell/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/opt/X11/bin:$HOME/Library/Haskell/bin
fpath=($HOME/repo/zsh-completions $fpath)

local RED=$'%{\e[0;31m%}'
local GREEN=$'%{\e[0;32m%}'
local YELLOW='%{\e[0;33m%}'
local BLUE=$'%{\e[0;34m%}'
local PINK=$'%{\e[0;35m%}'
local CYAN=$'%{\e[0;36m%}'
local GREY=$'%{\e[1;30m%}'
local NORMAL=$'%{\e[0m%}'
