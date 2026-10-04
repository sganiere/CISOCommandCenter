# CISO Command

A personal AI harness for CISOs, built as a Claude Code plugin. Capture organizational context throughout the day with zero friction, distill it into a curated and tagged record, and generate accountable deliverables (board updates, 1:1 prep, strategy checks) from that record.

This plugin ships the *mechanism* only. Your actual organizational data — projects, risks, obligations, doctrine — lives in a separate private workspace you control, never inside this repo.

## Install

**Option A — from a git repo (recommended for real use):**

Push this directory to a private git repository, then in a Claude Code session:

```
/plugin marketplace add <your-org-or-username>/ciso-command
/plugin install ciso-command
```

`/plugin marketplace add` also accepts a full git URL or a local directory path — see Option B if you want to try it before pushing anywhere.

**Option B — from a local directory (fastest way to test):**

```
/plugin marketplace add /absolute/path/to/ciso-command
/plugin install ciso-command
```

Restart Claude Code after installing so the new commands, skill, and hooks load. Run `/help` afterward to confirm `/ciso-init`, `/capture`, `/distill`, and `/brief` are listed.

Plugin mechanics move fast — if either command errors, check Claude Code's current plugin docs rather than assuming this README is still exactly right.

## First-time setup

```
/ciso-init ~/private/ciso-workspace
```

Choose a path under your own control — your own private git repo, an approved encrypted sync location, wherever your organization's AI/data governance process says this class of information is allowed to live. This plugin doesn't make that decision for you and doesn't transmit anything anywhere on its own.

After init, open `CISO_CONTEXT.md` in that workspace and fill in Organization, Goals, and Doctrine by hand before relying on `/brief` for anything real. Capture and distillation make the file richer over time — they don't replace an honest starting point.

## Daily use

- `/capture <anything>` — log a thought, a decision, a status update, whatever. No ceremony, no classification. This is the command you'll use five times a day.
- `/distill` — run when convenient (end of day, before a 1:1). Reconciles the capture log into the curated context file, asking for confirmation on anything load-bearing (Doctrine, Regulatory Obligations, Risk Register, Goals) and applying low-stakes updates (project status/blockers) automatically.
- `/brief <audience or purpose>` — e.g. `/brief 1:1 with my boss, since last time` or `/brief board update on the DORA obligations`. Pulls from the curated context plus recent Activity Log entries to produce a structured, sourced deliverable.

## Files

| File | Role |
|---|---|
| `CISO_CONTEXT.md` | The curated record — read this, rarely edit it by hand |
| `CAPTURE_LOG.md` | The inbox — write to it constantly via `/capture`, never read it directly |
| `CAPTURE_LOG_ARCHIVE.md` | Where distilled entries land |

## Testing before real use

See `examples/` for a fictional worked example (Meridian Global Bank) — a filled-in `CISO_CONTEXT.md` and a `CAPTURE_LOG.md` with a deliberate mix of low-stakes, load-bearing, and ambiguous entries, meant for stress-testing `/distill`'s classification and confirmation behavior before trusting it with anything real.

## Before you rely on this

- Verify `hooks/hooks.json`'s event name and schema against Claude Code's current hooks reference — hook mechanics move fast and this file is a best-effort starting point, not verified against the latest spec.
- This is not a GRC platform, a system of record, or a substitute for your organization's actual risk register or audit tooling. It reflects your own curated understanding.
- Which model/environment this runs against, and what data is allowed to reach it, is a decision for your organization's AI governance process — this plugin doesn't make that choice for you.
