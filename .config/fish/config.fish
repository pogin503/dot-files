# set fisher_home ~/workspace/fisherman
# set fisher_config ~/.config/fisherman
# source $fisher_home/config.fish

# for rbenv
if test -d "$HOME"/.rbenv
  status --is-interactive; and . (rbenv init -|psub)
else
  echo "can't load rbenv."
  echo "git clone https://github.com/rbenv/rbenv.git ~/.rbenv"
  echo "status --is-interactive; and . (rbenv init -|psub)"
end

if test -d "$HOME"/.cargo/bin
  set -x PATH "$HOME"/.cargo/bin $PATH
end

# for haskell-stack
if test -d "$HOME"/.local/bin
  set -x PATH "$HOME"/.local/bin $PATH
end

if test -d "$HOME"/.pyenv
  set -x PYENV_ROOT "$HOME"/.pyenv
  set -x PATH "$PYENV_ROOT"/bin $PATH
  . (pyenv init - | psub)
end

. "$HOME"/.config/fish/aliases.fish

# load functions
. "$HOME"/.config/fish/functions.fish

# set homebrew github api token
if [ -f "$HOME"/.config/fish/.homebrew_github_api_token ]; and [ (uname) = 'Darwin' ]
  source "$HOME"/.config/fish/.homebrew_github_api_token
end


set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
