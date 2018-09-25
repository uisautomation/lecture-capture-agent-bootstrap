#!/usr/bin/env bash

echo "Ubuntu version: ${VERSION}"
echo "Output image name: ${IMAGE_NAME}"

"./ubuntu/${VERSION}/build-iso.sh" "/workspace/deploy-keys.pub" \
  "/images/${IMAGE_NAME}.iso"

echo "Wrote image to /images/${IMAGE_NAME}.iso"
