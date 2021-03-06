#! /usr/bin/env bash

PROJECT_FILE="${PROJECT_FILE:-project.yml}"
local_import=$(yaml read "${PROJECT_FILE}" metadata.import)

find . \( -path ./vendor \) -prune -o -name "*.go" -exec gofmt -s -w {} \;
find . \( -path ./vendor \) -prune -o -name "*.go" -exec goimports -local "${local_import}" -w {} \;
