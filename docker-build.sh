#!/usr/bin/env bash
set -o errexit
set -o nounset
set -o noclobber

declare -r TAGS="${1:-v1.0}"

docker build -t genzouw/docker-tags:${TAGS} . \
  && docker tag genzouw/docker-tags:${TAGS} genzouw/docker-tags:${TAGS} \
  && docker login \
  && docker push genzouw/docker-tags:${TAGS}
