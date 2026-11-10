#!/usr/bin/env bash
# Lab 05 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git restore a.txt                                   # 1
git restore --staged b.txt                          # 2
git commit --amend -m "docs: fix typo in README"    # 3 (nothing staged, so only the message changes)
git revert --no-edit "$(git log --format=%H --grep='^feat: add broken feature$')"   # 4
git log --oneline
