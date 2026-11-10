#!/usr/bin/env bash
# Lab 10 · Rebase Conflicts — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 10 · Rebase Conflicts"
new_playground
printf 'name=devopsshack-api\nport=8080\nlog=info\n' > app.conf
git add app.conf && git commit -q -m "feat: base config"
git switch -q -c feature/resilience
sed -i 's/^port=8080/port=8081/' app.conf
echo "retries=3" >> app.conf
git commit -q -am "feat: add retries (and move port)"
sed -i 's/^log=info/log=debug/' app.conf
git commit -q -am "chore: debug logging"
echo "timeout=30" >> app.conf
git commit -q -am "feat: add timeout"
git switch -q main
sed -i 's/^port=8080/port=9090/' app.conf
sed -i 's/^log=info/log=warn/' app.conf
git commit -q -am "ops: production port and log level"
ready
