#!/usr/local/bin/zsh

# @see http://d.hatena.ne.jp/higher_tomorrow/20110330/1301435608
# # 親プロセスが script ではない場合に 0 を返す。
# # 例えば、bash や su や sshd などの場合。

_p_proc=`ps aux | grep "${PPID}" | awk '{print $11}'`
_script="/usr/bin/script"

is_parent_not_script(){
    # echo "is_parent_not_script"
    while read _pid _p_proc
    do
        # echo "PPID=${PPID}"
        # echo "_pid=${_pid}"
        # echo "_p_proc=${_p_proc}"
        if [ "x${_pid}"     = "x${PPID}" ] && \
           [ "x${_p_proc}" != "x${_script}" ]; then
            # echo 0
            return 0
        fi
        # echo "nil"

    done << __EOC__
`ps aux | grep "${PPID}" | awk '{ print $2 " " $11 }'`
__EOC__
    # 行の先頭の空白を消しとかないと
    # /Users/pogin/set_typescript.sh:53: parse error near `\n'
    # というエラーが出る
    # echo 1
    return 1
}
if [ ! -e ~/script_history ]; then
    mkdri ~/script_histroy
fi
is_parent_not_script
if [ $? -eq 0 ]; then
    ${_script} /Users/OginoRyo/script_history/op_`whoami`_`date '+%Y_%m_%d_%H_%M_%S'`_$$.log
    # ${_script} /Users/OginoRyo/script_history/op_`whoami`_`date '+%Y%m%d%H%M%S'`_$$.log
    exit
fi
unset _script
unset _p_proc

# example
# rem_control_seq script_history/op_usename_2013_07_25_11_34_32.log
rem_control_seq(){
    local name=`basename $1 .log`
    # echo $name
    EMACS=emacsclient
    # @see http://www.commandlinefu.com/commands/view/2318/fix-a-typescript-file-created-by-the-script-program-to-remove-control-characters
    # cat $1 | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > $1-processed
    cat $1 | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | col -b > $name-processed
    # shell script上でエディタを起動する方法
    $EMACS $name-processed < `tty` > `tty`
}
