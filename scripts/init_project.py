#!/usr/bin/env python3
from pathlib import Path
import sys

EXCLUDED_DIRS = {".git", "target", "node_modules"}


def iter_files(root: Path):
    for path in root.rglob("*"):
        if any(part in EXCLUDED_DIRS for part in path.parts):
            continue
        if path.is_file():
            yield path


def main() -> int:
    if len(sys.argv) != 2:
        print("usage: init_project.py PROJECT_NAME", file=sys.stderr)
        return 2

    project_name = sys.argv[1]
    root = Path.cwd()
    for path in iter_files(root):
        try:
            text = path.read_text()
        except UnicodeDecodeError:
            continue
        if "{{PROJECT_NAME}}" in text:
            path.write_text(text.replace("{{PROJECT_NAME}}", project_name))
            print(f"updated {path}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
