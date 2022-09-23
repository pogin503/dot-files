# @see http://d.hatena.ne.jp/h_iijima/20110401/1301620545
alias e='emacsclient -n'

alias lr='ls -R'            # recursive ls
alias ll='ls -l'
alias la='ll -AB'
alias lx='ll -BX'           # sort by extension
alias lz='ll -rS'           # sort by size
alias lt='ll -rt'           # sort by date
alias ltr='ll -rt'          # sort by date
alias l1='ls -1'
alias lm='la | more'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cd..='cd ..'
alias rr='rm -rf'

alias mkdir='mkdir -p -v'

alias rmdir_r='find . -depth -type d | xargs rmdir 2> /dev/null'
alias rdom='echo `od -vAn -N4 -tu4 < /dev/urandom`'

alias da='date "+%A, %B %d, %Y [%T]"'

alias updatedb='sudo /usr/libexec/locate.updatedb'

alias vaglogin='vagrant up; and vagrant ssh'
alias vagssh='vagrant ssh'

alias be="bundle exec"

alias crontab="crontab -i"

# git alias
alias ga='git add'
alias gal='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gs='git status'
alias gsb='git status -sb'
alias gps='git push'
alias gpl='git pull'
alias gch='git checkout'
alias gb='git branch'
alias gf='git diff'
alias gm='git merge'
alias gl='git log'

git config --global alias.co checkout
git config --global alias.st 'status'
git config --global alias.ci 'commit -a'
git config --global alias.di 'diff'
git config --global alias.br 'branch'

# privileged access
if not [ "$USER" = "root" ]
    alias sudo='sudo '
    alias scat='sudo cat'
    alias svim='sudo vim'
    alias root='sudo su'
    alias reboot='sudo reboot'
    alias halt='sudo halt'
    alias netcfg='sudo netcfg2'
end

if [ (uname) = Darwin ]
    alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
    alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
    alias chromium="/Applications/Chromium.app/Contents/MacOS/Chromium"
    alias firefox='open -a Firefox'
    alias safari='open -a Safari'
    alias itunes='open -a iTunes'
    alias show-hidefiles="defaults write com.apple.finder AppleShowAllFiles TRUE & killall Finder"
    alias cpuinfo="awk  -F: ' {if(\$1 ~/^model name/){ model[\$2]=+1}} END{for(k in model) { print model[k], k}}' /proc/cpuinfo"
    alias openports='netstat --all --numeric --programs --inet --inet6'
    alias sourcetree='open -a "Sourcetree"'

    # macOSのcrontabは-iオプションがないためエイリアスを削除
    functions -e crontab
end

# pacman aliases (if applicable, replace 'pacman' with 'yaourt'/'pacaur'/whatever)
if test /etc/arch-release
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
end

# @see https://qiita.com/SightSeekerTw/items/601d883e594bcaf234f4
alias jshell='docker run -it --rm java:9-jdk jshell'

# tmux
alias ta='tmux attach -t'
alias tad='tmux attach -d -t'
alias ts='tmux new-session -s'
alias tl='tmux list-sessions'
alias tksv='tmux kill-server'
alias tkss='tmux kill-session -t'

# bat
if test -e /usr/local/bin/bat
    alias cat=bat
end

alias ff=find-file
alias dired=find-file
alias dcup='docker-compose up -d'
alias dcdown='docker-compose down'
alias dcstop='docker-compose stop'
