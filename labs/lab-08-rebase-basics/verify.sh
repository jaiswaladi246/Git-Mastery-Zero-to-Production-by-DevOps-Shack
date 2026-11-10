#!/usr/bin/env bash
# Lab 08 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 08"
check "feature/search is based on the latest main commit 'ci: add pipeline'" 'git merge-base --is-ancestor "$(git log --all --format=%H --grep="^ci: add pipeline$")" feature/search'
check "main contains the search commits"         'git log main --format=%s | grep -qx "feat: add search module"'
check "main and feature/search point to the same commit" '[ "$(git rev-parse main)" = "$(git rev-parse feature/search)" ]'
check "No merge commits on main (linear history)" '[ -z "$(git rev-list --merges main)" ]'
check "Exactly 5 commits on main"                 '[ "$(git rev-list --count main)" = 5 ]'
finish
