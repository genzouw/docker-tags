FROM alpine:3.24.2

LABEL maintainer "genzouw <genzouw@gmail.com>"

# ベースイメージ同梱の zlib 1.3.2-r0 に脆弱性 (CVE-2026-85091) があるため、
# 修正版 (1.3.2-r1 以降) へ更新する。ベースイメージ側が修正版を含んだら外してよい。
RUN apk add --no-cache \
  bash \
  curl \
  jq \
  && apk upgrade --no-cache zlib

COPY entrypoint.sh /usr/local/bin

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
