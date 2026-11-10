#!/usr/bin/env bash
# Lab 02 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 02"
check "Exactly one new commit on top of the setup commit" '[ "$(git rev-list --count HEAD)" -eq 2 ]'
check "New commit message mentions timeout"              'git log -1 --format=%s | grep -qi timeout'
check "Committed version has TIMEOUT = 30"               'git show HEAD:payment.py | grep -q "^TIMEOUT = 30"'
check "Committed version does NOT have the DEBUG print"  '! git show HEAD:payment.py | grep -q DEBUG'
check "DEBUG print still exists in working tree"         'grep -q DEBUG payment.py'
check "DEBUG print is NOT staged"                        '! git diff --cached | grep -q DEBUG'
check "scratch.txt was never committed"                  '! git log --all --name-only --format= | grep -q scratch.txt'
finish
