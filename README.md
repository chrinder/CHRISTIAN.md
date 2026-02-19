# `ROBERT.md`

AI coding assistants are converging on a simple idea: a markdown file that tells them who you are and how you work. The format varies — `CLAUDE.md`, `AGENTS.md`, `SOUL.md` — but the pattern is the same. And it's not going away.

Robert ran into a practical question: when you work across many projects, where do these files actually live? Copying them into every repo means drift. Putting everything into a single project means it's stuck there. And personal preferences (how I talk, how I think about code) are different from company conventions, which are different from project-specific context.

This repo is the answer. One place for the stuff that's *mine* — version-controlled, symlinked into `~/.claude/`, and portable to whatever tool comes next.

## The layers

Not everything belongs in the same place. AI assistants work best when context is layered:

```text
┌──────────────────────────────────────────────────────────────┐
│  Personal (this repo)                                        │
│  Who I am. How I communicate. My coding philosophy.          │
│  → SOUL.md, CLAUDE.md, rules/salesforce/                     │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐  │
│  │  Company (separate private repo)                       │  │
│  │  Shared skills. Company-specific workflows.            │  │
│  │                                                        │  │
│  │  ┌──────────────────────────────────────────────────┐  │  │
│  │  │  Project (each repo)                             │  │  │
│  │  │  Domain model. Features. Project-specific skills.│  │  │
│  │  │  → CLAUDE.md, AGENTS.md, .claude/skills/         │  │  │
│  │  └──────────────────────────────────────────────────┘  │  │
│  └────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────┘
```

Tools like Claude Code [merge all layers](https://code.claude.com/docs/en/best-practices) at session start. Nothing overrides — it all stacks.

## What's in this repo

**`SOUL.md`** — My personality. How I want the assistant to communicate: conversational, concise, witty, no fluff. Tool-agnostic — lives at the root so any AI tool can find it. Inspired by [Peter Steinberger's OpenClaw](https://github.com/openclaw/openclaw).

**`claude/CLAUDE.md`** — My coding philosophy. Readability over cleverness, simplicity over sophistication, tests as documentation.

**`claude/rules/salesforce/`** — My Salesforce/Apex coding standards. Scoped via `paths:` frontmatter — only activates for `.cls`, `.trigger`, and metadata files. Other languages get their own folder.

**`claude/settings.json`** — Pre-approved tools and permissions so Claude doesn't ask for every web search or git push.

## How it works

The `install.sh` script symlinks this repo into `~/.claude/`, where Claude Code reads configuration at session start.

```bash
./install.sh
```

```text
~/.claude/CLAUDE.md      →  this repo/claude/CLAUDE.md
~/.claude/settings.json  →  this repo/claude/settings.json
~/.claude/rules/         →  this repo/claude/rules/
```

After pulling changes, Claude picks them up in the next session automatically — symlinks always point to the latest version.
