#!/usr/bin/env bash
# Lab 17 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
FIX=$(git log --format=%H --grep='^fix: prevent negative cart totals$')
git switch release/1.4
git cherry-pick -x "$FIX"
git tag -a v1.4.1 -m "Patch release 1.4.1: negative totals fix"
git switch main
git branch feature/reports          # keep the misplaced commit on a new branch
git reset --hard HEAD~1             # safe: main was never pushed in this scenario
git log --oneline --graph --all
