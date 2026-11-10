#!/usr/bin/env bash
# Lab 30 · Production Incident Drill — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 30 · Production Incident Drill (capstone)"
rm -rf "$PG"; mkdir -p "$PG"; cd "$PG"
git init -q --bare -b main server.git
git clone -q server.git you 2>/dev/null; lab_identity you; cd you
write_commit config.env "DEBUG=false" "feat: base config"
write_commit api.py "def api(): ..." "feat: api"
write_commit config.env "DEBUG=true" "feat: enable debug mode in prod"
write_commit payments.py "def pay(): ..." "feat: payments"
write_commit refunds.py "def refund(): ..." "feat: refunds"
git push -q origin main
git switch -q -c feature/payment-gateway
write_commit gateway.py 'API_KEY = "AKIAGATEWAYDEVSHACK1"' "feat: payment gateway client"
git switch -q main
cd "$PG"; git clone -q server.git rogue; lab_identity rogue; cd rogue
git reset -q --hard HEAD~3; git push -q --force origin main
cd "$PG"; rm -rf rogue
ready
cat <<'T'
   🚨 INCIDENT (it's 2 AM):
   1. Someone force-pushed main on the server back 3 commits. payments + refunds are gone from the remote.
   2. 'feat: enable debug mode in prod' is leaking stack traces. It must be reverted.
   3. Your unpushed branch feature/payment-gateway contains a hardcoded key. Clean it, then push it.
   Your clone: playground/you   ·  Server: playground/server.git
T
