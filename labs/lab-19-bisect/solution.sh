#!/usr/bin/env bash
# Lab 19 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git bisect start HEAD v1.0
git bisect run ./test.sh | tee /tmp/devopsshack-bisect.log
git rev-parse refs/bisect/bad > BAD_COMMIT.txt
git bisect reset
echo "First bad commit: $(cat BAD_COMMIT.txt)"
