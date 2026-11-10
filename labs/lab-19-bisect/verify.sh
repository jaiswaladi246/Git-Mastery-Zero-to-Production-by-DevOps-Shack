#!/usr/bin/env bash
# Lab 19 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 19"
check "BAD_COMMIT.txt exists"                               '[ -f BAD_COMMIT.txt ]'
check "BAD_COMMIT.txt names the first bad commit"           '[ "$(git rev-parse "$(tr -d "[:space:]" < BAD_COMMIT.txt)")" = "$(cat .git/devopsshack-answer)" ]'
check "Bisect session ended (git bisect reset)"             '[ ! -f .git/BISECT_LOG ]'
check "Back on branch main (not detached)"                  '[ "$(git branch --show-current)" = main ]'
finish
