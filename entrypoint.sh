#!/usr/bin/env bash
set -o errexit
set -o nounset

REST_OF_OUTPUT_PAGE=5

opts=':p:ah'

usage() {
  echo "docker-tags [-p PAGE] [-a] [-h]"
  echo "    -p : Output the specified number of pages.( DEFAULT : 5 )"
  echo "    -a : Output all pages."
  echo "    -h : Output Help."

  exit 1
}

while getopts ":${opts}" opt ; do
  case "${opt}" in
    a)
      REST_OF_OUTPUT_PAGE=
      ;;
    p)
      REST_OF_OUTPUT_PAGE="${OPTARG}"
      ;;
    h|\?)
      usage
      ;;
  esac
done

shift $((OPTIND -1))

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
    [[ -n "${REST_OF_OUTPUT_PAGE}" ]] && [[ ! "$((REST_OF_OUTPUT_PAGE--))" > 0 ]] && break

    RESPONSE="$(
      curl --keepalive-time 300 -4 --silent "${URL}" 2>/dev/null
    )"
    URL="$(echo "${RESPONSE}" | jq -r '."next"')"
    echo "${RESPONSE}" | jq -r '."results"[] | .name+" "+(.full_size|tostring)+" "+.last_updated'
  done
) | while read -r TAG SIZE LAST_UPDATED; do
  printf "%-20s\t%10s\t%s\n" "${TAG}" "${SIZE}" "${LAST_UPDATED}"
done
