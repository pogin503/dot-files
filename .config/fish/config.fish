# set fisher_home ~/workspace/fisherman
# set fisher_config ~/.config/fisherman
# source $fisher_home/config.fish

# for rbenv
if test -d "$HOME"/.rbenv
  # status --is-interactive; and . (rbenv init -|psub)
  rbenv init - | source
else
  echo "can't load rbenv."
  echo "git clone https://github.com/rbenv/rbenv.git ~/.rbenv"
  echo "rbenv init - | source"
end

if test -d "$HOME"/.cargo/bin
  set -x PATH "$HOME"/.cargo/bin $PATH
end


if test -d "$HOME"/.local/bin
  # for haskell-stack
  set -x PATH "$HOME"/.local/bin $PATH
  # for golang
  set -x GOPATH "$HOME"/.local/go
  set -x PATH "$GOPATH"/bin $PATH
end

if test -d "$HOME"/.pyenv
  set -x PYENV_ROOT "$HOME"/.pyenv
  set -x PATH "$PYENV_ROOT"/bin $PATH
  . (pyenv init - | psub)
end

# load aliases
. "$HOME"/.config/fish/aliases.fish

# load functions
. "$HOME"/.config/fish/functions.fish

if [ -f "$HOME"/.config/fish/GRAPHQL_TOKEN ];
  set -x GITHUB_GRAPHQL_TOKEN (cat "$HOME"/.config/fish/GRAPHQL_TOKEN)
end

# set homebrew github api token
if [ -f "$HOME"/.config/fish/.homebrew_github_api_token ]; and [ (uname) = 'Darwin' ]
  source "$HOME"/.config/fish/.homebrew_github_api_token
end

if [ -d "$HOME"/.nodebrew/current/bin ];
  set -x PATH "$HOME"/.nodebrew/current/bin $PATH
end
if [ -d /Applications/IBM/node/bin ];
  set -x PATH /Applications/IBM/node/bin $PATH
end

if [ (uname) = 'Darwin' ]
  set -x BROWSER "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
end

set -g fish_user_paths "/usr/local/opt/icu4c/bin" $fish_user_paths

set -g PYTHONPATH $PYTHONPATH ~/workspace/ansible-lint/lib
set -g PATH $PATH ~/workspace/ansible-lint/bin
# set -x ANSIBLE_INVENTORY "$HOME"/ansible_hosts
