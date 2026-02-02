#!/bin/bash
set -e

IMAGE_NAME="ghcr.io/developerinlondon/openobserve"
TAG="latest"

echo "=== Logging into ghcr.io ==="
echo "You'll need a GitHub token with write:packages scope"
gh auth token | docker login ghcr.io -u developerinlondon --password-stdin

echo "=== Building Docker image ==="
docker build -t ${IMAGE_NAME}:${TAG} -f deploy/build/Dockerfile.standalone .

echo "=== Pushing to ghcr.io ==="
docker push ${IMAGE_NAME}:${TAG}

echo "=== Done! ==="
echo "Image available at: ${IMAGE_NAME}:${TAG}"
