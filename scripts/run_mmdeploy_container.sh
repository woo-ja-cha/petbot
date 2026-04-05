#!/usr/bin/env bash
set -euo pipefail

: "${IMAGE_NAME:=petbot-mmdeploy:latest}"

docker run --rm -it \
  --network host \
  --runtime nvidia \
  -v "$(pwd)/third_party:/workspace/third_party" \
  -v "$(pwd)/models:/workspace/models" \
  -v "$(pwd)/ros2_ws:/workspace/ros2_ws" \
  "${IMAGE_NAME}" \
  bash