# syntax=docker.io/docker/dockerfile:1

FROM docker.io/ubuntu:24.04 AS base

USER root

ENV TZ=Asia/Singapore \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8

ENV PATH="/usr/local/go/bin:${PATH}"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    sudo bash git curl ca-certificates jq locales-all \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

FROM base AS build

ARG GO_VERSION=1.24.5

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    tar

RUN curl -fsSL "https://go.dev/dl/go${GO_VERSION}.linux-$(case $(uname -m) in x86_64) echo amd64 ;; aarch64) echo arm64 ;; esac).tar.gz" -o /tmp/go.tar.gz \
    && tar -xvf /tmp/go.tar.gz -C /tmp \
    && cp -r /tmp/go /usr/local

FROM base AS final

COPY --from=build /usr/local/go /usr/local/go
