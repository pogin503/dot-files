#!/usr/bin/env fish

set -Ux XDG_CONFIG_HOME "$HOME/.config"
set -Ux XDG_CACHE_HOME "$HOME/.cache"
set -Ux XDG_DATA_HOME "$HOME/.local/share"
set -Ux XDG_STATE_HOME "$HOME/.local/state"
set -Ux HOMEBREW_CACHE /Volumes/ext_SSD/.cache/Homebrew
set -Ux HOMEBREW_LOGS "$HOMEBREW_CACHE/Logs"

# ruby
# set -x GEM_HOME "$XDG_DATA_HOME"/gem
# set -x PATH "$GEM_HOME"/bin $PATH
# set -x GEM_SPEC_CACHE "$XDG_CACHE_HOME"/gem
set -Ux BUNDLE_USER_CONFIG "$XDG_CONFIG_HOME"/bundle
set -Ux BUNDLE_USER_CACHE "$XDG_CACHE_HOME"/bundle
set -Ux BUNDLE_USER_PLUGIN "$XDG_DATA_HOME"/bundle
# set -x IRBRC "$XDG_CONFIG_HOME"/irb/irbrc

# set -x HISTFILE "$XDG_DATA_HOME"/bash/history
set -Ux JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME"/jupyter
set -Ux JUPYTER_DATA_DIR "$XDG_DATA_HOME"/jupyter

set -Ux VAGRANT_ALIAS_FILE "$XDG_DATA_HOME"/vagrant/aliases
set -Ux VAGRANT_HOME "$XDG_DATA_HOME"/vagrant
set -Ux DOCKER_CONFIG "$XDG_CONFIG_HOME"/docker
set -Ux MACHINE_STORAGE_PATH "$XDG_DATA_HOME"/docker-machine

set -Ux MYSQL_HISTFILE "$XDG_DATA_HOME"/mysql_history

set -Ux PSQLRC "$XDG_CONFIG_HOME/pg/psqlrc"
set -Ux PSQL_HISTORY "$XDG_CACHE_HOME/pg/psql_history"
set -Ux PGPASSFILE "$XDG_CONFIG_HOME/pg/pgpass"
set -Ux PGSERVICEFILE "$XDG_CONFIG_HOME/pg/pg_service.conf"

set -Ux SQLITE_HISTORY "$XDG_DATA_HOME"/sqlite_history

set -Ux OCTAVE_HISTFILE "$XDG_CACHE_HOME/octave-hsts"
set -Ux OCTAVE_SITE_INITFILE "$XDG_CONFIG_HOME/octave/octaverc"

set -Ux AWS_SHARED_CREDENTIALS_FILE "$XDG_CONFIG_HOME"/aws/credentials
set -Ux AWS_CONFIG_FILE "$XDG_CONFIG_HOME"/aws/config

set -Ux LESSKEY "$XDG_CONFIG_HOME"/less/lesskey
set -Ux LESSHISTFILE "$XDG_CACHE_HOME"/less/lesshst

set -Ux GRADLE_USER_HOME "$XDG_DATA_HOME"/gradle

# set -Ux XINITRC "$XDG_CONFIG_HOME"/X11/xinitrcx
# set -Ux XSERVERRC "$XDG_CONFIG_HOME"/X11/xserverrc

set -Ux OCTAVE_HISTFILE "$XDG_CACHE_HOME/octave-hsts"a
set -Ux OCTAVE_SITE_INITFILE "$XDG_CONFIG_HOME/octave/octaverc"
set -Ux PYTHON_EGG_CACHE "$XDG_CACHE_HOME"/python-eggs
set -Ux PYLINTHOME "$XDG_CACHE_HOME"/pylint
set -Ux INPUTRC "$XDG_CONFIG_HOME"/readline/inputrc
set -Ux ANSIBLE_INVENTORY "$HOME"/ansible_hosts
set -Ux ANSIBLE_CONFIG "$XDG_CONFIG_HOME"/ansible/ansible.cfg

set -Ux WASMER_DIR="$HOME/.wasmer"
