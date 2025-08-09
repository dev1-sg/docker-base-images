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

ARG GO_VERSION=1.24.6

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tar xz-utils

RUN curl -fsSL "https://go.dev/dl/go${GO_VERSION}.linux-$(case $(uname -m) in x86_64) echo amd64 ;; aarch64) echo arm64 ;; esac).tar.gz" -o /tmp/go.tar.gz \
    && tar -xvf /tmp/go.tar.gz -C /usr/local

FROM base AS final

ENV PATH="/usr/local/go/bin:${PATH}"

COPY --from=build /usr/local /usr/local
