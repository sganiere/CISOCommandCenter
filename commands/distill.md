---
description: Reconcile your capture log into CISO_CONTEXT.md, proposing tagged diffs
---

Resolve the workspace path by reading `~/.ciso-command/workspace-path`. If that file doesn't exist, tell the user to run `/ciso-init <path>` first and stop.

Read `<workspace>/CAPTURE_LOG.md` and `<workspace>/CISO_CONTEXT.md` in full.

**Before processing entries, check for backlog.** Count the undistilled entries in CAPTURE_LOG.md. If there are more than ~25, tell the user up front: distillation quality degrades when too much accumulates at once, since context and nuance get harder to reconstruct across a large batch. Offer to process just the oldest 15–20 now and leave the rest for a follow-up run, rather than forcing everything through in one pass. This is a sign `/distill` hasn't been run often enough — flag it plainly rather than quietly doing a worse job.

For every capture entry that is not already marked `[distilled]`:

0. **Route first, distill second.** Not every entry is a context update. Before step 1, check whether the entry belongs to another command:
   - **A candidate belief or a statement of how the CISO thinks/decides** (a rule going forward, a lesson, a principle) → route to `/belief`. Never edit `PHILOSOPHY.md` from `/distill`. Read `PHILOSOPHY.md` first and say whether an existing belief already covers it, so `/belief` can refine instead of duplicate. If the entry shows the CISO acting against a stated belief or Doctrine, say so plainly in the summary.
   - **A document to keep for reference** (a template, standard, strategy paper, or any file path mentioned for filing) → route to `/file`.
   - **A pending submission awaiting a decision** (a risk acceptance request, exception, vendor or project proposal not yet decided) → route to `/assess`; do not record it as fact beyond a plain Activity Log note that the request exists.
   - **A question or a gap the CISO must decide** (e.g. no documented position on a topic) → surface it in the summary and suggest `/advise`; do not invent the answer.
   Routed entries are not applied to `CISO_CONTEXT.md` by `/distill`. List them in the summary with the command to run, and archive them with a `[routed to /command]` marker once the user has seen the hand-off — don't leave them in the inbox to accumulate.

1. Decide which section of CISO_CONTEXT.md it affects, if any: Goals, Regulatory Obligations, Risk Register, Doctrine, Strategies, Team, Technology, or Projects. Some entries may affect nothing structured and only belong in the Activity Log as a plain note — that's fine, don't force a fit.
2. Tag the underlying claim **F** (fact), **A** (assumption), or **J** (judgment).
3. Draft the smallest possible diff — a single row update, a status change, a new register entry. Never rewrite a whole section to fit one entry.

   A change in how much a risk matters (e.g. "bump it up", "less urgent now") is a change to the Risk Register `Priority` column (High/Medium/Low, always J) — propose it as a before → after on that field, never by rewording the risk text. Facts that justify the change go in the risk text or the Activity Log.

**Cross-check against the library.** For any entry that would touch a load-bearing section (Doctrine, Regulatory Obligations, Risk Register, Goals), scan `<workspace>/library/INDEX.md` and open only the document(s) whose "Read when" line matches. If the entry conflicts with a standard, policy or strategy in one of them (e.g. a vendor finding that breaches a third-party standard), say so in the proposed diff or the summary and name the document. Flag the connection; don't edit the library document or write the conflict into the context without confirmation. Skip this if the library is empty or nothing matches.

Then apply a two-tier confirmation rule:

- **Low-stakes (apply automatically, then report what you changed):** Projects table fields — Status, Blocker, Since, Target Date.
- **Load-bearing (propose and wait for explicit user confirmation before touching the file):** anything in Doctrine, Regulatory Obligations, Risk Register, or Goals. Show each proposed diff clearly (before → after) and wait for a yes/no/edit before applying it. If the user is mid-conversation and doesn't respond to a specific one, leave it unapplied rather than assuming yes.

After a change is applied (automatically or by confirmation):

- Append one line to the Activity Log in CISO_CONTEXT.md describing what changed and why, dated.
- Move the source entry from CAPTURE_LOG.md to `<workspace>/CAPTURE_LOG_ARCHIVE.md`, or mark it `[distilled]` in place if archiving isn't practical this round.

**Activity Log housekeeping — do this every run, not just when asked.** Count the lines under `## Activity Log` in CISO_CONTEXT.md. If there are more than 40:

1. Identify the oldest entries beyond the most recent 40, or beyond the last 90 days, whichever keeps more — never cut an entry younger than 30 days regardless of count.
2. Move those entries verbatim, in order, to `<workspace>/CISO_CONTEXT_ARCHIVE.md` under a dated heading (create the file with a one-line purpose note at the top if it doesn't exist yet).
3. Remove them from CISO_CONTEXT.md's Activity Log, leaving the recent tail in place.
4. Mention this in your summary ("archived N older entries to CISO_CONTEXT_ARCHIVE.md") — don't do it silently, since it's a structural change to the record even though it loses no information.

This keeps the file the session-start hook and `/brief` read from bounded, without ever deleting anything — the full history still exists, just moved out of the hot path.

Finish with a short summary: how many entries processed, what was auto-applied, what's still awaiting confirmation, anything archived, and anything you genuinely couldn't classify (surface those verbatim rather than guessing).
