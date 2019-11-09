#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$0")
"$SCRIPT_DIR"/env.sh

if [ "$(uname)" = 'Darwin' ];then
  ln -sf "$DOT_DIR"/etc/launchd/com.pogin.jupyterlab.plist ~/Library/LaunchAgents/com.pogin.jupyterlab.plist
fi
