#! /usr/bin/env bash

set -eo pipefail
set -x

apt update
apt install -y curl wget git ssh
ssh -o "StrictHostKeyChecking no" -T git@github.com || true
/sapling-guide/repo-refactor.sh
export PATH="/root/.local/bin:$PATH"
source ~/.bashrc
cd ~/ff
FFPR_OUTPUT="$(nix develop --accept-flake-config --command bash -c /sapling-guide/test/scripts/test-branch-setup.sh | tail -n 1)"
eval "$FFPR_OUTPUT"
nix develop --accept-flake-config --command bash -c /sapling-guide/test/scripts/test-branch-build.sh
