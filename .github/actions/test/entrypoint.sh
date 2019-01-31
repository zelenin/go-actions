#!/usr/bin/env bash

set -eux

export PATH=/go/bin:/usr/local/go/bin:$PATH

tmpDir=$(mktemp -d) && cp -r . "$tmpDir" && cd "$tmpDir"

go test $(go list ./... | grep -v /vendor/) -coverprofile=coverage.txt -covermode=atomic
cat coverage.txt
