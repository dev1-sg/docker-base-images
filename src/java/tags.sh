#!/usr/bin/env bash

ubuntu=($(sed -n 's/^FROM .*:\([^ -]*\).*/\1/p' Dockerfile | head -1))
java=($(sed -n 's/^ARG JAVA_VERSION=\(.*\)/\1/p' Dockerfile | head -1))

if [[ -n "${java}" && -n "${ubuntu}" ]]; then
    echo "${java}-${ubuntu}"
else
    echo "latest"
fi
