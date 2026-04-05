#!/usr/bin/env bash
# Build the Jetson deployment image (docker/Dockerfile.jetson).
# Usage: ./scripts/build_jetson_image.sh
# Override image name: IMAGE=petbot:jetson ./scripts/build_jetson_image.sh
# Cross-build for Jetson (arm64) from amd64: ./scripts/build_jetson_image.sh --platform linux/arm64
# Extra docker-build flags: ./scripts/build_jetson_image.sh --no-cache
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE="${IMAGE:-petbot:jetson}"

docker build \
  -f "${ROOT}/docker/Dockerfile.jetson" \
  -t "${IMAGE}" \
  "$@" \
  "${ROOT}"
