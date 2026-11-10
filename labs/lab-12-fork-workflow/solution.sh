#!/usr/bin/env bash
# Lab 12 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG/local"
git remote add upstream "$PG/upstream.git"
git fetch upstream
git switch main
git rebase upstream/main
git push origin main
git switch -c fix/docs-typo
write_commit README.md "# DevOps Shack Open-Source CLI" "docs: fix typo in README title"
git push -u origin fix/docs-typo
echo "Now open a pull request: fork:fix/docs-typo → upstream:main"
