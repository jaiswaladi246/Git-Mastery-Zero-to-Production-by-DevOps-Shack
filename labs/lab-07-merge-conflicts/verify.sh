#!/usr/bin/env bash
# Lab 07 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 07"
check "On branch main"                                 '[ "$(git branch --show-current)" = main ]'
check "Merge completed (HEAD has 2 parents)"           '[ "$(git cat-file -p HEAD | grep -c ^parent)" = 2 ]'
check "No merge in progress"                           '[ ! -f .git/MERGE_HEAD ]'
check "No conflict markers anywhere"                   '! git grep -nE "^(<<<<<<<|=======|>>>>>>>|\|\|\|\|\|\|\|)" HEAD'
check "timeout is 60"                                  'git show HEAD:config.yaml | grep -qx "timeout: 60"'
check "retries is 5"                                   'git show HEAD:config.yaml | grep -qx "retries: 5"'
check "README keeps the Retries line"                  'git show HEAD:README.md | grep -q "^Retries:"'
check "README keeps the Monitoring line"               'git show HEAD:README.md | grep -q "^Monitoring:"'
check "legacy.txt deleted"                             '! git cat-file -e HEAD:legacy.txt'
finish
