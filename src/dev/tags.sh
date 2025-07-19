#!/usr/bin/env bash

ubuntu=($(sed -n 's/^FROM .*:\([^ -]*\).*/\1/p' Dockerfile | head -1))

echo "${ubuntu:-dev}"
