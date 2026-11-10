#!/usr/bin/env bash
# Lab 06 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"
banner "Verifying Lab 06"
check "main contains 'feat: payment retries'"       'git log main --format=%s | grep -qx "feat: payment retries"'
check "main contains 'feat: payment logging'"       'git log main --format=%s | grep -qx "feat: payment logging"'
check "feature/invoices branch restored"            'git rev-parse --verify -q refs/heads/feature/invoices'
check "feature/invoices has 'feat: invoice pdf'"    'git log feature/invoices --format=%s | grep -qx "feat: invoice pdf"'
check "feature/invoices does NOT contain main-only commits" '! git log feature/invoices --format=%s | grep -q "payment retries"'
finish
