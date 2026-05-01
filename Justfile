set dotenv-load := true
set shell := ["sh", "-cu"]

LOCAL_MODEL := env_var_or_default("LOCAL_MODEL", "ollama/qwen2.5-coder:32b")

# Default recipe: list all available recipes
default:
  @just --list

# Show available commands
list:
  @just --list

# Initialize placeholders for a new project
init-project PROJECT_NAME:
  python3 scripts/init_project.py "{{PROJECT_NAME}}"

# Bootstrap AI agent tooling for this project
setup-ai-agents:
  scripts/setup_ai_agents.sh

# Bootstrap machine-level AI coding tools
bootstrap-ai-tools:
  scripts/dev-ai-bootstrap.sh

# Primary implementation agent
codex:
  codex

# Local or low-cost pair-programming loop
aider:
  aider --model {{LOCAL_MODEL}}

# Local planning mode before implementation
aider-plan:
  aider --model {{LOCAL_MODEL}} --architect

# Multi-provider coding agent fallback
opencode:
  opencode

# Premium review/debugging agent
claude:
  claude

# Check documentation structure and required files
docs-check:
  python3 scripts/docs_check.py

# Check ADR structure
adr-check:
  python3 scripts/adr_check.py

# Run all available local checks
ci: docs-check adr-check

# Generate changelog with git-cliff
changelog:
  git-cliff -o CHANGELOG.md

# Print template tree
show-tree:
  find . -maxdepth 3 -type f | sort
