#!/usr/bin/env bash
# Lab 13 · Git Flow End to End — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 13 · Git Flow End to End"
new_playground
write_commit VERSION "1.0.0" "chore: release 1.0.0"
git tag -a v1.0.0 -m "Release 1.0.0"
git switch -q -c develop
write_commit app.sh 'echo "DevOps Shack store"' "feat: store skeleton"
ready
