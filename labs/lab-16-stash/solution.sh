#!/usr/bin/env bash
# Lab 16 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git stash push -u -m "WIP: filters"
git switch -c hotfix/header
sed -i "s/Dashbord/Dashboard/" header.js
git commit -am "fix: correct dashboard title typo"
git switch main
git stash pop
# recover the dropped stash: it is a dangling commit
SHA=$(git fsck --no-reflogs 2>/dev/null | awk '/dangling commit/ {print $3}' | while read -r c; do
        git log -1 --format='%H %s' "$c"; done | grep "experiment cache layer" | head -1 | cut -d' ' -f1)
git branch recovered-experiment "$SHA"
git show recovered-experiment:experiment.txt
