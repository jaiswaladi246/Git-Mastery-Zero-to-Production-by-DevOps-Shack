#!/usr/bin/env bash
# Lab 30 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG/you"
# 1. restore main: your local main still has the lost commits
git fetch origin
git log --oneline origin/main..main                  # the 3 commits missing on the server
git push --force-with-lease=main:origin/main origin main
# 2. revert the debug commit (shared history -> revert, never reset)
git revert --no-edit "$(git log --format=%H --grep='^feat: enable debug mode in prod$')"
git push origin main
# 3. clean the unpushed secret (rotate the key in real life!) and push
git switch feature/payment-gateway
printf 'import os\nAPI_KEY = os.environ["GATEWAY_API_KEY"]\n' > gateway.py
git commit -a --amend --no-edit
git rebase main
git push -u origin feature/payment-gateway
