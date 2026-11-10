#!/usr/bin/env bash
# Lab 23 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 23"
check "core.hooksPath = .githooks"                 '[ "$(git config core.hooksPath)" = .githooks ]'
check ".githooks/commit-msg committed + executable" 'git ls-files --error-unmatch .githooks/commit-msg && [ -x .githooks/commit-msg ]'
check ".githooks/pre-commit committed + executable" 'git ls-files --error-unmatch .githooks/pre-commit && [ -x .githooks/pre-commit ]'
T=$(mktemp -d); git clone -q "$PG" "$T/c"; cd "$T/c"; git config core.hooksPath .githooks; lab_identity .
check "Rejects bad message 'updated stuff'"        '! git commit -q --allow-empty -m "updated stuff"'
check "Accepts 'feat(api): add health endpoint'"   'git commit -q --allow-empty -m "feat(api): add health endpoint"'
check "Blocks a staged AWS key"                    'echo "KEY=AKIAABCDEFGHIJKLMNOP" > leak.txt && git add leak.txt && ! git commit -q -m "feat: leak"'
check "Allows a clean file"                        'git reset -q && rm -f leak.txt && echo ok > ok.txt && git add ok.txt && git commit -q -m "chore: add ok file"'
cd /; rm -rf "$T"
finish
