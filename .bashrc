# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#PS1='[\u@\h \W]\\n$ '

# emacs
# @see http://d.hatena.ne.jp/h_iijima/20110401/1301620545
alias emacs="emacsclient -a emacs"
# alias nw='emacsclient --alternate-editor="" -t'
# alias cl='emacsclient --alternate-editor="" -nc'
# alias emnw='emacs -nw'
# alias emt='emacsclient -t -a ""'
# alias emc='emacsclient -c -a ""'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# alias l='ls'
alias ls='ls --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -lA'
alias lx='ll -BX'                   # sort by extension
alias lz='ll -rS'                   # sort by size
alias lt='ll -rt'                   # sort by date
alias lm='la | more'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'


# usefuln
alias grep='grep --color=auto'
alias mkdir='mkdir -p -v'
#alias ..='cd ..'

# Command history
export HISTCONTROL=ignoredups  # (ignoreboth -> ignoredups and ignorespace)

HISTIGNORE='?:??:rm *:\\rm *:r \\m *'

# append to the history file, don't overwrite it
shopt -s histappend

# privileged access
if [ $UID -ne 0 ]; then
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    # alias update='sudo pacman -Su'
    alias netcfg='sudo netcfg2'
fi

# new commands
alias da='date "+%A, %B %d, %Y [%T]"'
alias hist='history | grep $1'      # requires an argument
alias openports='netstat --all --numeric --programs --inet --inet6'



# pacman aliases (if applicable, replace 'pacman' with 'yaourt'/'pacaur'/whatever)
if [[ `uname -r` =~ ARCH$ ]]; then
    alias pac="pacman -S"      # default action     - install one or more packages
    alias pacu="pacman -Syu"   # '[u]pdate'         - upgrade all packages to their newest version
    alias pacs="pacman -Ss"    # '[s]earch'         - search for a package using one or more keywords
    alias paci="pacman -Si"    # '[i]nfo'           - show information about a package
    alias pacr="pacman -R"     # '[r]emove'         - uninstall one or more packages
    alias pacl="pacman -Sl"    # '[l]ist'           - list all packages of a repository
    alias pacll="pacman -Qqm"  # '[l]ist [l]ocal'   - list all packages which were locally installed (e.g. AUR packages)
    alias paclo="pacman -Qdt"  # '[l]ist [o]rphans' - list all packages which are orphaned
    alias paco="pacman -Qo"    # '[o]wner'          - determine which package owns a given file
    alias pacf="pacman -Ql"    # '[f]iles'          - list all files installed by a given package
    alias pacc="pacman -Sc"    # '[c]lean cache'    - delete all not currently installed package files
    alias pacm="makepkg -fci"  # '[m]ake'           - make package from PKGBUILD file in current directory
    # @see https://wiki.archlinux.org/index.php/Bashrc#Aliases
    alias yaupdate="yaourt -Syua --devel"
fi

extract() {
    local c e i

    (($#)) || return

    for i; do
        c=''
        e=1

        if [[ ! -r $i ]]; then
            echo "$0: file is unreadable: \`$i'" >&2
            continue
        fi

        case $i in
        *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
               c='bsdtar xvf';;
        *.7z)  c='7z x';;
        *.Z)   c='uncompress';;
        *.bz2) c='bunzip2';;
        *.exe) c='cabextract';;
        *.gz)  c='gunzip';;
        *.rar) c='unrar x';;
        *.xz)  c='unxz';;
        *.zip) c='unzip';;
        *)     echo "$0: unrecognized file extension: \`$i'" >&2
               continue;;
        esac

        command $c "$i"
        e=$?З
    done

    return $e
}

# color setting
export black="\[\033[0;38;5;0m\]"
export red="\[\033[0;38;5;1m\]"
export orange="\[\033[0;38;5;130m\]"
export green="\[\033[0;38;5;2m\]"
export yellow="\[\033[0;38;5;3m\]"
export blue="\[\033[0;38;5;4m\]"
export bblue="\[\033[0;38;5;12m\]"
export magenta="\[\033[0;38;5;55m\]"
export cyan="\[\033[0;38;5;6m\]"
export white="\[\033[0;38;5;7m\]"
export coldblue="\[\033[0;38;5;33m\]"
export smoothblue="\[\033[0;38;5;111m\]"
export iceblue="\[\033[0;38;5;45m\]"
export turqoise="\[\033[0;38;5;50m\]"
export smoothgreen="\[\033[0;38;5;42m\]"

# git alias
alias ga='git add'
alias gal='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gps='git push'
alias gpl='git pull'
alias gch='git checkout'
alias gb='git branch'
alias gf='git diff'
alias gm='git merge'
alias gl='git log'

alias gsb='git status -sb'

# http://www.reddit.com/r/commandline/comments/12g76v/how_to_automatically_source_zshrc_in_all_open/
trap "source ~/.bashrc" USR1
alias source-bashrc-all="pkill -usr1 bash"

source ~/git-completion.bash

# http://dharry.hatenablog.com/entry/2012/09/17/031850
backup(){ cp -pr $1{,.`date +%Y-%m-%dT%H:%M:%S`}; }

alias cpuinfo="awk  -F: ' {if(\$1 ~/^model name/){ model[\$2]=+1}} END{for(k in model) { print model[k], k}}' /proc/cpuinfo"
alias rmdir_r='find . -depth -type d | xargs rmdir 2> /dev/null'
# alias rmdir_r='find . -type d -empty -delete'
alias rdom='echo `od -vAn -N4 -tu4 < /dev/urandom`'

# ex. $ pscan 192.168.0.0/24
pscan(){ nmap -nsP "$1" | awk '{if($1=="Host") print $2 }'; }
