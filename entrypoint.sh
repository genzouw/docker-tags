#!/bin/sh

DOCKER_IMAGE="${1}"

# Prepend "library" string if a parameter is not contains "/" char.

echo "${DOCKER_IMAGE}" \
  | grep '/' >/dev/null \
  || DOCKER_IMAGE="library/${DOCKER_IMAGE}"

URL="https://registry.hub.docker.com/v2/repositories/${DOCKER_IMAGE}/tags/"
(
  echo "TAG SIZE UPDATED"
  echo "----- ----- -----"
  while [ "${URL}" != null ]; do
    RESPONSE="$(
      curl --keepalive-time 300 -4 --silent "${URL}" 2>/dev/null
    )"
    URL="$(echo "${RESPONSE}" | jq -r '."next"')"
    echo "${RESPONSE}" | jq -r '."results"[] | .name+" "+(.full_size|tostring)+" "+.last_updated' &
  done
  wait
) | while read -r TAG SIZE LAST_UPDATED; do
  printf "%-20s\t%10s\t%s\n" "${TAG}" "${SIZE}" "${LAST_UPDATED}"
done
