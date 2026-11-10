#!/usr/bin/env bash
# Lab 17 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 17"
FIX=$(git log --all --format=%H --grep='^fix: prevent negative cart totals$' | tail -1)
check "release/1.4 has the fix (max(0, ...))"                 'git show release/1.4:cart.py | grep -q "max(0"'
check "Backport records origin with -x"                       "git log release/1.4 --format=%B | grep 'cherry picked from commit $FIX'"
check "release/1.4 does NOT contain the dashboard features"   '! git cat-file -e release/1.4:dashboard.py'
check "Tag v1.4.1 (annotated) on release/1.4 tip"             '[ "$(git cat-file -t v1.4.1)" = tag ] && [ "$(git rev-parse v1.4.1^{commit})" = "$(git rev-parse release/1.4)" ]'
check "feature/reports has the reports commit"                'git cat-file -e feature/reports:reports.py'
check "main no longer has the reports commit"                 '! git cat-file -e main:reports.py'
check "main still has dashboard v2"                           'git show main:dashboard.py | grep -q v2'
finish
