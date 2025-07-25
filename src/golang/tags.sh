#!/usr/bin/env bash

ubuntu=$(sed -n 's/^FROM .*:\([^ -]*\).*/\1/p' Dockerfile | head -1)
golang=$(sed -n 's/^ARG GO_VERSION=\(.*\)/\1/p' Dockerfile | head -1)

if [[ -n "${golang}" && -n "${ubuntu}" ]]; then
    echo "${golang}-${ubuntu}"
else
    echo "latest"
fi
