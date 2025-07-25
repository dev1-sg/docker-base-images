#!/usr/bin/env bash

ubuntu=($(sed -n 's/^FROM .*:\([^ -]*\).*/\1/p' Dockerfile | head -2))
python=($(sed -n 's/^FROM .*:\([^ -]*\).*/\1/p' Dockerfile | head -1))

if [[ -n "${python}" && -n "${ubuntu}" ]]; then
    echo "${python}-${ubuntu[1]}"
else
    echo "latest"
fi
