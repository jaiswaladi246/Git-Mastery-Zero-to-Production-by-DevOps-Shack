#!/usr/bin/env bash
# Lab 27 · rerere — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 27 · rerere: Reuse Recorded Resolution"
new_playground
printf 'title=DevOps Shack\ntheme=light\n' > site.conf; git add .; git commit -q -m "feat: site config"
git switch -q -c feature/dark; sed -i 's/theme=light/theme=dark/' site.conf; git commit -q -am "feat: dark theme"
git switch -q main; sed -i 's/theme=light/theme=orange/' site.conf; git commit -q -am "feat: brand orange theme"
ready
