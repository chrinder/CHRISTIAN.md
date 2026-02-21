# AGENTS.md

This file provides guidance to Codex when working with code in this repository.

## What This Repo Is

Personal AI assistant configuration for Christian across Claude Code and Codex. It contains personality, coding philosophy, language-specific rules, and reusable skills.

This is a dotfiles repo, not an application project. There is no build, test, or lint step.

## Install

```bash
./install.sh
```

Creates symlinks into both `~/.claude/` and `~/.codex/`.

## Structure

- `SOUL.md` - Personality and communication style. Tool-agnostic and shared.
- `claude/` - Claude-specific global instructions, settings, rules, and skills.
- `codex/` - Codex-specific global instructions, config template, rules, and skills.
- `CLAUDE.md` - Repo-specific guidance for Claude when editing this repo.
- `AGENTS.md` - Repo-specific guidance for Codex when editing this repo.

## Layering Model

The instruction model is layered and additive:

1. Personal layer (this repo): personality, coding defaults, language standards
2. Company layer (private repo): shared org conventions and workflows
3. Project layer (each codebase): domain model and project-specific rules

Keep this repo general and reusable. Project-specific details belong in each project's local `CLAUDE.md` / `AGENTS.md`.

## Adding a New Language Rule

1. Create `claude/rules/<language>/` and `codex/rules/<language>/`
2. Add a markdown rule file scoped to relevant paths/extensions
3. Reference the rule from both `claude/CLAUDE.md` and `codex/AGENTS.md`
