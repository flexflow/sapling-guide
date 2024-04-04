#!/usr/bin/env bash

DIR="$(realpath -- "$(dirname "${BASH_SOURCE[0]}")")"

cd "$DIR/.."

docker run \
  -it \
  -v "$PWD":/sapling-guide \
  -v "$(readlink -f "$SSH_AUTH_SOCK")":/ssh-agent \
  -e GITHUB_TOKEN="$(gh auth token)" \
  -e SSH_AUTH_SOCK=/ssh-agent \
  --rm \
  ubuntu:22.04 /bin/bash -c "/sapling-guide/test/scripts/test-ff-dev-setup.sh"
