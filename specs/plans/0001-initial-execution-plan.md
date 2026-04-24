# Plan-0001: Initial Execution Plan

## Purpose

Create the initial project foundation and make the repository safe for agent-driven and developer-driven work.

## Inputs

- `README.md`
- `AGENTS.md`
- `specs/project.md`
- `specs/SPRINT.md`
- `specs/adrs/0001-record-architecture-decisions.md`
- `specs/backlog/0001-foundation-backlog.md`

## Phase 1: Project Identity

- [ ] Replace `{{PROJECT_NAME}}` placeholders.
- [ ] Define the project purpose in `specs/project.md`.
- [ ] Define goals and non-goals.
- [ ] Define the first production-grade outcome.

## Phase 2: Governance

- [ ] Review `AGENTS.md` and adjust rules for the project.
- [ ] Review ADR-0001.
- [ ] Add additional ADRs for non-negotiable architecture decisions.
- [ ] Update `specs/adrs/README.md`.

## Phase 3: Sprint Setup

- [ ] Update `specs/SPRINT.md` with the active sprint goal.
- [ ] Link all active plans.
- [ ] Link all relevant backlog files.
- [ ] Add decision checkpoints.

## Phase 4: Validation

- [ ] Run `just docs-check`.
- [ ] Run `just adr-check`.
- [ ] Run `just ci`.

## Acceptance Criteria

- [ ] Project identity is clear.
- [ ] Required specs exist.
- [ ] Initial ADR exists and is indexed.
- [ ] Active sprint references current plans and backlog.
- [ ] `just ci` passes.
