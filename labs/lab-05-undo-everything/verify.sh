#!/usr/bin/env bash
# Lab 05 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 05"
check "1. a.txt edit discarded (matches last commit)"    'git diff --quiet HEAD -- a.txt'
check "2. b.txt edit kept in working tree"               'grep -q "good edit" b.txt'
check "2. b.txt is NOT staged"                           '! git diff --cached --name-only | grep -q b.txt'
check "3. typo commit message fixed"                     'git log --format=%s | grep -qx "docs: fix typo in README"'
check "3. old message 'fix tpyo' gone from main"         '! git log --format=%s | grep -qx "fix tpyo"'
check "4. broken feature reverted with a new commit"     'git log --format=%s | grep -q "^Revert \"feat: add broken feature\""'
check "4. original broken commit still in history"       'git log --format=%s | grep -qx "feat: add broken feature"'
check "4. broken.txt no longer exists at HEAD"           '! git cat-file -e HEAD:broken.txt'
finish
