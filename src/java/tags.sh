#!/usr/bin/env bash

ubuntu=($(sed -n 's/^FROM .*:\([^ -]*\).*/\1/p' Dockerfile | head -2))
java=($(sed -n 's/^FROM .*:\([^ -]*\).*/\1/p' Dockerfile | head -1))

if [[ -n "${java}" && -n "${ubuntu}" ]]; then
    echo "${java}-${ubuntu[1]}"
else
    echo "latest"
fi
