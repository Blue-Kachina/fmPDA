#!/usr/bin/env bash
# Run Rector and apply changes inside the Docker Compose dev container.
# Usage examples:
#   ./RECTOR_APPLY.sh
#   ./RECTOR_APPLY.sh --config rector.php --memory-limit=512M

set -euo pipefail

# Ensure we execute from the repo root (where docker-compose.yml lives)
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Pick docker compose command (supports both new and legacy)
if command -v docker >/dev/null 2>&1 && docker compose version >/dev/null 2>&1; then
  DCMD=(docker compose)
elif command -v docker-compose >/dev/null 2>&1; then
  DCMD=(docker-compose)
else
  echo "Error: docker compose/docker-compose not found in PATH" >&2
  exit 1
fi

"${DCMD[@]}" run --rm app composer rector:apply "$@"
