#!/usr/bin/env bash
# Lab 24 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 24"
check "gpg.format is ssh"                        '[ "$(git config gpg.format)" = ssh ]'
check "allowed signers file configured"          '[ -f "$(git config gpg.ssh.allowedSignersFile)" ]'
check "HEAD commit signature verifies"           'git verify-commit HEAD'
check "Tag v1.0.0 exists and verifies"           'git verify-tag v1.0.0'
check "First commit is still unsigned (compare)" '! git verify-commit HEAD~1'
finish
