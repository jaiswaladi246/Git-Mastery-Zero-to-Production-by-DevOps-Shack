#!/usr/bin/env bash
# Lab 16 · Stash Scenarios — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 16 · Stash Scenarios"
new_playground
write_commit app.js "// DevOps Shack dashboard" "feat: dashboard"
write_commit header.js "export const title = 'Dashbord'" "feat: header"
write_commit experiment.txt "base" "chore: experiment placeholder"
# a stash that gets dropped (to be recovered)
echo "experiment v2: cache layer idea" > experiment.txt
git stash push -q -m "WIP: experiment cache layer"
git stash drop -q
# current in-progress work
echo "// filters: in progress" >> app.js
echo "my notes about filters" > notes.md
ready
echo "   🚨 Production bug: the header title is misspelled. Fix it on branch hotfix/header NOW."
