#!/usr/bin/env bash
# Lab 06 · Reflog Rescue — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 06 · Reflog Rescue"
new_playground
write_commit app.py "print('DevOps Shack payments')" "feat: initial payments app"
git switch -q -c feature/invoices
append_commit invoice.py "def render(): pass" "feat: invoice model"
append_commit invoice.py "def pdf(): pass" "feat: invoice pdf"
git switch -q main
append_commit app.py "RETRIES = 3" "feat: payment retries"
append_commit app.py "LOG_LEVEL = 'info'" "feat: payment logging"
# Disaster 1: branch force-deleted
git branch -q -D feature/invoices
# Disaster 2: hard reset loses two commits
git reset -q --hard HEAD~2
ready
echo "   💥 Disaster: someone ran 'git branch -D feature/invoices' and 'git reset --hard HEAD~2'."
