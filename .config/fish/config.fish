# set fisher_home ~/workspace/fisherman
# set fisher_config ~/.config/fisherman
# source $fisher_home/config.fish

if [ (uname) = 'Darwin' ];
  set -x LANG ja_JP.UTF-8
else
  set -x LANG ja_JP.utf8
end

# load aliases
. "$HOME"/.config/fish/aliases.fish

# load functions
. "$HOME"/.config/fish/functions/functions.fish

# set -x XDG_CONFIG_HOME "$HOME/.config"
# set -x XDG_CACHE_HOME "$HOME/.cache"
# set -x XDG_DATA_HOME "$HOME/.local/share"
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

  pyenv init - | source

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

if [ -f "$HOME"/.config/fish/GRAPHQL_TOKEN ];
  set -x GITHUB_GRAPHQL_TOKEN (cat "$HOME"/.config/fish/GRAPHQL_TOKEN)
end

if [ -f "$XDG_CONFIG_HOME"/private/.hubot_annict_token ];
  set -x HUBOT_ANNICT_TOKEN (cat "$XDG_CONFIG_HOME"/private/.hubot_annict_token)
end

if [ (uname) = 'Darwin' ];
  set -x GROOVY_HOME /usr/local/opt/groovy/libexec

  # set homebrew github api token
  if [ -f "$HOME"/.config/fish/.homebrew_github_api_token ]
    source "$HOME"/.config/fish/.homebrew_github_api_token
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

if [ -d "$HOME"/.composer/vendor/bin ];
  set -x PATH "$HOME"/.composer/vendor/bin $PATH
end

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
set -x RUSTC_WRAPPER=$(which sccache)

# ruby
# set -x GEM_HOME "$XDG_DATA_HOME"/gem
# set -x PATH "$GEM_HOME"/bin $PATH
# set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -x BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME"/bundle
set -x BUNDLE_USER_CACHE "$XDG_CACHE_HOME"/bundle
set -x BUNDLE_USER_PLUGIN "$XDG_DATA_HOME"/bundle
# set -x IRBRC "$XDG_CONFIG_HOME"/irb/irbrc

# set -x HISTFILE "$XDG_DATA_HOME"/bash/history
set -x JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME"/jupyter
set -x JUPYTER_DATA_DIR "$XDG_DATA_HOME"/jupyter

set -x VAGRANT_ALIAS_FILE "$XDG_DATA_HOME"/vagrant/aliases
set -x VAGRANT_HOME "$XDG_DATA_HOME"/vagrant
set -x DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -x MACHINE_STORAGE_PATH "$XDG_DATA_HOME"/docker-machine

set -x MYSQL_HISTFILE "$XDG_DATA_HOME"/mysql_history

set -x PSQLRC "$XDG_CONFIG_HOME/pg/psqlrc"
set -x PSQL_HISTORY "$XDG_CACHE_HOME/pg/psql_history"
set -x PGPASSFILE "$XDG_CONFIG_HOME/pg/pgpass"
set -x PGSERVICEFILE "$XDG_CONFIG_HOME/pg/pg_service.conf"

set -x SQLITE_HISTORY "$XDG_DATA_HOME"/sqlite_history

set -x OCTAVE_HISTFILE "$XDG_CACHE_HOME/octave-hsts"
set -x OCTAVE_SITE_INITFILE "$XDG_CONFIG_HOME/octave/octaverc"

set -x AWS_SHARED_CREDENTIALS_FILE "$XDG_CONFIG_HOME"/aws/credentials
set -x AWS_CONFIG_FILE "$XDG_CONFIG_HOME"/aws/config

set -x GNUPGHOME "$XDG_DATA_HOME"/gnupg
if type -q gpg2
  gpg2 --homedir "$XDG_DATA_HOME"/gnupg
end

mkdir -p "$XDG_CACHE_HOME"/less
set -x LESSKEY "$XDG_CONFIG_HOME"/less/lesskey
set -x LESSHISTFILE "$XDG_CACHE_HOME"/less/lesshst

set -x GRADLE_USER_HOME "$XDG_DATA_HOME"/gradle

# set -x XINITRC "$XDG_CONFIG_HOME"/X11/xinitrcx
# set -x XSERVERRC "$XDG_CONFIG_HOME"/X11/xserverrc

set -x OCTAVE_HISTFILE "$XDG_CACHE_HOME/octave-hsts"a
set -x OCTAVE_SITE_INITFILE "$XDG_CONFIG_HOME/octave/octaverc"
set -x PYTHON_EGG_CACHE "$XDG_CACHE_HOME"/python-eggs
set -x PYLINTHOME "$XDG_CACHE_HOME"/pylint
set -x INPUTRC "$XDG_CONFIG_HOME"/readline/inputrc
set -x ANSIBLE_INVENTORY "$HOME"/ansible_hosts
set -x ANSIBLE_CONFIG ~/.config/ansible/ansible.cfg
# direnv setting
eval (direnv hook fish)
set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths

# Wasmer
export WASMER_DIR="/Users/iMac/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
