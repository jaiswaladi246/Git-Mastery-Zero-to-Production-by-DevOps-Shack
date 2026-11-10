#!/usr/bin/env bash
# Lab 24 · Signed Commits — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 24 · Signed Commits and Tags (SSH signing)"
command -v ssh-keygen >/dev/null || { echo "ssh-keygen is required (install openssh-client)"; exit 1; }
rm -f "$LAB_DIR"/lab_signing_key*
new_playground
write_commit README.md "# DevOps Shack signing lab" "docs: init (unsigned)"
ready
echo "   Generate your lab key at: $LAB_DIR/lab_signing_key (never reuse lab keys for real accounts)"
