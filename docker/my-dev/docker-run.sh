#!/usr/bin/env bash
export DOCKER_BUILDKIT=1
docker build . --secret id=ssh,src=$HOME/.ssh/id_rsa -t my-dev && \
  docker run -d -it my-dev
