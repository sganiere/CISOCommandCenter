---
description: Structured interview to populate your CISO context, philosophy and library (resumable)
---

Resolve the workspace path by reading `~/.ciso-command/workspace-path`. If that file doesn't exist, tell the user to run `/ciso-init <path>` first and stop.

Read `<workspace>/CISO_CONTEXT.md` and `<workspace>/PHILOSOPHY.md`. The user's input is: $ARGUMENTS

If the input names a phase (e.g. `risks`, `philosophy`), start there. Otherwise, work out which phases are still **unfilled** by checking each section for template placeholders (empty fields, the blank template table rows, `[One-sentence statement.]`) and start at the first unfilled phase. Tell the user which phases are done and which remain, in one short line, before starting.

## How to run it

- **One phase at a time, 2–4 questions per turn.** Never dump a questionnaire. Ask, wait, follow up on vague answers, then move on.
- **Draft, show, confirm, write.** At the end of each phase, show the drafted section content and write it to the file only after the user confirms or edits it. Never invent content. If the user doesn't know or doesn't want to answer, leave the field empty and move on — an honest gap beats a plausible guess.
- **Tag as you go.** For each claim, set F (fact — verifiable), A (assumption — believed, unconfirmed), or J (judgment — the CISO's call). If it isn't obvious, ask, or propose a tag and let the user correct it.
- **Use IDs** as the template does (G1, R1, REG1, STS1, P1, B1…). Never reuse an ID.
- **Respect traceability:** goals before strategies, strategies before projects. Every strategy must serve a goal; every project must serve a strategy. If the user gives a project that serves nothing yet, flag the gap and ask what it serves rather than adding it unlinked.
- **Skippable and resumable.** The user can say "skip" for a phase or "stop" at any time. On stop, state which phases are done and tell them `/interview` resumes where they left off. Everything confirmed so far is already written.
- **No HR-sensitive data** (compensation, performance, health). If it comes up, leave it out and say why.
- **Each phase ends with a one-line check:** "Anything here that's wrong or missing?"

## Phases (in order)

1. **Organization** — business model, sector, footprint, crown-jewel services and data, CISO mandate and reporting line, major service providers and outsourcing dependencies.
2. **Mission and goals** — why the security function exists here (one sentence), then the top goals in priority order. Ask what the CISO would drop first if forced to — it exposes true priority. Then KPIs: a short, stable list with targets (not current values).
3. **Regulatory obligations** — which regimes apply, what the obligation is, status, deadline, owner. Applicability and status only — not regulation text.
4. **Risk register** — what keeps the CISO up at night, in plain language. For each: is it a known fact, an unconfirmed assumption, or a judgment? Which goal does it threaten?
5. **Doctrine** — risk appetite, non-negotiable controls, conditions for exceptions, build vs. buy vs. partner preference, and known biases or blind spots the CISO wants challenged. Press on the last one: ask for a concrete past mistake or recurring tendency, not a generic answer. These feed `/assess` and `/advise` directly.
6. **Team** — names, function, key skills, location.
7. **Technology and infrastructure** — cloud/on-prem split, migrations in progress, where crown-jewel data flows, known material gaps. Facts at the level risk reasoning needs, not a CMDB.
8. **Strategies and projects** — strategies, each serving a goal; then active projects, each serving a strategy, with owner, status, blocker, since and target date.
9. **Philosophy** — see below.
10. **Library** — ask what longer documents exist that should be reachable without being loaded every time (security strategy, project list, team list, standards, policies). Markdown only for now. For each one the user wants to add, run the `/file` flow (see `${CLAUDE_PLUGIN_ROOT}/commands/file.md`).

## The philosophy phase

This one is different: the user holds beliefs but usually hasn't articulated them. Work from prompts, one at a time, and let them talk:

- *Technical:* "What do you believe about how security actually works that others in your field get wrong or ignore?" / "What control or architectural principle would you defend against a vendor, an auditor, and a CEO?"
- *Risk:* "When is accepting a risk the right call? When is it never?" / "What evidence do you require before you believe a risk is real? Before you believe it's gone?"
- *Leadership:* "What do you believe about how a security team should work with the business?" / "How do you want bad news to travel up and down?" / "What do you do when your team is wrong and confident?"
- *Origin stories:* "What incident, mistake, or person shaped how you think?" — beliefs are usually the lesson from one of these.

Then draft **beliefs** following the format in PHILOSOPHY.md: ID, category, one-sentence statement, Why, and How it changes a decision. If an answer can't be turned into something that changes a decision, say so and ask for the decision it would change — don't write filler. Merge overlapping ideas into one belief instead of listing near-duplicates. Aim for a short, sharp set (typically 6–12), not an exhaustive one — the user can add more later with `/belief`.

## Finishing

When all phases are done or skipped, summarize: what's filled, what's still empty, and what to do next — `/capture` during the day, `/distill` to reconcile, `/assess` and `/advise` for decisions, `/brief` for deliverables, `/file` and `/belief` to grow the library and philosophy. Note that the interview's confirmed content is the starting record — it will get richer through capture and distillation, and any section can be re-opened with `/interview <phase>`.
