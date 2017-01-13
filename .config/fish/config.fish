set fisher_home ~/workspace/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

which rbenv > /dev/null 2>&1
if [ $status = 0 ] # コマンドが存在すれば
    status --is-interactive; and . (rbenv init -|psub)
else
    echo "can't load rbenv."
end

if test -d $HOME/.cargo/bin
    set -x PATH "$HOME/.cargo/bin" $PATH
end 
set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
