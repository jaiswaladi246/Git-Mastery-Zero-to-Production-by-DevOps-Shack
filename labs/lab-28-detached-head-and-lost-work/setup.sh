#!/usr/bin/env bash
# Lab 28 · Detached HEAD and Lost Work — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 28 · Detached HEAD and Lost Work"
new_playground
write_commit app.py "VERSION='1.0'" "feat: v1.0"; git tag v1.0
write_commit app.py "VERSION='1.1'" "feat: v1.1"
git switch -q --detach v1.0
write_commit cache.py "def cache(): ..." "experiment: add cache layer"
append_commit cache.py "TTL = 60" "experiment: cache ttl"
git switch -q main 2>/dev/null
ready
echo "   Yesterday you experimented on a detached HEAD at v1.0, then switched back to main. The experiment 'vanished'."
