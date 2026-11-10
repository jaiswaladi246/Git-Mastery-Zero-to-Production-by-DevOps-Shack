#!/usr/bin/env bash
# Lab 07 · Merge Conflicts — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 07 · Merge Conflicts"
new_playground
git config merge.conflictstyle zdiff3
printf 'service: payments\ntimeout: 10\nretries: 1\n' > config.yaml
printf '# Payments Service\n\nMaintained by DevOps Shack.\n' > README.md
echo "legacy endpoint" > legacy.txt
git add . && git commit -q -m "feat: initial service"
git switch -q -c feature/retry
sed -i 's/timeout: 10/timeout: 60/; s/retries: 1/retries: 5/' config.yaml
echo "Retries: exponential backoff enabled." >> README.md
git rm -q legacy.txt
git commit -q -am "feat: add retry with backoff, drop legacy endpoint"
git switch -q main
sed -i 's/timeout: 10/timeout: 30/' config.yaml
echo "Monitoring: Prometheus metrics on /metrics." >> README.md
echo "legacy endpoint (patched)" > legacy.txt
git commit -q -am "feat: add monitoring, patch legacy"
ready
