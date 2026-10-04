---
name: ciso-context
description: Use this skill whenever the user references their CISO Command workspace, capture log, distillation, philosophy, library, or asks for a brief/board update/1:1 prep/risk assessment/advice grounded in their own organizational context — even outside the slash commands. Also use when the user mentions a project, risk, goal, obligation, strategy, or team member by name and it's unclear whether it's already tracked, or when a question could be answered from a document in their library.
---

# CISO Command — operating conventions

This skill describes the system so that any interaction — not just the slash commands — behaves consistently with it.

## Where things live

The workspace path is stored in `~/.ciso-command/workspace-path`. Always resolve it from there rather than assuming a location. If it doesn't exist, the user hasn't run `/ciso-init` yet.

- `CISO_CONTEXT.md` — the curated, load-bearing record: Organization, Goals, KPIs, Regulatory Obligations, Risk Register, Doctrine, Strategies, Team, Technology, Projects, and a trailing Activity Log (kept to roughly the last 40 entries / 90 days — see `/distill`'s housekeeping step).
- `PHILOSOPHY.md` — the CISO's core beliefs (technical, risk, leadership), each with a "how it changes a decision" test. Doctrine is the operational rule; philosophy is the reasoning behind it.
- `library/INDEX.md` + `library/*.md` — long reference documents (strategy, project lists, team lists, standards). Only the index is loaded at session start; documents are opened on demand.
- `CAPTURE_LOG.md` — the raw inbox. Append-only, unstructured, never read top-to-bottom by the user. Only `/capture` writes here; only `/distill` reads and clears it.
- `CAPTURE_LOG_ARCHIVE.md` — where distilled capture entries go once processed.
- `CISO_CONTEXT_ARCHIVE.md` — where older Activity Log entries roll off to. Nothing is ever deleted, only moved out of the hot path. `/brief` checks this when a request's window reaches further back than the live log.
- `outputs/` — saved `/assess` results and other generated analyses, when the user chose to keep them.

## The commands

| Command | Job |
|---|---|
| `/ciso-init`, `/interview` | Create the workspace; run the structured, resumable interview to populate it |
| `/capture` | Zero-friction inbox |
| `/distill` | Reconcile the inbox into `CISO_CONTEXT.md` with tagged, tiered-confirmation diffs |
| `/belief` | Add or refine a belief in `PHILOSOPHY.md` (confirmation required) |
| `/file`, `/library` | Add or update library documents; audit the library |
| `/assess` | Structured verdict on a submission (risk acceptance, exception, vendor, project) |
| `/advise` | Questions-first thinking partner |
| `/brief` | Board update, 1:1 prep, strategy check |

## The one loop everything runs through

Capture → Classify → Connect → Challenge → Apply.

Every interaction — a two-line capture, a risk assessment, a board brief — is a version of this loop. Each should be grounded in the same record, tagged fact/assumption/judgment, checked against Doctrine and philosophy, and open to challenge for contradiction or staleness. Don't treat `/assess`, `/advise` or `/brief` as generation tasks disconnected from what `/capture` and `/distill` accumulated.

## Retrieval discipline (library)

The library exists so that long documents don't ride along in every prompt. When a request touches something a library document might cover:

1. Check the index's "Read when" lines first.
2. Open only the document(s) that match. Don't open speculatively, and don't open the whole library.
3. Say which documents you used, so the user can see what the answer rests on.
4. If a document is relevant but looks stale (reviewed long ago), or the answer needs a document that isn't in the library, say so rather than guessing.

## Tagging discipline

Every claim in CISO_CONTEXT.md is F (fact), A (assumption), or J (judgment). When adding or updating anything — via `/distill`, `/interview`, or a direct edit made during conversation — preserve or assign this tag. Don't let a judgment get flattened into a fact by omission; that's the specific failure mode this system exists to prevent. Beliefs in PHILOSOPHY.md are judgments by nature.

## Philosophy as a test

Use beliefs by ID, and only where they actually bear on the question. A proposal that conflicts with a belief should be flagged, not silently accepted — and if the user then overrides the belief, say so plainly; that may be a sign the belief needs refining (`/belief`). Never invent a belief that isn't in the file.

## Traceability

Every Project should carry a `serves:` link to a Strategy, and every Strategy should serve a Goal. If a user describes a new project or initiative and it isn't clearly linked, ask what it serves, or flag the gap, rather than adding it unlinked.

## Confirmation tiers

Projects table fields (status, blocker, dates) can be updated with a light touch. Anything touching Doctrine, Regulatory Obligations, Risk Register, Goals, or PHILOSOPHY.md requires explicit confirmation before being written. `/assess` and `/advise` never modify files; they only offer to save output or log a decision via `/capture`.

## What this system is not

It is not a GRC platform, not a system of record for regulatory text, and not a substitute for the organization's actual risk register or audit tooling. The context reflects the CISO's own curated understanding — useful for reasoning, dangerous if mistaken for an authoritative external record. `/assess` informs a decision; the CISO makes it.
