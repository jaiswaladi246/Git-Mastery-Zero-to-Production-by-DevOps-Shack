#!/usr/bin/env bash
# Lab 07 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git merge feature/retry || true
git status
printf 'service: payments\ntimeout: 60\nretries: 5\n' > config.yaml
printf '# Payments Service\n\nMaintained by DevOps Shack.\nMonitoring: Prometheus metrics on /metrics.\nRetries: exponential backoff enabled.\n' > README.md
git rm -q legacy.txt
git add config.yaml README.md
git commit --no-edit
git log --oneline --graph
