#!/usr/bin/env python3
from pathlib import Path
import sys

REQUIRED = [
    "README.md",
    "AGENTS.md",
    "Justfile",
    "cliff.toml",
    "specs/project.md",
    "specs/SPRINT.md",
    "specs/adrs/README.md",
    "specs/adrs/0001-record-architecture-decisions.md",
    "specs/plans/0001-initial-execution-plan.md",
    "specs/backlog/0001-foundation-backlog.md",
    "specs/templates/adr-template.md",
    "specs/templates/plan-template.md",
    "specs/templates/backlog-template.md",
]

BANNED_TERMS = ["modal"]


def main() -> int:
    root = Path.cwd()
    failed = False

    for rel in REQUIRED:
        if not (root / rel).exists():
            print(f"missing required file: {rel}", file=sys.stderr)
            failed = True

    for path in root.rglob("*"):
        if not path.is_file() or ".git" in path.parts:
            continue
        try:
            text = path.read_text()
        except UnicodeDecodeError:
            continue
        lowered = text.lower()
        for term in BANNED_TERMS:
            if term in lowered:
                print(f"banned term '{term}' found in {path}", file=sys.stderr)
                failed = True

    if failed:
        return 1
    print("docs-check passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
