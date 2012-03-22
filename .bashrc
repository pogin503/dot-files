# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

alias emacs="emacsclient -a emacs"
alias nw='emacsclient --alternate-editor="" -t'
alias cl='emacsclient --alternate-editor="" -nc'
alias emn='emacs -nw'
# User specific aliases and functions
