#!/usr/bin/env bash
set -eu
# set -x

curl https://sh.rustup.rs -sSf | sh -s -- -y

# completion, difinition jump
cargo install racer

# code formatter
cargo install rustfmt
