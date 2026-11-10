#!/usr/bin/env bash
# Lab 03 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 03"
check ".gitignore is committed"                       'git ls-files --error-unmatch .gitignore'
check ".env is no longer tracked"                     '! git ls-files --error-unmatch .env'
check ".env still exists on disk"                     '[ -f .env ]'
check ".env is ignored"                               'git check-ignore -q .env'
check "config/.env.example is still tracked"          'git ls-files --error-unmatch config/.env.example'
check "node_modules/ ignored"                         'git check-ignore -q node_modules/express/index.js'
check "dist/ ignored"                                 'git check-ignore -q dist/app.min.js'
check "logs ignored"                                  'git check-ignore -q logs/app.log'
check ".DS_Store ignored"                             'git check-ignore -q .DS_Store'
check "Working tree clean (nothing untracked showing)" '[ -z "$(git status --porcelain)" ]'
finish
