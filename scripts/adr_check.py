#!/usr/bin/env python3
from pathlib import Path
import re
import sys

REQUIRED_SECTIONS = [
    "## Status",
    "## Context",
    "## Decision",
    "## Invariants",
    "## Consequences",
    "## Implementation Impact",
    "## Validation",
]

ADR_NAME = re.compile(r"^\d{4}-.+\.md$")


def main() -> int:
    root = Path.cwd()
    adr_dir = root / "specs" / "adrs"
    failed = False

    if not adr_dir.exists():
        print("missing specs/adrs", file=sys.stderr)
        return 1

    for path in sorted(adr_dir.glob("*.md")):
        if path.name == "README.md":
            continue
        if not ADR_NAME.match(path.name):
            print(f"ADR filename must match NNNN-title.md: {path}", file=sys.stderr)
            failed = True
        text = path.read_text()
        for section in REQUIRED_SECTIONS:
            if section not in text:
                print(f"{path} missing section: {section}", file=sys.stderr)
                failed = True

    if failed:
        return 1
    print("adr-check passed")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
