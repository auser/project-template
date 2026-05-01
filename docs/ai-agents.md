# AI Agent Tooling

This template supports a cost-aware AI coding workflow.

## Recommended Agent Roles

| Tool | Role |
| --- | --- |
| Codex CLI | Primary implementation agent |
| Aider | Local or low-cost editing loop |
| OpenCode | Multi-provider fallback |
| Claude Code | Premium architecture review and hard debugging |
| Ollama | Local model runtime |

## Daily Commands

```sh
just codex
just aider
just aider-plan
just opencode
just claude
just ci
```

## Machine Bootstrap

Run this once on a development machine:

```sh
scripts/dev-ai-bootstrap.sh
```

## Repository Bootstrap

Run this inside a new project created from this template:

```sh
scripts/setup_ai_agents.sh
```

## Cost Policy

Use local and lower-cost agents first for:

- documentation
- scaffolding
- repetitive refactors
- test generation
- boilerplate
- straightforward implementation tasks

Use premium agents for:

- architecture decisions
- security-sensitive review
- complex debugging
- cross-module design changes
- final review before merge
