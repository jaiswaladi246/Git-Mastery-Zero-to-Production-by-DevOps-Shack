#!/usr/bin/env bash
# Lab 18 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git worktree add ../playground-hotfix hotfix/2.0.1
cd ../playground-hotfix
sed -i "s/2.0.0/2.0.1/" api.py
git commit -am "fix: patch release 2.0.1"
cd "$PG"
git worktree list
git worktree remove ../playground-hotfix
git status -s
