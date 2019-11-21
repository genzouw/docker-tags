#!/bin/sh

DOCKER_IMAGE="${1}"

# Prepend "library" string if a parameter is not contains "/" char.
echo "${DOCKER_IMAGE}" \
  | grep '/' >/dev/null \
  || DOCKER_IMAGE="library/${DOCKER_IMAGE}"

URL="https://registry.hub.docker.com/v2/repositories/${DOCKER_IMAGE}/tags/"
while [ "${URL}" != null ]; do
  RESPONSE="$(
    curl --keepalive-time 300 -4 --silent "${URL}" 2>/dev/null
  )"
  URL="$(echo "${RESPONSE}" | jq -r '."next"')"
  echo "${RESPONSE}"
done \
  | jq -r '."results"[] | .name+" "+.last_updated' \
  | xargs -n 2 printf "%-20s\t%s\n"
