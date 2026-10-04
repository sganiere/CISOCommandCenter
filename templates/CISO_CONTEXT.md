# CISO Context — [Organization Name]

## Document Purpose

This document is the CISO's curated organizational and personal context. It is read by the AI harness to answer questions, challenge assumptions, and produce deliverables (board briefs, 1:1 updates, strategy checks).

This file is edited in two ways only:
1. **Distillation** — the `/distill` command proposes edits from the Capture Log, which the CISO confirms.
2. **Direct edit** — the CISO corrects something manually, at any time, without ceremony.

The CISO should almost never need to add material to this file by hand during the day. Day-to-day input goes to `CAPTURE_LOG.md` instead — see the bottom of this file for how the two connect.

Every line item below carries an ID, and a `[F]/[A]/[J]` tag: **F**act (verifiable), **A**ssumption (believed, not confirmed), **J**udgment (the CISO's opinion or call). Untagged lines default to Fact.

---

## Organization

- Business model, sector, footprint:
- Crown-jewel services and data:
- CISO mandate and reporting line:
- Major service providers / outsourcing dependencies:

## Security Program Mission

- SM1: [one sentence — why the security function exists here]

## Goals
*(G1 is highest priority; each subsequent goal is treated as roughly half as important unless it directly serves a higher one — mark those with `serves: Gx`)*

- G1: [J]
- G2: [J]

## KPIs / Metrics
*(Keep this list short and stable — these should rarely change; values live in the Activity Log below, not here)*

- K1: [metric name] — target: [x] — current: *(see Activity Log)*

## Regulatory Obligations
*(Applicability and status — not the regulation text itself)*

| ID | Regime | Obligation | Status | Deadline | Owner |
|----|--------|-----------|--------|----------|-------|
| REG1 | FINMA / DORA / MAS / … | | Met / In progress / At risk / Overdue | | |

## Risk Register
*(What the CISO is most worried about, in plain language)*

| ID | Risk | Tag | Linked Goal | Since |
|----|------|-----|-------------|-------|
| R1 | | F/A/J | G_ | |

## Doctrine
*(The CISO's own operating rules — short, load-bearing, rarely changes)*

- **Risk appetite:** [J]
- **Non-negotiable controls:** [J]
- **Conditions for exceptions:** [J]
- **Build vs. buy vs. partner preference:** [J]
- **Known biases / blind spots the CISO wants challenged:** [J]

## Strategies
*(Each strategy should serve one or more goals above)*

| ID | Strategy | Serves |
|----|----------|--------|
| STS1 | | G_ |

## Team

| Name | Function | Key skills | Location |
|------|----------|-----------|----------|
| | | | |

*(Deliberately excludes compensation and any HR-sensitive data — that lives in HR systems, not here.)*

## Technology & Infrastructure Notes
*(Facts at the level risk reasoning needs — not a CMDB)*

- Cloud / on-prem split:
- Migration in progress:
- Where crown-jewel data flows:
- Known material gaps:

## Projects
*(Every project should trace to a strategy via `serves:` — this is what makes a 1:1 or board brief explainable)*

| ID | Project | Serves | Owner | Status | Blocker (if any) | Since | Target Date |
|----|---------|--------|-------|--------|-------------------|-------|-------------|
| P1 | | STS_ | | On track / At risk / Blocked / Delayed | | | |

---

## Activity Log
*(Append-only. Populated by `/distill`, not typed here directly. Newest last. This is the diffable record — "what changed since I last looked" is computed from this section, not by re-reading the whole file.)*

- [YYYY-MM-DD] —

---
*Older Activity Log entries are periodically rolled up and archived to `CISO_CONTEXT_ARCHIVE.md` to keep this file scannable. Nothing above the Activity Log should be edited without going through distillation or a deliberate manual correction.*
