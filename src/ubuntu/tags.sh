#!/usr/bin/env bash

ubuntu=$(sed -n 's/^FROM .*:\([a-zA-Z]*\).*/\1/p' Dockerfile | head -1)

export AWS_ECR_PUBLIC_IMAGE_TAG="${ubuntu}"

if [ -n "$GITHUB_ENV" ]; then
  echo "AWS_ECR_PUBLIC_IMAGE_TAG=$AWS_ECR_PUBLIC_IMAGE_TAG" >> $GITHUB_ENV
else
  echo "AWS_ECR_PUBLIC_IMAGE_TAG=$AWS_ECR_PUBLIC_IMAGE_TAG"
fi
