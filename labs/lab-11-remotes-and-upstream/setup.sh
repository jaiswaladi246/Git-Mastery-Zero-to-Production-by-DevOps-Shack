#!/usr/bin/env bash
# Lab 11 · Remotes and Upstream — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 11 · Remotes and Upstream"
rm -rf "$PG"; mkdir -p "$PG"; cd "$PG"
git init -q --bare -b main server.git
git clone -q server.git seed 2>/dev/null; lab_identity seed; cd seed
write_commit app.py "print('DevOps Shack API')" "feat: init api"
git push -q origin main
git switch -q -c old-feature; write_commit old.txt "old" "feat: old experiment"; git push -q origin old-feature
cd "$PG"; git clone -q server.git you; lab_identity you
git clone -q server.git teammate; lab_identity teammate
cd teammate; write_commit health.py "def health(): return 'ok'" "teammate: add healthcheck"; git push -q origin main
cd "$PG"; git -C server.git branch -q -D old-feature
cd you; write_commit metrics.py "def metrics(): return {}" "you: add metrics"
cd "$PG"; rm -rf seed teammate
ready
echo "   Your clone is: $PG/you   (the shared server is $PG/server.git)"
