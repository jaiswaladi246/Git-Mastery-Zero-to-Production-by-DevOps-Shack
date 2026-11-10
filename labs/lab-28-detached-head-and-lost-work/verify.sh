#!/usr/bin/env bash
# Lab 28 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 28"
check "Branch experiment/cache exists"                 'git rev-parse -q --verify refs/heads/experiment/cache'
check "It contains 'experiment: add cache layer'"      'git log experiment/cache --format=%s | grep -qx "experiment: add cache layer"'
check "Its tip is 'experiment: cache ttl'"             '[ "$(git log -1 --format=%s experiment/cache)" = "experiment: cache ttl" ]'
check "It is based on v1.0"                            'git merge-base --is-ancestor v1.0 experiment/cache'
check "HEAD is attached to a branch"                   'git symbolic-ref -q HEAD'
finish
