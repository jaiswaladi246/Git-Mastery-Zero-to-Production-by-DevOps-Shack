#!/usr/bin/env bash
# Lab 15 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git tag -d v1.3.0-rc
git log --oneline v1.2.0..HEAD          # feat present, no breaking change -> MINOR bump -> 1.3.0
{
  echo "# Changelog"; echo; echo "## v1.3.0"; echo
  echo "### Features"; git log --format='- %s (%h)' v1.2.0..HEAD --grep='^feat'
  echo; echo "### Fixes";   git log --format='- %s (%h)' v1.2.0..HEAD --grep='^fix'
} > CHANGELOG.md
echo "1.3.0" > VERSION
git add CHANGELOG.md VERSION && git commit -m "chore(release): 1.3.0"
git tag -a v1.3.0 -m "Release 1.3.0"
git describe
