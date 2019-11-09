#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$0")
"$SCRIPT_DIR"/env.sh

if [ "$(uname)" = 'Darwin' ];then
  ln -sf "$DOT_DIR"/etc/launchd/jupyterlab.plist ~/Library/LaunchAgents/jupyterlab.plist
fi
