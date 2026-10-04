---
name: ciso-context
description: Use this skill whenever the user references their CISO Command workspace, capture log, distillation, or asks for a brief/board update/1:1 prep grounded in their own organizational context — even outside the /capture, /distill, /brief commands. Also use when the user mentions a project, risk, goal, or obligation by name and it's unclear whether it's already tracked in their workspace.
---

# CISO Command — operating conventions

This skill describes the system so that any interaction — not just the three slash commands — behaves consistently with it.

## Where things live

The workspace path is stored in `~/.ciso-command/workspace-path`. Always resolve it from there rather than assuming a location. If it doesn't exist, the user hasn't run `/ciso-init` yet.

- `CISO_CONTEXT.md` — the curated, load-bearing record: Organization, Goals, KPIs, Regulatory Obligations, Risk Register, Doctrine, Strategies, Team, Technology, Projects, and a trailing Activity Log (kept to roughly the last 40 entries / 90 days — see `/distill`'s housekeeping step).
- `CAPTURE_LOG.md` — the raw inbox. Append-only, unstructured, never read top-to-bottom by the user. Only `/capture` writes here; only `/distill` reads and clears it.
- `CAPTURE_LOG_ARCHIVE.md` — where distilled capture entries go once processed.
- `CISO_CONTEXT_ARCHIVE.md` — where older Activity Log entries get rolled off to by `/distill`, once the live log passes its size threshold. Nothing is ever deleted, only moved out of the hot path. `/brief` should check this file too when a request's time window reaches further back than the live Activity Log covers (e.g. "since Q2" once Q2 has been archived).

## The one loop everything runs through

Capture → Classify → Connect → Challenge → Apply.

Every interaction with this system — however small — is a version of this loop. A two-line capture and a full board brief differ only in size, not in kind: both eventually get tagged fact/assumption/judgment, checked against Doctrine, and are available to be challenged for contradictions or staleness. Don't treat `/brief` as a separate generation task disconnected from what `/capture` and `/distill` accumulated — it should read as the natural conclusion of the same process, not a fresh interview.

## Tagging discipline

Every claim in CISO_CONTEXT.md is F (fact), A (assumption), or J (judgment). When adding or updating anything in the file — whether via `/distill` or a direct edit made during conversation — preserve or assign this tag. Don't let a judgment get flattened into a fact by omission; that's the specific failure mode this system exists to prevent.

## Traceability

Every Project should carry a `serves:` link to a Strategy, and every Strategy should serve a Goal. If a user describes a new project or initiative in conversation and it isn't clearly linked to something in Goals/Strategies, ask what it serves, or flag the gap, rather than adding it unlinked.

## Confirmation tiers

Projects table fields (status, blocker, dates) can be updated with a light touch. Anything touching Doctrine, Regulatory Obligations, Risk Register, or Goals requires the user's explicit confirmation before being written — these are load-bearing and a wrong silent update could mislead a later brief.

## What this system is not

It is not a GRC platform, not a system of record for regulatory text, and not a substitute for the organization's actual risk register or audit tooling if those exist. CISO_CONTEXT.md reflects the CISO's own curated understanding — useful for reasoning, dangerous if mistaken for an authoritative external record.
