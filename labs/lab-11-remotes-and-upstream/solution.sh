#!/usr/bin/env bash
# Lab 11 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG/you"
git push origin main || echo "Rejected as expected (non-fast-forward)"
git fetch --prune
git log --oneline main..origin/main
git pull --rebase
git push origin main
git switch -c feature/upstream-demo
write_commit demo.txt "upstream demo" "feat: upstream demo"
git push -u origin feature/upstream-demo
git branch -vv
