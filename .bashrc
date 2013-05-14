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

# extract() {
#     local c e i

#     (($#)) || return

#     for i; do
#         c=''
#         e=1

#         if [[ ! -r $i ]]; then
#             echo "$0: file is unreadable: \`$i'" >&2
#             continue
#         fi

#         case $i in
#         *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
#                c='bsdtar xvf';;
#         *.7z)  c='7z x';;
#         *.Z)   c='uncompress';;
#         *.bz2) c='bunzip2';;
#         *.exe) c='cabextract';;
#         *.gz)  c='gunzip';;
#         *.rar) c='unrar x';;
#         *.xz)  c='unxz';;
#         *.zip) c='unzip';;
#         *)     echo "$0: unrecognized file extension: \`$i'" >&2
#                continue;;
#         esac

#         command $c "$i"
#         e=$?
#     done

#     return $e
# }

# source ~/git-completion.bash

# http://dharry.hatenablog.com/entry/2012/09/17/031850
backup(){ cp -pr $1{,.`date +%Y-%m-%dT%H:%M:%S`}; }

# ex. $ pscan 192.168.0.0/24
pscan(){ nmap -nsP "$1" | awk '{if($1=="Host") print $2 }'; }

source ./.bash_alias

export EDITOR='emacsclient'

if [ -f /usr/share/git-core/git-completion.bash ]; then
  source /usr/share/git-core/git-completion.bash
fi
function show-hide-file (){
    defaults write com.apple.finder AppleShowAllFiles -boolean $1 && killall Finder
}

