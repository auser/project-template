set dotenv-load := true
set shell := ["sh", "-cu"]

# Default recipe: list all available recipes
default:
  @just --list

# Show available commands
list:
  @just --list

# Initialize placeholders for a new project
init-project PROJECT_NAME:
  python3 scripts/init_project.py "{{PROJECT_NAME}}"

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
