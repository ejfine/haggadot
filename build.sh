#!/usr/bin/env bash
set -euo pipefail

# Override with LATEX_IMAGE if you prefer a different LaTeX container image.
IMAGE="${LATEX_IMAGE:-texlive/texlive:latest}"
TARGET="${1:-haggadah.tex}"
BUILD_DIR="${BUILD_DIR:-build}"

if [[ ! -f "$TARGET" ]]; then
  echo "Error: '$TARGET' not found in $PWD" >&2
  echo "Usage: ./build.sh [main.tex]" >&2
  exit 1
fi

mkdir -p "$BUILD_DIR"

docker run --rm \
  --user "$(id -u):$(id -g)" \
  -v "$PWD":/workdir \
  -w /workdir \
  "$IMAGE" \
  latexmk \
    -pdf \
    -interaction=nonstopmode \
    -halt-on-error \
    -outdir="$BUILD_DIR" \
    -auxdir="$BUILD_DIR" \
    "$TARGET"

echo "Built PDF: $BUILD_DIR/$(basename "${TARGET%.tex}").pdf"