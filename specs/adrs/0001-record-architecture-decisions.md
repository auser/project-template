# ADR-0001: Record Architecture Decisions

## Status

accepted

## Context

This project needs a durable way to make architecture and product decisions explicit. Without a decision record, implementation can drift, agents can make conflicting assumptions, and undocumented shortcuts can become permanent behavior.

## Decision

The project will use Architecture Decision Records stored in `specs/adrs/`.

Accepted ADRs are binding. Every meaningful feature must align with accepted ADRs. If a proposed change conflicts with an accepted ADR, implementation must stop until a new ADR supersedes or amends the prior decision.

## Invariants

- ADRs are the source of truth for architecture decisions.
- Accepted ADRs must be followed by implementation work.
- ADR changes must be reflected in `specs/adrs/README.md`.
- `specs/SPRINT.md` must reference active ADR work when decisions are being added or changed.
- Features that affect architecture, security, data ownership, public APIs, runtime behavior, or operational guarantees require ADR coverage.

## Consequences

- The project gains explicit decision history.
- Agents and developers have a stable governance model.
- Implementation may slow down slightly when new decisions are required.
- Architecture drift becomes easier to detect.

## Implementation Impact

- New ADRs should use `specs/templates/adr-template.md`.
- `just adr-check` validates basic ADR structure.
- `specs/adrs/README.md` must be updated whenever ADRs are added or superseded.

## Validation

- `just adr-check` passes.
- All active implementation work can cite governing ADRs.
- New features have ADR coverage where required.
