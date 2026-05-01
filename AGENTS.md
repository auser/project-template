# AGENTS.md

## Purpose

This file defines mandatory operating rules for AI agents and developers working in this repository.

This repository uses a documentation-first project workflow. The project is governed by explicit architectural decisions, project invariants, system guarantees, plans, and sprint state. Work must follow those rules.

## Read Order

Before making changes, always read:

1. `specs/project.md`
2. `specs/adrs/`
3. `specs/plans/`
4. `specs/SPRINT.md`
5. any package-level documentation relevant to the area being changed

## Core Rules

- NEVER violate project invariants.
- ALWAYS conform to accepted ADRs.
- ALWAYS keep implementation aligned with `specs/project.md`.
- ALWAYS update `specs/SPRINT.md` when work starts, changes, or completes.
- NEVER add architecture that is not reflected in project docs and ADRs.
- NEVER add temporary production shortcuts without explicit ADR coverage.
- NEVER introduce hidden operator bypasses or undocumented privileged paths.
- ALWAYS prefer explicit contracts over informal conventions.
- ALWAYS preserve security, auditability, and maintainability guarantees defined by the project.

## Architecture Discipline

When proposing or implementing changes:

- prefer project primitives over app-specific hacks
- prefer declared capabilities over ambient trust
- prefer explicit contracts over implicit behavior
- prefer additive changes over structural rewrites
- prefer observable infrastructure over clever hidden behavior
- prefer boring, testable implementations over magic
- keep plans, ADRs, and sprint state synchronized with code

## Worktree Workflow for Features

Every feature, refactor, or non-trivial bug fix MUST be developed in a git worktree, never on the main checkout. 

### Creating the worktree

```bash
git worktree add ../<name>-<feature-slug> -b feat/<feature-slug>
cd ../<name>-<feature-slug>
```

Branch names follow the existing pattern (`feat/<slug>`, `fix/<slug>`, `chore/<slug>`).

### Isolating mutable state

Use the `bin/dev` wrapper or the `just dev-*`

Examples:

```bash
bin/dev template build              # equivalent to: cargo run --quiet -- template build
just dev-test                       # cargo test --workspace with the dev env
just dev-clippy                     # cargo clippy with the dev env
```

The dev env files are committed; new contributors get the right behaviour with no setup.

### Optional: direnv

Users who already have direnv installed can opt in:

```bash
cp .envrc.example .envrc
direnv allow
```

This is a convenience, not a requirement. The wrapper script path (`bin/dev` / `just dev-*`) works for everyone with no additional tools.

### Cleaning up

After the feature merges:

```bash
git worktree remove ../<name>-<feature-slug>
```

### When NOT to use a worktree

Trivial single-line changes (typo fixes, doc word swaps, dependency bumps) can land directly on a topic branch in the main checkout. The worktree rule applies to anything that touches code, runtime state, or the registry.

## Definition of Done

No task is complete without tests. Every feature, bug fix, or refactor must include:

1. **Tests first**: Write or update tests covering the new/changed behavior before marking a task done. Unit tests for logic, integration tests for CLI and cross-crate interactions.
2. **All tests green**: Run `cargo test --workspace` and confirm zero failures. New tests must pass alongside all existing tests.
3. **Zero clippy warnings/errors**: Run `cargo clippy --workspace -- -D warnings` and fix all findings before calling a feature done. Never suppress a clippy lint with `#[allow(...)]` — fix the underlying issue instead.
4. **Compiling workspace**: Run `cargo check --workspace` (or full `cargo test`/`cargo build`) and fix any errors before you finish. Never leave the workspace in a non-compiling state.
5. **Update sprint spec**: After completing any phase, task, or sub-task, update `specs/SPRINT.md` to reflect the current status. Check off completed items (`- [x]`), update phase status labels (e.g. `**Status: COMPLETE**`), and add any new test counts or notes. The sprint spec must always accurately reflect what has been implemented.

## Code Quality Expectations

If implementation work happens in this repo, default expectations are:

- all tests pass
- no unresolved lint errors or warnings
- every feature has comprehensive tests
- every public behavior has a happy-path test and a primary error-case test
- no TODOs or unimplemented stubs in committed production paths
- no dead code
- functions remain small and focused
- avoid unnecessary runtime indirection in hot paths
- favor typed contracts and explicit error handling
- keep operational code observable and auditable
- prefer logical module splits; do not accumulate unrelated contracts in a single large file
- no functional file, excluding tests, should exceed 1000 lines without a documented reason

## Documentation Rules

Any meaningful behavior change must update:

- `specs/project.md` if it changes the main system plan or goals
- one or more ADRs if it changes architectural decisions
- relevant implementation or package docs if it changes execution details
- `specs/SPRINT.md` to reflect in-progress and completed work
- `specs/plans/` if execution strategy changes
- `specs/backlog/` when completed work is archived or deferred work is recorded

`specs/SPRINT.md` is the canonical source of truth during implementation. Update it at the end of every implementation batch, test batch, or scope change. Check off completed tasks with evidence links. If sprint scope changes, update `SPRINT.md` first, then update supporting plan documents.

Completed sprint work moves to or is summarized in `specs/backlog/`. Active and reference planning documents stay in `specs/plans/`.

Do not let code and architecture docs drift.

## Security Rules

- no plaintext secrets in code, logs, examples, or fixtures
- no direct raw secret reads outside an approved secrets subsystem
- no unauthenticated internal service calls unless explicitly approved by ADR
- no privilege escalation paths outside explicit policy
- no bypasses of encryption, audit, authorization, or validation requirements
- no production behavior that cannot be explained through docs, tests, and ADRs

## Workflow for Agents

1. Read the relevant specs.
2. Identify the governing ADRs.
3. Make the smallest change that preserves invariants.
4. Update tests and docs.
5. Update `specs/SPRINT.md`.
6. Summarize which ADRs were followed or changed.

## Documentation Freshness

Documentation must stay current with the project. When any of the following change, documentation MUST be reviewed and updated:

- ADRs added, modified, superseded, or deprecated in `specs/adrs/`
- plans added or modified in `specs/plans/`
- public APIs changed
- new packages, crates, services, apps, or modules added
- CLI commands added or changed
- SDK contracts changed
- security model changed
- project invariants added or modified

Before merging architecture-affecting changes:

- run `just docs-check`
- update relevant hand-authored docs if concepts changed
- ensure new ADRs appear in `specs/adrs/README.md`
- ensure active tasks are represented in `specs/SPRINT.md`

## File Hygiene

- NEVER save screenshots, temporary images, or debug artifacts in the repository.
- Save screenshots and temporary files to `/tmp` instead.
- Do not commit binary artifacts unless they are documented assets.
- Prefer text-first specs and reproducible generation over checked-in generated files.

## When to Stop and Escalate

Stop and request a design review if:

- a requested feature does not fit an existing extension point
- an implementation would bypass an invariant
- a change affects identity, tenancy, authorization, encryption, audit, data ownership, or public APIs
- a change introduces a new compatibility surface
- a change requires a new ADR but none exists
