#!/usr/bin/env bash
# Lab 23 · Hooks — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 23 · Git Hooks"
new_playground
write_commit README.md "# DevOps Shack hooks lab" "docs: init"
ready
