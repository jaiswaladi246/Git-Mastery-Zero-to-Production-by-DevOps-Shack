#!/usr/bin/env bash
# =====================================================================
#  Git Mastery: Zero to Production · by DevOps Shack
#  Shared helpers for every lab.
#  YouTube: https://www.youtube.com/@devopsshack
#  Hindi:   https://www.youtube.com/@shackverse
#  Web:     https://devopsshack.com
#  Made with love by DevOps Shack. Please keep this credit if you share.
# =====================================================================
set -euo pipefail

# LAB_DIR must be set by the calling script before sourcing this file.
: "${LAB_DIR:?LAB_DIR must be set before sourcing common.sh}"
PG="$LAB_DIR/playground"

# Make every lab deterministic and independent of the learner's global config.
export GIT_CONFIG_GLOBAL=/dev/null 2>/dev/null || true
export GIT_AUTHOR_NAME="DevOps Shack"
export GIT_AUTHOR_EMAIL="labs@devopsshack.com"
export GIT_COMMITTER_NAME="DevOps Shack"
export GIT_COMMITTER_EMAIL="labs@devopsshack.com"
export GIT_PAGER=cat
export GIT_EDITOR=true
export GIT_MERGE_AUTOEDIT=no

banner() {
  cat <<'EOF'
==============================================================
   Git Mastery: Zero to Production  ·  by DevOps Shack
   youtube.com/@devopsshack  ·  youtube.com/@shackverse
==============================================================
EOF
  echo "   $1"
  echo
}

# Create a fresh playground repo (deletes any previous attempt).
new_playground() {
  rm -rf "$PG"
  mkdir -p "$PG"
  cd "$PG"
  git init -q -b main
  git config user.name "DevOps Shack"
  git config user.email "labs@devopsshack.com"
  git config commit.gpgsign false
  git config tag.gpgsign false
}

# Configure identity inside any other repo the lab creates.
lab_identity() {
  git -C "$1" config user.name "DevOps Shack"
  git -C "$1" config user.email "labs@devopsshack.com"
  git -C "$1" config commit.gpgsign false
}

# write_commit <file> <content> <message>
write_commit() {
  mkdir -p "$(dirname "$1")"
  printf '%s\n' "$2" > "$1"
  git add "$1"
  git commit -q -m "$3"
}

# append_commit <file> <line> <message>
append_commit() {
  mkdir -p "$(dirname "$1")"
  printf '%s\n' "$2" >> "$1"
  git add "$1"
  git commit -q -m "$3"
}

ready() {
  echo "✅ Playground ready at: $PG"
  echo "   cd \"$PG\"  and follow the tasks in README.md"
  echo "   When done, run:  bash \"$LAB_DIR/verify.sh\""
  echo
  echo "   Built with love by DevOps Shack 🧡"
}

# ---------- verification helpers ----------
FAILS=0
check() {
  local desc="$1"; shift
  if ( set +o pipefail; eval "$*" ) >/dev/null 2>&1; then
    echo "  ✅ $desc"
  else
    echo "  ❌ $desc"
    FAILS=$((FAILS + 1))
  fi
}

finish() {
  echo
  if [ "$FAILS" -eq 0 ]; then
    echo "🎉 All checks passed. Lab complete!"
    echo "   Share your progress and tag @devopsshack. Learn more: youtube.com/@devopsshack"
  else
    echo "❗ $FAILS check(s) failed. Re-read the task, look at 'git log --oneline --graph --all', and try again."
    echo "   Stuck? Run 'bash setup.sh' to start fresh, or peek at solution.sh."
    exit 1
  fi
}

require_playground() {
  if [ ! -d "$PG" ]; then
    echo "No playground found. Run: bash \"$LAB_DIR/setup.sh\" first."
    exit 1
  fi
}
