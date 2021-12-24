# set fisher_home ~/workspace/fisherman
# set fisher_config ~/.config/fisherman
# source $fisher_home/config.fish

if [ (uname) = 'Darwin' ];
  set -x LANG ja_JP.UTF-8
else
  set -x LANG ja_JP.utf8
end

# load aliasesﬁ
. "$XDG_CONFIG_HOME"/fish/aliases.fish

# load functions
. "$XDG_CONFIG_HOME"/fish/functions/functions.fish

# set -x XDG_RUNTIME_DIR
# set -x XDG_DATA_DIRS "$HOME/.local/share"
# if [[ (uname) = 'Darwin' ]]; then]
#   set -x XDG_DATA_DIRS "/Volumes/ext_SSD/.local/share:$XDG_DATA_DIRS"
# fi

set -x DOT_HOME "$HOME/dotfiles"
set -x PATH $PATH "$DOT_HOME"/bin

# for rbenv
if test -d "$HOME"/.rbenv
  set -x PATH $HOME/.rbenv/bin $PATH
  status --is-interactive; and rbenv init - | source
else
  echo 'can\'t load rbenv.'
  echo 'git clone https://github.com/rbenv/rbenv.git ~/.rbenv'
  echo 'set -x PATH $HOME/.rbenv/bin $PATH'
  echo 'echo \'status --is-interactive; and rbenv init - | source\' >> ~/.config/fish/config.fish'
end

if test -d "$HOME"/.cargo/bin
  set -x PATH "$HOME"/.cargo/bin $PATH
  # set -x CARGO_HOME "$XDG_DATA_HOME"/cargo
end


if test -d "$HOME"/.local/bin
  # for haskell-stack
  # set -x STACK_ROOT "$XDG_DATA_HOME"/stack
  set -x PATH "$HOME"/.local/bin $PATH
  # for golang
  mkdir -p "$HOME"/.local/go
  set -x GOPATH "$HOME"/.local/go
  set -x PATH "$GOPATH"/bin $PATH
end

if test -d "$HOME"/.pyenv

  status is-login; and pyenv init --path | source
  status is-interactive; and pyenv init - | source

  set -l python_install_version anaconda3-5.3.1
  set -q _LOADED_CONDA_FISH; or set -x _LOADED_CONDA_FISH 0
  if test -d "$PYENV_ROOT"/versions/"$python_install_version"/bin;and test $_LOADED_CONDA_FISH -eq 0
    set -x _LOADED_CONDA_FISH 1
    set -x PATH $PATH "$PYENV_ROOT"/versions/"$python_install_version"/bin
    # enable "conda activate <env_name>"
    # enable "conda deactivate <env_name>"
    source (conda info --root)/etc/fish/conf.d/conda.fish
  end
end

if [ -f "$XDG_CONFIG_HOME"/fish/GRAPHQL_TOKEN ];
  set -x GITHUB_GRAPHQL_TOKEN (cat "$XDG_CONFIG_HOME"/fish/GRAPHQL_TOKEN)
end

if [ -f "$XDG_CONFIG_HOME"/private/.hubot_annict_token ];
  set -x HUBOT_ANNICT_TOKEN (cat "$XDG_CONFIG_HOME"/private/.hubot_annict_token)
end

if [ (uname) = 'Darwin' ];
  set -x GROOVY_HOME /usr/local/opt/groovy/libexec

  # set homebrew github api token
  if [ -f "$XDG_CONFIG_HOME"/fish/.homebrew_github_api_token ]
    source "$XDG_CONFIG_HOME"/fish/.homebrew_github_api_token
  end

  set -x BROWSER "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

  set -x LIBZMQ_PATH (brew --prefix zeromq)/lib
  set -x LIBCZMQ_PATH (brew --prefix czmq)/lib

  if [ -d "/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin" ];
    set -x PATH "/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin" $PATH
  end

  # set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
  set -x PATH /usr/local/opt/gnu-sed/libexec/gnubin $PATH

  if [ -d "/usr/local/texlive/2020/bin/x86_64-darwin" ];
    set -x PATH /usr/local/texlive/2020/bin/x86_64-darwin $PATH
  end
end

# PHP
if [ -d "$HOME"/.composer/vendor/bin ];
  set -x PATH "$HOME"/.composer/vendor/bin $PATH
end

# OCaml
# OPAM configuration
if [ -f "$HOME"/.opam/opam-init/init.fish ];
  source "$HOME"/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end

set -x NODE_REPL_HISTORY "$XDG_DATA_HOME"/node_repl_history
set -x NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME"/npm/npmrc
set -x NODENV_ROOT "$XDG_DATA_HOME"/nodenv
# status --is-interactive; and source (nodenv init -|psub)

set -x PATH "$HOME"/dotfiles/bin $PATH

# peco
function fish_user_key_bindings
  bind \cr peco_select_history
end

function history-merge --on-event fish_preexec
  history --save
  history --merge
end

# global
set -x GTAGSLABEL pygments

# set -x ANSIBLE_INVENTORY "$HOME"/ansible_hosts

# rust
# cargo
set -x CARGO_HOME "$XDG_DATA_HOME"/cargo
if [ -d "$CARGO_HOME" ];
  set -x PATH "$CARGO_HOME"/bin $PATH
end

set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
set -x RUSTC_WRAPPER (which sccache)

set -x GNUPGHOME "$XDG_DATA_HOME"/gnupg
if type -q gpg2
  gpg2 --homedir "$XDG_DATA_HOME"/gnupg
end

mkdir -p "$XDG_CACHE_HOME"/less


# direnv setting
eval (direnv hook fish)
set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths

# Wasmer
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
