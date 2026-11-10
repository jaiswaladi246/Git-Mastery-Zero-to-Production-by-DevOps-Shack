#!/usr/bin/env bash
# Lab 29 reference solution — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
cp -r "$PG" "$PG-backup"                                   # 1. back up first, always
git fsck --full 2>&1 | head -5 || true
find .git/objects -type f -empty -delete                   # 2. remove empty (corrupt) object files
git clone -q --mirror --no-local "$LAB_DIR/server.git" /tmp/devopsshack-rescue.git   # 3. healthy copy
cp /tmp/devopsshack-rescue.git/objects/pack/* .git/objects/pack/ 2>/dev/null || true
rm -rf /tmp/devopsshack-rescue.git
git fsck --full && echo "Repository healthy"
rm -rf "$PG-backup"
