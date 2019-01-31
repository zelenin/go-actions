#!/usr/bin/env bash

set -eux

export PATH=/go/bin:/usr/local/go/bin:$PATH

tmpDir=$(mktemp -d) && cp -r . "$tmpDir" && cd "$tmpDir"

files=$(gofmt -l $(find . -type f -name '*.go' -not -path "./vendor/*") 2>&1)
if [ "$files" ]
then
    echo "These files did not pass the gofmt check:"
    echo ${files}
    exit 1
fi
