#!/usr/bin/env bash
# Lab 01 · Your First Repository — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 01 · Your First Repository"
rm -rf "$PG"; mkdir -p "$PG"
echo "Created an EMPTY folder. Turning it into a Git repository is your first task."
ready
