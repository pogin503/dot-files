# set fisher_home ~/workspace/fisherman
# set fisher_config ~/.config/fisherman
# source $fisher_home/config.fish

# for rbenv
which rbenv > /dev/null 2>&1
if [ $status = 0 ] # コマンドが存在すれば
    status --is-interactive; and . (rbenv init -|psub)
else
    echo "can't load rbenv."
    echo "git clone https://github.com/rbenv/rbenv.git ~/.rbenv"
    echo 'set -x PATH $HOME/.rbenv/bin $PATH'
    echo 'type rbenv'
end

if test -d "$HOME"/.cargo/bin
  set -x PATH "$HOME"/.cargo/bin $PATH
end

# for haskell-stack
if test -d "$HOME"/.local/bin
  set -x PATH "$HOME"/.local/bin $PATH
end

. "$HOME"/.config/fish/aliases.fish

# set homebrew github api token
if [ -f "$HOME"/.config/fish/.homebrew_github_api_token ]; and [ (uname) = 'Darwin' ]
  source "$HOME"/.config/fish/.homebrew_github_api_token
end


set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
