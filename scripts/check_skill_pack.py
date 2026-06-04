#!/usr/bin/env python3
"""Validate the project skill pack structure."""

from __future__ import annotations

import re
from pathlib import Path


ROOT = Path(__file__).resolve().parents[1]
REQUIRED = ["name", "description"]
REQUIRED_PACKAGE_FILES = [
    ROOT / "README.md",
    ROOT / "scripts" / "install_to_codex_mac.sh",
]


def parse_frontmatter(text: str) -> dict[str, str]:
    if not text.startswith("---\n"):
        return {}
    end = text.find("\n---", 4)
    if end == -1:
        return {}
    block = text[4:end].strip().splitlines()
    data: dict[str, str] = {}
    for line in block:
        if ":" not in line:
            continue
        key, value = line.split(":", 1)
        data[key.strip()] = value.strip().strip('"')
    return data


def main() -> int:
    problems: list[str] = []
    for required_file in REQUIRED_PACKAGE_FILES:
        if not required_file.exists():
            problems.append(f"missing package file: {required_file.relative_to(ROOT)}")
    skill_dirs = [
        p for p in ROOT.iterdir() if p.is_dir() and p.name != "scripts" and not p.name.startswith(".")
    ]
    if not skill_dirs:
        problems.append("No skill directories found.")
    for skill_dir in sorted(skill_dirs):
        skill_file = skill_dir / "SKILL.md"
        if not skill_file.exists():
            problems.append(f"{skill_dir.name}: missing SKILL.md")
            continue
        text = skill_file.read_text(encoding="utf-8")
        fm = parse_frontmatter(text)
        for key in REQUIRED:
            if not fm.get(key):
                problems.append(f"{skill_dir.name}: missing frontmatter {key}")
        name = fm.get("name", "")
        if name and name != skill_dir.name:
            problems.append(f"{skill_dir.name}: frontmatter name mismatch {name!r}")
        if name and not re.fullmatch(r"[a-z0-9-]{1,63}", name):
            problems.append(f"{skill_dir.name}: invalid skill name {name!r}")
        desc = fm.get("description", "")
        if desc and not desc.startswith("Use when"):
            problems.append(f"{skill_dir.name}: description should start with 'Use when'")
        if len(desc) > 500:
            problems.append(f"{skill_dir.name}: description too long ({len(desc)} chars)")
    if problems:
        print("FAIL")
        for problem in problems:
            print(f"- {problem}")
        return 1
    print(f"PASS {len(skill_dirs)} skills")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
