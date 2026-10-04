# CISO Philosophy — Meridian Global Bank (example)

*Fictional worked example, for testing `/assess`, `/advise` and `/brief` against `CISO_CONTEXT_example.md`. Invented beliefs; no resemblance to any real person intended.*

Every belief is a judgment `[J]`. Doctrine in the context file references these by ID.

---

## Technical beliefs

- **B1** [J] — *Detection speed matters more than prevention completeness: assume breach and shorten the time to know.*
  - **Why:** Every preventive control eventually fails against a motivated attacker; the incidents that hurt were the ones discovered late.
  - **How it changes a decision:** When two investments compete, favor the one that cuts mean time to detect over one that adds another preventive layer, unless the preventive control protects payment integrity.

- **B2** [J] — *Visibility precedes control: you cannot protect, or risk-accept, what you cannot see.*
  - **Why:** Shadow SaaS and legacy systems repeatedly turned out to be where incidents started.
  - **How it changes a decision:** Reject or condition any exception on a system outside CASB, EDR or logging coverage until the visibility gap is closed or compensated.

## Risk management beliefs

- **B3** [J] — *A risk acceptance is a loan, not a gift: it needs a named owner, a compensating control, and an expiry date.*
  - **Why:** Open-ended exceptions silently become permanent policy.
  - **How it changes a decision:** Any acceptance missing one of the three is returned, not approved with a promise to fix it later.

- **B4** [J] — *Concentration risk is under-priced because it is invisible until the day it isn't.*
  - **Why:** Single-vendor dependencies look efficient right up to the outage.
  - **How it changes a decision:** Weight a new dependency on a vendor already in a critical path higher than its standalone risk score suggests; ask for an exit path before approval.

## Leadership beliefs

- **B5** [J] — *Bad news should travel up fast and unfiltered; a team that softens it is a risk in itself.*
  - **Why:** Delay turns manageable incidents into board-level surprises.
  - **How it changes a decision:** Prefer an early, incomplete escalation over a polished late one, and reward it visibly.

- **B6** [J] — *Say "no" with an alternative; a bare refusal just moves the risk out of sight.*
  - **Why:** Business units route around a security function that only blocks.
  - **How it changes a decision:** A rejection should come with at least one workable option; if none exists, say so and escalate the trade-off to the right level.

---

## Change Log

- [2026-09-01] — Initial set of beliefs.
