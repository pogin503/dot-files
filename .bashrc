# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
#PS1='[\u@\h \W]\$ '

# emacs
# @see http://d.hatena.ne.jp/h_iijima/20110401/1301620545
alias emacs="emacsclient -a emacs"
alias nw='emacsclient --alternate-editor="" -t'
alias cl='emacsclient --alternate-editor="" -nc'
alias emnw='emacs -nw'
alias emt='emacsclient -t -a ""'
alias emc='emacsclient -c -a ""'

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# alias l='ls'
alias ls='ls --color=auto'
alias lr='ls -R'                    # recursive ls
alias ll='ls -l'
alias la='ll -la'
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
