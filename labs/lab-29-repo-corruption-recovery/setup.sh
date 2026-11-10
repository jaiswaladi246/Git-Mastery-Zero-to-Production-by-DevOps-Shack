#!/usr/bin/env bash
# Lab 29 · Repository Corruption Recovery — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 29 · Repository Corruption Recovery"
rm -rf "$PG" "$LAB_DIR/server.git" "$LAB_DIR/_seed"
git init -q --bare -b main "$LAB_DIR/server.git"
git clone -q "$LAB_DIR/server.git" "$LAB_DIR/_seed" 2>/dev/null; lab_identity "$LAB_DIR/_seed"
( cd "$LAB_DIR/_seed"; write_commit README.md "# DevOps Shack ledger" "docs: readme"; write_commit ledger.py "def post(): ..." "feat: ledger"; git push -q origin main )
rm -rf "$LAB_DIR/_seed"
git clone -q --no-local "$LAB_DIR/server.git" "$PG"; lab_identity "$PG"; cd "$PG"
# explode packs into loose objects so we can corrupt one
mv .git/objects/pack/*.pack /tmp/devopsshack.pack; rm -f .git/objects/pack/*; git unpack-objects -q < /tmp/devopsshack.pack; rm -f /tmp/devopsshack.pack
write_commit audit.py "def audit(): ... # unpushed work" "feat: unpushed audit module"
B=$(git rev-parse HEAD~1:README.md); F=".git/objects/${B:0:2}/${B:2}"; chmod u+w "$F"; : > "$F"
ready
echo "   💥 A disk-full crash left an EMPTY object file. Try: git log -p   /   git fsck --full"
echo "   You have one unpushed commit you must not lose. Remote: $LAB_DIR/server.git"
