#!/usr/bin/env bash
# Lab 13 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 13"
check "develop contains login.sh"                         'git cat-file -e develop:login.sh'
check "feature merged with --no-ff (merge commit on develop)" 'git log develop --merges --format=%s | grep -q "feature/login"'
check "Tag v1.1.0 exists and is annotated"                '[ "$(git cat-file -t v1.1.0)" = tag ]'
check "v1.1.0 VERSION file says 1.1.0"                    '[ "$(git show v1.1.0:VERSION)" = 1.1.0 ]'
check "Tag v1.1.1 exists and is annotated"                '[ "$(git cat-file -t v1.1.1)" = tag ]'
check "v1.1.1 VERSION file says 1.1.1"                    '[ "$(git show v1.1.1:VERSION)" = 1.1.1 ]'
check "main points at v1.1.1"                             '[ "$(git rev-parse main)" = "$(git rev-parse v1.1.1^{commit})" ]'
check "Hotfix merged back into develop"                   'git merge-base --is-ancestor "$(git rev-parse v1.1.1^{commit}^2 2>/dev/null || git rev-parse v1.1.1^{commit})" develop'
check "Release merged back into develop"                  'git merge-base --is-ancestor "$(git rev-parse v1.1.0^{commit}^2 2>/dev/null || git rev-parse v1.1.0^{commit})" develop'
check "No leftover release/* or hotfix/* branches"        '[ -z "$(git branch --list "release/*" "hotfix/*")" ]'
finish
