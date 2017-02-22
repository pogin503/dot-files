#!/usr/bin/env bash

# for clojure
if [ ! -d "$HOME"/.local/bin ]; then mkdir -p "$HOME"/.local/bin; fi
pushd "$HOME"/.local/bin
curl https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein > lein
chmod a+x lein
./lein
popd
