#!/usr/bin/env bash
# Copy a README template into a repository and fill the simple tokens.
#
# Usage:
#   ./scripts/new-readme.sh [app|tool|coursework] [target-dir] [options]
#
# Options:
#   --title "Name"       Override the project title
#   --tagline "..."      Override the one-line tagline
#   --live "https://..." Override the live URL
#   --force              Overwrite an existing README.md
#   --no-meta            Do not copy LICENSE or .github/
#   -h, --help           Show this help
#
# Examples:
#   ./scripts/new-readme.sh app ~/projects/my-app
#   ./scripts/new-readme.sh coursework . --title "Space Wars" --tagline "An arcade game."
#
# The script never overwrites an existing README.md unless --force is passed.

set -euo pipefail

KIT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

usage() {
  sed -n '2,20p' "$0" | sed 's/^# \{0,1\}//'
}

TYPE="app"
TARGET="."
FORCE=0
META=1
TITLE=""
TAGLINE=""
LIVE_URL=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    app|tool|coursework)
      TYPE="$1"
      ;;
    --title)
      TITLE="${2:?--title needs a value}"
      shift
      ;;
    --tagline)
      TAGLINE="${2:?--tagline needs a value}"
      shift
      ;;
    --live)
      LIVE_URL="${2:?--live needs a value}"
      shift
      ;;
    --force)
      FORCE=1
      ;;
    --no-meta)
      META=0
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    -*)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
    *)
      TARGET="$1"
      ;;
  esac
  shift
done

case "$TYPE" in
  app)        TEMPLATE="$KIT_DIR/README.template.md" ;;
  tool)       TEMPLATE="$KIT_DIR/templates/tool.md" ;;
  coursework) TEMPLATE="$KIT_DIR/templates/coursework.md" ;;
  *)
    echo "Unknown template type: $TYPE" >&2
    exit 2
    ;;
esac

if [[ ! -f "$TEMPLATE" ]]; then
  echo "Template not found: $TEMPLATE" >&2
  exit 1
fi

if [[ ! -d "$TARGET" ]]; then
  echo "Target directory does not exist: $TARGET" >&2
  exit 1
fi

TARGET="$(cd "$TARGET" && pwd)"
OUT="$TARGET/README.md"

if [[ -e "$OUT" && $FORCE -eq 0 ]]; then
  echo "Refusing to overwrite $OUT" >&2
  echo "Pass --force to replace it." >&2
  exit 1
fi

# Resolve the repo and owner from the target's Git remote and gh session.
REPO=""
if git -C "$TARGET" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  REMOTE="$(git -C "$TARGET" remote get-url origin 2>/dev/null || true)"
  REMOTE="${REMOTE%/}"
  if [[ -n "$REMOTE" ]]; then
    REPO="$(basename "${REMOTE%.git}")"
  fi
fi
[[ -n "$REPO" ]] || REPO="$(basename "$TARGET")"

OWNER="franpts2"
if command -v gh >/dev/null 2>&1; then
  GH_OWNER="$(gh api user --jq .login 2>/dev/null || true)"
  [[ -n "$GH_OWNER" ]] && OWNER="$GH_OWNER"
fi

if [[ -z "$TITLE" ]]; then
  TITLE="$(printf '%s' "$REPO" | tr '_-' '  ' \
    | awk '{ for (i = 1; i <= NF; i++) $i = toupper(substr($i, 1, 1)) substr($i, 2) } 1')"
fi

# Use the GitHub description and homepage when they exist.
if [[ -z "$TAGLINE" ]] && command -v gh >/dev/null 2>&1; then
  TAGLINE="$(gh api "repos/$OWNER/$REPO" --jq '.description // empty' 2>/dev/null || true)"
fi
if [[ -z "$LIVE_URL" ]] && command -v gh >/dev/null 2>&1; then
  LIVE_URL="$(gh api "repos/$OWNER/$REPO" --jq '.homepage // empty' 2>/dev/null || true)"
fi

LIVE_HOST=""
if [[ -n "$LIVE_URL" ]]; then
  LIVE_HOST="${LIVE_URL#http://}"
  LIVE_HOST="${LIVE_HOST#https://}"
  LIVE_HOST="${LIVE_HOST%%/*}"
fi

cp "$TEMPLATE" "$OUT"

replace() {
  local find="$1" value="$2"
  value="${value//\\/\\\\}"
  value="${value//&/\\&}"
  value="${value//|/\\|}"
  sed -i "s|{{$find}}|$value|g" "$OUT"
}

[[ -n "$TITLE" ]]    && replace PROJECT "$TITLE"
[[ -n "$REPO" ]]     && replace REPO "$REPO"
[[ -n "$OWNER" ]]    && replace OWNER "$OWNER"
[[ -n "$TAGLINE" ]]  && replace TAGLINE "$TAGLINE"
[[ -n "$LIVE_URL" ]] && replace LIVE_URL "$LIVE_URL"
[[ -n "$LIVE_HOST" ]] && replace LIVE_HOST "$LIVE_HOST"
replace YEAR "$(date +%Y)"
replace AUTHOR "Francisca Portugal"

if [[ $META -eq 1 ]]; then
  [[ -e "$TARGET/LICENSE" ]] || cp "$KIT_DIR/LICENSE" "$TARGET/LICENSE"
  [[ -e "$TARGET/.github" ]] || cp -R "$KIT_DIR/.github" "$TARGET/.github"
fi

echo "Wrote $OUT from $TYPE template."

if grep -q '{{[A-Z_]*}}' "$OUT"; then
  echo
  echo "Still to fill:"
  grep -o '{{[A-Z_]*}}' "$OUT" | sort -u | sed 's/^/  /'
fi
