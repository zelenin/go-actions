#!/bin/sh -l

set -eux

export PATH=/go/bin:/usr/local/go/bin:$PATH

# echo "GITHUB_EVENT_NAME: ${GITHUB_EVENT_NAME}"
# echo "GITHUB_EVENT_PATH: ${GITHUB_EVENT_PATH}"
# echo "GITHUB_SHA: ${GITHUB_SHA}"
# echo "GITHUB_REF: ${GITHUB_REF}"

go build \
    -a \
    -asmflags "all=-trimpath=$(pwd)" \
    -gcflags "all=-trimpath=$(pwd)" \
    -ldflags "-s -w" \
    -o app \
    "./cmd/main.go"
