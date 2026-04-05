#!/usr/bin/env bash
# Build the ROS 2 Humble dev image (docker/Dockerfile.dev).
# Usage: ./scripts/build_dev_image.sh
# Override image name: IMAGE=petbot:dev ./scripts/build_dev_image.sh
# Extra docker-build flags: ./scripts/build_dev_image.sh --no-cache
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE="${IMAGE:-petbot:dev}"

docker build \
  -f "${ROOT}/docker/Dockerfile.dev" \
  -t "${IMAGE}" \
  "$@" \
  "${ROOT}"
