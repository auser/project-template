# Architecture Decision Records

ADRs define immutable architecture and product decisions that implementation must follow.

Every meaningful feature must align to accepted ADRs. If a feature conflicts with an accepted ADR, stop and create a new ADR to supersede or amend the decision before implementation continues.

## Status Values

- `proposed` — under review, not yet binding
- `accepted` — binding decision for implementation
- `superseded` — replaced by a newer ADR
- `deprecated` — no longer recommended, but retained for history

## ADR Index

| ADR | Title | Status |
| --- | --- | --- |
| `0001` | Record Architecture Decisions | accepted |

## Rules

- Use `specs/templates/adr-template.md` for new ADRs.
- ADRs must include context, decision, consequences, invariants, implementation impact, and validation.
- Accepted ADRs are binding.
- Superseding an ADR requires a new ADR.
