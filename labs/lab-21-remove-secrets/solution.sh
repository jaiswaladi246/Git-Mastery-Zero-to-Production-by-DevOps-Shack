#!/usr/bin/env bash
# Lab 21 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
command -v git-filter-repo >/dev/null || pip install git-filter-repo
echo 'regex:AKIA[0-9A-Z]{16}==>***REMOVED***' > ../replacements.txt
git filter-repo --force --replace-text ../replacements.txt
rm -f ../replacements.txt
git log --all -p | grep -c AKIA || echo "clean"
