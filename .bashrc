# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
PS1='[\u@\h \W]\n$ '

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# Command history
export HISTCONTROL=ignoredups  # (ignoreboth -> ignoredups and ignorespace)

HISTIGNORE='?:??:rm *:\\rm *:r \\m *'

# append to the history file, don't overwrite it
shopt -s histappend

# http://dharry.hatenablog.com/entry/2012/09/17/031850
backup(){ cp -pr $1{,.`date +%Y-%m-%dT%H:%M:%S`}; }

# ex. $ pscan 192.168.0.0/24
pscan(){ nmap -nsP "$1" | awk '{if($1=="Host") print $2 }'; }

source ./.bash_alias

if [ -f /usr/share/git-core/git-completion.bash ]; then
  source /usr/share/git-core/git-completion.bash
fi

function show-hide-file (){
    defaults write com.apple.finder AppleShowAllFiles -boolean $1 && killall Finder
}
