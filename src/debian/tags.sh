#!/usr/bin/env bash

set -e

debian=$(sed -n 's/^FROM .*:\([a-zA-Z]*\).*/\1/p' Dockerfile | head -1)

if [ -z "$debian" ]; then exit 1 fi

export AWS_ECR_PUBLIC_IMAGE_TAG="${debian}"

if [ -n "$GITHUB_ENV" ]; then
  echo "AWS_ECR_PUBLIC_IMAGE_TAG=$AWS_ECR_PUBLIC_IMAGE_TAG" >> $GITHUB_ENV
else
  echo "AWS_ECR_PUBLIC_IMAGE_TAG=$AWS_ECR_PUBLIC_IMAGE_TAG"
fi
