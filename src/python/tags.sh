#!/usr/bin/env bash

python=($(sed -n 's/^FROM [^:]*:\([^ ]*\).*/\1/p' Dockerfile | head -1))

echo "${python:-dev}"
