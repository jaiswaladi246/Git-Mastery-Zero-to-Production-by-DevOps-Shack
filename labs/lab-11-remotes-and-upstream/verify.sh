#!/usr/bin/env bash
# Lab 11 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG/you"
banner "Verifying Lab 11"
S="git --git-dir=$PG/server.git"
check "Server main has the teammate's commit"            "$S log main --format=%s | grep -qx 'teammate: add healthcheck'"
check "Server main has your commit"                      "$S log main --format=%s | grep -qx 'you: add metrics'"
check "Server main is linear (no merge commits)"         "[ -z \"\$($S rev-list --merges main)\" ]"
check "Server has branch feature/upstream-demo"          "$S rev-parse --verify -q refs/heads/feature/upstream-demo"
check "Local feature/upstream-demo tracks origin"        '[ "$(git rev-parse --abbrev-ref feature/upstream-demo@{upstream})" = origin/feature/upstream-demo ]'
check "Stale origin/old-feature pruned locally"          '! git rev-parse --verify -q refs/remotes/origin/old-feature'
check "Local main is in sync with origin/main"           '[ "$(git rev-parse main)" = "$(git rev-parse origin/main)" ]'
finish
