#!/usr/bin/env bash
# Start an interactive shell in the dev image (same default tag as build_dev_image.sh).
# Mounts host ros2_ws at /workspace/ros2_ws.
#
# Usage:
#   ./scripts/run_dev_container.sh
#   ./scripts/run_dev_container.sh -- bash -lc "source /opt/ros/humble/setup.bash && ros2 doctor"
# Override image: IMAGE=my:dev ./scripts/run_dev_container.sh
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
IMAGE="${IMAGE:-petbot:dev}"

exec docker run --rm -it \
  -v "${ROOT}/ros2_ws:/workspace/ros2_ws" \
  -w /workspace/ros2_ws \
  "${IMAGE}" \
  "$@"
