# set fisher_home ~/workspace/fisherman
# set fisher_config ~/.config/fisherman
# source $fisher_home/config.fish

set -x LANG ja_JP.UTF-8

# load aliases
. "$XDG_CONFIG_HOME"/fish/aliases.fish

# load functions
. "$XDG_CONFIG_HOME"/fish/functions/functions.fish

# set -x XDG_RUNTIME_DIR
# set -x XDG_DATA_DIRS "$HOME/.local/share"
# if [[ (uname) = 'Darwin' ]]; then]
#   set -x XDG_DATA_DIRS "/Volumes/ext_SSD/.local/share:$XDG_DATA_DIRS"
# fi

set -x LESSCHARSET utf-8

set -x DOT_HOME "$HOME/dotfiles"
fish_add_path "$DOT_HOME"/bin


# rbenv
if test -d "$HOME"/.rbenv
  status --is-interactive; and rbenv init - | source
else
  echo 'can\'t load rbenv.'
end

# ~/.local/bin
if test -d "$HOME"/.local/bin
  # for haskell-stack
  # set -x STACK_ROOT "$XDG_DATA_HOME"/stack
  fish_add_path "$HOME"/.local/bin
end

# pyenv
if test -d "$HOME"/.pyenv

  status is-login; and pyenv init --path | source
  status is-interactive; and pyenv init - | source

  set -l python_install_version anaconda3-5.3.1
  set -q _LOADED_CONDA_FISH; or set -x _LOADED_CONDA_FISH 0
  if test -d "$PYENV_ROOT"/versions/"$python_install_version"/bin;and test $_LOADED_CONDA_FISH -eq 0
    set -x _LOADED_CONDA_FISH 1
    fish_add_path "$PYENV_ROOT"/versions/"$python_install_version"/bin
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

# for macOS
if [ (uname) = 'Darwin' ];
  # groovy
  set -x GROOVY_HOME /usr/local/opt/groovy/libexec

  # set homebrew github api token
  if [ -f "$XDG_CONFIG_HOME"/fish/.homebrew_github_api_token ]
    source "$XDG_CONFIG_HOME"/fish/.homebrew_github_api_token
  end

  set -x BROWSER "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"

  set -x LIBZMQ_PATH (brew --prefix zeromq)/lib
  set -x LIBCZMQ_PATH (brew --prefix czmq)/lib

  # tex
  if [ -d "/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin" ];
    fish_add_path "/Library/TeX/Distributions/.DefaultTeX/Contents/Programs/texbin"
  end

  # set -g fish_user_paths "/usr/local/opt/openssl/bin" $fish_user_paths
  fish_add_path /usr/local/opt/gnu-sed/libexec/gnubin

end

# PHP
if [ -d "$HOME"/.composer/vendor/bin ];
  fish_add_path "$HOME"/.composer/vendor/bin
end

function history-merge --on-event fish_preexec
  history --save
  history --merge
end


# global
set -x GTAGSLABEL pygments


# Ansible
# set -x ANSIBLE_INVENTORY "$HOME"/ansible_hosts


# rust
# cargo
if [ -d "$CARGO_HOME" ];
  fish_add_path "$CARGO_HOME"/bin
end

set -x RUST_SRC_PATH (rustc --print sysroot)/lib/rustlib/src/rust/src
set -x RUSTC_WRAPPER (which sccache)


# GnuPG
set -x GNUPGHOME "$XDG_DATA_HOME"/gnupg
if type -q gpg2
  gpg2 --homedir "$XDG_DATA_HOME"/gnupg
end

# golang
fish_add_path /usr/local/go/bin
fish_add_path "$HOME/.local/go/bin"

# OCaml
# OPAM configuration
if [ -f "$HOME"/.opam/opam-init/init.fish ];
  source "$HOME"/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
end

eval (opam env)


# less
mkdir -p "$XDG_CACHE_HOME"/less

# openjdk
# set -g fish_user_paths "/usr/local/opt/openjdk/bin" $fish_user_paths

# direnv setting
eval (direnv hook fish)

# Wasmer
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"

# ghcup
[ -f "$HOME/.local/share/ghcup/env" ] && source "$HOME/.local/share/ghcup/env" # ghcup-env

# for WSL > GTK App
set -x GTK_IM_MODULE fcitx5
set -x QT_IM_MODULE fcitx5
set -x XMODIFIERS @im=fcitx5
set -x INPUT_METHOD fcitx5
set -x DefaultIMModule fcitx5
if test $SHLVL = 1
  fcitx5 --disable=wayland -d --verbose '*'=0 &
end

# for WSL > QT App
set -x QT_AUTO_SCREEN_SCALE_FACTOR 1
set -x QT_ENABLE_HIGHDPI_SCALING 1
set -x QT_SCALE_FACTOR 2

# nix
fish_add_path  ~/.nix-profile/bin/

# atuin
if type -q atuin
    set -gx ATUIN_NOBIND "true"
    atuin init fish | source

    # bind to ctrl-r in normal and insert mode, add any other bindings you want here too
    bind \cr _atuin_search
    bind -M insert \cr _atuin_search

else
    echo "atuin not found"
end

