#!/usr/bin/env bash
# Lab 06 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git reflog
git reset --hard HEAD@{1}                       # the position right before the reset
SHA=$(git log -g --format='%H %gs' | grep 'commit: feat: invoice pdf' | head -1 | cut -d' ' -f1)
git branch feature/invoices "$SHA"
git log --oneline --graph --all
