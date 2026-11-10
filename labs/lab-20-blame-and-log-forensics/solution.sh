#!/usr/bin/env bash
# Lab 20 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
{
echo "Q1: $(git blame --line-porcelain -L '/MAX_RETRIES/,+1' services/billing.py | sed -n 's/^author //p')"
echo "Q2: $(git log -S 'API_KEY' --format=%h | head -1)"
echo "Q3: $(git log --follow --name-only --format= services/billing.py | tail -1)"
echo "Q4: $(git shortlog -sn HEAD --author='Priya Sharma' | awk '{print $1}')"
} > answers.txt; cat answers.txt
