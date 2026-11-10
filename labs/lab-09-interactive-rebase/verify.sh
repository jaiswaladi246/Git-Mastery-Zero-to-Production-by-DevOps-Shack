#!/usr/bin/env bash
# Lab 09 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 09"
check "No rebase in progress"                              '[ ! -d .git/rebase-merge ] && [ ! -d .git/rebase-apply ]'
check "Exactly 2 commits on feature/invoices beyond main"  '[ "$(git rev-list --count main..feature/invoices)" = 2 ]'
check "First commit: 'feat: add invoice model'"            '[ "$(git log --reverse --format=%s main..feature/invoices | sed -n 1p)" = "feat: add invoice model" ]'
check "Second commit: 'feat: add invoice export endpoint'" '[ "$(git log --reverse --format=%s main..feature/invoices | sed -n 2p)" = "feat: add invoice export endpoint" ]'
check "First commit contains only invoice.py"              '[ "$(git show --name-only --format= feature/invoices~1)" = "invoice.py" ]'
check "invoice.py has the typo fix comment"                'git show feature/invoices:invoice.py | grep -q "DevOps Shack billing"'
check "export.py has both csv and pdf"                     'git show feature/invoices:export.py | grep -q export_pdf && git show feature/invoices:export.py | grep -q export_csv'
check "debug.log removed from the branch history"          '! git log main..feature/invoices --name-only --format= | grep -q debug.log'
check "notes.txt (wip) removed from the branch history"    '! git log main..feature/invoices --name-only --format= | grep -q notes.txt'
finish
