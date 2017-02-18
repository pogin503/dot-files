#!/usr/bin/env bash

curl -sSL https://get.haskellstack.org/ | sh
stack setup
stack install ghc-mod
stack install stylish-haskell
