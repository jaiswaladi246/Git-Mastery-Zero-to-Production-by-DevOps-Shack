#!/usr/bin/env bash
# Lab 04 · Exploring Git Objects — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 04 · Exploring Git Objects"
new_playground
write_commit README.md "# DevOps Shack internals lab" "docs: add README"
write_commit src/app.sh 'echo "v1"' "feat: add app v1"
git switch -q -c feature/v2
write_commit src/app.sh 'echo "v2"' "feat: app v2"
git switch -q main
write_commit docs/notes.md "Notes from DevOps Shack" "docs: add notes"
git merge -q --no-ff feature/v2 -m "Merge branch 'feature/v2'"
ready
