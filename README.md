# Project Template

A bare, documentation-first starter template for new projects.

This template gives every new project a consistent planning and governance structure:

- `AGENTS.md` defines mandatory rules for AI agents and developers.
- `specs/project.md` defines the project goal, scope, invariants, and success criteria.
- `specs/SPRINT.md` is the active source of truth for current work.
- `specs/adrs/` contains immutable architectural decisions that implementation must follow.
- `specs/plans/` contains detailed execution plans.
- `specs/backlog/` records completed work and deferred work referenced by the sprint.
- `Justfile` provides common commands.
- `cliff.toml` supports conventional changelog generation with `git-cliff`.

## Start a New Project

```sh
cp -R project-template my-new-project
cd my-new-project
just init-project PROJECT_NAME="My New Project"
```

Then edit:

1. `README.md`
2. `specs/project.md`
3. `specs/SPRINT.md`
4. `specs/adrs/0001-record-architecture-decisions.md`
5. `specs/plans/0001-initial-execution-plan.md`

## Rules

Implementation must follow accepted ADRs. Any feature that changes architecture, security, data ownership, runtime behavior, public APIs, or operational guarantees requires an ADR before implementation.

`specs/SPRINT.md` must stay current during active work. Completed sprint items should be moved or summarized into `specs/backlog/` with evidence links.
