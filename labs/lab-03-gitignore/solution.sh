#!/usr/bin/env bash
# Lab 03 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
cat > .gitignore <<'GI'
# DevOps Shack standard ignores
node_modules/
dist/
logs/
*.log
.DS_Store
.env
!config/.env.example
GI
git rm --cached .env
git add .gitignore
git commit -m "chore: ignore build output, deps, logs and local env"
git status
