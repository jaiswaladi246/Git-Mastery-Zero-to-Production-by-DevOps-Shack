#!/usr/bin/env bash
# Lab 05 · Undo Everything — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 05 · Undo Everything"
new_playground
write_commit README.md "# DevOps Shack Undo Lab" "docs: add README"
write_commit a.txt "a original" "feat: add a.txt"
write_commit b.txt "b original" "feat: add b.txt"
write_commit broken.txt "this feature breaks production" "feat: add broken feature"
write_commit README.md "# DevOps Shack Undo Lab (fixed tpyo)" "fix tpyo"
echo "a: accidental edit, throw me away" > a.txt
echo "b: good edit, but staged too early" > b.txt && git add b.txt
ready
echo "   Pretend 'feat: add broken feature' is already pushed to a shared main."
