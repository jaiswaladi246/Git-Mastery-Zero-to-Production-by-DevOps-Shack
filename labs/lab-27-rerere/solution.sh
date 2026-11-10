#!/usr/bin/env bash
# Lab 27 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git config rerere.enabled true
git merge feature/dark || true
printf 'title=DevOps Shack\ntheme=orange-dark\n' > site.conf
git add site.conf && git commit --no-edit            # rerere records the resolution
git reset --hard HEAD~1                              # throw the merge away
git merge feature/dark || true                       # same conflict: rerere replays it
cat site.conf
git add site.conf && git commit --no-edit
