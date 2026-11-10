#!/usr/bin/env bash
# Lab 09 · Interactive Rebase — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 09 · Interactive Rebase"
new_playground
write_commit README.md "# DevOps Shack invoices" "docs: init"
git switch -q -c feature/invoices
write_commit invoice.py "class Invoice: pass" "add invoice model"
append_commit notes.txt "remember to add tests" "wip"
write_commit invoice.py "class Invoice:  # DevOps Shack billing
    pass" "fix tpyo"
write_commit export.py "def export_csv(): ..." "add export endpoint"
append_commit export.py "def export_pdf(): ..." "address review comments"
write_commit debug.log "DEBUG: secret-ish noise" "debug stuff"
ready
