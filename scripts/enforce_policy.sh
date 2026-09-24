#!/usr/bin/env bash
set -euo pipefail

echo "=========================================="
echo " Running Local Compliance Policy Checks   "
echo "=========================================="

# Check for required tools
for tool in terraform python3; do
  if ! command -v "$tool" &> /dev/null; then
    echo "[ERROR] Required CLI tool '$tool' is missing." >&2
    exit 1
  fi
done

echo "[OK] Environment readiness check passed."