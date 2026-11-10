#!/usr/bin/env bash
# Lab 16 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 16"
check "Branch hotfix/header exists"                         'git rev-parse -q --verify refs/heads/hotfix/header'
check "hotfix/header fixes the typo (Dashboard)"            'git show hotfix/header:header.js | grep -q "Dashboard"'
check "hotfix commit does NOT include the filters WIP"      '! git show hotfix/header:app.js | grep -q filters'
check "You are back on main"                                '[ "$(git branch --show-current)" = main ]'
check "WIP edit to app.js restored (uncommitted)"           'grep -q "filters: in progress" app.js && ! git show main:app.js | grep -q filters'
check "notes.md restored (untracked)"                       '[ -f notes.md ] && ! git ls-files --error-unmatch notes.md'
check "Stash list is empty"                                 '[ -z "$(git stash list)" ]'
check "Dropped stash recovered to branch recovered-experiment" 'git show recovered-experiment:experiment.txt | grep -q "cache layer"'
finish
