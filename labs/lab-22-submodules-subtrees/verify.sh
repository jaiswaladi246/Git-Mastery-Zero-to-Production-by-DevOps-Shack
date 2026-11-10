#!/usr/bin/env bash
# Lab 22 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 22"
check ".gitmodules registers libs/shared"                'git config -f .gitmodules submodule.libs/shared.path'
check "libs/shared is a gitlink (mode 160000) in HEAD"   'git ls-tree HEAD libs/shared | grep -q "^160000"'
check "Submodule pinned to latest shared-lib (v2)"       '[ "$(git ls-tree HEAD libs/shared | awk "{print \$3}")" = "$(git --git-dir=$LAB_DIR/shared-lib.git rev-parse main)" ]'
check "vendor/shared/lib.sh is a normal file (subtree)"  'git ls-tree HEAD vendor/shared/lib.sh | grep -q "^100644 blob"'
check "Working tree clean"                               '[ -z "$(git status --porcelain)" ]'
finish
