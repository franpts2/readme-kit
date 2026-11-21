#!/usr/bin/env bash
# Create a new private repository from this kit, then turn it into a clean project.
#
# Usage:
#   ./scripts/new-project.sh <name> [app|tool|coursework]
#
# Example:
#   ./scripts/new-project.sh my-new-project app
#
# Requires gh, authenticated with repo scope. The kit repository must be marked as a
# template repository.

set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

NAME="${1:-}"
TYPE="${2:-app}"

if [[ -z "$NAME" ]]; then
  echo "Usage: new-project.sh <name> [app|tool|coursework]" >&2
  exit 2
fi

case "$TYPE" in
  app|tool|coursework) ;;
  *)
    echo "Unknown template type: $TYPE" >&2
    exit 2
    ;;
esac

if ! command -v gh >/dev/null 2>&1; then
  echo "gh is required: https://cli.github.com" >&2
  exit 1
fi

OWNER="$(gh api user --jq .login)"
KIT_REPO="$OWNER/readme-kit"

if [[ -e "$NAME" ]]; then
  echo "A file or directory named '$NAME' already exists." >&2
  exit 1
fi

echo "Creating $OWNER/$NAME from $KIT_REPO ..."
gh repo create "$OWNER/$NAME" --private --template "$KIT_REPO" --clone

cd "$NAME"

"$KIT_DIR/scripts/new-readme.sh" "$TYPE" . --force
rm -rf templates scripts BADGES.md README.template.md

git add -A
git commit -m "Initialize project README"
git push

echo
echo "Done: https://github.com/$OWNER/$NAME"
echo "Next: add screenshots under docs/screenshots/ and fill the remaining placeholders."
