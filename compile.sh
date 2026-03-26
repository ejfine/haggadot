#!/usr/bin/env bash
set -euo pipefail

# Override with LATEX_IMAGE if you prefer a different LaTeX container image. No particular reason for this specific image, just pinning for best practice. texlive doesn't seem to support versioned tags
IMAGE="${LATEX_IMAGE:-texlive/texlive@sha256:62927d994f09aea455c8ea9da034af14764f9e2276a616b413545e7cec69c06b}"
TARGET="${1:-main.tex}"
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
