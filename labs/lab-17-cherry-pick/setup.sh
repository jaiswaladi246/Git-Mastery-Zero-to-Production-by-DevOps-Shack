#!/usr/bin/env bash
# Lab 17 · Cherry-pick and Backports — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 17 · Cherry-pick and Backports"
new_playground
write_commit cart.py "def total(items): return sum(items)" "feat: cart totals"
git tag -a v1.4.0 -m "Release 1.4.0"
git branch release/1.4
write_commit dashboard.py "def dashboard(): ..." "feat: analytics dashboard"
write_commit cart.py "def total(items): return max(0, sum(items))" "fix: prevent negative cart totals"
write_commit dashboard.py "def dashboard(): return 'v2'" "feat: dashboard v2"
write_commit reports.py "def monthly(): ..." "feat: monthly reports (wrong branch!)"
ready
echo "   Customers on 1.4 need the negative-totals fix. And the last commit was made on main by mistake."
