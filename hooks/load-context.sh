#!/usr/bin/env bash
# Prints CISO_CONTEXT.md (minus the Activity Log tail) at session start,
# so Claude Code has organizational context without being asked for it.
# No-ops quietly if the workspace hasn't been initialized yet.

WORKSPACE_FILE="$HOME/.ciso-command/workspace-path"

if [ ! -f "$WORKSPACE_FILE" ]; then
  exit 0
fi

WORKSPACE=$(cat "$WORKSPACE_FILE")
CONTEXT_FILE="$WORKSPACE/CISO_CONTEXT.md"

if [ ! -f "$CONTEXT_FILE" ]; then
  exit 0
fi

echo "## CISO Command context (auto-loaded)"
echo ""
# Print everything above the Activity Log heading only.
sed '/^## Activity Log/,$d' "$CONTEXT_FILE"
