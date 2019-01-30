#!/bin/sh -l

set -eux

# echo "GITHUB_EVENT_NAME: ${GITHUB_EVENT_NAME}"
# echo "GITHUB_EVENT_PATH: ${GITHUB_EVENT_PATH}"
# echo "GITHUB_SHA: ${GITHUB_SHA}"
# echo "GITHUB_REF: ${GITHUB_REF}"

./app -from ${FROM}
