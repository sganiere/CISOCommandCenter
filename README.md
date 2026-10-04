# CISO Command

A personal AI harness for CISOs, built as a Claude Code plugin. Capture organizational context throughout the day with zero friction, distill it into a curated and tagged record, keep your core philosophy and reference documents alongside it, and generate accountable deliverables and decision support (board updates, 1:1 prep, risk-acceptance assessments, advice) from that record.

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

Restart Claude Code after installing so the new commands, skill, and hooks load. Run `/help` afterward to confirm the commands in the table below are listed.

Plugin mechanics move fast — if either command errors, check Claude Code's current plugin docs rather than assuming this README is still exactly right.

## First-time setup

```
/ciso-init ~/private/ciso-workspace
```

Choose a path under your own control — your own private git repo, an approved encrypted sync location, wherever your organization's AI/data governance process says this class of information is allowed to live. This plugin doesn't make that decision for you and doesn't transmit anything anywhere on its own.

Init creates the workspace and then offers a **structured interview** (roughly 20–30 minutes) that walks you through ten phases: organization, mission and goals, regulatory obligations, risks, doctrine, team, technology, strategies and projects, your philosophy, and your document library. It asks a few questions at a time, drafts each section for your confirmation, tags claims as fact / assumption / judgment, and never invents content. You can say "stop" or "skip" at any time and pick it up later with `/interview`.

## Commands

| Command | What it does |
|---|---|
| `/ciso-init <path>` | Create the workspace, then start the interview |
| `/interview [phase]` | Resume or re-open the structured interview |
| `/capture <text>` | Log a thought verbatim — no ceremony. The command you'll use five times a day |
| `/distill` | Reconcile the capture log into `CISO_CONTEXT.md`; low-stakes changes auto-apply, load-bearing ones (Doctrine, Obligations, Risks, Goals) wait for your yes |
| `/belief <text>` | Add or refine a belief in your philosophy; folds into existing beliefs rather than appending |
| `/file <path-or-text>` | Add or update a markdown document in the library and register it in the index |
| `/library [topic]` | List the library and flag stale, orphaned, or poorly indexed documents |
| `/assess <submission>` | Structured verdict on a risk acceptance, exception, vendor, or project, tested against Doctrine, your beliefs, the context and the library |
| `/advise <question>` | Thinking partner: asks sharp questions first, challenges against your own beliefs, then gives a view |
| `/brief <audience>` | Board update, 1:1 prep, or strategy check — grounded in the same record |

## Files in your workspace

| File | Role |
|---|---|
| `CISO_CONTEXT.md` | The curated record — organization, goals, risks, doctrine, projects. Read this, rarely edit it by hand |
| `PHILOSOPHY.md` | Your core beliefs (technical, risk, leadership), each with a "how it changes a decision" test |
| `library/INDEX.md` | One entry per long document, with a "read when" trigger. **Only the index is loaded each session** |
| `library/*.md` | Strategy documents, project and team lists, standards — opened on demand, never loaded wholesale |
| `CAPTURE_LOG.md` | The inbox — write to it constantly via `/capture`, never read it directly |
| `CAPTURE_LOG_ARCHIVE.md` | Where distilled entries land |
| `CISO_CONTEXT_ARCHIVE.md` | Older Activity Log entries, rolled off to keep the context file scannable |
| `outputs/` | Saved `/assess` results, when you choose to keep them |

## How the pieces keep prompts small

At session start a hook loads three things: your context (minus the Activity Log), your philosophy, and the library **index**. Long documents stay in `library/`; each costs one short index entry until it's actually needed. When a question matches a document's "read when" line, Claude opens that document and tells you which one it used.

## Assessing and advising

`/assess` and `/advise` never change your files. `/assess` returns a recommendation (approve / approve with conditions / reject / need more information), the analysis behind it, conditions, questions for the submitter, options, a dissenting view, and a confidence level — citing the Doctrine conditions and beliefs (by ID) it applied. It checks your own listed blind spots explicitly. Afterward it offers to save the result and to log your decision with `/capture`, so it feeds the next `/distill`. The assessment informs your decision; it doesn't make it.

## Testing before real use

See `examples/` for a fictional worked example (Meridian Global Bank) — a filled-in `CISO_CONTEXT.md`, a `PHILOSOPHY.md`, a small `library/` (with an index), a `CAPTURE_LOG.md` with a deliberate mix of low-stakes, load-bearing, and ambiguous entries, and a deliberately flawed risk-acceptance submission (`ASSESS_submission_example.md`). Use them to stress-test `/distill`'s classification and confirmation behavior, and to check that `/assess` cites the right beliefs, opens only the relevant library documents, and catches the missing expiry date and attestation-only evidence — before trusting any of it with real data.

## Before you rely on this

- Verify `hooks/hooks.json`'s event name and schema against Claude Code's current hooks reference — hook mechanics move fast and this file is a best-effort starting point, not verified against the latest spec.
- This is not a GRC platform, a system of record, or a substitute for your organization's actual risk register or audit tooling. It reflects your own curated understanding.
- Which model/environment this runs against, and what data is allowed to reach it, is a decision for your organization's AI governance process — this plugin doesn't make that choice for you.
