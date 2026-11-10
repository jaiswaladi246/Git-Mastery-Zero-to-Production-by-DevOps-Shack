#!/usr/bin/env bash
# Lab 18 · Worktrees — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 18 · Worktrees"
rm -rf "$LAB_DIR/playground-hotfix"
new_playground
write_commit api.py "VERSION = '2.0.0'" "feat: api 2.0.0"
git branch hotfix/2.0.1
write_commit feature.py "def big_feature(): ..." "feat: start big feature"
echo "# half-written code, do not lose me" >> feature.py
ready
echo "   You have uncommitted work in feature.py. Fix 2.0.1 WITHOUT stashing or committing it."
