#!/usr/bin/env bash
# Lab 04 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git cat-file -p main
{
  echo "Q1: $(git rev-parse main^{tree})"
  echo "Q2: $(git rev-parse main:README.md)"
  echo "Q3: $(git cat-file -p main | grep -c ^parent)"
  echo "Q4: $(git cat-file -t main:src)"
} > answers.txt
BLOB=$(echo "Built by hand at DevOps Shack" | git hash-object -w --stdin)
export GIT_INDEX_FILE=.git/handmade-index
git update-index --add --cacheinfo 100644 "$BLOB" hello.txt
TREE=$(git write-tree)
unset GIT_INDEX_FILE
COMMIT=$(echo "Handmade commit" | git commit-tree "$TREE")
git update-ref refs/heads/handmade "$COMMIT"
git log --oneline handmade
