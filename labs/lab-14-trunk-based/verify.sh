#!/usr/bin/env bash
# Lab 14 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 14"
check "At least 3 commits added to main since start"           '[ "$(git rev-list --count start..main)" -ge 3 ]'
check "Linear trunk: no merge commits since start"             '[ -z "$(git rev-list --merges start..main)" ]'
check "No other local branches left (short-lived, deleted)"    '[ "$(git branch --format="%(refname:short)" | grep -vx main | wc -l)" = 0 ]'
check "History shows new_checkout shipped dark (flag false)"   'git log start..main -p -- flags.json | grep -q "\"new_checkout\": false"'
check "History shows the flag being turned on (flag true)"     'git log start..main -p -- flags.json | grep -q "\"new_checkout\": true"'
check "Final: flag removed from flags.json"                    '! git show main:flags.json | grep -q new_checkout'
check "Final: checkout() calls new_checkout directly"          'git show main:checkout.py | grep -q "return new_checkout(cart)"'
check "Final: legacy_checkout deleted"                         '! git show main:checkout.py | grep -q legacy_checkout'
finish
