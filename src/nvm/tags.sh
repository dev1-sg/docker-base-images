#!/usr/bin/env bash

ubuntu=($(sed -n 's/^FROM .*:\([^ -]*\).*/\1/p' Dockerfile | head -1))
node=($(sed -n 's/^ARG NODE_VERSION=\(.*\)/\1/p' Dockerfile | head -1))

if [[ -n "${node}" && -n "${ubuntu}" ]]; then
    echo "${node}-${ubuntu}"
else
    echo "latest"
fi
