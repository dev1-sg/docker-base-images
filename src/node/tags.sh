#!/usr/bin/env bash

ubuntu=($(sed -n 's/^FROM .*:\([^ -]*\).*/\1/p' Dockerfile | head -1))
node=($(sed -n 's/^ARG NODE_VERSION=\(.*\)/\1/p' Dockerfile | head -1))

echo "${node:-dev}-${ubuntu:-null}"
