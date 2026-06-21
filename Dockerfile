FROM alpine:3.24.1

LABEL maintainer "genzouw <genzouw@gmail.com>"

RUN apk add --no-cache \
  bash \
  curl \
  jq

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
