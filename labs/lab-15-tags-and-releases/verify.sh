#!/usr/bin/env bash
# Lab 15 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 15"
check "Wrong tag v1.3.0-rc deleted"                     '! git rev-parse -q --verify refs/tags/v1.3.0-rc'
check "Tag v1.3.0 exists"                               'git rev-parse -q --verify refs/tags/v1.3.0'
check "v1.3.0 is an annotated tag"                      '[ "$(git cat-file -t v1.3.0)" = tag ]'
check "v1.3.0 points at main"                           '[ "$(git rev-parse v1.3.0^{commit})" = "$(git rev-parse main)" ]'
check "VERSION file at v1.3.0 says 1.3.0"               '[ "$(git show v1.3.0:VERSION)" = 1.3.0 ]'
check "CHANGELOG.md committed in the release"           'git cat-file -e v1.3.0:CHANGELOG.md'
check "CHANGELOG lists UPI checkout"                    'git show v1.3.0:CHANGELOG.md | grep -q "UPI checkout"'
check "CHANGELOG lists CSV export"                      'git show v1.3.0:CHANGELOG.md | grep -q "CSV"'
check "CHANGELOG lists the null customer fix"           'git show v1.3.0:CHANGELOG.md | grep -q "null customer"'
check "git describe on main gives v1.3.0"               '[ "$(git describe main)" = v1.3.0 ]'
finish
