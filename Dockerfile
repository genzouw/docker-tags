FROM alpine

RUN apk add --no-cache curl jq

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
