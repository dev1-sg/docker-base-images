#!/usr/bin/env bash

debian=$(sed -n 's/^FROM .*:\([a-zA-Z]*\).*/\1/p' Dockerfile.debian | head -1)
ubuntu=$(sed -n 's/^FROM .*:\([a-zA-Z]*\).*/\1/p' Dockerfile.ubuntu | head -1)

export AWS_ECR_PUBLIC_IMAGE_TAG_DEBIAN="${debian}"
export AWS_ECR_PUBLIC_IMAGE_TAG_UBUNTU="${ubuntu}"

if [ -n "$GITHUB_ENV" ]; then
  echo "AWS_ECR_PUBLIC_IMAGE_TAG_DEBIAN=$AWS_ECR_PUBLIC_IMAGE_TAG_DEBIAN" >> $GITHUB_ENV
  echo "AWS_ECR_PUBLIC_IMAGE_TAG_UBUNTU=$AWS_ECR_PUBLIC_IMAGE_TAG_UBUNTU" >> $GITHUB_ENV
else
  echo "AWS_ECR_PUBLIC_IMAGE_TAG_DEBIAN=$AWS_ECR_PUBLIC_IMAGE_TAG_DEBIAN"
  echo "AWS_ECR_PUBLIC_IMAGE_TAG_UBUNTU=$AWS_ECR_PUBLIC_IMAGE_TAG_UBUNTU"
fi
