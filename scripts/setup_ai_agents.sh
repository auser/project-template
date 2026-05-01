#!/usr/bin/env bash
set -euo pipefail

mkdir -p .opencode docs specs/plans specs/backlog specs/adrs

write_if_missing() {
  local path="$1"
  local content="$2"

  if [ -f "$path" ]; then
    echo "exists: $path"
    return
  fi

  printf "%s\n" "$content" > "$path"
  echo "created: $path"
}

write_if_missing ".aider.conf.yml" "model: ollama/qwen2.5-coder:32b
auto-commits: false
dirty-commits: false
show-diffs: true
watch-files: true
read:
  - AGENTS.md
  - README.md
  - specs/project.md
  - specs/SPRINT.md"

write_if_missing ".opencode/README.md" "# OpenCode Configuration

This directory is reserved for repo-local OpenCode configuration.

Use OpenCode for multi-provider agent work and provider fallback when Claude Code credits or session time are exhausted.
"

write_if_missing "specs/plans/0002-ai-agent-automation.md" "# AI Agent Automation Plan

## Goal

Standardize a cost-aware AI coding workflow for this repository.

## Agent Roles

- Codex CLI is the default implementation agent.
- Aider with Ollama is the low-cost local editing loop.
- OpenCode is the multi-provider fallback.
- Claude Code is reserved for high-value architecture review, hard debugging, and final review.

## Required Commands

- \`just codex\`
- \`just aider\`
- \`just aider-plan\`
- \`just opencode\`
- \`just claude\`
- \`just ci\`

## Acceptance Criteria

- Repository has local agent defaults.
- Repository can run local AI edit loops without hosted model usage.
- Premium model usage is reserved for work that benefits from it.
"

echo "AI agent project files installed."
