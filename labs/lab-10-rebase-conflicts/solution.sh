#!/usr/bin/env bash
# Lab 10 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git switch -q feature/resilience
git rebase main || true
# conflict 1 (port): keep 9090, keep retries
printf 'name=devopsshack-api\nport=9090\nlog=warn\nretries=3\n' > app.conf
git add app.conf && git -c core.editor=true rebase --continue || true
# conflict 2 (log level): ops wins -> this commit becomes empty; skip it
if [ -d .git/rebase-merge ]; then
  printf 'name=devopsshack-api\nport=9090\nlog=warn\nretries=3\n' > app.conf
  git add app.conf
  git rebase --skip || git -c core.editor=true rebase --continue || true
fi
while [ -d .git/rebase-merge ]; do
  printf 'name=devopsshack-api\nport=9090\nlog=warn\nretries=3\ntimeout=30\n' > app.conf
  git add app.conf; git -c core.editor=true rebase --continue || true
done
git log --oneline main~1..feature/resilience
cat app.conf
