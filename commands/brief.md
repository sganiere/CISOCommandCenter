---
description: Generate a deliverable (board update, 1:1 prep, strategy check) from your distilled CISO context
---

Resolve the workspace path by reading `~/.ciso-command/workspace-path`. If that file doesn't exist, tell the user to run `/ciso-init <path>` first and stop.

Read `<workspace>/CISO_CONTEXT.md` and `<workspace>/PHILOSOPHY.md`, and scan `<workspace>/library/INDEX.md`. Open library documents only when their "Read when" line matches the brief, and cite them in the sources.

The user's request is: $ARGUMENTS

Parse it for two things:
- **Audience/purpose** (board update, 1:1 with a specific person, strategy check, quarterly review, etc.) — ask if genuinely ambiguous, otherwise take the best reasonable interpretation.
- **Time window** — if the request says "since last" or similar, use the most recent Activity Log entry that looks like a prior brief of the same kind as the reference point; otherwise use a sensible default (e.g. two weeks) and state the window you used. If the requested window reaches further back than the live Activity Log covers (it's periodically trimmed by `/distill`), also read `<workspace>/CISO_CONTEXT_ARCHIVE.md` if it exists, rather than silently reporting a shorter window than asked for.

Build the brief from:
- The Projects table's current state, filtered to what's relevant to the stated audience.
- Activity Log entries within the time window — this is what makes it a diff ("what changed") rather than a static status dump.
- Relevant Goals, Strategies, Risk Register, and Regulatory Obligations rows, followed via each Project's `serves:` link so the brief can explain *why* something matters, not just *that* it happened.
- Relevant beliefs from PHILOSOPHY.md, cited by ID, where a position in the brief rests on one — so the brief reflects how the CISO actually thinks rather than generic security advice.

Structure the output using the deliverable contract: executive conclusion, decision required (if any), business context, evidence, assumptions, analysis, options considered, recommendation, dissenting view, risks of the recommendation, confidence, owners and next actions, sources and provenance. For a short, informal deliverable like 1:1 prep, compress this — lead with executive conclusion and decisions/asks, and fold the rest in briefly rather than forcing every heading to appear.

Clearly distinguish fact, assumption, and judgment in the output wherever a claim's status matters to how it should be read — don't present a J-tagged risk assessment with the same confidence as an F-tagged obligation deadline.
