# Risk acceptance request — LedgerCore reporting module (example)

*Fictional submission, for testing `/assess` against the Meridian example. Deliberately incomplete: no expiry date, a vendor attestation as the only evidence, and no exit path.*

**Requested by:** Head of Retail Lending
**Request:** Accept the risk of using LedgerCore's new hosted reporting module for loan analytics, which stores customer PII (names, income, KYC status) outside our AWS data warehouse. Go-live in six weeks.
**Rationale:** Cuts report build time from days to hours. LedgerCore provided a SOC 2 report and says the module is "fully compliant."
**Compensating controls:** LedgerCore encrypts data at rest. We will review access quarterly.
**Owner:** Retail Lending (name to be confirmed).
**Expiry:** None — "ongoing."
