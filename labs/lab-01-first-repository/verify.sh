#!/usr/bin/env bash
# Lab 01 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 01"
check "Folder is a Git repository"                 '[ -d .git ]'
check "Current branch is main"                     '[ "$(git branch --show-current)" = main ]'
check "At least 3 commits"                         '[ "$(git rev-list --count HEAD)" -ge 3 ]'
check "README.md is tracked"                       'git ls-files --error-unmatch README.md'
check "src/app.sh is tracked"                      'git ls-files --error-unmatch src/app.sh'
check ".gitignore ignores *.log"                   'echo x > _t.log && git check-ignore -q _t.log; r=$?; rm -f _t.log; exit $r'
check "Every commit has a message longer than 10 characters" '! git log --format=%s | awk "length(\$0)<=10" | grep -q .'
check "Working tree is clean"                      '[ -z "$(git status --porcelain)" ]'
finish
