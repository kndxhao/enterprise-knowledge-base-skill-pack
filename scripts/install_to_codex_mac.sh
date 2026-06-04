#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILLS_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
PROJECT_ROOT="$(cd "$SKILLS_ROOT/.." && pwd)"
CODEX_HOME_DIR="${CODEX_HOME:-$HOME/.codex}"
DEST_ROOT="$CODEX_HOME_DIR/skills"
BACKUP_ROOT="$CODEX_HOME_DIR/skills_backup_$(date +%Y%m%d_%H%M%S)"
DRY_RUN=0

if [[ "${1:-}" == "--dry-run" ]]; then
  DRY_RUN=1
fi

SKILLS=(
  "enterprise-knowledge-pipeline"
  "knowledge-review-governance"
  "stable-export-mcp-callability"
  "commercial-knowledge-delivery-audit"
)

echo "Project root: $PROJECT_ROOT"
echo "Source skills: $SKILLS_ROOT"
echo "Target skills: $DEST_ROOT"

python3 "$SKILLS_ROOT/scripts/check_skill_pack.py"

if [[ "$DRY_RUN" == "1" ]]; then
  echo "Dry run only. Would install:"
  for skill in "${SKILLS[@]}"; do
    echo "  $SKILLS_ROOT/$skill -> $DEST_ROOT/$skill"
  done
  exit 0
fi

mkdir -p "$DEST_ROOT"

for skill in "${SKILLS[@]}"; do
  src="$SKILLS_ROOT/$skill"
  dst="$DEST_ROOT/$skill"
  if [[ ! -d "$src" ]]; then
    echo "Missing source skill: $src" >&2
    exit 1
  fi
  if [[ -e "$dst" ]]; then
    mkdir -p "$BACKUP_ROOT"
    echo "Backing up existing $dst -> $BACKUP_ROOT/$skill"
    rm -rf "$BACKUP_ROOT/$skill"
    mv "$dst" "$BACKUP_ROOT/$skill"
  fi
  echo "Installing $skill"
  mkdir -p "$dst"
  tar -C "$src" -cf - . | tar -C "$dst" -xf -
done

echo "Installed ${#SKILLS[@]} skills to $DEST_ROOT"
if [[ -d "$BACKUP_ROOT" ]]; then
  echo "Backups written to $BACKUP_ROOT"
fi
echo "Restart Codex or start a new Codex session to refresh skill discovery."
