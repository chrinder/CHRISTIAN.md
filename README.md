# 🪼 ROBERT.md (rules for any AI that dares to co-work with me)

I've been watching everyone figure out how to talk to their AI coding assistants, and nobody agrees on how much you actually need to say.

[Boris Cherny](https://www.threads.com/@boris_cherny/post/DTBVlMIkpcm), who created Claude Code, says his setup is "surprisingly vanilla" — the model already knows how to code, so he barely customizes it. [Peter Steinberger](https://steipete.me/posts/2026/openclaw) went the other direction with [OpenClaw](https://github.com/openclaw/openclaw): give your agent a `SOUL.md` — a personality, opinions, a voice — because a good assistant shouldn't sound like a corporate chatbot. Meanwhile, every tool is shipping its own flavor: `CLAUDE.md`, `AGENTS.md`, `.cursorrules`, `copilot-instructions.md`. Vendor-specific files that are quietly becoming an industry standard.

This repo is me trying to make sense of all of that. One place for the stuff that's *mine* — how I think, how I code, what I expect — version-controlled, symlinked into `~/.claude/`, and portable to whatever tool comes next.

## The layers

The hard part isn't *what* to put in these files — it's *where*. What's mine is different from what's [Aquiva](https://aquivalabs.com)'s, which is different from what a specific project needs.

```text
┌──────────────────────────────────────────────────────────────┐
│  Me (this repo)                                              │
│  How I talk. How I code. What annoys me.                     │
│  → SOUL.md, CLAUDE.md, rules/salesforce/                     │
│                                                              │
│  ┌────────────────────────────────────────────────────────┐  │
│  │  Aquiva (separate private repo)                        │  │
│  │  Shared conventions. Company-wide skills & workflows.  │  │
│  │                                                        │  │
│  │  ┌──────────────────────────────────────────────────┐  │  │
│  │  │  Project (each repo)                             │  │  │
│  │  │  Domain model. Features. Project-specific stuff. │  │  │
│  │  │  → CLAUDE.md, AGENTS.md, .claude/skills/         │  │  │
│  │  └──────────────────────────────────────────────────┘  │  │
│  └────────────────────────────────────────────────────────┘  │
└──────────────────────────────────────────────────────────────┘
```

Claude Code [merges all of this](https://code.claude.com/docs/en/best-practices) at session start. Nothing overrides — it all stacks.

## What's in here

**[`SOUL.md`](SOUL.md)** — Codes my style. Snarky, German, no fluff. So the AI talks like a sharp colleague, not a support bot. Tool-agnostic — lives at the root so any AI tool can find it. Inspired by [Peter Steinberger's OpenClaw](https://github.com/openclaw/openclaw).

**[`claude/CLAUDE.md`](claude/CLAUDE.md)** — My five coding commandments. Non-negotiable.

**[`claude/rules/salesforce/`](claude/rules/salesforce/)** — My brutal, PMD-backed Apex standards. The machine checks what I forget.

**[`claude/settings.json`](claude/settings.json)** — So Claude stops nagging me for permission before every git push.

## How I use it

I run [`install.sh`](install.sh) once. It symlinks everything into `~/.claude/`, where Claude Code picks it up at session start.

```bash
./install.sh
```

```text
~/.claude/CLAUDE.md      →  this repo/claude/CLAUDE.md
~/.claude/settings.json  →  this repo/claude/settings.json
~/.claude/rules/         →  this repo/claude/rules/
```

After I pull changes, the next session gets them automatically — symlinks always point to the latest version.
