# syntax=docker.io/docker/dockerfile:1

FROM docker.io/ubuntu:24.04 AS base

USER root

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo git curl ca-certificates locales \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* \
    && locale-gen en_US.UTF-8

ENV TZ=Asia/Singapore \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

FROM base AS build

ARG NODE_VERSION=24.5.0

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tar xz-utils

RUN ARCH="$(case $(uname -m) in x86_64) echo x64 ;; aarch64) echo arm64 ;; esac)" \
    && curl -fsSL "https://nodejs.org/dist/v${NODE_VERSION}/node-v${NODE_VERSION}-linux-${ARCH}.tar.xz" -o /tmp/node.tar.xz \
    && tar -xvf /tmp/node.tar.xz -C /usr/local --strip-components=1 \
    "node-v${NODE_VERSION}-linux-${ARCH}/bin" \
    "node-v${NODE_VERSION}-linux-${ARCH}/include" \
    "node-v${NODE_VERSION}-linux-${ARCH}/lib" \
    "node-v${NODE_VERSION}-linux-${ARCH}/share"

FROM base AS final

COPY --from=build /usr/local /usr/local
