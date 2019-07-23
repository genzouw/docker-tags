#!/bin/sh

DOCKER_IMAGE="${1}"

# Prepend "library" string if a parameter is not contains "/" char.
echo "${DOCKER_IMAGE}" \
  | grep '/' >/dev/null \
  || DOCKER_IMAGE="library/${DOCKER_IMAGE}"

curl \
  --silent "https://registry.hub.docker.com/v2/repositories/${DOCKER_IMAGE}/tags/" 2>/dev/null \
  | jq -r '."results"[]["name"]?'
