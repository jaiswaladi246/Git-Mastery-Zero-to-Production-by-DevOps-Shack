#!/usr/bin/env bash
# Lab 30 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; banner "Verifying Lab 30"
S="git --git-dir=$PG/server.git"
check "Server main has payments restored"                "$S log main --format=%s | grep -qx 'feat: payments'"
check "Server main has refunds restored"                 "$S log main --format=%s | grep -qx 'feat: refunds'"
check "Debug commit reverted (not erased)"               "$S log main --format=%s | grep -q '^Revert \"feat: enable debug mode in prod\"' && $S log main --format=%s | grep -qx 'feat: enable debug mode in prod'"
check "Server main config has DEBUG=false"               "[ \"\$($S show main:config.env)\" = DEBUG=false ]"
check "Server has feature/payment-gateway"               "$S rev-parse -q --verify refs/heads/feature/payment-gateway"
check "No AKIA key anywhere on server branch"            "[ -z \"\$($S log -p feature/payment-gateway | grep AKIA)\" ]"
check "Gateway reads key from environment"               "$S show feature/payment-gateway:gateway.py | grep -q environ"
finish
