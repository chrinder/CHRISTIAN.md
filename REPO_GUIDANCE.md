# Repository Guidance

This file provides repository-level guidance for any AI assistant working in this repository.

## What This Repository Is

This is a personal AI configuration repo for Christian. It stores reusable instructions, personality, coding philosophy, language-specific rules, and skills for multiple AI tools.

This is a dotfiles-style configuration repo, not an application project. There is no build, test, or lint workflow for this repo itself.

## Install Flow

Run:

```bash
./install.sh
```

The installer creates symlinks for both supported tools:

- Claude files into `~/.claude/`
- Codex files into `~/.codex/`

Important: `~/.codex/config.toml` is protected. If it already exists as a regular file, `install.sh` does not overwrite it.

## Repository Structure

- `README.md` - Project overview and intent
- `SOUL.md` - Tool-agnostic personality and communication style
- `claude/` - Claude-specific global instructions, settings, rules, and skills
- `codex/` - Codex-specific global instructions, config template, rules, and skills
- `install.sh` - Symlink installer for Claude and Codex

Current language and skill coverage is Salesforce-focused via:

- `*/rules/salesforce/coding-standards.md`
- `*/skills/sf-code-analyzer/`

## Layering Model

Instructions are layered and additive:

1. Personal layer (this repository)
2. Company layer (separate private/shared repository)
3. Project layer (instruction files inside each working codebase)

Nothing here should become project-specific unless this repository itself requires it.

## Editing Principles For This Repo

- Keep guidance files general and reusable across projects.
- Keep tool-specific details inside each tool folder (`claude/`, `codex/`, future tool folders).
- Keep shared style/personality in `SOUL.md`.
- Avoid duplicating the same policy text in multiple places unless required by tool-specific syntax.
- When behavior differs by tool, document that difference explicitly in the relevant tool folder.

## Adding A New Tool/Agent Layer

When adding support for another assistant/tool:

1. Create a top-level folder named for the tool (for example `cursor/` or `copilot/`).
2. Add the tool's required instruction/config files in that folder.
3. Mirror existing structure where it makes sense:
   - `rules/<language>/`
   - `skills/<skill-name>/`
4. Update `install.sh` to wire symlinks or copies for that tool's expected home/config path.
5. Update `README.md` with a short summary of the new tool layer.

## Adding A New Language Rule

For each supported tool layer:

1. Add `rules/<language>/` in that tool folder.
2. Add the language rule markdown file scoped to the correct file patterns/extensions.
3. Reference the new rule from that tool's main instruction file.
4. If there is an enforcement skill or script, place it under that tool's `skills/` folder and link it from the rule.

## Why This File Exists

This file is the neutral, cross-tool explanation of how to work in this repository.
Tool-specific instruction files can remain for compatibility with each tool, but this document is the canonical repository-level guidance.
