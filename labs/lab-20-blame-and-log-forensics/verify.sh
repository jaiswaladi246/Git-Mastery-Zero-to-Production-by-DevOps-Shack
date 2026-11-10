#!/usr/bin/env bash
# Lab 20 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 20"
a(){ grep -E "^$1:" answers.txt | head -1 | cut -d: -f2- | sed 's/^ *//;s/ *$//'; }
e(){ grep "^$1=" .git/devopsshack-answers | cut -d= -f2-; }
check "answers.txt exists" '[ -f answers.txt ]'
check "Q1 who set MAX_RETRIES = 5"            '[ "$(a Q1)" = "$(e Q1)" ]'
check "Q2 short hash of commit that removed API_KEY" '[ "$(git rev-parse "$(a Q2)")" = "$(git rev-parse "$(e Q2)")" ]'
check "Q3 original path of services/billing.py" '[ "$(a Q3)" = "$(e Q3)" ]'
check "Q4 number of commits by Priya Sharma"   '[ "$(a Q4)" = "$(e Q4)" ]'
finish
