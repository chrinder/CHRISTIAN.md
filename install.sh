#!/bin/bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

link_file() {
  local source="$1"
  local target="$2"
  ln -sfn "$source" "$target"
}

mkdir -p ~/.claude

link_file "$SCRIPT_DIR/claude/CLAUDE.md" ~/.claude/CLAUDE.md
link_file "$SCRIPT_DIR/claude/settings.json" ~/.claude/settings.json
link_file "$SCRIPT_DIR/claude/rules" ~/.claude/rules
link_file "$SCRIPT_DIR/claude/skills" ~/.claude/skills

mkdir -p ~/.codex ~/.codex/skills

link_file "$SCRIPT_DIR/codex/AGENTS.md" ~/.codex/AGENTS.md
link_file "$SCRIPT_DIR/codex/skills/sf-code-analyzer" ~/.codex/skills/sf-code-analyzer

if [ -e ~/.codex/config.toml ] && [ ! -L ~/.codex/config.toml ]; then
  CODEX_CONFIG_STATUS="kept existing ~/.codex/config.toml"
else
  link_file "$SCRIPT_DIR/codex/config.toml" ~/.codex/config.toml
  CODEX_CONFIG_STATUS="linked ~/.codex/config.toml"
fi

echo "Done. Symlinks created for Claude and Codex."
echo ""
echo "Claude"
echo "  ~/.claude/CLAUDE.md     -> claude/CLAUDE.md"
echo "  ~/.claude/settings.json -> claude/settings.json"
echo "  ~/.claude/rules/        -> claude/rules/"
echo "  ~/.claude/skills/       -> claude/skills/"
echo ""
echo "Codex"
echo "  ~/.codex/AGENTS.md                -> codex/AGENTS.md"
echo "  ~/.codex/skills/sf-code-analyzer  -> codex/skills/sf-code-analyzer/"
echo "  ${CODEX_CONFIG_STATUS}"
echo ""
echo "Start a new Claude/Codex session to pick up the changes."
