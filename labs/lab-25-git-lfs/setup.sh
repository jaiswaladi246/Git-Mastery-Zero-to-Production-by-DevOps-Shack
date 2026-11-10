#!/usr/bin/env bash
# Lab 25 · Git LFS — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 25 · Migrating Big Binaries to Git LFS"
command -v git-lfs >/dev/null || { echo "Install Git LFS first: https://git-lfs.com"; exit 1; }
new_playground
write_commit app.py "print('DevOps Shack media app')" "feat: app"
mkdir -p assets; head -c 3000000 /dev/urandom > assets/demo.bin; git add assets; git commit -q -m "feat: add demo video"
head -c 3000000 /dev/urandom > assets/demo.bin; git commit -q -am "feat: re-encode demo video"
write_commit README.md "# Media app" "docs: readme"
ready
echo "   Two 3 MB binary versions are baked into history. Check: git count-objects -vH"
