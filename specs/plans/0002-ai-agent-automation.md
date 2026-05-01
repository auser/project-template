# 0002: AI Agent Automation Plan

## Status

Active

## Goal

Add a reusable, cost-aware AI coding setup to the project template so new repositories can use local, lower-cost, and premium agents together without reinventing the workflow.

## Scope

This plan adds:

- machine bootstrap for AI coding tools
- repo bootstrap for agent defaults
- Justfile commands for daily agent usage
- Aider defaults for local model workflows
- OpenCode placeholder configuration
- documentation for agent roles and escalation
- ADR coverage for the cost-aware agent workflow

## Agent Tiers

### Tier 1: Local and low-cost loops

Use Aider with Ollama-backed models for:

- documentation
- scaffolding
- repetitive refactors
- simple test generation
- boilerplate
- straightforward edits

### Tier 2: Primary implementation

Use Codex CLI for:

- normal implementation work
- repo-aware edits
- test-fix cycles
- feature work guided by ADRs and plans

### Tier 3: Multi-provider fallback

Use OpenCode for:

- provider fallback
- experiments with alternative hosted or local models
- workflows that benefit from a provider-switchable terminal agent

### Tier 4: Premium review

Use Claude Code for:

- architecture review
- hard debugging
- security-sensitive reasoning
- final review before merge

## Implementation Steps

- [x] Add `scripts/dev-ai-bootstrap.sh` for machine-level setup.
- [x] Add `scripts/setup_ai_agents.sh` for repo-level setup.
- [x] Add `.aider.conf.yml` defaults.
- [x] Add `.opencode/README.md` placeholder configuration.
- [x] Add `docs/ai-agents.md`.
- [x] Add Justfile recipes for `codex`, `aider`, `aider-plan`, `opencode`, `claude`, `setup-ai-agents`, and `bootstrap-ai-tools`.
- [x] Add ADR `0002-cost-aware-ai-agent-tooling.md`.
- [x] Update `AGENTS.md` with the cost-aware escalation policy.

## Validation

Run:

```sh
just docs-check
just adr-check
just ci
```

Optional manual checks:

```sh
just setup-ai-agents
just aider
just codex
just opencode
```

## Non-Goals

- Do not require every developer to install every agent.
- Do not store provider credentials in the repository.
- Do not replace the ADR-first governance model.
- Do not make premium agents mandatory for normal implementation work.
