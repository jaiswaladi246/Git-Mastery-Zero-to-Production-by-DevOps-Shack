#!/usr/bin/env bash
# Lab 02 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git diff
# stage hunk 1 (timeout), skip hunk 2 (debug print)
printf 'y\nn\n' | git add -p payment.py
git diff --staged
git commit -m "fix: raise payment timeout to 30 seconds"
git status -s
