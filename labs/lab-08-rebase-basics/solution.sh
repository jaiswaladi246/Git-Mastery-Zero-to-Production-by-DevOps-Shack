#!/usr/bin/env bash
# Lab 08 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git switch feature/search
git rebase main
git switch main
git merge --ff-only feature/search
git log --oneline --graph --all
