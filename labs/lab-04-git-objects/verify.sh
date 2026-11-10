#!/usr/bin/env bash
# Lab 04 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 04"
A=answers.txt
ans() { grep -E "^$1:" "$A" | head -1 | cut -d: -f2- | tr -d ' '; }
check "answers.txt exists"                                '[ -f answers.txt ]'
check "Q1: tree hash of main's latest commit"             '[ "$(ans Q1)" = "$(git rev-parse main^{tree})" ]'
check "Q2: blob hash of README.md on main"                '[ "$(ans Q2)" = "$(git rev-parse main:README.md)" ]'
check "Q3: number of parents of main's latest commit"     '[ "$(ans Q3)" = "$(git cat-file -p main | grep -c ^parent)" ]'
check "Q4: object type of main:src"                       '[ "$(ans Q4)" = "tree" ]'
check "Branch handmade exists"                            'git rev-parse --verify -q refs/heads/handmade'
check "handmade's commit has no parent (root commit)"     '[ "$(git cat-file -p handmade | grep -c ^parent)" = 0 ]'
check "handmade contains hello.txt = 'Built by hand at DevOps Shack'" '[ "$(git show handmade:hello.txt)" = "Built by hand at DevOps Shack" ]'
finish
