#! /usr/bin/env bash

set -euo pipefail
set -x

USERBIN="${XDG_BIN_HOME:-$HOME/.local/bin}"

mkdir -p "$USERBIN"

wget 'https://github.com/DavHau/nix-portable/releases/download/v010/nix-portable' -O "$USERBIN/nix-portable"
chmod u+x "$USERBIN/nix-portable"
ln -s "$USERBIN/nix-portable" "$USERBIN/nix"

cat >>"$HOME/.bashrc" <<'EOF'
# --- added by https://github.com/flexflow/sapling-guide
mkdir -p "/tmp/$USER"
export NP_LOCATION="/tmp/$USER/"
module load slurm
# --- end

alias ,node-gpu="srun --time=2:00:00 -N 1 -n 1 -p gpu --pty bash --login"
alias ,node-cpu="srun --time=2:00:00 -N 1 -n 1 -p cpu --pty bash --login"
EOF

SSH_URL="git@github.com:lockshaw/ff-dev.git"
git clone --recursive "$SSH_URL" "$HOME/ff"
