#!/usr/bin/env bash
# Lab 19 · Bisect — Git Mastery by DevOps Shack (youtube.com/@devopsshack)
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
banner "Lab 19 · Hunting a Regression with git bisect"
new_playground
cat > calc.sh <<'S'
#!/usr/bin/env bash
# DevOps Shack calculator
add() { echo $(( $1 + $2 )); }
S
cat > test.sh <<'S'
#!/usr/bin/env bash
source ./calc.sh
[ "$(add 2 3)" = 5 ]
S
chmod +x calc.sh test.sh
git add . && git commit -q -m "feat: calculator v1"
git tag v1.0
BAD_AT=$(( (RANDOM % 70) + 15 ))
for i in $(seq 1 100); do
  echo "# tweak $i" >> calc.sh
  if [ "$i" -eq "$BAD_AT" ]; then
    sed -i 's/add() { echo \$(( \$1 + \$2 )); }/add() { echo $(( $1 + $2 + ($1 > 1 ? 1 : 0) )); }/' calc.sh
  fi
  git commit -q -am "refactor: tweak #$i"
  [ "$i" -eq "$BAD_AT" ] && git rev-parse HEAD > .git/devopsshack-answer
done
ready
echo "   v1.0 passed ./test.sh. HEAD fails it. 100 commits in between. Find the culprit."
