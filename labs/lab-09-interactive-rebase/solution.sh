#!/usr/bin/env bash
# Lab 09 reference solution — Git Mastery by DevOps Shack. Try it yourself first!
# In real life you'd edit the todo list in your editor. Here a sed script plays the editor.
LAB_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; source "$LAB_DIR/../_lib/common.sh"
bash "$LAB_DIR/setup.sh" >/dev/null; cd "$PG"
git switch -q feature/invoices
# Todo list (oldest first): add invoice model / wip / fix tpyo / add export endpoint / address review comments / debug stuff
export GIT_SEQUENCE_EDITOR="sed -i -e '/ wip$/s/^pick/drop/' -e '/ fix tpyo$/s/^pick/fixup/' -e '/ address review comments$/s/^pick/fixup/' -e '/ debug stuff$/s/^pick/drop/' -e '/ add invoice model$/s/^pick/reword/' -e '/ add export endpoint$/s/^pick/reword/'"
# reword needs a message editor: a tiny script that rewrites the subject line
cat > /tmp/devopsshack-reword.sh <<'R'
#!/usr/bin/env bash
case "$(head -1 "$1")" in
  "add invoice model") sed -i '1s/.*/feat: add invoice model/' "$1" ;;
  "add export endpoint") sed -i '1s/.*/feat: add invoice export endpoint/' "$1" ;;
esac
R
chmod +x /tmp/devopsshack-reword.sh
GIT_EDITOR=/tmp/devopsshack-reword.sh git rebase -i main
git log --oneline main..feature/invoices
