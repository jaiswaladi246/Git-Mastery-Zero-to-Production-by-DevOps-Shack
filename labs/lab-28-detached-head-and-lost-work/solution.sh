#!/usr/bin/env bash
# Lab 28 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git reflog | head
SHA=$(git log -g --format='%H %gs' | grep 'commit: experiment: cache ttl' | head -1 | cut -d' ' -f1)
git branch experiment/cache "$SHA"
git log --oneline --graph --all
