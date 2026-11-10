#!/usr/bin/env bash
# Lab 15 · Tags and Releases — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 15 · Tags and Releases"
new_playground
write_commit VERSION "1.2.0" "chore(release): 1.2.0"
git tag -a v1.2.0 -m "Release 1.2.0"
append_commit app.txt "upi" "feat(payments): add UPI checkout"
append_commit app.txt "nullfix" "fix(api): handle null customer id"
git tag v1.3.0-rc HEAD~1        # wrong tag on the wrong commit
append_commit app.txt "docs" "docs: document refunds"
append_commit app.txt "csv" "feat(reports): export invoices to CSV"
ready
