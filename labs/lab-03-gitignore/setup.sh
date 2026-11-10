#!/usr/bin/env bash
# Lab 03 · .gitignore Deep Dive — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 03 · .gitignore Deep Dive"
new_playground
write_commit app.js 'console.log("DevOps Shack app")' "feat: add app entrypoint"
printf 'DB_PASSWORD=supersecret\nAPI_TOKEN=devopsshack-demo-token\n' > .env
mkdir -p config && printf 'DB_PASSWORD=\nAPI_TOKEN=\n' > config/.env.example
git add .env config/.env.example && git commit -q -m "chore: add env files"
mkdir -p node_modules/express dist logs
echo "module" > node_modules/express/index.js
echo "bundle" > dist/app.min.js
echo "log line" > logs/app.log
echo "x" > .DS_Store
ready
