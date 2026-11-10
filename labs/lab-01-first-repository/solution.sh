#!/usr/bin/env bash
# Lab 01 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git init -b main
git config user.name "DevOps Shack"; git config user.email "labs@devopsshack.com"
echo "# DevOps Shack demo app" > README.md
git add README.md && git commit -m "docs: add project README"
mkdir -p src && printf '#!/usr/bin/env bash\necho "Hello from DevOps Shack"\n' > src/app.sh
git add src/app.sh && git commit -m "feat: add hello script"
echo "*.log" > .gitignore && echo "debug" > run.log
git add .gitignore && git commit -m "chore: ignore log files"
rm -f run.log
git log --oneline
