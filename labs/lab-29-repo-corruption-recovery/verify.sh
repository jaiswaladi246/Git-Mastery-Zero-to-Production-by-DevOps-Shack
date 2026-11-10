#!/usr/bin/env bash
# Lab 29 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 29"
check "git fsck --full passes"                          'git fsck --full'
check "README.md readable at every commit"              'git show HEAD~1:README.md'
check "Unpushed commit still on main"                   'git log main --format=%s | grep -qx "feat: unpushed audit module"'
check "audit.py intact"                                 'git show main:audit.py | grep -q audit'
finish
