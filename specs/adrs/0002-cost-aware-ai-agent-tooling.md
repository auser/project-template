# 0002: Cost-Aware AI Agent Tooling

## Status

Accepted

## Context

AI coding agents are now part of the expected development workflow for projects created from this template. Hosted premium coding agents are useful, but they can exhaust credits, session time, or rate limits during ordinary implementation work.

The template needs a standard way to combine premium agents, cheaper hosted agents, and local agents without making every project invent its own workflow.

## Decision

Projects created from this template will support a cost-aware, tiered AI coding workflow.

The default agent roles are:

- Codex CLI for primary implementation work.
- Aider with Ollama for local or lower-cost editing loops.
- OpenCode for multi-provider fallback.
- Claude Code for high-value architecture review, hard debugging, security-sensitive reasoning, and final review.

The repository will include:

- machine-level bootstrap script: `scripts/dev-ai-bootstrap.sh`
- repo-level bootstrap script: `scripts/setup_ai_agents.sh`
- Aider defaults: `.aider.conf.yml`
- OpenCode placeholder configuration: `.opencode/README.md`
- Justfile commands for all supported agents
- documentation in `docs/ai-agents.md`

## Invariants

- AI tooling must not weaken existing ADR, sprint, test, documentation, or security requirements.
- Agents must read governing project documentation before implementation.
- Local or lower-cost agents should be used before premium agents when they are capable of the task.
- Premium agents should be reserved for work that benefits from premium reasoning or review.
- `just ci` remains the verification gate before claiming completion.

## Consequences

Positive consequences:

- Developers can continue productive work when premium-agent credits or sessions are exhausted.
- New projects inherit a consistent multi-agent workflow.
- Local models can handle repetitive and low-risk changes.
- Premium reasoning is focused on architecture and review.

Tradeoffs:

- The template now includes optional tooling that not every developer will use.
- Some tools require first-time interactive authentication.
- Local model quality varies by machine and model size.

## Verification

A project using this template should be able to run:

```sh
just setup-ai-agents
just aider
just codex
just opencode
just ci
```

Machine bootstrap is available through:

```sh
just bootstrap-ai-tools
```
