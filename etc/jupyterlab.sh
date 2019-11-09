#!/usr/bin/env zsh

PORT="$1"
DIR="$2"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_DATA_DIR="$XDG_DATA_HOME"/jupyter

export PATH="$HOME"/.pyenv/shims:"$PATH"
env | sort
printf "version: "
jupyter --version
printf "config-dir: "
jupyter --config-dir
printf "data-dir: "
jupyter --data-dir
printf "rintime-dir: "
jupyter --runtime-dir
jupyter lab --port "$PORT" --notebook-dir "$DIR"
