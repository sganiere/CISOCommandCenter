---
description: Assess a submission (risk acceptance, exception, vendor, project) against your context and philosophy
---

Resolve the workspace path by reading `~/.ciso-command/workspace-path`. If that file doesn't exist, tell the user to run `/ciso-init <path>` first and stop.

Read in full: `<workspace>/CISO_CONTEXT.md` (including the Activity Log) and `<workspace>/PHILOSOPHY.md`. Read `<workspace>/library/INDEX.md`, then open **only** the library documents whose "Read when" line matches this submission — and name them in the output. Do not open documents speculatively.

The submission is: $ARGUMENTS

It may be pasted text, a description, or a path to a file — read the file if so. If the submission is too thin to assess, say exactly what is missing and ask for it before producing a verdict, rather than assessing a guess.

Identify the kind of submission (risk acceptance, policy exception, new vendor/third party, new project, architecture decision, other) and assess it against, in this order:

1. **Doctrine** — risk appetite, non-negotiable controls, and the conditions for exceptions (e.g. named business owner, compensating control, expiry date). State plainly which conditions the submission meets and which it doesn't.
2. **Philosophy** — test the submission against specific beliefs, cited by ID (B3, B7…), using each belief's "How it changes a decision" line. Cite only beliefs that actually bear on this; say "no belief applies" if none does. Never invent a belief the file doesn't contain.
3. **Context** — which Risk Register entries (note their Priority), Regulatory Obligations, Goals, Strategies, Projects, and Technology gaps does it touch or contradict? Does it duplicate, depend on, or conflict with an existing project? Does it quietly worsen a known risk?
4. **Library** — anything in the consulted documents that bears on it.
5. **Blind spots** — the CISO listed known biases in Doctrine. Check the submission against them explicitly and say if one is in play.

Output, in this order:

- **Recommendation** — approve / approve with conditions / reject / need more information — one line, with the single most important reason.
- **Why** — the analysis above, compressed to what drives the recommendation. Tag claims **F / A / J**, and make the status of each load-bearing claim visible (what is verified in the submission or context, what is assumed, what is judgment).
- **Conditions or required changes** — concrete and owned, if approving with conditions (owner, compensating control, expiry, review date).
- **Missing information / questions for the submitter** — the specific things you'd need to be confident.
- **Options considered** — at least one real alternative, including doing nothing.
- **Dissenting view** — the strongest case against your own recommendation.
- **Confidence** — high / medium / low, and what would change it.
- **Context gaps** — anything you needed from context or the library that isn't there or looks stale. Say so rather than guessing.

This command assesses — it does not decide, and it does not modify any file. After the output, offer two things: (a) save it to `<workspace>/outputs/<YYYY-MM-DD>-assess-<slug>.md`, and (b) if the CISO makes a decision, log it with `/capture` so `/distill` can reconcile it into the Risk Register or Projects. Only do either on a yes.
