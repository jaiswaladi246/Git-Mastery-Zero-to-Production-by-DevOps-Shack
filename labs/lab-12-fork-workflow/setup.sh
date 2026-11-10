#!/usr/bin/env bash
# Lab 12 · Fork Workflow — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 12 · Fork Workflow"
rm -rf "$PG"; mkdir -p "$PG"; cd "$PG"
git init -q --bare -b main upstream.git
git clone -q upstream.git maint 2>/dev/null; lab_identity maint; cd maint
write_commit README.md "# DevOps Shack Open Source CLI" "docs: init"
write_commit cli.sh 'echo "dshack v1"' "feat: cli v1"
git push -q origin main
cd "$PG"; git clone -q --bare upstream.git fork.git          # "Fork" button on the platform
git clone -q fork.git local; lab_identity local                # your clone of your fork
cd maint; write_commit cli.sh 'echo "dshack v2"' "feat: cli v2"; write_commit CHANGELOG.md "v2" "docs: changelog"; git push -q origin main
cd "$PG"; rm -rf maint
ready
echo "   upstream.git = original project · fork.git = your fork (origin) · local/ = your clone"
