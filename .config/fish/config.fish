set fisher_home ~/workspace/fisherman
set fisher_config ~/.config/fisherman
source $fisher_home/config.fish

which rbenv > /dev/null 2>&1
if [ $status = 0 ] # コマンドが存在すれば
    status --is-interactive; and . (rbenv init -|psub)
else
    echo "can't load rbenv."
end


