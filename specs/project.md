# Project Specification

## Project Name

`{{PROJECT_NAME}}`

## Purpose

Describe the project in one paragraph. Explain what the project exists to do, who it serves, and what outcome it must create.

## Goals

- [ ] Define the primary user or operator.
- [ ] Define the core workflow.
- [ ] Define the first production-grade outcome.
- [ ] Define the acceptance criteria for the first release.

## Non-Goals

- [ ] List what this project will not do yet.
- [ ] List intentionally deferred capabilities.
- [ ] List integrations or features that require future ADRs.

## Product Principles

- Keep the core workflow simple and explicit.
- Prefer documented behavior over hidden behavior.
- Prefer small, verifiable increments over broad rewrites.
- Prefer durable architecture over one-off shortcuts.

## Platform Invariants

These must not be violated by implementation work:

- Every meaningful feature must align with an accepted ADR.
- Every public behavior must be documented or tested.
- Every security-sensitive boundary must be explicit.
- Every external integration must have a clear owner, failure model, and test strategy.
- Every change to architecture, data ownership, API behavior, or security policy requires ADR coverage.

## System Guarantees

Define guarantees the system intends to provide.

- [ ] Reliability guarantees
- [ ] Security guarantees
- [ ] Data ownership guarantees
- [ ] Observability guarantees
- [ ] Compatibility guarantees

## Failure Model

Define how the system behaves when things fail.

- What fails closed?
- What can be retried?
- What must be idempotent?
- What must be auditable?
- What user-visible states are allowed during failure?

## Initial Scope

- [ ] Repository structure
- [ ] Documentation governance
- [ ] ADR workflow
- [ ] Sprint tracking
- [ ] First implementation plan

## Success Criteria

The project is ready for implementation when:

- [ ] `specs/project.md` is complete.
- [ ] At least one ADR defines the core architecture decision.
- [ ] At least one plan defines the first implementation sequence.
- [ ] `specs/SPRINT.md` references active plan and backlog files.
- [ ] `just ci` passes.
