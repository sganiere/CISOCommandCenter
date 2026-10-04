# CISO Context — Meridian Global Bank

## Document Purpose

This document is the CISO's curated organizational and personal context. It is read by the AI harness to answer questions, challenge assumptions, and produce deliverables (board briefs, 1:1 updates, strategy checks).

This file is edited in two ways only:
1. **Distillation** — the `/distill` command proposes edits from the Capture Log, which the CISO confirms.
2. **Direct edit** — the CISO corrects something manually, at any time, without ceremony.

*This is a fictional worked example, populated with invented data, for testing the CISO Command plugin. No resemblance to any real institution is intended.*

---

## Organization

- Business model, sector, footprint: Global retail, commercial, and private banking group. Headquartered in Astoria (fictional). Operates in 14 countries across three regions (Astoria/Continental, Southeast Meridia, and North Calder). ~11,000 employees, ~2.4M retail customers, ~180 institutional clients.
- Crown-jewel services and data: Online and mobile banking platform ("MeridianDirect"), core banking ledger, SWIFT payment gateway, customer PII and KYC records, private banking client portfolios.
- CISO mandate and reporting line: Group CISO reports to the Chief Risk Officer, with a dotted line to the Board Risk Committee. Mandate covers group-wide cyber risk, security operations, and regulatory liaison for cyber matters.
- Major service providers / outsourcing dependencies: Core banking platform hosted by a third-party fintech vendor ("LedgerCore"); cloud infrastructure on AWS (primary) with Azure as DR region; managed SOC augmentation via an external MSSP for follow-the-sun coverage; card processing via a regional payments processor.

## Security Program Mission

- SM1: [J] Protect customer funds, data, and trust so Meridian can operate as a bank its customers, regulators, and counterparties rely on without hesitation.

## Goals
*(G1 is highest priority; each subsequent goal is treated as roughly half as important unless it directly serves a higher one — mark those with `serves: Gx`)*

- G1: [J] Achieve and maintain continuous PCI-DSS and SWIFT CSP compliance across all in-scope environments.
- G2: [J] Reduce mean time to detect (MTTD) for critical alerts to under 15 minutes group-wide by Q4 2027.
- G3: [J] Complete cloud security baseline rollout across all AWS/Azure workloads by mid-2027. — serves: G2
- G4: [J] Reduce third-party/vendor concentration risk exposure, specifically single-vendor dependency on LedgerCore.
- G5: [J] Achieve ISO 27001 recertification group-wide by Q1 2028.

## KPIs / Metrics
*(Keep this list short and stable — these should rarely change; values live in the Activity Log below, not here)*

- K1: Mean time to detect (MTTD), critical alerts — target: <15 min — current: *(see Activity Log)*
- K2: Mean time to remediate (MTTR), critical vulnerabilities on crown-jewel systems — target: <5 days — current: *(see Activity Log)*
- K3: % of workloads meeting cloud security baseline — target: 100% — current: *(see Activity Log)*
- K4: Phishing simulation click rate — target: <5% — current: *(see Activity Log)*

## Regulatory Obligations
*(Applicability and status — not the regulation text itself)*

| ID | Regime | Obligation | Status | Deadline | Owner |
|----|--------|-----------|--------|----------|-------|
| REG1 | Astoria Financial Supervisory Authority (fictional) | Annual cyber resilience self-assessment submission | In progress | 2026-11-30 | Head of GRC |
| REG2 | PCI-DSS v4.0 | Full compliance across cardholder data environment | Met | Ongoing (annual QSA audit) | Head of Security Operations |
| REG3 | SWIFT CSP | Attestation of controls for SWIFT-connected environments | Met | 2026-12-15 (annual) | Head of Security Architecture |
| REG4 | Continental Data Protection Regulation (fictional, GDPR-equivalent) | Data breach notification readiness, 72-hour window | Met | Ongoing | DPO / CISO (joint) |
| REG5 | Southeast Meridia Banking Authority (fictional) | Third-party risk assessment for critical vendors | At risk | 2027-01-31 | Vendor Risk Manager |

## Risk Register
*(What the CISO is most worried about, in plain language)*

| ID | Risk | Tag | Linked Goal | Since |
|----|------|-----|-------------|-------|
| R1 | Single-vendor concentration risk on LedgerCore for core banking — no viable failover if the vendor has a major outage or breach | F | G4 | 2026-06-01 |
| R2 | SOC coverage gap during APAC night hours before MSSP follow-the-sun contract is fully operational | F | G2 | 2026-08-15 |
| R3 | Legacy on-prem mainframe components in payments processing lack modern EDR coverage | F | G3 | 2026-05-10 |
| R4 | Believed but unconfirmed: several business units are using unsanctioned SaaS tools for client data, outside CASB visibility | A | G1 | 2026-09-01 |
| R5 | Cloud security baseline rollout may slip past mid-2027 target given current engineering capacity | J | G3 | 2026-09-10 |

## Doctrine
*(The CISO's own operating rules — short, load-bearing, rarely changes)*

- **Risk appetite:** [J] Low tolerance for anything touching payment integrity or customer fund safety; moderate tolerance for operational friction in pursuit of faster secure delivery.
- **Non-negotiable controls:** [J] MFA on all privileged access, encryption at rest and in transit for customer PII, no production database access without a ticketed, time-boxed approval.
- **Conditions for exceptions:** [J] Exceptions require a named business owner, a compensating control, and an expiry date — no open-ended exceptions.
- **Build vs. buy vs. partner preference:** [J] Buy for commodity security tooling (EDR, SIEM); build only where it's genuinely differentiating (fraud detection heuristics); partner for 24/7 coverage rather than building an in-house follow-the-sun SOC from scratch.
- **Known biases / blind spots the CISO wants challenged:** [J] Tendency to over-trust vendor security attestations without independent verification; tendency to prioritize visible customer-facing risk over less visible internal/vendor risk.

## Strategies
*(Each strategy should serve one or more goals above)*

| ID | Strategy | Serves |
|----|----------|--------|
| STS1 | Roll out cloud security posture management (CSPM) tooling across all AWS/Azure accounts | G3 |
| STS2 | Stand up 24/7 follow-the-sun SOC via MSSP augmentation for APAC/North Calder hours | G2 |
| STS3 | Run a formal vendor concentration risk review and build a contingency plan for LedgerCore dependency | G4 |
| STS4 | Data loss prevention (DLP) rollout across endpoints and email to reduce unsanctioned data flows | G1 |

## Team

| Name | Function | Key skills | Location |
|------|----------|-----------|----------|
| A. Okafor | Head of Security Operations | SOC management, SIEM, incident response | Astoria HQ |
| L. Vance | Head of Security Architecture | Cloud security, SWIFT CSP, network architecture | Astoria HQ |
| R. Chen | Vendor Risk Manager | Third-party risk, contract review | North Calder office |
| M. Dubois | Security Engineer, DLP lead | DLP tooling, endpoint security | Continental office |
| S. Iyer | Threat Intelligence Lead | Threat intel, fraud analytics | Southeast Meridia office |

*(Deliberately excludes compensation and any HR-sensitive data — that lives in HR systems, not here.)*

## Technology & Infrastructure Notes
*(Facts at the level risk reasoning needs — not a CMDB)*

- Cloud / on-prem split: ~65% cloud (AWS primary, Azure DR), ~35% on-prem, concentrated in payments processing and a legacy mainframe environment slated for gradual decommission.
- Migration in progress: Retail lending platform migrating from on-prem to AWS, targeted completion Q2 2027.
- Where crown-jewel data flows: Customer PII and KYC data replicated between the core banking vendor (LedgerCore, hosted externally), the AWS data warehouse (analytics), and the on-prem mainframe (legacy payments). Three copies is one more than the CISO is comfortable with.
- Known material gaps: No CASB coverage for shadow SaaS usage; legacy mainframe lacks modern EDR; network firewall rule sets between corporate and OT-adjacent payment segments have not been reviewed in over 18 months.

## Projects
*(Every project should trace to a strategy via `serves:` — this is what makes a 1:1 or board brief explainable)*

| ID | Project | Serves | Owner | Status | Blocker (if any) | Since | Target Date |
|----|---------|--------|-------|--------|-------------------|-------|-------------|
| P1 | DLP Rollout (endpoint + email) | STS4 | M. Dubois | On track | | 2026-07-01 | 2027-02-28 |
| P2 | CSPM Tooling Deployment | STS1 | L. Vance | At risk | Engineering capacity shared with cloud migration project | 2026-08-01 | 2027-06-30 |
| P3 | MSSP Follow-the-Sun SOC Contract | STS2 | A. Okafor | On track | | 2026-06-15 | 2026-12-01 |
| P4 | LedgerCore Vendor Concentration Review | STS3 | R. Chen | Blocked | Awaiting legal review of exit-clause language in vendor contract | 2026-09-05 | 2027-01-31 |

---

## Activity Log
*(Append-only. Populated by `/distill`, not typed here directly. Newest last.)*

- [2026-06-01] Identified LedgerCore single-vendor concentration as a standing risk (R1); no failover currently exists.
- [2026-08-15] SOC coverage gap during APAC night hours flagged as R2; MSSP contract negotiation initiated (P3).
- [2026-09-05] LedgerCore vendor concentration review (P4) kicked off; legal review of exit clauses requested.
- [2026-09-10] Cloud migration project pulling engineering resources away from CSPM rollout (P2); flagged as at-risk.

---
*Older Activity Log entries are periodically rolled up and archived to `CISO_CONTEXT_ARCHIVE.md` to keep this file scannable.*
