#!/usr/bin/env bash
# Lab 18 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 18"
check "hotfix/2.0.1 has a new commit"                         '[ "$(git rev-list --count main~1..hotfix/2.0.1)" -ge 1 ]'
check "hotfix sets VERSION = '2.0.1'"                         'git show hotfix/2.0.1:api.py | grep -q "2.0.1"'
check "Uncommitted work in feature.py still there"            'grep -q "do not lose me" feature.py && ! git show HEAD:feature.py | grep -q "do not lose me"'
check "Stash was not used"                                    '[ -z "$(git stash list)" ]'
check "Still on main in the main folder"                      '[ "$(git branch --show-current)" = main ]'
check "Worktree removed (only 1 worktree listed)"             '[ "$(git worktree list | wc -l)" = 1 ]'
finish
