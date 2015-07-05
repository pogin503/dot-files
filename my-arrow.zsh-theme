if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi

function str_with_color() {
    echo "%{$fg[$1]%}$2%{$reset_color%}"
}

function str_with_color1() {
    echo "\e[38;5;$1m$2\e[m%{$reset_color%}"
}

# for c in {000..255}; do echo -n "\e[38;5;${c}m $c" ; [ $(($c%16)) -eq 15 ] && echo;done;echo

function my_git_status() {
    [ $(current_branch) ] && echo "($(current_branch)$(git_prompt_status))"
}

DATE_TIME=$(str_with_color1 166 '%D{%Y-%m-%d %K:%M}')
SEPARATOR=$(str_with_color1 237 '------------------------------------------------------------')
USER_NAME=$(str_with_color magenta '%n')
SEPARATOR2=$(str_with_color white '@')
HOST_NAME=$(str_with_color magenta '%m')
CURRENT_DIRECTORY=$(str_with_color green '%~')
PROMPT_CHAR="%{$fg[${NCOLOR}]%} ➤ %{$reset_color%}"
SEPARATOR3=$(str_with_color white '::')
PROMPT='${SEPARATOR}
${USER_NAME}${SEPARATOR2}${HOST_NAME} ${SEPARATOR3} ${CURRENT_DIRECTORY} ${SEPARATOR3} ${DATE_TIME}
${PROMPT_CHAR}%{$reset_color%}'
RPROMPT='%{$fg[$NCOLOR]%}%p $(git_prompt_info)%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="git:"
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"
