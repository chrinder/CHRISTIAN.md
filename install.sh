#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

mkdir -p ~/.claude

ln -sf "$SCRIPT_DIR/claude/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$SCRIPT_DIR/claude/settings.json" ~/.claude/settings.json
ln -sf "$SCRIPT_DIR/claude/rules" ~/.claude/rules

echo "Done. Symlinks created in ~/.claude/"
echo ""
echo "  ~/.claude/CLAUDE.md     -> claude/CLAUDE.md"
echo "  ~/.claude/settings.json -> claude/settings.json"
echo "  ~/.claude/rules/        -> claude/rules/"
echo ""
echo "SOUL.md is included via a relative symlink inside claude/rules/."
echo "Start a new Claude Code session to pick up the changes."
