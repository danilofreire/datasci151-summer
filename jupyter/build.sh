#!/usr/bin/env bash
# Build JupyterLite into docs/jupyter/.
# Invoked by Quarto's post-render hook (see _quarto.yml).
# Safe to run manually: ./jupyter/build.sh

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
OUTPUT_DIR="$ROOT_DIR/docs/jupyter"

cd "$SCRIPT_DIR"

# Create the venv on first run (or if jupyter is missing).
if [ ! -x .venv/bin/jupyter ]; then
  echo "[jupyter/build.sh] Creating Python venv..."
  uv venv .venv --python 3.12 --quiet
  uv pip install --quiet --python .venv/bin/python -r requirements.txt
fi

echo "[jupyter/build.sh] Building JupyterLite into $OUTPUT_DIR..."
rm -rf "$OUTPUT_DIR"
.venv/bin/jupyter lite build --output-dir "$OUTPUT_DIR" --contents content

echo "[jupyter/build.sh] Done."
