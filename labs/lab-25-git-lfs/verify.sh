#!/usr/bin/env bash
# Lab 25 verify — Git Mastery by DevOps Shack
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
require_playground; cd "$PG"; banner "Verifying Lab 25"
check ".gitattributes tracks *.bin with LFS"        'git show HEAD:.gitattributes | grep -q "\*.bin filter=lfs"'
check "HEAD assets/demo.bin is an LFS pointer"      'git cat-file -p HEAD:assets/demo.bin | grep -q "^version https://git-lfs"'
check "No blob over 1 MB anywhere in history"       '[ -z "$(git rev-list --objects --all | git cat-file --batch-check="%(objecttype) %(objectsize)" | awk "\$1==\"blob\" && \$2>1000000")" ]'
check "Same commit count (history rewritten, not lost)" '[ "$(git rev-list --count HEAD)" = 4 ]'
check "LFS object for demo.bin stored locally"      'git lfs ls-files | grep -q assets/demo.bin && [ -n "$(find .git/lfs/objects -type f | head -1)" ]'
finish
