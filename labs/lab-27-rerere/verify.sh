#!/usr/bin/env bash
# Lab 27 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 27"
check "rerere.enabled is true"                    '[ "$(git config rerere.enabled)" = true ]'
check "A resolution was recorded in rr-cache"     '[ -n "$(ls -A .git/rr-cache 2>/dev/null)" ]'
check "main HEAD is the merge of feature/dark"    '[ "$(git cat-file -p HEAD | grep -c ^parent)" = 2 ] && git merge-base --is-ancestor feature/dark HEAD'
check "Resolved value theme=orange-dark"          'git show HEAD:site.conf | grep -qx theme=orange-dark'
check "Exactly one merge commit on main"          '[ "$(git rev-list --merges --count main)" = 1 ]'
finish
