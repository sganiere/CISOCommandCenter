#!/usr/bin/env bash
# At session start, prints the CISO's context, philosophy, and library index so
# Claude Code has them without being asked. Long documents stay in library/ and
# are opened on demand — only the index is loaded here.
# No-ops quietly if the workspace hasn't been initialized yet.

WORKSPACE_FILE="$HOME/.ciso-command/workspace-path"

if [ ! -f "$WORKSPACE_FILE" ]; then
  exit 0
fi

WORKSPACE=$(cat "$WORKSPACE_FILE")
CONTEXT_FILE="$WORKSPACE/CISO_CONTEXT.md"
PHILOSOPHY_FILE="$WORKSPACE/PHILOSOPHY.md"
INDEX_FILE="$WORKSPACE/library/INDEX.md"

if [ ! -f "$CONTEXT_FILE" ]; then
  exit 0
fi

echo "## CISO Command context (auto-loaded)"
echo ""
# Print everything above the Activity Log heading only.
sed '/^## Activity Log/,$d' "$CONTEXT_FILE"

if [ -f "$PHILOSOPHY_FILE" ]; then
  echo ""
  echo "## CISO Philosophy (auto-loaded)"
  echo ""
  # Drop the Change Log tail; the beliefs are what matter in-session.
  sed '/^## Change Log/,$d' "$PHILOSOPHY_FILE"
fi

if [ -f "$INDEX_FILE" ]; then
  echo ""
  echo "## CISO Library index (auto-loaded)"
  echo ""
  echo "Full documents live in \`$WORKSPACE/library/\`. Open one only when its \"Read when\" line matches the request, and say which you used."
  echo ""
  cat "$INDEX_FILE"
fi
