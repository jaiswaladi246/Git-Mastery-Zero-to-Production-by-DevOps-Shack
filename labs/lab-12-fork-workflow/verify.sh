#!/usr/bin/env bash
# Lab 12 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG/local"
banner "Verifying Lab 12"
U="git --git-dir=$PG/upstream.git"; F="git --git-dir=$PG/fork.git"
check "Remote 'upstream' configured"                     'git remote get-url upstream'
check "Fork main equals upstream main"                   "[ \"\$($F rev-parse main)\" = \"\$($U rev-parse main)\" ]"
check "Fork has branch fix/docs-typo"                    "$F rev-parse --verify -q refs/heads/fix/docs-typo"
check "fix/docs-typo is based on latest upstream main"   "$F merge-base --is-ancestor \$($U rev-parse main) fix/docs-typo"
check "fix/docs-typo adds exactly one commit"            "[ \"\$($F rev-list --count main..fix/docs-typo)\" = 1 ]"
check "Upstream main untouched by you"                   "! $U log main --format=%s | grep -q 'docs: fix typo'"
finish
