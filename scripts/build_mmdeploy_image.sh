#!/usr/bin/env bash
set -euo pipefail

# 예시:
# export BASE_IMAGE=nvcr.io/nvidia/l4t-base:<YOUR_MATCHING_TAG>
# export IMAGE_NAME=petbot-mmdeploy:jp62

: "${BASE_IMAGE:?Set BASE_IMAGE to a matching Jetson L4T base image tag}"
: "${IMAGE_NAME:=petbot-mmdeploy:latest}"

docker build \
  --network=host \
  -f docker/Dockerfile.mmdeploy \
  --build-arg BASE_IMAGE="${BASE_IMAGE}" \
  -t "${IMAGE_NAME}" \
  .