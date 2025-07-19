# syntax=docker.io/docker/dockerfile:1

FROM docker.io/ubuntu:24.04 AS base

USER root

ENV TZ=Asia/Singapore \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo bash git curl ca-certificates jq locales-all \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

FROM base AS build

ARG NODE_VERSION=22.17.1

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tar xz-utils

RUN curl -fsSL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-$(case $(uname -m) in x86_64) echo x64 ;; aarch64) echo arm64 ;; esac).tar.xz" -o /tmp/node.tar.xz \
    && tar -xvf /tmp/node.tar.xz -C /tmp \
    && cp "/tmp/node-v${NODE_VERSION}-linux-$(case $(uname -m) in x86_64) echo x64 ;; aarch64) echo arm64 ;; esac)/bin/node" /usr/local/bin \
    && cp -r "/tmp/node-v${NODE_VERSION}-linux-$(case $(uname -m) in x86_64) echo x64 ;; aarch64) echo arm64 ;; esac)/lib/node_modules" /usr/local/lib

FROM base AS final

COPY --from=build /usr/local/bin/node /usr/local/bin/node
COPY --from=build /usr/local/lib/node_modules /usr/local/lib/node_modules

RUN cd /usr/local/bin \
    && ln -s ../lib/node_modules/corepack/dist/corepack.js corepack \
    && ln -s ../lib/node_modules/npm/bin/npm-cli.js npm \
    && ln -s ../lib/node_modules/npm/bin/npx-cli.js npx
