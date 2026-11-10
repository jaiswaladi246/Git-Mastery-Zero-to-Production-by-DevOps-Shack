#!/usr/bin/env bash
# Lab 21 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 21"
check "No AKIA key in any commit of any branch"  '[ -z "$(git log --all -p | grep AKIA)" ]'
check "No AKIA key in any reachable blob"        '! git grep -q AKIA $(git rev-list --all)'
check "Same number of commits as before"         '[ "$(git rev-list --count HEAD)" = "$(cat .git/devopsshack-count)" ]'
check "Placeholder ***REMOVED*** present in old config" 'git log --all -p -- config.py | grep -F "***REMOVED***"'
check "Latest config still reads from env"       'git show HEAD:config.py | grep -q os.environ'
finish
