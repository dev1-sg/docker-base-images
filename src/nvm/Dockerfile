# syntax=docker.io/docker/dockerfile:1

FROM docker.io/ubuntu:24.04 AS base

ARG NVM_VERSION=0.40.3
ARG NODE_VERSION=22.17.1

USER root

ENV TZ=Asia/Singapore \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8 \
    NVM_DIR=/opt/nvm \
    NVM_BIN=/usr/local/bin

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo bash git curl ca-certificates jq locales-all \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir -p /opt/nvm \
    && curl -fsSL "https://raw.githubusercontent.com/nvm-sh/nvm/v${NVM_VERSION}/install.sh" | bash \
    && echo 'export NVM_DIR="/opt/nvm"' >> /etc/profile.d/nvm.sh \
    && echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> /etc/profile.d/nvm.sh \
    && \. "/opt/nvm/nvm.sh" \
    && nvm install "${NODE_VERSION}"
