#!/usr/bin/env bash
set -u

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# lsp
rustup component add rls rust-analysis rust-src

# rust-analyzer
curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-linux \
     -o ~/.local/bin/rust-analyzer
