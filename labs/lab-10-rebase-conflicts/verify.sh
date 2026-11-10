#!/usr/bin/env bash
# Lab 10 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 10"
F='git show feature/resilience:app.conf'
check "No rebase in progress"                           '[ ! -d .git/rebase-merge ] && [ ! -d .git/rebase-apply ]'
check "feature/resilience sits on top of main"           'git merge-base --is-ancestor main feature/resilience'
check "Linear: no merge commits on the branch"           '[ -z "$(git rev-list --merges main..feature/resilience)" ]'
check "port=9090 (ops decision wins)"                    "$F | grep -qx port=9090"
check "log=warn (ops decision wins)"                     "$F | grep -qx log=warn"
check "retries=3 kept"                                   "$F | grep -qx retries=3"
check "timeout=30 kept"                                  "$F | grep -qx timeout=30"
check "No conflict markers"                              "! $F | grep -qE '^(<<<<<<<|=======|>>>>>>>)'"
finish
